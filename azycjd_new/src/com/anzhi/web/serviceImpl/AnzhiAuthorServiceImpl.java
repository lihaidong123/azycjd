package com.anzhi.web.serviceImpl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnZhiFuLi;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinAuthor;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.dao.IAnzhiAuthorDao;
import com.anzhi.web.dao.IAnzhiMemberDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiAuthorService;
import com.anzhi.web.service.IAnzhiNovelMultifunctionService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiAuthorServiceImpl extends ActionDb  implements IAnzhiAuthorService {
	@Autowired
	private IAnzhiAuthorDao anzhiauthorDao;
	@Autowired
	private IAnzhiMemberDao anzhimemberDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiNovelMultifunctionService anzhinovelmultifunctionService;
	public boolean addAnzhiAuthor(AnzhiAuthor anzhiauthor,AnzhiMember anzhimember){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiauthorDao.addAnzhiAuthor(anzhiauthor));
		//成为作者后修改读者表的角色为作者
		anzhimember.setMemberType(1);
		pojoList.add(anzhimemberDao.updateAnzhiMember(anzhimember));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiAuthor(List<AnzhiAuthor> list){
		return anzhiauthorDao.addBatchAnzhiAuthor(list);
	}

	public boolean delAnzhiAuthor(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiauthorDao.delAnzhiAuthor(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiAuthor(String ids){
		return anzhiauthorDao.delBatchAnzhiAuthor(ids);
	}

	public boolean updateAnzhiAuthor(AnzhiAuthor anzhiauthor){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiauthorDao.updateAnzhiAuthor(anzhiauthor));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiAuthor> findAnzhiAuthorAll(int size,int pageNum,String condition){
		return anzhiauthorDao.findAnzhiAuthorAll(size,pageNum,condition);
	}

	public QueryList<AnzhiNovelMultiJoinAuthor> findAnzhiNovelMultiJoinAuthor(
			int size, int pageNum, String condition) {
		return anzhiauthorDao.findAnzhiNovelMultiJoinAuthor(size, pageNum, condition);
	}

	public void findAnzhiAuthorByDetail(HttpServletRequest request) {
		QueryList<AnzhiAuthor> list = anzhiauthorDao.findAnzhiAuthorAll(10, 1, " and member_id="+Integer.parseInt(request.getParameter("anzhiauthorId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		String zongshoucang=this.getStringBySqlDb("select sum(total_save_num) from anzhi_novel where author_id="+Integer.parseInt(request.getParameter("anzhiauthorId")));
		request.setAttribute("zongshoucangshu", zongshoucang);
		String zongzishu=this.getStringBySqlDb("select sum(total_char_num) from anzhi_novel where author_id="+Integer.parseInt(request.getParameter("anzhiauthorId")));
		request.setAttribute("zongzishu", zongzishu);
		
		String shushuju=this.getStringBySqlDb("select max(update_time) from anzhi_novel where  author_id="+Integer.parseInt(request.getParameter("anzhiauthorId"))+"  ");
		if(shushuju!=null){
			if(shushuju.indexOf(".")!=-1){
				shushuju=shushuju.substring(0,shushuju.indexOf("."));
			}
		}
		request.setAttribute("shugengxinshijian", shushuju);
		
		String zuijingengxinxiaohsuo=this.getStringBySqlDb("select novel_title from anzhi_novel where update_time= '"+shushuju+"'");
		request.setAttribute("zuijingengxinxiaohsuo", zuijingengxinxiaohsuo);
		
		QueryList<AnzhiNovel> listss = anzhinovelDao.findAnzhiNovelAll(10, 1, " and author_id="+Integer.parseInt(request.getParameter("anzhiauthorId")), "id");
		request.setAttribute("novellist", listss);
		QueryList<AnzhiNovelMultifunction> listtj = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(10, 1, "", 3, Integer.parseInt(request.getParameter("anzhiauthorId")));
		request.setAttribute("tuijianlist", listtj);
	}

	public void fuliShenQin(HttpServletRequest request, AnzhiMember am) {
		// 先查询该作者有哪些小说 
		QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1000, 1, " and author_id="+am.getId(), "id");
		for(int i=0;i<ls.getList().size();i++){
			AnzhiNovel an=ls.getList().get(i);
			List<AnZhiFuLi> fuLiList=new ArrayList<AnZhiFuLi>();
			//全勤奖
			int[] arr=new int[]{9000,6000,3000};
			int upMonthDayNum=getUpMonthDayNum();
			//全勤奖---pojo
			AnZhiFuLi azf=new AnZhiFuLi();
			azf.setFuliType(0);
			azf.setMemberId(am.getId());
			azf.setNovelId(an.getId());
			azf.setSuccessInt(0);
			int yetQuanQin=this.getIntBySqlDb("select count(*) from anzhi_benefit where novel_id="+an.getId()+" and benefit_type=2 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
			if(yetQuanQin==1){
				azf.setSuccessInt(2);
			}else{
				for(int s:arr){
					int n=this.getIntBySqlDb("select count(*) from (select novel_id,Convert(varchar(100),add_time,23) as riqi,SUM(update_num) as updateNum from anzhi_chapter_update_novel_v where DATEDIFF(month,GETDATE(),add_time)=-1 and novel_id="+an.getId()+" group by novel_id,Convert(varchar(100),add_time,23) having SUM(update_num)>"+s+") t");
					if(n==upMonthDayNum){//说明全勤
						azf.setVote(azf.getVote()+"每天更新"+s+"字达到。全勤奖完成。");
						azf.setSuccessInt(1);
						break;
					}else{
						azf.setVote(azf.getVote()+"每天更新"+s+"字。没有完成。有"+n+"天更新达到！<br/>");
					}
				}
			}
			fuLiList.add(azf);
			
			//上架福利
			//先验证是否申请过上架福利
			AnZhiFuLi azf1=new AnZhiFuLi();
			azf1.setFuliType(1);
			azf1.setMemberId(am.getId());
			azf1.setNovelId(an.getId());
			azf1.setSuccessInt(0);
			int shangjia=this.getIntBySqlDb("select count(*) from anzhi_benefit where novel_id="+an.getId()+" and benefit_type=0");
			if(shangjia==1){
				azf1.setSuccessInt(2);
			}else{
				int num=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+an.getId()+" and action_type=18");
				if(num==0){
					String shangjiaDate=this.getStringBySqlDb("select top 1 add_time from anzhi_novel_multifunction where novel_id="+an.getId()+" and (action_type=16 or action_type=17) order by add_time desc");
					if(!shangjiaDate.equals("0")&&!shangjiaDate.equals("")){
						int n=this.getIntBySqlDb("select count(*) from (select novel_id,Convert(varchar(100),add_time,23) as riqi,SUM(update_num) as updateNum from anzhi_chapter_update_novel_v where DATEDIFF(day,'"+shangjiaDate+"',add_time)<=30 and novel_id="+an.getId()+" group by novel_id,Convert(varchar(100),add_time,23) having SUM(update_num)>3000) t");
						if(n==30){
							azf1.setSuccessInt(1);
							azf1.setVote("上架福利。上架日期："+shangjiaDate+";连续更新30日，每日更新字数大于3000字!");
						}else{
							azf1.setVote("上架福利。上架日期："+shangjiaDate+";连续更新3000字有"+n+"日，没有达到!");
						}
					}else{
						azf1.setVote("该作品上架福利没有通过，上架日期不存在！");
					}
				}else{
					azf1.setVote("该作品还没有申请过上架福利");
				}
			}
			
			fuLiList.add(azf1);
			
			//完结奖
				//先查询是否有完结标识
			AnZhiFuLi azf2=new AnZhiFuLi();
			azf2.setFuliType(2);
			azf2.setMemberId(am.getId());
			azf2.setNovelId(an.getId());
			azf2.setSuccessInt(0);
			int wanjie=this.getIntBySqlDb("select count(*) from anzhi_benefit where novel_id="+an.getId()+" and benefit_type=1");
			if(wanjie==1){
				azf2.setSuccessInt(2);
			}else{
				if(an.getState().equals(3)){
					String wanjieDate=this.getStringBySqlDb("select top 1 add_time from anzhi_novel_multifunction where novel_id="+an.getId()+" and action_type=20 order by add_time desc");
					String qianyueDate=this.getStringBySqlDb("select top 1 add_time from anzhi_novel_multifunction where novel_id="+an.getId()+" and action_type=21 order by add_time desc");
					if(!wanjieDate.equals("0")&&!qianyueDate.equals("0")&&!wanjieDate.equals("")&&!qianyueDate.equals("")){
						int b=this.getIntBySqlDb("select DATEDIFF(month,'"+qianyueDate+"',GETDATE())")-1;
						int e=this.getIntBySqlDb("select DATEDIFF(month,'"+wanjieDate+"',GETDATE())")+1;
						boolean con=false;
						for(int j=e;j<=b;j++){
							//总字数
							int sumnum=this.getIntBySqlDb("select sum(update_num) from anzhi_chapter_update_novel_v where novel_id="+an.getId()+" and DATEDIFF(MONTH,add_time,GETDATE())="+j);
							//考勤天数
							int n=this.getIntBySqlDb("select count(*) from (select novel_id,Convert(varchar(100),add_time,23) as riqi,SUM(update_num) as updateNum from anzhi_chapter_update_novel_v where DATEDIFF(month,GETDATE(),add_time)="+j+" and novel_id="+an.getId()+" group by novel_id,Convert(varchar(100),add_time,23)) t");
							//当月的天数
							int monthDy=getUpMonthDayNum(j);
							if(sumnum<60000||(monthDy-n)>=15){
								con=false;
								break;
							}else{
								con=true;
							}
						}
						if(con){
							azf2.setSuccessInt(1);
							azf2.setVote("自签约之日起，每月更新字数大于6万，且每月断更数少于15天的作品.作品完本总字数:"+an.getTotalCharNum());
						}else{
							azf2.setVote("自签约之日起，没有达到每月更新字数大于6万，且每月断更数少于15天的作品.作品完本总字数:"+an.getTotalCharNum());
						}
					}else{
						azf2.setVote("该作品完结日期读取异常[在原网站完结的作品会出现该情况]");
					}
				}else{
					azf2.setVote("该作品没有完结！");
				}
			}
			fuLiList.add(azf2);
			an.setFuLiList(fuLiList);
		}
		request.setAttribute("novelFuli", ls);

		//精英奖
		//小说的购买数
		AnZhiFuLi azf3=new AnZhiFuLi();
		azf3.setFuliType(3);
		azf3.setMemberId(am.getId());
		azf3.setNovelId(0);
		azf3.setSuccessInt(0);
		int jingying=this.getIntBySqlDb("select count(*) from anzhi_benefit where benefit_type=9 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
		if(jingying==1){
			azf3.setSuccessInt(2);
		}else{
			int dingyuenum=this.getIntBySqlDb("select SUM(consume_anzhi_money) from anzhi_consume_novel_v where author_id="+am.getId()+" and consume_type=1 and DATEDIFF(MONTH,consume_time,GETDATE())=1");
			if(dingyuenum>1000000){
				azf3.setVote("订阅稿费超过1万元的作者.订阅稿费为："+(dingyuenum/100)+"元");
				azf3.setSuccessInt(1);
			}else if(dingyuenum>300000){
				azf3.setVote("订阅稿费超过3000元的作者.订阅稿费为："+(dingyuenum/100)+"元");
				azf3.setSuccessInt(1);
			}else{
				azf3.setVote("订阅稿费为："+(dingyuenum/100)+"元,没有达到！");
			}
		}
		
		request.setAttribute("jingyingjiang", azf3);
		
		AnZhiFuLi azf4=new AnZhiFuLi();
		azf4.setFuliType(4);
		azf4.setMemberId(am.getId());
		azf4.setNovelId(0);
		azf4.setSuccessInt(0);
		//小说的购买数
		int daoju=this.getIntBySqlDb("select count(*) from anzhi_benefit where benefit_type=10 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
		if(daoju==1){
			azf4.setSuccessInt(2);
		}else{
			int daojunum=this.getIntBySqlDb("select SUM(consume_anzhi_money) from anzhi_consume_novel_v where author_id="+am.getId()+" and consume_type=0 and DATEDIFF(MONTH,consume_time,GETDATE())=1");
			if(daojunum>20000){
				azf4.setVote("当月稿费200元以上.道具总和为："+(daojunum/100)+"元");
				azf4.setSuccessInt(1);
			}else{
				azf4.setVote("道具总和为："+(daojunum/100)+"元,没有达到！");
			}
		}
		request.setAttribute("daojufencheng", azf4);	
	}

	public int getUpMonthDayNum(){
		//取得系统当前时间
		Calendar cal = Calendar.getInstance();
		//取得系统当前时间所在月第一天时间对象
		cal.set(Calendar.DAY_OF_MONTH, 1);
		//日期减一,取得上月最后一天时间对象
		cal.add(Calendar.DAY_OF_MONTH, -1);
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	
	public int getUpMonthDayNum(int month){
		//取得系统当前时间
		Calendar cal = Calendar.getInstance();
		//取得系统当前时间所在月第一天时间对象
		cal.set(Calendar.MONTH, Calendar.MONTH-month);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		//日期减一,取得上月最后一天时间对象
		cal.add(Calendar.DAY_OF_MONTH, -1);
		return cal.get(Calendar.DAY_OF_MONTH);
	}

}