package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiCommentDao;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelRewardDao;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelReward;
import com.anzhi.web.service.IAnzhiNovelRewardService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelRewardServiceImpl extends ActionDb  implements IAnzhiNovelRewardService {
	@Autowired
	private IAnzhiNovelRewardDao anzhinovelrewardDao;
	@Autowired
	private IAnzhiConsumeDao anzhiconsumeDao;
	@Autowired
	private IAnzhiCommentDao anzhicommentDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	public boolean addAnzhiNovelReward(AnzhiNovelReward anzhinovelreward){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelrewardDao.addAnzhiNovelReward(anzhinovelreward));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelReward(List<AnzhiNovelReward> list){
		return anzhinovelrewardDao.addBatchAnzhiNovelReward(list);
	}

	public boolean delAnzhiNovelReward(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelrewardDao.delAnzhiNovelReward(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelReward(String ids){
		return anzhinovelrewardDao.delBatchAnzhiNovelReward(ids);
	}

	public boolean updateAnzhiNovelReward(AnzhiNovelReward anzhinovelreward){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelrewardDao.updateAnzhiNovelReward(anzhinovelreward));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelReward> findAnzhiNovelRewardAll(int size,int pageNum,String condition){
		return anzhinovelrewardDao.findAnzhiNovelRewardAll(size,pageNum,condition);
	}

	/**
	 * 打赏记录。项目重中之重！
	 */
	public String cashDaShang(HttpServletRequest request, AnzhiMember am,
			AnzhiNovelReward anzhinovelreward) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//打赏数量、打赏类型验证、小说id验证
		if(anzhinovelreward.getRewardNum()<1||anzhinovelreward.getRewardType()<0||anzhinovelreward.getRewardType()>13||anzhinovelreward.getNovelId()==null||anzhinovelreward.getRewardType()==null||anzhinovelreward.getChapterId()<0){
			return "亲，请不要异常数据请求！";
		}
		
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+anzhinovelreward.getNovelId(), "id");
		if(list.getList().size()==0){
			return "亲，小说基本数据读取异常！";
		}
		
		//添加到该小说的评论区
		AnzhiComment acomm=new AnzhiComment();
		
		//如果是推荐票则需要验证余票是否充足
		if(anzhinovelreward.getRewardType().equals(0)){
			int tuijianpiao=this.getTuijianPiao(this.getDuzhejingyanLevel(am.getMemberExperience()));
			//获得今天已经投了多少推荐票
			int yetTuiJianPiao=this.getIntBySqlDb("select sum(reward_num) from anzhi_novel_reward where member_id="+am.getId()+" and reward_type=0 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
			if((tuijianpiao-yetTuiJianPiao-anzhinovelreward.getRewardNum())<0){
				return "推荐票不足!";
			}
			
			//如果是投了推荐票,则需要验证当天是否完成了任务
			if((yetTuiJianPiao+anzhinovelreward.getRewardNum())>10){//达到10张推荐票就有经验
				//看看是否已经增加了任务记录
				int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=2 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
				if(n==0){
					//如果没有记录，则添加。同时增加用户的经验
					AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
					anzhiexperiencerecord.setAddTime(this.getNowTime());
					anzhiexperiencerecord.setExperienceNum(10);
					anzhiexperiencerecord.setExperienceType(2);
					anzhiexperiencerecord.setMemberId(am.getId());
					anzhiexperiencerecord.setState(0);
					anzhiexperiencerecord.setVote("当日完成第一条点赞，增加2个经验");
					pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
					//修改该用户的经验  先查找 后修改
					
					this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 10);	
					int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
					am.setMemberExperience(jingyan);
				}
			}
			acomm.setCommentTitle("投票记录");
			//修改小说的推荐票数
			this.updateTableFieldAppend("anzhi_novel", anzhinovelreward.getNovelId(), "total_recommand", 1);
		}
		//如果是催更票则需要重新设置安之币金额，防止黑客乱请求
		if(anzhinovelreward.getRewardType().equals(1)){
			anzhinovelreward.setRewardAnzhiMoney(anzhinovelreward.getRewardNum()*200);
			acomm.setCommentTitle("投票记录");
		}
		//如果是月票则需要重新检查是否已投过，防止黑客乱请求
		if(anzhinovelreward.getRewardType().equals(2)){
			int yuePiaoNum=0;
			//先查询上个月的消费
			int totalAnzhi=this.getIntBySqlDb("select sum(consume_anzhi_money) from anzhi_consume where member_id="+am.getId()+" and consume_time between '"+this.getDateType(6)+"' and '"+this.getDateType(7)+"'");
			if(totalAnzhi>(10*100)){//如果消费了10元
				request.setAttribute("yuepiao", "yes");
				yuePiaoNum+=1;
			}
			//在查询本月的消费  本月的是指：单笔打赏超过指定底线的
			//先查询上个月的消费
			int nowMonth=getNowMonthYuePia(am.getId());
			yuePiaoNum+=nowMonth;

			int nt=this.getIntBySqlDb("select count(*) from anzhi_novel_reward where member_id="+am.getId()+" and reward_type=2 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
			if(nt>=yuePiaoNum){
				return "亲，您本月月票已经用完了！";
			}
			anzhinovelreward.setRewardNum(1);
			acomm.setCommentTitle("投票记录");
		}
		//如果是道具,则需要验证付款安之币是否达到最低要求
		if(anzhinovelreward.getRewardType()>2){
			anzhinovelreward.setRewardNum(1);
			String[] tmps=daoJuArr[anzhinovelreward.getRewardType()-3].split(",");//鲜花,200
			if(anzhinovelreward.getRewardAnzhiMoney()<Integer.parseInt(tmps[1])){
				return "亲，您支付的安之币不能购买本道具！";
			}
			
			
			//获得今天已经打赏的安之币,以确定增加经验
			int moneys=anzhinovelreward.getRewardAnzhiMoney()+this.getIntBySqlDb("select sum(reward_anzhi_money) from anzhi_novel_reward where member_id="+am.getId()+" and reward_type>2 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
			int experience_type=0;
			int experience_num=0;
			
			for(int i=daShangJingYanarray.length-1;i>=0;i--){
				String[] tmp=daShangJingYanarray[i].split(",");
				if(moneys>=Integer.parseInt(tmp[0])){
					experience_type=Integer.parseInt(tmp[1]);
					experience_num=Integer.parseInt(tmp[2]);
					break;
				}
			}

			//看看是否已经增加了任务记录
			int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type="+experience_type+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
			if(n==0){
				//如果没有记录，则添加。同时增加用户的经验
				AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
				anzhiexperiencerecord.setAddTime(this.getNowTime());
				anzhiexperiencerecord.setExperienceNum(experience_num);
				anzhiexperiencerecord.setExperienceType(experience_type);
				anzhiexperiencerecord.setMemberId(am.getId());
				anzhiexperiencerecord.setState(0);
				anzhiexperiencerecord.setVote("当日打赏安之币达到"+moneys+"个，给予"+experience_num+"个经验");
				pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
				//修改该用户的经验  先查找 后修改
				
				this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", experience_num);	
				int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
				am.setMemberExperience(jingyan);
			}
			acomm.setCommentTitle("打赏记录");
		}
		
		int remainMoney=0;
		if(!anzhinovelreward.getRewardType().equals(0)&&!anzhinovelreward.getRewardType().equals(2)){
			//重新查询该用户的账户余额
			remainMoney=this.getIntBySqlDb("select member_money from anzhi_member where id="+am.getId());
			if(remainMoney<anzhinovelreward.getRewardAnzhiMoney()){
				return "对不起，您剩余安之币不足，请先充值!";
			}
		}
		
		/**
		 * 1、添加打赏记录
		 * 2、添加消费记录
		 * 3、修改当前用户的余额
		 * 4、推荐票和打赏需要增加经验
		 * 5、添加到该小说的评论区
		 */
		
		String commentContent=getRewardCommentContent(anzhinovelreward.getVote(),anzhinovelreward.getRewardType(),anzhinovelreward.getRewardNum(),anzhinovelreward.getRewardAnzhiMoney());
		anzhinovelreward.setVote(commentContent);//重新设置备注
		
		//添加打赏记录
		anzhinovelreward.setState(0);
		anzhinovelreward.setAddTime(getNowTime());
		pojoList.add(anzhinovelrewardDao.addAnzhiNovelReward(anzhinovelreward));
		
		
		acomm.setAddTime(this.getNowTime());
		acomm.setMemberId(am.getId());
		acomm.setTableId(anzhinovelreward.getNovelId());
		acomm.setCommentContent(commentContent);
		acomm.setCommentType(0);
		acomm.setCommentFatherid(0);
		acomm.setState(0);
		acomm.setIsMarrow(0);
		acomm.setIsTop(0);
		acomm.setVote("");
		pojoList.add(anzhicommentDao.addAnzhiComment(acomm));
		
		//如果不是推荐票，也不是月票，则需要修改安之币
		if(!anzhinovelreward.getRewardType().equals(0)&&!anzhinovelreward.getRewardType().equals(2)){
			
			//添加消费记录
			AnzhiConsume ac=new AnzhiConsume();
			ac.setMemberId(am.getId());
			ac.setConsumeAnzhiMoney(anzhinovelreward.getRewardAnzhiMoney());
			ac.setTableId(anzhinovelreward.getNovelId());
			ac.setTableType(anzhinovelreward.getChapterId());
			ac.setConsumeType(0);//打赏
			ac.setConsumeTime(this.getNowTime());
			ac.setConsumeBeforeMoney(remainMoney);
			ac.setConsumeAfterMoney(remainMoney-anzhinovelreward.getRewardAnzhiMoney());
			ac.setVote("");
			pojoList.add(anzhiconsumeDao.addAnzhiConsume(ac));
			
			//A、修改当前用户的余额 		B、同时给该小说作者增加安之币
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_money", (-anzhinovelreward.getRewardAnzhiMoney()));
			//查找小说作者
			int authorMemberId=this.getIntBySqlDb("select author_id from anzhi_novel where id="+anzhinovelreward.getNovelId());
			//修改小说作者的安之币余额
			this.updateTableFieldAppend("anzhi_member", authorMemberId, "member_money", (anzhinovelreward.getRewardAnzhiMoney()));
			am.setMemberMoney(remainMoney-anzhinovelreward.getRewardAnzhiMoney());
		}
		this.excuteUpdate(pojoList);
		request.getSession().setAttribute("loginUsers", am);//重新设置
		//打赏成功。重新生成小说详情数据
		anzhinovelService.createNovel(request.getRealPath("//"), anzhinovelreward.getNovelId());
		return "yes";
	}

	public String getRewardCommentContent(String commentContent,Integer rewardType,int rewardNum,int anzhiMoney){
		
		if(rewardType.equals(0)){
			commentContent="给本书投了"+rewardNum+"张推荐票！"+commentContent;
		}else if(rewardType.equals(1)){
			commentContent="给本书投了"+rewardNum+"张催更票("+anzhiMoney+"安之币)！"+commentContent;
		}else if(rewardType.equals(2)){
			commentContent="给本书投了"+rewardNum+"张月票！"+commentContent;
		}else{
			String[] tmp=daoJuArr[rewardType-3].split(",");
			int n=getYp(anzhiMoney);
			commentContent="给本书打赏了["+tmp[0]+"]道具("+anzhiMoney+"安之币)！"+(n==0?"":"[获得"+n+"张月票]")+commentContent;
		}
		return commentContent;
	}
}