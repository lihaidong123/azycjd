package com.anzhi.web.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiBookmarkDao;
import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiChapterSubscribeDao;
import com.anzhi.web.dao.IAnzhiCommentDao;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import com.anzhi.web.dao.IAnzhiDiscountedJoinDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiFenJuanDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyBuyRecordDao;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.pojo.AnzhiBookmark;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
import com.anzhi.web.service.IMobileService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class MobileServiceImpl extends ActionDb implements IMobileService {
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiCommentDao anzhiCommentDao;
	@Autowired
	private IAnzhiFenJuanDao anzhifenjuanDao;
	@Autowired
	private IAnzhiDiscountedJoinDao anzhidiscountedjoinDao;
	@Autowired
	private IAnzhiNovelReadMoneyBuyRecordDao anzhinovelreadmoneybuyrecordDao;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	@Autowired
	private IAnzhiChapterSubscribeDao anzhichaptersubscribeDao;
	@Autowired
	private IAnzhiConsumeDao anzhiconsumeDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IAnzhiBookmarkDao anzhibookmarkDao;
	public String mIndex(HttpServletRequest request) {
		//查询本周特惠
		QueryList<AnzhiNovel> benzhou=anzhinovelDao.findAnzhiNovelYouHui(9,1," and discounted_end_date>getdate()");
		request.setAttribute("benzhoutehui", benzhou);
		//完结精品榜(5本，手动调)
		QueryList<AnzhiNovel> wanjiejingxuan=anzhinovelDao.findAnzhiNovelAll(5, 1, " and id in (select novel_id from anzhi_recommend where recommend_position='101')","id");
		request.setAttribute("wanjiejingxuan", wanjiejingxuan);
		//编辑推荐
		QueryList<AnzhiNovel> bainjituijian=anzhinovelDao.findAnzhiNovelAll(4, 1, " and id in (select novel_id from anzhi_recommend where recommend_position='131')","id");
		request.setAttribute("bainjituijian", bainjituijian);
		return "mobile/m_index";
	}
	public String mBangDan(HttpServletRequest request) {
		List<QueryList> ls=new ArrayList<QueryList>();
		for(int i=1;i<=12;i++){
			ls.add(getBanDanData(request,i));
		}
		request.setAttribute("banDanData", ls);
		return "mobile/m_paihangbang";
	}
	
	public QueryList<AnzhiNovel> getBanDanData(HttpServletRequest request,int types){
		QueryList<AnzhiNovel> list=new QueryList<AnzhiNovel>();
		if(types!=-1){
			String nowMonth=" and datediff(day,add_time,getdate())<=30";
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):100;
			int pageNum=this.getPageNum(request);
			if(types==1){
				//月票榜(前20)每月清零一次，即时刷新--也即查询本月的数据
				list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, " and state>1","anzhi_novel_yuepiao");
			}else if(types==2){
				//点击榜(前10)每天即时刷新，不清零
				String c=" and state>1";
				if(this.getInt(request, "shangIndex")==0){
					//周
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dianjilv_zhou");
				}else if(this.getInt(request, "shangIndex")==1){
					//月
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dianjilv_yue");
				}else{
					list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1","click_num");
				}
				
			}else if(types==3){
				//收藏版(前10)每天即时刷新，不清零
				list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1","total_save_num");
			}else if(types==4){
				//更新榜(前10)每天按字数即时刷新，当天24：00清零
				list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, " and state>1","anzhi_novel_gengxin");
			}else if(types==5){
				//推荐榜(前10)每天即时刷新，不清零
				//点击榜(前10)每天即时刷新，不清零
				String c=" and state>1";
				if(this.getInt(request, "shangIndex")==0){
					//周
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_tuijian_zhou");
				}else if(this.getInt(request, "shangIndex")==1){
					//月
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_tuijian_yue");
				}else{
					list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1","total_recommand");
				}
				
			}else if(types==6){
				//订阅榜(前20)每天即时刷新，不清零
				//点击榜(前10)每天即时刷新，不清零
				String c=" and state>1";
				if(this.getInt(request, "shangIndex")==0){
					//周
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dingyue_zhou");
				}else if(this.getInt(request, "shangIndex")==1){
					//月
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dingyue_yue");
				}else{
					list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1","total_dingyue_num");
				}
				
			}else if(types==7){
				//新书月票榜(前20，上架第一个月的新书)每月清零一次，即时刷新，该书当月上架计在该榜
				list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, " and state>1 "+nowMonth,"anzhi_novel_yuepiao");
			}else if(types==8){
				//书友打赏榜(前10)每天即时刷新，不清零
				String c=" and state>1";
				if(this.getInt(request, "shangIndex")==0){
					//周
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dashang_zhou");
					
				}else if(this.getInt(request, "shangIndex")==1){
					//月
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dashang_yue");
				}else{
					list=anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dashang");
				}
			}else if(types==9){
				//新书点击榜(开新书的第一个月，前10)从新书上传开始，30天内，即时刷新
				list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1"+nowMonth,"click_num");	
			}else if(types==10){
				//新书推荐榜(开新书第一个月，前10)从新书上传开始，30天内，即时刷新
				list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1"+nowMonth,"total_recommand");
			}else if(types==11){
				//新书收藏榜(开新书第一个月，前10)从新书上传开始，30天内，即时刷新
				list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and state>1"+nowMonth,"total_save_num");
			}else if(types==12){
				//完结精品榜(5本，手动调)
				list=anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and id in (select novel_id from anzhi_recommend where recommend_position='101')","id");
			}
			novelTypeChange(list);
			setShangJiaData(list);
		}
		return list;
	}
	
	public void setShangJiaData(QueryList<AnzhiNovel> list){
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			an.setIsWebUp(0);
			an.setIsPingTaiUp(0);
			if(an.getIsSigned().equals(0)){//未签约
				QueryList<AnzhiNovelMultifunction> ls=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(2, 1, " and (action_type=16 or action_type=17) and novel_id="+an.getId());
				for(int k=0;k<ls.getList().size();k++){
					AnzhiNovelMultifunction anm=ls.getList().get(k);
					if(anm.getActionType().equals(16)){
						an.setIsWebUp(1);
					}else if(anm.getActionType().equals(17)){
						an.setIsPingTaiUp(1);
					}
				}
			}
		}
	}
	
	public String mShuku(HttpServletRequest request) {
		List<QueryList> ls=new ArrayList<QueryList>();
		for(int i=1;i<=8;i++){
			ls.add(getShukuData(request,i-1));
		}
		request.setAttribute("shukuData", ls);
		return "mobile/m_shuku";
	}
	
	//搜索书籍
	public String msearch(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=" and state>1";
		if(this.checkParam(request, "novelTitles")){
			condition+=" and (novel_label like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%' or author_writer_name like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%' or novel_title like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%')";
		}else{
			condition+=" and 1=2";
		}
		QueryList<AnzhiNovel> searchlist=anzhinovelDao.findAnzhiNovelAll(size, pageNum, condition, "id");
		setShangJiaData(searchlist);
		novelTypeChange(searchlist);
		request.setAttribute("searchlist", searchlist);
		return "mobile/m_search";
	}
	//书架
	public String mbookcase(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		if(request.getSession().getAttribute("loginUsers")!=null){
			AnzhiMember am=(AnzhiMember)request.getSession().getAttribute("loginUsers");
			QueryList<AnzhiNovelMultifunction> shujialist =anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size, pageNum, " and action_type=1 and member_id="+am.getId());
			request.setAttribute("shujialist", shujialist);
		}
		//novelTypeChange(shujialist);
		return "mobile/m_bookcase";
	}
	public String mpinglun(HttpServletRequest request) {
		if(this.getInt(request, "novelId")!=-1){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
			int pageNum=this.getPageNum(request);
			QueryList<AnzhiComment> pinglunlist=anzhiCommentDao.findAnzhiCommentAll(size, pageNum, " and comment_fatherid=0 and comment_type=0  and state<2  and table_id="+this.getInt(request, "novelId"));
			for(AnzhiComment p:pinglunlist.getList()){
				p.setReplyNum(this.getIntBySqlDb("select count(*) from anzhi_comment where table_id="+this.getInt(request, "novelId")+" and state!=2 and comment_fatherid="+p.getId()));
			}
			request.setAttribute("novelTitle",this.getStringBySqlDb("select novel_title from anzhi_novel where id="+this.getInt(request, "novelId")));
			request.setAttribute("pinglunlist", pinglunlist);
		}
		
		return "mobile/m_pinglun";
	}
	
	public QueryList<AnzhiNovel> getShukuData(HttpServletRequest request,int types){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):100;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelAll(size, pageNum, " and novel_type like '%"+novelBigTypeData[types]+"@%'", "id");
		novelTypeChange(list);
		setShangJiaData(list);
		return list;
	}
	public String mChapterMenu(HttpServletRequest request) {
		QueryList<AnzhiNovel> pl=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
		QueryList<AnzhiFenJuan> list=anzhifenjuanDao.findAnzhiFenJuanAll(1000,1," and novel_id="+this.getInt(request, "novelId"));
		if(request.getParameter("novelId")!=null&&!request.getParameter("novelId").equals("")){
			for(AnzhiFenJuan a:list.getList()){
				a.setLs(this.excuteQuery(new AnzhiChapter(), "select * from anzhi_chapter_report_nopass where state=1 and fen_juan_id="+a.getId()+" order by id asc"));
			}
		}
		
		if(request.getSession().getAttribute("loginUsers")!=null){
			AnzhiMember am=(AnzhiMember)request.getSession().getAttribute("loginUsers");
			//查找该书的书签
			QueryList<AnzhiBookmark> ls=anzhibookmarkDao.findAnzhiBookmarkAll(10000, 1, " and bookmark_type=1 and member_id="+am.getId()+" and novel_id="+this.getInt(request, "novelId"));
			request.setAttribute("markData", ls);
			int shoucangNum=this.getIntBySqlDb("select * from anzhi_novel_multifunction where action_type=1 and novel_id="+this.getInt(request, "novelId")+" and member_id="+am.getId());
			request.setAttribute("shoucangBoolean", shoucangNum==0?true:false);
		}else{
			request.setAttribute("shoucangBoolean", true);
		}
		
		request.setAttribute("chapterData", list);
		request.setAttribute("pojo", pl.getList().size()==0?null: pl.getList().get(0));
		return "mobile/main_menu";
	}
	
	public String cashRead(HttpServletRequest request, AnzhiMember am) {
		int chapterId=this.getInt(request, "chapterId");
		if(chapterId==0){
			request.setAttribute("readFlag", "no");
			request.setAttribute("errorInfo", "当前已经是第一页或最后一页了!");
			return "404";
		}
		//获得小说id
		int novelId=0;
		
		QueryList<AnzhiChapter> lt=anzhichapterDao.findAnzhiChapterAll(1, 1, " and id="+chapterId);
		if(lt.getList().size()==0){
			request.setAttribute("readFlag", "no");
			request.setAttribute("errorInfo", "章节数据读取异常!");
			return "mobile/chapter_read";
		}
		AnzhiChapter anzhiChapter=lt.getList().get(0);
		String content=anzhiChapter.getChapterContent();
		if(content!=null){
			try {
				while(content.indexOf("\n")!=-1){
					content=content.replace("\n", "<p class='chapter_content_read_css'>");
				}
			} catch (Exception e) {
				
			}
		}
		anzhiChapter.setChapterContent(content);
		request.setAttribute("pojo",anzhiChapter );
		novelId=anzhiChapter.getNovelId();
		request.setAttribute("novelId",novelId );
		request.setAttribute("nextChapter", this.getIntBySqlDb("select top 1 id from anzhi_chapter_report where novel_id="+novelId+" and id>"+anzhiChapter.getId()+" order by id asc"));
		request.setAttribute("upChapter", this.getIntBySqlDb("select top 1 id from anzhi_chapter_report where novel_id="+novelId+" and id<"+anzhiChapter.getId()+" order by id desc"));
		
		if(am!=null&&am.getMemberNo().equals("admin")&&am.getMemberType().equals(2)){
			request.setAttribute("readFlag", "yes");
			return "mobile/chapter_read";
		}
		
		//查询本小说是否参加了优惠活动
		double zhekou=1;
		int discountedType_t=4;
		QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
		//优惠的记录
		AnzhiNovel youhuiNovel=null;
		if(youhui.getList().size()!=0){
			youhuiNovel=youhui.getList().get(0);
			discountedType_t=youhuiNovel.getDiscountedType();
			zhekou=youhuiNovel.getDiscountedRebate();
		}
		//如果是本周免费、限时免费，则不要任何验证。
		if(discountedType_t>1){
			//获得章节的阅读类型
			int readType=this.getIntBySqlDb("select read_type from anzhi_chapter where id="+chapterId);
			if(readType==1){//说明是VIP
				if(am==null||am.getId()==null){
					request.setAttribute("readFlag", "no");
					request.setAttribute("errorInfo", "您还没有登录呢!");
				}else{
					//查找小说作者
					int authorMemberId=this.getIntBySqlDb("select author_id from anzhi_novel where id="+novelId);
					//如果是作者本身，还验证个屁
					if(am.getId().equals(authorMemberId)&&am.getId().equals(-11)){//绝不可能，作家本身也要验证
						request.setAttribute("readFlag", "yes");
					}else{
						//需要查询当前用户是否用阅读币购买了本章节
						int readN=this.getIntBySqlDb("select count(*) from anzhi_novel_read_money_buy_record where chapter_id="+chapterId+" and member_id="+am.getId());
						//需要查询当前用户是否购买了本章节
						int n=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe where chapter_id="+chapterId+" and member_id="+am.getId());
						if(readN==0&&n==0){
							//都没有购买
							//看看有没有阅读币
							int readMoney=this.getIntBySqlDb("select read_money from anzhi_member where id="+am.getId());
							//获得该章节的字数
							int chapterCharNum=this.getIntBySqlDb("select chapter_char_num from anzhi_chapter where id="+chapterId);
							int needMoney=(int)(getAnZhiBi(chapterCharNum)*zhekou);
							needMoney=this.getVipDiscount(this.getVipLevel(am.getId()), needMoney);
							if(needMoney<=readMoney){
								List<Pojo> pojoList=new ArrayList<Pojo>();
								if(youhuiNovel!=null){
									//添加参与优惠的记录
									AnzhiDiscountedJoin anzhidiscountedjoin=new AnzhiDiscountedJoin();
									anzhidiscountedjoin.setAddTime(getNowTime());
									anzhidiscountedjoin.setDiscountedId(youhuiNovel.getDiscountedId());
									anzhidiscountedjoin.setMemberId(am.getId());
									anzhidiscountedjoin.setState(0);
									anzhidiscountedjoin.setVote("使用阅读币章节自动购买");
									pojoList.add(anzhidiscountedjoinDao.addAnzhiDiscountedJoin(anzhidiscountedjoin));
								}
								//添加阅读币使用记录
								AnzhiNovelReadMoneyBuyRecord ac=new AnzhiNovelReadMoneyBuyRecord();
								ac.setAddTime(getNowTime());
								ac.setAfterReadMoney(readMoney-needMoney);
								ac.setBeforeReadMoney(readMoney);
								ac.setChapterId(chapterId);
								ac.setMemberId(am.getId());
								ac.setState(0);
								ac.setUserMoney(needMoney);
								ac.setVote("阅读币购买");
								pojoList.add(anzhinovelreadmoneybuyrecordDao.addAnzhiNovelReadMoneyBuyRecord(ac));
								
								this.excuteUpdate(pojoList);
								
								//修改当前登录用户的阅读币		
								this.updateTableFieldAppend("anzhi_member", am.getId(), "read_money", (-needMoney));
								
								am.setReadMoney(readMoney-needMoney);
								request.getSession().setAttribute("loginUsers", am);//重新设置
								request.setAttribute("readFlag", "yes");
								String youhuiInfo="";
								if(discountedType_t==2||discountedType_t==3){
									youhuiInfo="本书目前有["+discountedType[discountedType_t]+"]优惠,购买折扣为:"+zhekou*10+"折。";
								}
								request.setAttribute("buyInfo", "当前小说是VIP章节，已经使用阅读币自动为您购买。"+youhuiInfo+"小说总字数"+chapterCharNum+"，花费"+needMoney+"阅读币。您账户阅读币余额为："+(readMoney-needMoney));
								//修改小说的阅读次数	
								this.updateTableFieldAppend("anzhi_novel", novelId, "read_num", 1);
								return "mobile/chapter_read";
							}
							
							
							//先查询是否已经订阅鸟
							int autoBuy=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and member_id="+am.getId()+" and action_type=5");
							if(autoBuy==0){//说明没有自动订阅，
								request.setAttribute("readFlag", "no");
								request.setAttribute("errorInfo", "该章节您还没有购买呢!");
							}else{
								//真的订阅鸟,那就直接购买
								//获得该章节的字数
								/*int chapterCharNum=this.getIntBySqlDb("select chapter_char_num from anzhi_chapter where id="+chapterId);
								int needMoney=(int)(getAnZhiBi(chapterCharNum)*zhekou);*/
								//需要重新获得当前用户的账户余额
								int remainMoney=this.getIntBySqlDb("select member_money from anzhi_member where id="+am.getId());
								//验证钱是否够
								if(needMoney>remainMoney){
									request.setAttribute("readFlag", "no");
									request.setAttribute("errorInfo", "您设置了自动购买VIP章节，当前账户安之币余额不足!不能进行自动购买。");
								}else{
									List<Pojo> pojoList=new ArrayList<Pojo>();
									if(youhuiNovel!=null){
										//添加参与优惠的记录
										AnzhiDiscountedJoin anzhidiscountedjoin=new AnzhiDiscountedJoin();
										anzhidiscountedjoin.setAddTime(getNowTime());
										anzhidiscountedjoin.setDiscountedId(youhuiNovel.getDiscountedId());
										anzhidiscountedjoin.setMemberId(am.getId());
										anzhidiscountedjoin.setState(0);
										anzhidiscountedjoin.setVote("章节自动订阅购买");
										pojoList.add(anzhidiscountedjoinDao.addAnzhiDiscountedJoin(anzhidiscountedjoin));
									}		
									AnzhiChapterSubscribe acs=new AnzhiChapterSubscribe();
									acs.setChapterId(chapterId);
									acs.setMemberId(am.getId());
									acs.setAddTime(this.getNowTime());
									acs.setState(0);
									acs.setVote("章节自动订阅购买");
									pojoList.add(anzhichaptersubscribeDao.addAnzhiChapterSubscribe(acs));
									
									//查询一下，该小说是否有被网编报备
									int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_author where novel_id="+novelId);
									if(editorId!=0){
										//增加网编的积分
										pojoList.add(anzhiwebeditorDao.updateScore(editorId, 5));
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
									checkSubscribeTask(1,am,pojoList,anzhiexperiencerecordDao);
									
									this.excuteUpdate(pojoList);
									
									//修改当前登录用户的安之币
									//A、修改当前用户的余额 		B、同时给该小说作者增加安之币
									this.updateTableFieldAppend("anzhi_member", am.getId(), "member_money", (-needMoney));
									//修改小说作者的安之币余额
									this.updateTableFieldAppend("anzhi_member", authorMemberId, "member_money", (needMoney));
									
									am.setMemberMoney(remainMoney-needMoney);
									request.getSession().setAttribute("loginUsers", am);//重新设置
									request.setAttribute("readFlag", "yes");
									String youhuiInfo="";
									if(discountedType_t==2||discountedType_t==3){
										youhuiInfo="本书目前有["+discountedType[discountedType_t]+"]优惠,购买折扣为:"+zhekou*10+"折。";
									}
									request.setAttribute("buyInfo", "您设置了自动订阅，当前小说是VIP章节，已经自动为您购买。"+youhuiInfo+"小说总字数"+chapterCharNum+"，花费"+needMoney+"安之币。您账户安之币余额为："+(remainMoney-needMoney));
								}
							}
						}else{
							request.setAttribute("readFlag", "yes");
						}
						
					}
				}
			}else{
				request.setAttribute("readFlag", "yes");
			}
		}else{
			request.setAttribute("readFlag", "yes");
		}
			
		//修改小说的阅读次数	
		this.updateTableFieldAppend("anzhi_novel", novelId, "read_num", 1);
		this.updateTableFieldAppend("anzhi_novel", novelId, "click_num", 1);
		//添加小说点击量
		AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
		anm.setActionType(0);
		anm.setAddTime(this.getNowTime());
		anm.setMemberId(0);
		anm.setNovelId(novelId);
		anm.setState(0);
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		this.excuteUpdate(pojoList);
		return "mobile/chapter_read";
	}
	public String myBookMark(HttpServletRequest request) {
		if(request.getSession().getAttribute("loginUsers")!=null){
			AnzhiMember am=(AnzhiMember)request.getSession().getAttribute("loginUsers");
			//查找该书的书签
			QueryList<AnzhiBookmark> ls=anzhibookmarkDao.findAnzhiBookmarkAll(10000, 1, " and bookmark_type=1 and member_id="+am.getId());
			request.setAttribute("markData", ls);
		}
		return "mobile/myBookMark";
	}
	public String moreDiscount(HttpServletRequest request) {
		//查询本周免费
		QueryList<AnzhiNovel> benzhou=anzhinovelDao.findAnzhiNovelYouHui(4,1," and discounted_type=0 and discounted_end_date>getdate()");
		//查询限时免费
		QueryList<AnzhiNovel> xianshimianfei=anzhinovelDao.findAnzhiNovelYouHui(10,1," and discounted_type=1 and discounted_end_date>getdate()");
		//查询完本优惠
		QueryList<AnzhiNovel> wanbenyouhui=anzhinovelDao.findAnzhiNovelYouHui(10,1," and discounted_type=2 and discounted_end_date>getdate()");
		//查询红文优惠
		QueryList<AnzhiNovel> hongwenyouhui=anzhinovelDao.findAnzhiNovelYouHui(10,1," and discounted_type=3 and discounted_end_date>getdate()");
		request.setAttribute("benzhou",novelTypeChange(benzhou));
		request.setAttribute("xianshimianfei",novelTypeChange(xianshimianfei));
		request.setAttribute("wanbenyouhui",novelTypeChange(wanbenyouhui));
		request.setAttribute("hongwenyouhui",novelTypeChange(hongwenyouhui));
		return "mobile/moreDiscount";
	}

}
