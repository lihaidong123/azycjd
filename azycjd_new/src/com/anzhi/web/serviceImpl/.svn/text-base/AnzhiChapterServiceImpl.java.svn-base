package com.anzhi.web.serviceImpl;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiChapterSubscribeDao;
import com.anzhi.web.dao.IAnzhiChapterUpdateRecordDao;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import com.anzhi.web.dao.IAnzhiDiscountedJoinDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiIllegalCharDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyBuyRecordDao;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.pojo.AnzhiChapterUpdateRecord;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.pojo.AnzhiIllegalChar;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinChapter;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
import com.anzhi.web.pojo.ChapterSubscribeNum;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiChapterServiceImpl extends ActionDb  implements IAnzhiChapterService {
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiChapterUpdateRecordDao anzhichapterupdaterecordDao;
	@Autowired
	private IAnzhiChapterSubscribeDao anzhichaptersubscribeDao;
	@Autowired
	private IAnzhiConsumeDao anzhiconsumeDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiDiscountedJoinDao anzhidiscountedjoinDao;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiIllegalCharDao anzhiillegalcharDao;
	@Autowired
	private IAnzhiNovelReadMoneyBuyRecordDao anzhinovelreadmoneybuyrecordDao;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	public boolean addAnzhiChapter(String path,AnzhiChapter anzhichapter){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		if(anzhichapter.getChapterCharNum()!=null&&anzhichapter.getChapterCharNum()<0){
			return false;
		}
		//先获得章节所在小说id
		int novelId=Integer.parseInt(this.getObjectBySql("select novel_id from anzhi_fen_juan where id="+anzhichapter.getFenJuanId()).toString());
		
		//如果是立即发布，则需要检查是否违法。如果没有，则需要重新生成小说的目录，以及生成小说的阅读界面
		boolean rights=checkIllegal(anzhichapter,pojoList);
		//先看有没有签约
		int n=this.getIntBySqlDb("select is_signed from anzhi_novel where id="+novelId);
		if(n==1){
			//已经签约，则查询有没有加v的章节
			n=this.getIntBySqlDb("select count(*) from anzhi_chapter_report where read_type=1 and novel_id="+novelId);
		}else if(n==0){
			//说明没有签约 查询是否网站上架    或   平台上架
			n+=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and (action_type=17 or action_type=16)");
		}	
		anzhichapter.setReadType(n==0?0:1);//设置阅读方式
		int id=this.excuteUpdate(anzhichapterDao.addAnzhiChapter(anzhichapter));
		anzhichapter.setId(id);
		if(rights){
			//添加违法记录
			addMulit(anzhichapter,pojoList);
		}
		
		if(anzhichapter.getState().equals(1)){//只有是立即发布才做如下操作
			//当添加章节的时候，同时需要修改作品的最后更新时间
			pojoList.add(this.updateTableField("anzhi_novel",novelId , "update_time", this.getNow()));
			//只有VIP章节才记录更新字数
			if(anzhichapter.getReadType().equals(1)){
				//同时添加章节修改记录
				AnzhiChapterUpdateRecord acur=new AnzhiChapterUpdateRecord();
				acur.setAddTime(this.getNowTime());
				acur.setChapterId(id);
				acur.setUpdateNum(anzhichapter.getChapterCharNum());
				pojoList.add(anzhichapterupdaterecordDao.addAnzhiChapterUpdateRecord(acur));
			}
			//修改小说的总字数
			int nn=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where novel_id="+novelId);
			pojoList.add(this.updateTableField("anzhi_novel",novelId , "total_char_num", nn));
			updateNovelMenu(path, anzhichapter, novelId);//修改小说的目录
			anzhinovelService.createNovel(path, novelId);//生成小说
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	
	public boolean addBatchAnzhiChapter(List<AnzhiChapter> list){
		return anzhichapterDao.addBatchAnzhiChapter(list);
	}

	public boolean delAnzhiChapter(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichapterDao.delAnzhiChapter(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiChapter(String ids){
		return anzhichapterDao.delBatchAnzhiChapter(ids);
	}

	public boolean updateAnzhiChapter(String path,AnzhiChapter anzhichapter,int updateNum){
		if(anzhichapter.getChapterCharNum()!=null&&anzhichapter.getChapterCharNum()<0){
			return false;
		}
		boolean isCreate=false;
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//先获得章节所在小说id
		int novelId=Integer.parseInt(this.getObjectBySql("select novel_id from anzhi_fen_juan where id="+anzhichapter.getFenJuanId()).toString());
		//如果是立即发布，则需要检查是否违法。如果没有，则需要重新生成小说的目录，以及生成小说的阅读界面
		boolean rights=checkIllegal(anzhichapter,pojoList);
		//获得该章节的阅读方式。修改章节不会影响之前的阅读方式。原来是VIP任然是，免费的任然免费！
		int readType=this.getIntBySqlDb("select read_type from anzhi_chapter where id="+anzhichapter.getId());
		anzhichapter.setReadType(readType);//设置阅读方式
		if(rights){
			addMulit(anzhichapter,pojoList);
		}
		if(anzhichapter.getState().equals(1)){//只有是立即发布才能执行如下操作
			//当添加章节的时候，同时需要修改作品的最后更新时间
			isCreate=true;
			pojoList.add(this.updateTableField("anzhi_novel",novelId , "update_time", this.getNow()));
			//修改小说的总字数
			int nn=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where id!="+anzhichapter.getId()+" and novel_id="+novelId);
			pojoList.add(this.updateTableField("anzhi_novel",novelId , "total_char_num", (nn+anzhichapter.getChapterCharNum())));
			//只有VIP章节才记录更新字数
			if(updateNum==-1){
				//说明是定时发布的
				anzhichapter.setLastUpdateTime(anzhichapter.getAddTime());//将最后更新时间换成发布时间
			}
			if(anzhichapter.getReadType().equals(1)){
				AnzhiChapterUpdateRecord acur=new AnzhiChapterUpdateRecord();
				if(updateNum==-1){
					//说明是定时发布的
					acur.setAddTime(anzhichapter.getAddTime());
				}else{
					//立即发布。
					acur.setAddTime(this.getNowTime());
				}
				acur.setChapterId(anzhichapter.getId());
				acur.setUpdateNum(anzhichapter.getChapterCharNum());
				pojoList.add(anzhichapterupdaterecordDao.addAnzhiChapterUpdateRecord(acur));
			}
			updateNovelMenu(path, anzhichapter, novelId);//修改小说的目录
			anzhinovelService.createNovel(path, novelId);//生成小说
		}	
		pojoList.add(anzhichapterDao.updateAnzhiChapter(anzhichapter));
		//修改该章节所有的未通过的记录,使其不用提醒老是待审核！
		pojoList.add(anzhinovelmultifunctionDao.updateAnzhiNovelMultifunction(anzhichapter.getId(), 10, 1,2));
		this.excuteUpdate(pojoList);
		
		return isCreate;
	}

	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition){
		return anzhichapterDao.findAnzhiChapterAll(size,pageNum,condition);
	}

	public QueryList<ChapterSubscribeNum> findChapterSubscribeNumAll(int size,
			int pageNum, String condition, int novelId) {
		return this.findChapterDingYueNumDb(size, pageNum, condition, novelId);
	}

	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size, int pageNum,
			String condition, String orderField) {
		// TODO Auto-generated method stub
		return anzhichapterDao.findAnzhiChapterAll(size, pageNum, condition,orderField);
	}

	/**
	 * 章节订阅数
	 * 
	 */
	public void dingyuechaxu(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):1000;
		int pageNum=this.getPageNum(request);
		
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelAll(10, 1, " and id="+this.getInt(request, "novelId"),"id");
		if(list.getList().size()!=0){
			AnzhiNovel m=list.getList().get(0);
			request.setAttribute("pojo", m);
			int zongdingyue=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe_report where novel_id="+this.getInt(request, "novelId"));
			int zongzahngjie=this.getIntBySqlDb("select count(*) from anzhi_chapter_report where read_type=1 and novel_id="+this.getInt(request, "novelId"));
			request.setAttribute("zongdingyue",zongdingyue );
			request.setAttribute("pingjundingyue",(zongdingyue==0||zongzahngjie==0)?0:zongdingyue/zongzahngjie );
			request.setAttribute("zuigaodingyue", this.getIntBySqlDb("select count(*) as nums,chapter_id  from anzhi_chapter_subscribe_report where novel_id="+this.getInt(request, "novelId")+" group by chapter_id order by nums desc"));
			request.setAttribute("zuoridingyue", this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe_report where (ding_yue_time between '"+getDateStr(new Timestamp(new Date().getTime()),-1,false)+"' and '"+getDateStr(new Timestamp(new Date().getTime()),-1,true)+"') and novel_id="+this.getInt(request, "novelId")));
			
			request.setAttribute("chapterNumData", this.findChapterSubscribeNumAll(size, pageNum, null, this.getInt(request, "novelId")));
		}
	}

	/**
	 * 跳转小说阅读界面
	 */
	public String cashRead(HttpServletRequest request, int chapterId, AnzhiMember am) {
		if(chapterId==0){
			request.setAttribute("readFlag", "no");
			request.setAttribute("errorInfo", "当前已经是第一页或最后一页了!");
			return "404";
		}
		//获得小说id
		int novelId=this.getIntBySqlDb("select novel_id from anzhi_chapter_report where id="+chapterId);
		
		if(am!=null&&am.getMemberNo().equals("admin")&&am.getMemberType().equals(2)){
			request.setAttribute("readFlag", "yes");
			return "novel/"+novelId+"/"+chapterId;
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
								return "novel/"+novelId+"/"+chapterId;
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
			
		//修改小说的阅读次数	点击数
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
		
		return "novel/"+novelId+"/"+chapterId;
	}

	/**
	 * 加载购买章节、全书章节、或订阅界面
	 */
	public String loadBuyChapter(HttpServletRequest request, int chapterId,
			AnzhiMember am) {
		if(am==null||am.getId()==null){
			request.setAttribute("noLogin", "no");
		}else{
			//获得小说id
			int novelId=this.getIntBySqlDb("select novel_id from anzhi_chapter_report where id="+chapterId);
			/**
			 * 加载小说有无优惠信息
			 */
			//查询本小说是否参加了优惠活动
			double zhekou=1;
			QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
			if(youhui.getList().size()!=0){
				AnzhiNovel youhuiNovel=youhui.getList().get(0);
				request.setAttribute("youhuiJoin", "yes");
				request.setAttribute("discountedType", youhuiNovel.getDiscountedType());
				request.setAttribute("discountedTypeName", discountedType[youhuiNovel.getDiscountedType()]);
				request.setAttribute("discountedEndDate", new SimpleDateFormat("yyyy/MM/dd HH:mm").format(youhuiNovel.getDiscountedEndDate()));
				request.setAttribute("discountedRebate", youhuiNovel.getDiscountedType()>1?youhuiNovel.getDiscountedRebate()+"折":(youhuiNovel.getDiscountedType().equals(0)?"本周免费":"限时免费"));
				zhekou=youhuiNovel.getDiscountedRebate();
			}
			
			//获得小说名称
			String novelName=this.getStringBySqlDb("select novel_title from anzhi_novel where id="+novelId);
			request.setAttribute("novelName", novelName);
			request.setAttribute("novelId", novelId);
			//先查询该章节是够已经购买
			QueryList<AnzhiChapter> ls=anzhichapterDao.findAnzhiChapterAll(5, 1, " and id="+chapterId);
			if(ls.getList().size()==0){//章节数据读取异常,防止乱来
				return "500";
			}
			AnzhiChapter ac=ls.getList().get(0);
			ac.setAnzhibi((int)(ac.getAnzhibi()*zhekou));
			request.setAttribute("chapterPojo", ac);
			int n=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe where chapter_id="+chapterId+" and member_id="+am.getId());
			if(n!=0){
				//已经购买了
				request.setAttribute("buychapter", "yes");
			}
			//获得该小说下的所有没有购买的VIP章节
			int noBuyVip=this.getIntBySqlDb("select count(*) from anzhi_chapter_report where id not in(select chapter_id from anzhi_chapter_subscribe where member_id="+am.getId()+") and read_type=1 and novel_id="+novelId);
			//先获得该小说下的所有没有购买的VIP章节的字数
			int noBuyCharNum=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where read_type=1 and id not in(select chapter_id from anzhi_chapter_subscribe where member_id="+am.getId()+") and novel_id="+novelId);
			request.setAttribute("noBuyVip", noBuyVip);
			request.setAttribute("noBuyCharNum", noBuyCharNum);
			request.setAttribute("needAnzhiBi", (int)(this.getAnZhiBi(noBuyCharNum)*zhekou));
		}
		String pn="buy_chapter";
		if(request.getParameter("pageName")!=null){
			pn=request.getParameter("pageName");
		}
		return pn;
	}

	public QueryList<AnzhiNovelMultiJoinChapter> findAnzhiNovelMultiJoinChapterAll(
			int size, int pageNum, String condition, String orderField) {
		return anzhichapterDao.findAnzhiNovelMultiJoinChapterAll(size, pageNum, condition, orderField);
	}

	public String addSetChaptetVip(HttpServletRequest request) {
		String[] arr=request.getParameter("ids").split("@");
		for(String s:arr){
			this.updateTableFieldVoid("anzhi_chapter", Integer.parseInt(s), "read_type", 1);
		}
		return "加V成功！";
	}
	
	/**
	 * 检查是否违法
	 * @param anzhichapter
	 * @return
	 */
	public boolean checkIllegal(AnzhiChapter anzhichapter,List<Pojo> pojoList){
		if(anzhichapter.getState().equals(0)){//还是草稿
			return false;
		}
		if(anzhichapter.getState().equals(1)||anzhichapter.getState().equals(2)){//立即发布、定时发布
			QueryList<AnzhiIllegalChar> list=anzhiillegalcharDao.findAnzhiIllegalCharAll(5000, 1, null);
			boolean con=false;
			for(AnzhiIllegalChar ac:list.getList()){
				if(anzhichapter.getChapterContent().indexOf(ac.getCharName())!=-1){
					con=true;
					break;
				}
			}
			anzhichapter.setState(con?3:anzhichapter.getState());
			return con;
		}
		return false;
	}
	
	public void addMulit(AnzhiChapter anzhichapter,List<Pojo> pojoList){
		AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
		anm.setNovelId(anzhichapter.getId());//这里存储的是章节的id！
		anm.setMemberId(0);//这里不跟memberId挂钩
		anm.setActionType(10);
		anm.setState(0);
		anm.setAddTime(getNowTime());
		anm.setVote("章节违法");
		pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
	}
	
	/**
	 * 修改小说目录、生成章节阅读界面
	 * @param path
	 * @param anzhichapter
	 * @param novelId
	 * @param ac
	 * @return
	 */
	public void updateNovelMenu(String path,AnzhiChapter ac,int novelId){
		if(ac.getState().equals(1)){//立即发布
			QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
			if(ls.getList().size()!=0){
				AnzhiNovel an=ls.getList().get(0);
				//更新小说目录
				utilService.createNovelChapter(an, path);
			}
		}
	}


	public File novelTxt(String path,int novelId) {
		QueryList<AnzhiChapter> ls=anzhichapterDao.findAnzhiChapterAll(5000, 1, " and novel_id="+novelId);
		File f=new File(path+"/txt/"+novelId+".txt");
		if(!f.exists()){
			try {
				f.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			FileOutputStream fis=new FileOutputStream(f);
			String content="";
			for(int i=0;i<ls.getList().size();i++){
				AnzhiChapter ac=ls.getList().get(i);
				String infd=ac.getChapterContent();
				while(infd.indexOf("<br>")!=-1||infd.indexOf("<br />")!=-1||infd.indexOf("<p>")!=-1||infd.indexOf("&nbsp;")!=-1){
					infd=infd.replaceAll("<br>", "\r\n");
					infd=infd.replaceAll("<br />", "\r\n");
					infd=infd.replaceAll("<p>", "\r\n");
					infd=infd.replaceAll("&nbsp;", "\t");
				}
				content+=infd;
			}
			fis.write(content.getBytes());
			fis.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
}