package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiHeadImgUseRecordDao;
import com.anzhi.web.dao.IAnzhiMemberDao;
import com.anzhi.web.dao.IAnzhiMoneyApplyRecordDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelRewardDao;
import com.anzhi.web.dao.IAnzhiRechargeDao;
import com.anzhi.web.dao.IAnzhiThirdLoginDao;
import com.anzhi.web.pojo.AnzhiHeadImgUseRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiMoneyApplyRecord;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelReward;
import com.anzhi.web.pojo.AnzhiRecharge;
import com.anzhi.web.pojo.AnzhiThirdLogin;
import com.anzhi.web.service.IAnzhiMemberService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiMemberServiceImpl extends ActionDb  implements IAnzhiMemberService {
	@Autowired
	private IAnzhiMemberDao anzhimemberDao;
	@Autowired
	private IAnzhiHeadImgUseRecordDao anzhiheadimguserecordDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiRechargeDao anzhirechargeDao;
	@Autowired
	private IAnzhiNovelRewardDao anzhinovelrewardDao;
	@Autowired
	private IAnzhiMoneyApplyRecordDao anzhimoneyapplyrecordDao;
	@Autowired
	private IAnzhiThirdLoginDao anzhithirdloginDao;
	public boolean addAnzhiMember(AnzhiMember anzhimember){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimemberDao.addAnzhiMember(anzhimember));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiMember(List<AnzhiMember> list){
		return anzhimemberDao.addBatchAnzhiMember(list);
	}

	public boolean delAnzhiMember(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimemberDao.delAnzhiMember(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiMember(String ids){
		return anzhimemberDao.delBatchAnzhiMember(ids);
	}

	public boolean updateAnzhiMember(AnzhiMember anzhimember, int types){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimemberDao.updateAnzhiMember(anzhimember));
		if(types==1){
			//需要添加头像使用记录
			AnzhiHeadImgUseRecord ad=new AnzhiHeadImgUseRecord();
			ad.setAddTime(this.getNowTime());
			ad.setMemberId(anzhimember.getId());
			ad.setState(0);
			ad.setUseImg(anzhimember.getMemberHeadImg());
			pojoList.add(anzhiheadimguserecordDao.addAnzhiHeadImgUseRecord(ad));
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiMember> findAnzhiMemberAll(int size,int pageNum,String condition){
		return anzhimemberDao.findAnzhiMemberAll(size,pageNum,condition);
	}

	/**
	 * 评论区域点击会员显示会员信息
	 */
	public String memberInfo(HttpServletRequest request,AnzhiMember am) {
		QueryList<AnzhiMember> ls=anzhimemberDao.findAnzhiMemberAll(1, 1, " and id="+this.getInt(request, "memberId"));
		if(ls.getList().size()!=0){
			AnzhiMember memberInfo=ls.getList().get(0);
			int n=0;
			if(am!=null){
				n=this.getIntBySqlDb("select count(*) from anzhi_friend where member_id="+am.getId()+" and friend_member_id="+memberInfo.getId());
			}
			request.setAttribute("isFriend", n==0?"no":"yes");
			boolean isloadBookshelf=false;
			//判断该用户是否公开书架
			if(memberInfo.getBookshelfPublic().equals(1)){//仅向好友
				if(am!=null&&am.getId()!=null){//需要验证是否是好友
					isloadBookshelf=n==0?false:true;
				}
			}else if(memberInfo.getBookshelfPublic().equals(2)){//所有人
				isloadBookshelf=true;
			}
			if(isloadBookshelf){//说明需要加载该用户的书架--收藏的书
				int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
				int pageNum=this.getPageNum(request);
				
				QueryList<AnzhiNovel> anzhinovelList=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and id in(select novel_id from anzhi_novel_multifunction where member_id="+memberInfo.getId()+" and action_type=1)", "id");
				request.setAttribute("anzhinovelList",anzhinovelList );
			}
			request.setAttribute("memberPojo",memberInfo );
			return "memberInfo";
		}
		return "500";
	}

	public void everyDayTask(HttpServletRequest request, AnzhiMember t) {
		//每日签到	
		int qiandao=this.getIntBySqlDb("select count(*) from anzhi_experience_record where experience_type=0 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日动态
		int dongtai=this.getIntBySqlDb("select count(*) from anzhi_trend where member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日投票
		int toupiao=this.getIntBySqlDb("select count(*) from anzhi_novel_reward where reward_type=0 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日充值
		double chognzhi=this.getDoubleBySqlDb("select sum(recharge_money) from anzhi_recharge where member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日订阅
		int dingyue=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe where member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日收藏
		int soucang=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where action_type=1 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日评论
		int pinglun=this.getIntBySqlDb("select count(*) from anzhi_comment where comment_title!='打赏记录' and comment_title!='投票记录' and comment_fatherid=0 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日打赏
		int dashang=this.getIntBySqlDb("select sum(reward_anzhi_money) from anzhi_novel_reward where reward_type>2 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		//每日点赞
		int dianzan=this.getIntBySqlDb("select count(*) from anzhi_comment_praise where member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		request.setAttribute("qiandaotask", qiandao);
		request.setAttribute("dongtaitask", dongtai);
		request.setAttribute("toupiaotask", toupiao);
		request.setAttribute("chognzhitask", (int)chognzhi);
		request.setAttribute("dingyuetask", dingyue);
		request.setAttribute("soucangtask", soucang);
		request.setAttribute("pingluntask", pinglun);
		request.setAttribute("dashangtask", dashang);
		request.setAttribute("dianzantask", dianzan);
		request.setAttribute("endJinYan", getEngJinYan(t.getMemberExperience()));
	}
	
	public int getEngJinYan(int nowJinYan){
		int n=Integer.parseInt(duzhejingyan[0]);
		for(int i=duzhejingyan.length-1;i>=0;i--){
			if(nowJinYan>Integer.parseInt(duzhejingyan[i])){
				try {
					return Integer.parseInt(duzhejingyan[i+1]);
				} catch (NumberFormatException e) {
					return 10000000;
				}
			}
		}
		return n;
	}

	public void  addChongzhi(HttpServletRequest request, String anzhiTradeNo) {
		if(anzhiTradeNo!=null&&!anzhiTradeNo.equals("")){
			QueryList<AnzhiMoneyApplyRecord> ls=anzhimoneyapplyrecordDao.findAnzhiMoneyApplyRecordAll(1, 1, " and state=0 and order_no='"+anzhiTradeNo+"'");
			if(ls.getList().size()!=0){
				AnzhiMoneyApplyRecord aar=ls.getList().get(0);
				//没有添加过
				double m=aar.getChongMoney()*100;
				int c=(int)m;
				int mon=this.getIntBySqlDb("select member_money from anzhi_member where id="+aar.getMemberId());
				//修改金额
				this.updateTableFieldAppend("anzhi_member", aar.getMemberId(), "member_money", c);
				//修改为已充值
				this.updateTableFieldVoid("anzhi_money_apply_record", aar.getId(), "state", 1);
				//添加充值记录
				List<Pojo> pojoList=new ArrayList<Pojo>();
				AnzhiRecharge anzhirecharge=new AnzhiRecharge();
				anzhirecharge.setMemberId(aar.getMemberId());
				anzhirecharge.setRechargeMoney(aar.getChongMoney());
				anzhirecharge.setRechargeAnzhiMoney(c);
				anzhirecharge.setAfterBalance(mon+c);
				anzhirecharge.setBeforeBalance(mon);
				anzhirecharge.setAddTime(getNowTime());
				anzhirecharge.setVote(anzhiTradeNo);
				pojoList.add(anzhirechargeDao.addAnzhiRecharge(anzhirecharge));
				this.excuteUpdate(pojoList);
			}
		}
	}

	public String piliangReadMoney(HttpServletRequest request) {
		QueryList<AnzhiMember> list = anzhimemberDao.findAnzhiMemberAll(50000, 1, null);
		for(int i=0;i<list.getList().size();i++){
			AnzhiMember am=list.getList().get(i);
			if(am.getMemberType().equals(1)){
				am.setIsSignBook(this.getIntBySqlDb("select count(*) from anzhi_novel where author_id="+am.getId()+" and is_signed=1"));
			}else{
				am.setIsSignBook(0);
			}
		}
		request.setAttribute("allmemberList", list);
		return "admin/anzhinovelreadmoneyrecord";
	}

	public void basicInfo(HttpServletRequest request, AnzhiMember am) {
		/**
		 * 先查询本月有没有投过月票，如果没有，则查询上个月消费有没有达到10元。
		 */
		int yuePiaoNum=0;
		//先查询上个月的消费
		int totalAnzhi=this.getIntBySqlDb("select sum(consume_anzhi_money) from anzhi_consume where member_id="+am.getId()+" and consume_time between '"+this.getDateType(6)+"' and '"+this.getDateType(7)+"'");
		if(totalAnzhi>(10*100)){//如果消费了10元
			request.setAttribute("yuepiao", "yes");
			yuePiaoNum+=1;
		}
		//在查询本月的消费
		//先查询上个月的消费
		int nowMonth=getNowMonthYuePia(am.getId());
		yuePiaoNum+=nowMonth;
		
		//在查询本月已经投了多少张月票
		QueryList<AnzhiNovelReward> ls=anzhinovelrewardDao.findAnzhiNovelRewardAll(2, 1, " and member_id="+am.getId()+" and reward_type=2 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
		request.setAttribute("yuepiaoNum", yuePiaoNum);
		request.setAttribute("yuepiaoYiTou", ls.getTotal());
		
		//获得当前用户的推荐票
		//根据用户经验获得推荐票数
		int tuijianpiao=this.getTuijianPiao(this.getDuzhejingyanLevel(am.getMemberExperience()));
			//获得今天已经投了多少推荐票
		int yetTuiJianPiao=this.getIntBySqlDb("select sum(reward_num) from anzhi_novel_reward where member_id="+am.getId()+" and reward_type=0 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		
		int remainTuiJianPiao=(tuijianpiao-yetTuiJianPiao)>=0?((tuijianpiao-yetTuiJianPiao)):0;
		request.setAttribute("remainTuiJianPiao", remainTuiJianPiao);
		request.setAttribute("totalTuijianpiao", tuijianpiao);
		request.setAttribute("yetTuiJianPiao", yetTuiJianPiao);
		request.setAttribute("vipInfo", getVipLevel(am.getId()));
		
		int cangshuNum=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where action_type=1 and member_id="+am.getId());
		request.setAttribute("cangshuNum", cangshuNum);
		request.setAttribute("endJinYan", getEngJinYan(am.getMemberExperience()));
		request.setAttribute("duzheLv", getDuzhejingyanLevel(am.getMemberExperience()));
	}

	public AnzhiMember addAnzhiMember(AnzhiMember anzhimember,
			String thirdLoginPid, int type) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		int memberId=this.getIntBySqlDb("select member_id from anzhi_third_login where third_login_pid='"+thirdLoginPid+"' and third_login_type="+type);
		if(memberId==0){
			memberId=this.excuteUpdate(anzhimemberDao.addAnzhiMember(anzhimember));
			AnzhiThirdLogin at=new AnzhiThirdLogin();
			at.setAddTime(getNowTime());
			at.setMemberId(memberId);
			at.setState(0);
			at.setThirdLoginPid(thirdLoginPid);
			at.setThirdLoginType(type);
			pojoList.add(anzhithirdloginDao.addAnzhiThirdLogin(at));
			this.excuteUpdate(pojoList);
		}
		QueryList<AnzhiMember> ls=anzhimemberDao.findAnzhiMemberAll(1, 1, " and id="+memberId);
		return ls.getList().size()==0?null:ls.getList().get(0);
	}
}