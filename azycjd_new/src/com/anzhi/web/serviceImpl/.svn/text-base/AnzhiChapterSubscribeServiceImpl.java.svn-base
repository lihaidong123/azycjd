package com.anzhi.web.serviceImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiAuthorDao;
import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiChapterSubscribeDao;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import com.anzhi.web.dao.IAnzhiDiscountedJoinDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.pojo.AnZhiIncome;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.ChapterDingYue;
import com.anzhi.web.service.IAnzhiChapterSubscribeService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiChapterSubscribeServiceImpl extends ActionDb  implements IAnzhiChapterSubscribeService {
	@Autowired
	private IAnzhiChapterSubscribeDao anzhichaptersubscribeDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiConsumeDao anzhiconsumeDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiDiscountedJoinDao anzhidiscountedjoinDao;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	@Autowired
	private IAnzhiAuthorDao anzhiauthorDao;
	
	public boolean addAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichaptersubscribeDao.addAnzhiChapterSubscribe(anzhichaptersubscribe));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiChapterSubscribe(List<AnzhiChapterSubscribe> list){
		return anzhichaptersubscribeDao.addBatchAnzhiChapterSubscribe(list);
	}

	public boolean delAnzhiChapterSubscribe(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichaptersubscribeDao.delAnzhiChapterSubscribe(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiChapterSubscribe(String ids){
		return anzhichaptersubscribeDao.delBatchAnzhiChapterSubscribe(ids);
	}

	public boolean updateAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichaptersubscribeDao.updateAnzhiChapterSubscribe(anzhichaptersubscribe));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiChapterSubscribe> findAnzhiChapterSubscribeAll(int size,int pageNum,String condition){
		return anzhichaptersubscribeDao.findAnzhiChapterSubscribeAll(size,pageNum,condition);
	}

	/**
	 * 分卷订阅
	 */
	public String cashAnzhiChapterSubscribe(
			int fenJuanId,
			HttpServletRequest request, AnzhiMember am) {
		//先获得该分卷下的所有没有购买的VIP章节的字数
		int fenJuanTotalCharNum=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter where read_type=1 and id not in(select chapter_id from anzhi_chapter_subscribe where member_id="+am.getId()+") and fen_juan_id="+fenJuanId);
		//获得该用户下的剩余安之币
		int remainMoney=this.getIntBySqlDb("select member_money from anzhi_member where id="+am.getId());
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//获得小说id
		int novelId=this.getIntBySqlDb("select novel_id from anzhi_fen_juan where id="+fenJuanId);
		//查询本小说是否参加了优惠活动
		double zhekou=1;
		QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
		if(youhui.getList().size()!=0){
			AnzhiNovel youhuiNovel=youhui.getList().get(0);
			zhekou=youhuiNovel.getDiscountedRebate();
			if(youhuiNovel.getDiscountedType()<2){//说明是本周免费、限时免费
				return "对不起，该小说有["+discountedType[youhuiNovel.getDiscountedType()]+"]优惠，暂不能购买!";
			}
			//添加参与优惠的记录
			AnzhiDiscountedJoin anzhidiscountedjoin=new AnzhiDiscountedJoin();
			anzhidiscountedjoin.setAddTime(getNowTime());
			anzhidiscountedjoin.setDiscountedId(youhuiNovel.getDiscountedId());
			anzhidiscountedjoin.setMemberId(am.getId());
			anzhidiscountedjoin.setState(0);
			anzhidiscountedjoin.setVote("分卷订阅");
			pojoList.add(anzhidiscountedjoinDao.addAnzhiDiscountedJoin(anzhidiscountedjoin));
		}
		
		//验证钱是否够
		int needMoney=(int)(getAnZhiBi(fenJuanTotalCharNum)*zhekou);
		needMoney=this.getVipDiscount(this.getVipLevel(am.getId()), needMoney);
		if(needMoney>remainMoney){
			return "对不起，您剩余安之币不足，请先充值!";
		}

		//获得该分卷下的所有没有购买的VIP章节
		QueryList<AnzhiChapter> lts=anzhichapterDao.findAnzhiChapterAll(5000, 1, " and id not in(select chapter_id from anzhi_chapter_subscribe where member_id="+am.getId()+") and read_type=1 and fen_juan_id="+fenJuanId);
		if(lts.getList().size()==0){
			return "该分卷下暂无小说章节!";
		}
		//获得分卷名称以及小说id
		String fenJuanName=this.getStringBySqlDb("select juan_name from anzhi_fen_juan where id="+fenJuanId);

		for(int i=0;i<lts.getList().size();i++){
			AnzhiChapter ac=lts.getList().get(i);
			AnzhiChapterSubscribe acs=new AnzhiChapterSubscribe();
			acs.setChapterId(ac.getId());
			acs.setMemberId(am.getId());
			acs.setAddTime(this.getNowTime());
			acs.setState(0);
			acs.setVote("购买分卷："+fenJuanName);
			pojoList.add(anzhichaptersubscribeDao.addAnzhiChapterSubscribe(acs));
		}
		
		//查询一下，该小说是否有被网编报备
		int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_author where novel_id="+novelId);
		if(editorId!=0){
			//增加网编的积分
			pojoList.add(anzhiwebeditorDao.updateScore(editorId, (lts.getList().size())*5));
		}
		
		//修改小说的订阅数
		this.updateTableFieldAppend("anzhi_novel", novelId, "total_dingyue_num", lts.getList().size());
		
		if(needMoney==0){
			return "对不起，本操作不需要支付安之币。";
		}

		//添加消费记录
		AnzhiConsume ac=new AnzhiConsume();
		ac.setMemberId(am.getId());
		ac.setConsumeAnzhiMoney(needMoney);
		ac.setTableId(novelId);
		ac.setTableType(0);//chapter_id
		ac.setConsumeType(1);//购买
		ac.setConsumeTime(this.getNowTime());
		ac.setConsumeBeforeMoney(remainMoney);
		ac.setConsumeAfterMoney(remainMoney-needMoney);
		ac.setVote("");
		pojoList.add(anzhiconsumeDao.addAnzhiConsume(ac));
		
		//检查今天是否完成了章节订阅任务并返回最新的经验
		checkSubscribeTask(lts.getList().size(),am,pojoList,anzhiexperiencerecordDao);
		
		this.excuteUpdate(pojoList);
		
		//修改当前登录用户的安之币
		//A、修改当前用户的余额 		B、同时给该小说作者增加安之币
		this.updateTableFieldAppend("anzhi_member", am.getId(), "member_money", (-needMoney));
		//查找小说作者
		int authorMemberId=this.getIntBySqlDb("select author_id from anzhi_novel where id="+novelId);
		//修改小说作者的安之币余额
		this.updateTableFieldAppend("anzhi_member", authorMemberId, "member_money", (needMoney));
		
		am.setMemberMoney(remainMoney-needMoney);
		request.getSession().setAttribute("loginUsers", am);//重新设置
		return "yes";
	}

	/**
	 * 单章购买、整书购买、自动订阅
	 */
	public String cashAnzhiChapterSubscribe(int tableId, int types,
			HttpServletRequest request, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//如果是自动订阅
		if(types==2){
			//先查询是否已经订阅鸟
			int novelId=tableId;
			int autoBuy=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and member_id="+am.getId()+" and action_type=5");
			if(autoBuy==0){//如果没有订阅，则添加
				AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
				anm.setActionType(5);
				anm.setNovelId(novelId);
				anm.setMemberId(am.getId());
				anm.setState(0);
				anm.setAddTime(this.getNowTime());
				pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
				this.excuteUpdate(pojoList);
			}
		}else{
			int novelId=tableId;
			//需要重新获得当前用户的账户余额
			int remainMoney=this.getIntBySqlDb("select member_money from anzhi_member where id="+am.getId());
			if(types==0){
				//获得小说id
				novelId=this.getIntBySqlDb("select novel_id from anzhi_chapter_report where id="+tableId);
			}
			//查询本小说是否参加了优惠活动
			double zhekou=1;
			QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
			if(youhui.getList().size()!=0){
				AnzhiNovel youhuiNovel=youhui.getList().get(0);
				zhekou=youhuiNovel.getDiscountedRebate();
				if(youhuiNovel.getDiscountedType()<2){//说明是本周免费、限时免费
					return "对不起，该小说有["+discountedType[youhuiNovel.getDiscountedType()]+"]优惠，暂不能购买!";
				}
				//添加参与优惠的记录
				AnzhiDiscountedJoin anzhidiscountedjoin=new AnzhiDiscountedJoin();
				anzhidiscountedjoin.setAddTime(getNowTime());
				anzhidiscountedjoin.setDiscountedId(youhuiNovel.getDiscountedId());
				anzhidiscountedjoin.setMemberId(am.getId());
				anzhidiscountedjoin.setState(0);
				anzhidiscountedjoin.setVote("单章购买、整书购买、自动订阅");
				pojoList.add(anzhidiscountedjoinDao.addAnzhiDiscountedJoin(anzhidiscountedjoin));
			}
			
			int needMoney=0;
			int thisChapterNum=1;//本次购买的章节数
			if(types==0){//单章购买
				int chapterId=tableId;
				//需要查询当前用户是否购买了本章节
				int n=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe where chapter_id="+chapterId+" and member_id="+am.getId());
				if(n!=0){
					return "您已经购买过本章节了";
				}
				//获得该章节的字数
				int chapterCharNum=this.getIntBySqlDb("select chapter_char_num from anzhi_chapter where id="+chapterId);
				needMoney=(int)(getAnZhiBi(chapterCharNum)*zhekou);
				needMoney=this.getVipDiscount(this.getVipLevel(am.getId()), needMoney);
				//验证钱是否够
				if(needMoney>remainMoney){
					return "对不起，当前账户安之币余额不足。";
				}else{
					AnzhiChapterSubscribe acs=new AnzhiChapterSubscribe();
					acs.setChapterId(chapterId);
					acs.setMemberId(am.getId());
					acs.setAddTime(this.getNowTime());
					acs.setState(0);
					acs.setVote("章节购买");
					pojoList.add(anzhichaptersubscribeDao.addAnzhiChapterSubscribe(acs));
					
					
					//查询一下，该小说是否有被网编报备
					int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_author where novel_id="+novelId);
					if(editorId!=0){
						//增加网编的积分
						pojoList.add(anzhiwebeditorDao.updateScore(editorId, 5));
					}
					
					//修改小说的订阅数
					this.updateTableFieldAppend("anzhi_novel", novelId, "total_dingyue_num", 1);
				}
			}else if(types==1){//整书购买
				//先获得该小说下的所有没有购买的VIP章节的字数
				int totalCharNum=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where read_type=1 and id not in(select chapter_id from anzhi_chapter_subscribe where member_id="+am.getId()+") and novel_id="+novelId);
				needMoney=(int)(getAnZhiBi(totalCharNum)*zhekou);
				needMoney=this.getVipDiscount(this.getVipLevel(am.getId()), needMoney);
				if(needMoney>remainMoney){
					return "对不起，当前账户安之币余额不足。";
				}else{
					//获得所有没有购买的VIP章节的ID
					List<ChapterDingYue> ls=this.excuteQuery(new ChapterDingYue(),"select id from anzhi_chapter_report where novel_id="+novelId+" and read_type=1 and id not in(select chapter_id from anzhi_chapter_subscribe_report where novel_id="+novelId+" and member_id="+am.getId()+")");
					for(int i=0;i<ls.size();i++){
						ChapterDingYue ac=ls.get(i);
						AnzhiChapterSubscribe acs=new AnzhiChapterSubscribe();
						acs.setChapterId(ac.getChapterId());
						acs.setMemberId(am.getId());
						acs.setAddTime(this.getNowTime());
						acs.setState(0);
						acs.setVote("整书购买");
						pojoList.add(anzhichaptersubscribeDao.addAnzhiChapterSubscribe(acs));
					}
					thisChapterNum=ls.size();
					
					//查询一下，该小说是否有被网编报备
					int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_author where novel_id="+novelId);
					if(editorId!=0){
						//增加网编的积分
						pojoList.add(anzhiwebeditorDao.updateScore(editorId, (ls.size())*5));
					}
					
					//修改小说的订阅数
					this.updateTableFieldAppend("anzhi_novel", novelId, "total_dingyue_num", ls.size());
				}
			}
			
			if(needMoney==0){
				return "对不起，本操作不需要支付安之币。";
			}
			
			//添加消费记录
			AnzhiConsume ac=new AnzhiConsume();
			ac.setMemberId(am.getId());
			ac.setConsumeAnzhiMoney(needMoney);
			ac.setTableId(novelId);
			ac.setTableType(0);//chapter_id
			ac.setConsumeType(1);//购买
			ac.setConsumeTime(this.getNowTime());
			ac.setConsumeBeforeMoney(remainMoney);
			ac.setConsumeAfterMoney(remainMoney-needMoney);
			ac.setVote("");
			pojoList.add(anzhiconsumeDao.addAnzhiConsume(ac));
			
			//检查今天是否完成了章节订阅任务并返回最新的经验
			checkSubscribeTask(thisChapterNum,am,pojoList,anzhiexperiencerecordDao);
			
			this.excuteUpdate(pojoList);
			
			//修改当前登录用户的安之币
			//A、修改当前用户的余额 		B、同时给该小说作者增加安之币
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_money", (-needMoney));
			//查找小说作者
			int authorMemberId=this.getIntBySqlDb("select author_id from anzhi_novel where id="+novelId);
			//修改小说作者的安之币余额
			this.updateTableFieldAppend("anzhi_member", authorMemberId, "member_money", (needMoney));
			
			am.setMemberMoney(remainMoney-needMoney);
			request.getSession().setAttribute("loginUsers", am);//重新设置
		}
		return "yes";
	}

	public void getDingYueChapter(HttpServletRequest request,HttpServletResponse response,AnzhiMember am) {
		int novelId=this.getInt(request, "novelId");
		JSONObject jsonBack=new JSONObject();
		//查询本小说是否参加了优惠活动
		QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
		if(youhui.getList().size()!=0){
			jsonBack.put("youhuiInfo", "yes");
			AnzhiNovel youhuiNovel=youhui.getList().get(0);
			jsonBack.put("discountedType", youhuiNovel.getDiscountedType());
			jsonBack.put("discountedTypeName", discountedType[youhuiNovel.getDiscountedType()]);
			jsonBack.put("discountedEndDate", new SimpleDateFormat("yyyy/MM/dd HH:mm").format(youhuiNovel.getDiscountedEndDate()));
			jsonBack.put("discountedRebate", youhuiNovel.getDiscountedType()>1?new java.text.DecimalFormat("#.00").format(youhuiNovel.getDiscountedRebate())+"折":(youhuiNovel.getDiscountedType().equals(0)?"本周免费":"限时免费"));
		}
		//如果已经登录
		if(am!=null&&am.getId()!=null){
			//读取订阅情况
			List<ChapterDingYue> ls=this.excuteQuery(new ChapterDingYue(), "select chapter_id from anzhi_chapter_subscribe_report where member_id="+am.getId()+" and novel_id="+this.getInt(request, "novelId"));
			List<ChapterDingYue> readls=this.excuteQuery(new ChapterDingYue(), "select chapter_id from anzhi_novel_read_money_buy_record_view where member_id="+am.getId()+" and novel_id="+this.getInt(request, "novelId"));
			for(ChapterDingYue cd:readls){
				if(!ls.contains(cd)){
					ls.add(cd);
				}
			}
			
			JSONArray commentJsonItems=new JSONArray();
			for(ChapterDingYue p:ls){
				commentJsonItems.add(JSONObject.fromObject(p));
			}
			jsonBack.put("data", commentJsonItems);
			jsonBack.put("autoBuy", this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+this.getInt(request, "novelId")+" and member_id="+am.getId()+" and action_type=5"));//查询当前用户是否已经是自动订阅本小说
		}
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(jsonBack);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void income(HttpServletRequest request) {
		String condition="";
		String cosumecondition="";
		if(this.checkParam(request, "begTime")&&this.checkParam(request, "endTime")){
			condition+=" and add_time between '"+request.getParameter("begTime")+" 00:00:00' and '"+request.getParameter("begTime")+" 23:59:59'";
			cosumecondition+=" and consume_time between '"+request.getParameter("begTime")+" 00:00:00' and '"+request.getParameter("begTime")+" 23:59:59'";
		}
		
		String authorConditon="";
		if(this.checkParam(request, "writerName")){
			authorConditon+=" and author_writer_name like '%"+request.getParameter("writerName")+"%'";
		}else{
			List<Object[]> dasahngLs=this.getList("select author_id,SUM(consume_anzhi_money) from anzhi_consume_income where consume_type=0 "+cosumecondition+"  group by author_id");
			List<Object[]> goumaiLs=this.getList("select author_id,SUM(consume_anzhi_money) from anzhi_consume_income where consume_type=0 "+cosumecondition+" group by author_id");
			List<Object[]> yuedubiLs=this.getList("select author_id,SUM(user_money) from anzhi_novel_read_money_buy_record_income where 1=1 "+condition+" group by author_id");
			String ids=new String("");
			ids=getIncomeMemberId(dasahngLs,ids);
			ids=getIncomeMemberId(goumaiLs,ids);
			ids=getIncomeMemberId(yuedubiLs,ids);
			if(!ids.equals("")){
				authorConditon+=" and member_id in("+ids+")";
			}else{
				authorConditon+=" and 1=3";
			}
		}
		List<AnZhiIncome> incomeList=new ArrayList<AnZhiIncome>();
		QueryList<AnzhiAuthor> authorList=anzhiauthorDao.findAnzhiAuthorAll(10000, 1, authorConditon);
		if(authorList.getList()!=null){
			for(int i=0;i<authorList.getList().size();i++){
				AnzhiAuthor aa=authorList.getList().get(i);
				AnZhiIncome income=new AnZhiIncome();
				income.setDashangIncome(this.getDoubleBySqlDb("select sum(consume_anzhi_money) from anzhi_consume_income where consume_type=0 and author_id="+aa.getMemberId()+cosumecondition));
				income.setMenmberId(aa.getMemberId());
				income.setWriterName(aa.getAuthorWriterName());
				income.setYuedubiIncome(this.getDoubleBySqlDb("select sum(user_money) from anzhi_novel_read_money_buy_record_income where author_id="+aa.getMemberId()+condition));
				income.setZhangjieIncome(this.getDoubleBySqlDb("select sum(consume_anzhi_money) from anzhi_consume_income where consume_type=1 and author_id="+aa.getMemberId()+cosumecondition));
				incomeList.add(income);
			}
		}
		Collections.sort(incomeList);
		request.setAttribute("incomeList",incomeList);
	}
	
	public String getIncomeMemberId(List<Object[]> ls,String ids){
		for(int i=0;i<ls.size();i++){
			Object[] obj=ls.get(i);
			String[] arr=ids.split(",");
			boolean con=true;
			for(String s:arr){
				if(s.equals(obj[0].toString())){
					con=false;
					break;
				}
			}
			if(con){
				ids+=obj[0]+",";
			}
		}
		return ids.equals("")?"":ids.substring(0, ids.length()-1);
	}

}