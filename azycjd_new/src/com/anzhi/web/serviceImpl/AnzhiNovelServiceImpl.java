package com.anzhi.web.serviceImpl;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiChapterUpdateRecordDao;
import com.anzhi.web.dao.IAnzhiCommentDao;
import com.anzhi.web.dao.IAnzhiCommentPraiseDao;
import com.anzhi.web.dao.IAnzhiFenJuanDao;
import com.anzhi.web.dao.IAnzhiIllegalCharDao;
import com.anzhi.web.dao.IAnzhiNewsDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelLabelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IAnzhiNovelRewardDao;
import com.anzhi.web.dao.IAnzhiNovelTypeDao;
import com.anzhi.web.dao.IAnzhiPictureDao;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiChapterUpdateRecord;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiCommentPraise;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiIllegalChar;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelLabel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelReward;
import com.anzhi.web.pojo.AnzhiNovelType;
import com.anzhi.web.pojo.AnzhiPicture;
import com.anzhi.web.pojo.CommentPraise;
import com.anzhi.web.pojo.DaojuPojo;
import com.anzhi.web.pojo.NeedDoTaskNum;
import com.anzhi.web.pojo.NovelFansList;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelServiceImpl extends ActionDb  implements IAnzhiNovelService {
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiNovelTypeDao anzhinoveltypeDao;
	@Autowired
	private IAnzhiNovelRewardDao anzhinovelrewardDao;
	@Autowired
	private IAnzhiCommentDao anzhicommentDao;
	@Autowired
	private IAnzhiNewsDao anzhinewsDao;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiCommentPraiseDao anzhicommentpraiseDao;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelLabelDao anzhinovellabelDao;
	@Autowired
	private IAnzhiFenJuanDao anzhifenjuanDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IAnzhiChapterUpdateRecordDao anzhichapterupdaterecordDao;
	@Autowired
	private IAnzhiIllegalCharDao anzhiillegalcharDao;
	@Autowired
	private IAnzhiPictureDao anzhipictureDao;
	public int addAnzhiNovel(HttpServletRequest request,AnzhiNovel anzhinovel){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//添加记录，并获得插入进去的小说id
		anzhinovel.setAddTime(getNowTime());
		int id=this.excuteUpdate(anzhinovelDao.addAnzhiNovel(anzhinovel));
		//添加小说的时候，需要将小说的类型批量添加进去
		if(anzhinovel.getNovelType()!=null&&!anzhinovel.getNovelType().equals("")){
			String[] arr=anzhinovel.getNovelType().split("/");//数据格式：玄幻奇幻@异界大陆;异界争霸;
			for(String s:arr){
				if(!s.equals("")){
					String[] st=s.split("@");//数据格式：[0]玄幻奇幻  [1]异界大陆;异界争霸;
					if(!st[1].equals("")){
						String[] small=st[1].split(";");//单独的小类
						for(String tm:small){
							AnzhiNovelType at=new AnzhiNovelType();
							at.setAddTime(getNowTime());
							at.setBigType(st[0]);
							at.setNovelId(id);
							at.setSmallType(tm);
							pojoList.add(anzhinoveltypeDao.addAnzhiNovelType(at));
						}
					}
				}
			}
		}
		AnzhiFenJuan anzhifenjuan=new AnzhiFenJuan();
		anzhifenjuan.setNovelId(id);
		anzhifenjuan.setJuanName("正文内容");
		anzhifenjuan.setJuanVote("正文内容");
		anzhifenjuan.setAddTime(getNowTime());
		int fenjuanid=this.excuteUpdate(anzhifenjuanDao.addAnzhiFenJuan(anzhifenjuan));
		
		//先获得章节所在小说id
		int novelId=id;
		String eda=new SimpleDateFormat("yyyy").format(new Date())+"-"+request.getParameter("yue")+"-"+request.getParameter("tian")+" "+request.getParameter("dian")+":"+request.getParameter("fen")+":00";
		AnzhiChapter anzhichapter=new AnzhiChapter();
		anzhichapter.setFenJuanId(fenjuanid);
		anzhichapter.setChapterCharNum(this.getInt(request, "chapterCharNum"));
		anzhichapter.setChapterContent(request.getParameter("chapterContent"));
		anzhichapter.setChapterTitle(request.getParameter("chapterTitle"));
		anzhichapter.setChapterVote("");
		anzhichapter.setState(this.getInt(request, "state"));
		anzhichapter.setAddTime(this.getTimestampFull(eda));
		anzhichapter.setLastUpdateTime(getNowTime());
		anzhichapter.setVote("");
		//如果是立即发布，则需要检查是否违法。如果没有，则需要重新生成小说的目录，以及生成小说的阅读界面
		boolean rights=checkIllegal(anzhichapter,pojoList);
		
		//先看有没有签约
		int n=0;
		if(n==0){
			//说明没有签约 查询是否网站上架    或   平台上架
			n+=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and (action_type=17 or action_type=16)");
		}	
		anzhichapter.setReadType(n==0?0:1);//设置阅读方式
		int chapterid=this.excuteUpdate(anzhichapterDao.addAnzhiChapter(anzhichapter));
		anzhichapter.setId(chapterid);
		if(rights){
			//添加违法记录
			addMulit(anzhichapter,pojoList);
		}
		
		if(anzhichapter.getState().equals(1)){//只有是立即发布才做如下操作
			if(anzhichapter.getChapterCharNum()!=null&&anzhichapter.getChapterCharNum()>0){
				updateNovelMenu(request.getRealPath("//"), anzhichapter, novelId);
				//当添加章节的时候，同时需要修改作品的最后更新时间
				pojoList.add(this.updateTableField("anzhi_novel",novelId , "update_time", this.getNow()));
				
				//同时添加章节修改记录
				AnzhiChapterUpdateRecord acur=new AnzhiChapterUpdateRecord();
				acur.setAddTime(this.getNowTime());
				acur.setChapterId(chapterid);
				acur.setUpdateNum(anzhichapter.getChapterCharNum());
				pojoList.add(anzhichapterupdaterecordDao.addAnzhiChapterUpdateRecord(acur));
				
				//修改小说的总字数
				//int n=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where novel_id="+novelId);
				pojoList.add(this.updateTableField("anzhi_novel",novelId , "total_char_num", (anzhichapter.getChapterCharNum())));
			}
		}
	
		this.excuteUpdate(pojoList);
		//创建小说介绍
		this.createNovel(request.getRealPath("//"), id);
		//创建小说目录
		anzhinovel.setId(id);
		utilService.createNovelChapter(anzhinovel, request.getRealPath("//"));
		return id;
	}

	public boolean addBatchAnzhiNovel(List<AnzhiNovel> list){
		return anzhinovelDao.addBatchAnzhiNovel(list);
	}

	public boolean delAnzhiNovel(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelDao.delAnzhiNovel(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovel(String ids){
		return anzhinovelDao.delBatchAnzhiNovel(ids);
	}

	public boolean updateAnzhiNovel(HttpServletRequest request,AnzhiNovel anzhinovel,boolean con,String novelTile){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelDao.updateAnzhiNovel(anzhinovel));
		//先删除
		pojoList.add(anzhinoveltypeDao.delAnzhiNovelTypeByNovelId(anzhinovel.getId()));
		
		if(con){
			//需要添加作品名称修改记录
			AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
			anm.setActionType(13);
			anm.setAddTime(this.getNowTime());
			anm.setMemberId(0);
			anm.setNovelId(anzhinovel.getId());
			anm.setState(0);
			anm.setVote(novelTile);
			pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		}
		
		//修改小说的时候，需要将小说的类型批量添加进去
		if(anzhinovel.getNovelType()!=null&&!anzhinovel.getNovelType().equals("")){
			String[] arr=anzhinovel.getNovelType().split("/");//数据格式：玄幻奇幻@异界大陆;异界争霸;
			for(String s:arr){
				if(!s.equals("")){
					String[] st=s.split("@");//数据格式：[0]玄幻奇幻  [1]异界大陆;异界争霸;
					if(!st[1].equals("")){
						String[] small=st[1].split(";");//单独的小类
						for(String tm:small){
							AnzhiNovelType at=new AnzhiNovelType();
							at.setAddTime(getNowTime());
							at.setBigType(st[0]);
							at.setNovelId(anzhinovel.getId());
							at.setSmallType(tm);
							pojoList.add(anzhinoveltypeDao.addAnzhiNovelType(at));
						}
					}
				}
			}
		}
		if(anzhinovel.getState().equals(3)){
			//如果是完结需要，添加完结时间点标识
			AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
			anm.setActionType(20);
			anm.setAddTime(this.getNowTime());
			anm.setMemberId(0);
			anm.setNovelId(anzhinovel.getId());
			anm.setState(0);
			anm.setVote(novelTile);
			pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		}
		
		this.excuteUpdate(pojoList);
		//createNovel(request.getRealPath("//"),anzhinovel.getId()); 没有必要
		return true;
	}

	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField){
		return anzhinovelDao.findAnzhiNovelAll(size,pageNum,condition,orderField);
	}

	/**
	 * 最终的生成小说详情介绍界面
	 */
	public void createNovel(String path,int novelId){
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+novelId,"id");
		if(list.getList().size()!=0){
			try {
				AnzhiNovel an=list.getList().get(0);
				
				an.setIsWebUp(0);
				an.setIsPingTaiUp(0);
				QueryList<AnzhiNovelMultifunction> ls=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(2, 1, " and (action_type=16 or action_type=17) and novel_id="+an.getId());
				for(int k=0;k<ls.getList().size();k++){
					AnzhiNovelMultifunction anm=ls.getList().get(k);
					if(anm.getActionType().equals(16)){
						an.setIsWebUp(1);
					}else if(anm.getActionType().equals(17)){
						an.setIsPingTaiUp(1);
					}
				}
				
				File model=new File(path+"//model//nodel_detail_model.jsp");
				File html=new File(path+"//novel//"+(an.getId())+".jsp");
				FileInputStream fis=new FileInputStream(model);
				byte[] b=new byte[fis.available()];
				fis.read(b);
				String modelString=new String(b,"utf-8");
				int n=120;
				String jieshao=an.getVote();
				jieshao=jieshao.replaceAll("<br>", "");
				jieshao=jieshao.replaceAll("<br />", "");
				jieshao=jieshao.replaceAll("<br/>", "");
				jieshao=jieshao.replaceAll("<p>", "");
				jieshao=jieshao.replaceAll("</p>", "");
				jieshao=charSubString(jieshao,120);
				
				modelString=modelString.replaceAll("novel_pojo.id", an.getId()+"");
				modelString=modelString.replaceAll("novel_pojo.xiaoshuofengmian", an.getNovelImg());
				modelString=modelString.replaceAll("novel_pojo.novelType", getNovelType(an.getNovelType()));
				modelString=modelString.replaceAll("novel_pojo.novelTitle", an.getNovelTitle());
				modelString=modelString.replaceAll("novel_pojo.gengxinshijian", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(an.getUpdateTime()));
				modelString=modelString.replaceAll("novel_pojo.zuozhe", an.getAuthorWriterName());
				modelString=modelString.replaceAll("novel_pojo.shouquanfangshi", an.getAuthorizationLevel().equals(0)?"原创":"转载");
				modelString=modelString.replaceAll("novel_pojo.shifouqianyue", an.getIsSigned().equals(0)?"未签约":"已签约");
				modelString=modelString.replaceAll("novel_pojo.fabiaofashi", an.getPostedWay().equals(0)?"独家首发":"他站首发");;
				modelString=modelString.replaceAll("novel_pojo.xiaoshuojieshao",jieshao );
				modelString=modelString.replaceAll("novel_pojo.guanjianci", an.getNovelLabel());
				modelString=modelString.replaceAll("novel_pojo.zhujiao", an.getLeadingRole());
				modelString=modelString.replaceAll("novel_pojo.peijiao", an.getSupportingRole());
				modelString=modelString.replaceAll("novel_pojo.authorId", an.getAuthorId()+"");
				modelString=modelString.replaceAll("novel_pojo.yuepiao", this.getStringBySqlDb("select count(*) from anzhi_novel_reward where novel_id="+novelId+" and reward_type=2 "));
				if(an.getState().equals(3)){//说明已完结
					modelString=modelString.replaceAll("novel_pojo.novelstateIcon", "<img src='images/yiwanjie.png' alt='' /><br/>");
				}else{
					modelString=modelString.replaceAll("novel_pojo.novelstateIcon", "<img src='images/lianzaizhong.png' alt='' /><br/>");
				}
				if(an.getIsWebUp().equals(0)){//网站上架
					modelString=modelString.replaceAll("novel_pojo.novelWebUpstate", "");
				}else{
					modelString=modelString.replaceAll("novel_pojo.novelWebUpstate", "<img src='images/wangzhanshangjia.png' alt='' /><br/>");
				}
				if(an.getIsPingTaiUp().equals(0)){//平台上架
					modelString=modelString.replaceAll("novel_pojo.novelPingTaiUpstate", "");
				}else{
					modelString=modelString.replaceAll("novel_pojo.novelPingTaiUpstate", "<img src='images/pingtaishangjia.png' alt='' />");
				}
				modelString=modelString.replaceAll("novel_pojo.zhoudianji", this.getStringBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and action_type=0 and add_time between '"+this.getDateType(2)+"' and '"+this.getDateType(3)+"'"));
				modelString=modelString.replaceAll("novel_pojo.zhoutuijian", this.getStringBySqlDb("select count(*) from anzhi_novel_reward where novel_id="+novelId+" and reward_type=0 and add_time between '"+this.getDateType(2)+"' and '"+this.getDateType(3)+"'"));
				modelString=modelString.replaceAll("novel_pojo.yuetuijian", this.getStringBySqlDb("select count(*) from anzhi_novel_reward where novel_id="+novelId+" and reward_type=0 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'"));
				modelString=modelString.replaceAll("novel_pojo.yuedianji", this.getStringBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and action_type=0 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'"));
				modelString=modelString.replaceAll("novel_pojo.zongdianji", an.getClickNum()+"");
				modelString=modelString.replaceAll("novel_pojo.zongzishu", an.getTotalCharNum()+"");
				modelString=modelString.replaceAll("novel_pojo.gengxinshijian", new SimpleDateFormat("yyyy/MM/dd HH:mm").format(an.getUpdateTime()));
				modelString=modelString.replaceAll("novel_pojo.jianjiezuozhe", this.getStringBySqlDb("select author_info from anzhi_author where member_id="+an.getAuthorId()));
				int zuozhedengji=this.getIntBySqlDb("select sum(reward_anzhi_money) from anzhi_novel_reward  d  where d.novel_id in(select  c.id from anzhi_novel  c where c.author_id="+an.getAuthorId()+" )");
				String dengjimingcheng="";
				if(zuozhedengji<=10000){
					dengjimingcheng="白银大神";
				}else if(zuozhedengji<=1000000){
					dengjimingcheng="黄金大神";
				}else if(zuozhedengji<=1000000){
					dengjimingcheng="铂金大神";
				}
				modelString=modelString.replaceAll("novel_pojo.dengjizuozhe", dengjimingcheng);
				String tmp="";
				
				//加载该小说的书评
				QueryList<AnzhiComment> shupingcommentLs=anzhicommentDao.findAnzhiCommentAll(10, 1, " and comment_fatherid=0 and comment_type=0  and state<2  and table_id="+novelId,"is_top desc,id");
				for(AnzhiComment p:shupingcommentLs.getList()){
					p.setReplyNum(this.getIntBySqlDb("select count(*) from anzhi_comment where table_id="+novelId+" and state!=2 and comment_fatherid="+p.getId()));
					p.setDianZanNum(this.getIntBySqlDb("select count(*) from anzhi_comment_praise where comment_id="+p.getId()+" and novel_id="+novelId));
				}
				modelString=modelString.replaceAll("novel_pojo.LiuYanNum", shupingcommentLs.getTotal()+"");
				tmp="";
				for(int i=0;i<shupingcommentLs.getList().size();i++){
					AnzhiComment f=shupingcommentLs.getList().get(i);
					//查找该评论下的前5条回复
					QueryList<AnzhiComment> replyList=anzhicommentDao.findAnzhiCommentAll(5, 1, " and state!=2 and comment_fatherid="+f.getId());
					tmp+="<div class='comment_items' id='comment_items_div_"+f.getId()+"'>";
							tmp+="<table width='100%'>";
									tmp+="<tr>";
										tmp+="<td valign='top' width='42'>";
											tmp+="<img src='"+f.getMemberHeadImg()+"' width='41' height='41'/>";
										tmp+="</td>";
										tmp+="<td valign='top'>";
											tmp+="<div class='comment_head'>";
												tmp+="<div class='comment_member_nick'>";
													tmp+=(f.getIsMarrow().equals(1)?"[已加精]":"")+(f.getIsTop().equals(1)?"[已置顶]":"");
													tmp+="<a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId="+f.getMemberId()+"' target='_blank'>"+f.getMemberNick()+"</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq \"admin\"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin("+f.getId()+","+f.getTableId()+",this)'>删除</a>]</span></c:if>";
												tmp+="</div>";
												tmp+="<div class='comment_title'>"+f.getCommentTitle()+"</div>";
												tmp+="<div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment"+f.getId()+"' onclick=\"commentPraise(this,loginMemberId,'"+f.getTableId()+"','"+f.getId()+"',0)\">点赞("+f.getDianZanNum()+")</div>";
												tmp+="<div class='comment_reply'>";
													tmp+="<a href=\"javascript:commentReply('"+f.getId()+"','"+f.getTableId()+"',loginMemberId)\">回复("+f.getReplyNum()+")</a>";
												tmp+="</div>";
											tmp+="</div>";
											tmp+="<div class='comment_content'>"+f.getCommentContent()+"</div>";
											tmp+="<div class='comment_time' id='comment_time"+f.getId()+"'>"+new SimpleDateFormat("yyyy/MM/dd HH:mm").format(f.getAddTime())+"</div>";
											if(replyList.getList().size()!=0){
												tmp+="<div id='commentReplyDiv"+f.getId()+"' class='commentReplyDiv'>";
												for(int k=0;k<replyList.getList().size();k++){
													AnzhiComment r=replyList.getList().get(k);
													tmp+="<div class='comment_items'>";
														tmp+="<table width='100%'>";
															tmp+="<tr>";
																tmp+="<td valign='top' width='42'>";
																	tmp+="<img src='"+r.getMemberHeadImg()+"' width='41' height='41'/>";
																tmp+="</td>";
																tmp+="<td valign='top'>";
																	tmp+="<div class='comment_head'>";
																		tmp+="<div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId="+r.getMemberId()+"' target='_blank'>"+r.getMemberNick()+"</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq \"admin\"}'><span>[<a href='javascript:;' onclick='delCommentByAdmin("+r.getId()+","+r.getTableId()+",this)'>删除</a>]</span></c:if></div>";
																		tmp+="<div class='comment_time'>"+new SimpleDateFormat("yyyy/MM/dd HH:mm").format(r.getAddTime())+"</div>";
																		tmp+="<div class='nowPosition'>第"+(k+1)+"楼</div>";
																	tmp+="</div>";
																	tmp+="<div class='comment_content'>"+r.getCommentContent()+"</div>";
																tmp+="</td>";
															tmp+="</tr>";
														tmp+="</table>";
													tmp+="</div>";
												}	
												if(replyList.getTotal()>5){
													tmp+="<div class='moreReplyCss'><a href='javascript:;' onclick=\"getJspDataByUrl('anzhicomment/commentAction.do#commentId="+f.getId()+"#novelId="+f.getTableId()+"')\">查看更多回复</a></div>";
												}
												tmp+="</div>";
											}
										tmp+="</td>";
									tmp+="</tr>";
							tmp+="</table>";
					tmp+="</div>";
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.shupincontent", tmp);
				modelString=modelString.replaceAll("novel_pojo.commentTotalNum", (shupingcommentLs.getTotal())+"");
				
				//加载该小说的最新打赏记录 前5条
				QueryList<AnzhiNovelReward> anzhinovelrewardLs=anzhinovelrewardDao.findAnzhiNovelRewardAll(8, 1, " and novel_id="+novelId);
				tmp="";
				for(int i=0;i<anzhinovelrewardLs.getList().size();i++){
					AnzhiNovelReward f=anzhinovelrewardLs.getList().get(i);
					int ns=getYp(f.getRewardAnzhiMoney());
					if(f.getRewardType()>12){
						tmp+="<div>";
							tmp+="<div class='midd_one'>"+f.getMemberNick()+"</div>";
							tmp+="<div class='midd_two'>";
								tmp+="<div class='midd_two_one'>"+(f.getRewardType()>1?"打赏":"投了")+"<a style='color:#ff3535;'>"+f.getRewardAnzhiMoney()+"安之币</a>"+(ns==0?"":"<c:if test=\"${loginUsers.memberNo eq '"+f.getMemberNo()+"'}\">[获得"+ns+"张月票]</c:if>")+"</div>";//[获得"+ns+"张月票]
								tmp+="<div class='midd_two_two'></div>";
								tmp+="<div class='midd_two_three'></div>";
							tmp+="</div>";
						tmp+="</div>"; 
					}else{
						tmp+="<div>";
							tmp+="<div class='midd_one'>"+f.getMemberNick()+"</div>";
							tmp+="<div class='midd_two'>";
								tmp+="<div class='midd_two_one'>"+(f.getRewardType()>1?"打赏":"投了")+"<a style='color:#ff3535;'>"+f.getRewardNum()+danweiArr[f.getRewardType()]+dashangType[f.getRewardType()]+"</a>"+(ns==0?"":"<c:if test=\"${loginUsers.memberNo eq '"+f.getMemberNo()+"'}\">[获得"+ns+"张月票]</c:if>")+"</div>";
								tmp+="<div class='midd_two_two'>"+f.getRewardAnzhiMoney()+"</div>";
								tmp+="<div class='midd_two_three'><img src='images/"+dashangtubiaoArr[f.getRewardType()]+"' style='width:20px;height:20px;'></img></div>";
							tmp+="</div>";
						tmp+="</div>"; 
					}
					
					 
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.zuixindashangjilu", tmp);
				
				
				//加载该小说的粉丝榜。也即是打赏安之币排行
				List<NovelFansList> fanList=this.excuteQuery(new NovelFansList(), "select top 10 member_id,member_nick,sum(reward_anzhi_money) as total_money from anzhi_novel_reward_view where novel_id="+novelId+" group by member_id,member_nick order by total_money desc");
				for(NovelFansList p:fanList){
					//设置粉丝等级
					String[] arr=fensijifen;	
					for(int i=arr.length-1;i>=0;i--){
						if(!arr[i].equals(",")){
							String[] tmps=arr[i].split(",");
								p.setLevelName(tmps[1]);
							if(p.getTotalMoney()>=Integer.parseInt(tmps[0])){
								break;
							}
						}
					}
				}
				tmp="";
				for(int i=0;i<fanList.size();i++){
					NovelFansList f=fanList.get(i);
					tmp+="<tr>";
						tmp+="<td>"+(i+1)+"</td>";
						tmp+="<td>"+f.getMemberNick()+"</td>";
						tmp+="<td>"+f.getLevelName()+"</td>";
					tmp+="</tr>";
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.fensibang", tmp);
				
				
				//加载：点赞前十用户榜
				List<CommentPraise> commentPraiseList=this.excuteQuery(new CommentPraise(), "select top 10 member_id,member_nick,member_head_img,count(*) as t_n from anzhi_comment_praise_top_v where novel_id="+novelId+" group by member_id,member_nick,member_head_img order by t_n desc");
				tmp="";
				for(int i=0;i<commentPraiseList.size();i++){
					CommentPraise f=commentPraiseList.get(i);
					String imgSrc=f.getMemberHeadImg();
					if(imgSrc==null||imgSrc.equals("")){
						imgSrc="./images/defaultHead.png";
					}
					tmp+="<div>";
						tmp+="<a href='anzhimember/memberInfo.do?memberId="+f.getMemberId()+"'><img src='"+imgSrc+"' width='40' height='40' alt='' /></a>";
						tmp+="<br /><span style='color: #707070'>"+f.getMemberNick()+"</span>";
					tmp+="</div>";
						
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.dianzanqianshi", tmp);

				//查询该小说的各个道具的打赏数量
				List<DaojuPojo> daojuList=this.excuteQuery(new DaojuPojo(), "select reward_type,sum(reward_num) as nums,sum(reward_anzhi_money) as anzhimoneys from anzhi_novel_reward where reward_type>2 and novel_id="+novelId+" group by reward_type");
				tmp="";
				for(int i=0;i<daojuList.size();i++){
					DaojuPojo f=daojuList.get(i);
					if(f.getRewardType()>12){
						continue;
					}
					tmp+="<div class='last_hang' style='width:155px;'>";
						tmp+="<div title='"+dashangType[f.getRewardType()]+"'><img src='images/dashang/"+(f.getRewardType()-2)+".png' width='45' height='45'></img></div>";
						tmp+="<div class='da_shang_lei_ji_css'>"+dashangType[f.getRewardType()]+"["+f.getNums()+"]"+"</div>";
					tmp+="</div>";
						
						
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.leijidashang", tmp);
				
				modelString=modelString.replaceAll("novel_pojo.novel_big_type", this.getNovelType(an.getNovelType()));
				
				
				tmp="";
				QueryList<AnzhiNovel> autorNovelList=anzhinovelDao.findAnzhiNovelAll(5, 1, " and id!="+an.getId()+" and author_id="+an.getAuthorId(), "id");
				novelTypeChange(autorNovelList);
				for(int i=0;i<autorNovelList.getList().size();i++){
					AnzhiNovel f=autorNovelList.getList().get(i);
						tmp+="<div class='project_wuben' title='"+f.getNovelTitle()+"'>";
							tmp+="<a href='novel/"+f.getId()+".jsp' target='_blank'>"+f.getNovelTitle()+"</a>";
						tmp+="</div>";
				}
				tmp=java.util.regex.Matcher.quoteReplacement(tmp);
				modelString=modelString.replaceAll("novel_pojo.wubenzuopin", tmp);
				
				
				//创建jsp文件
				if (!html.exists()) { 
					try {
						html.createNewFile();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
				} 
				FileOutputStream fo=new FileOutputStream(html,false);
				fo.write(modelString.getBytes("utf-8"));
				fo.close();
				//生成对应的章节
				//createNovelChapter(an,path);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public String charSubString(String info,int len){
		if(info!=null){
			if(info.length()>len){
				return info.substring(0, len)+"...";
			}else{
				return info;
			}
		}
		return "";
	}
	
	public JSONObject getNovelMoreData(HttpServletRequest request,int novelId,int memberId) {
		//先查询小说基本信息
		JSONObject jsonBack=new JSONObject();
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
		novelTypeChange(list);
		if(list.getList().size()==1){
			AnzhiNovel an=list.getList().get(0);
			jsonBack.put("zhoudianji", this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and action_type=0 and add_time between '"+this.getDateType(2)+"' and '"+this.getDateType(3)+"'"));
			jsonBack.put("zhoutuijian", this.getIntBySqlDb("select count(*) from anzhi_novel_reward where novel_id="+novelId+" and reward_type=0 and add_time between '"+this.getDateType(2)+"' and '"+this.getDateType(3)+"'"));
			jsonBack.put("yuetuijian",this.getIntBySqlDb("select count(*) from anzhi_novel_reward where novel_id="+novelId+" and reward_type=0 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'") );
			jsonBack.put("yuedianji", this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and action_type=0 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'"));
			jsonBack.put("zongdianji",an.getClickNum() );
			jsonBack.put("zongzishu", an.getTotalCharNum());
			//先看有没有签约
			int n=this.getIntBySqlDb("select is_signed from anzhi_novel where id="+novelId);
			if(n==0){
				//说明没有签约 查询是否网站上架    或   平台上架
				n+=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and (action_type=17 or action_type=16)");
			}	
			jsonBack.put("novelSignState", n==0?0:1);//VIP状态
			jsonBack.put("gengxinshijian",new SimpleDateFormat("yyyy/MM/dd HH:mm").format(an.getUpdateTime()) );
			
			
			//查询是否参加了优惠活动
			QueryList<AnzhiNovel> youhui=anzhinovelDao.findAnzhiNovelYouHui(1, 1, " and novel_id="+novelId+" and discounted_end_date>getdate()");
			if(youhui.getList().size()!=0){
				jsonBack.put("youhuiInfo", "yes");
				AnzhiNovel youhuiNovel=youhui.getList().get(0);
				jsonBack.put("discountedType", discountedType[youhuiNovel.getDiscountedType()]);
				jsonBack.put("discountedEndDate", new SimpleDateFormat("yyyy/MM/dd HH:mm").format(youhuiNovel.getDiscountedEndDate()));
				jsonBack.put("discountedRebate", youhuiNovel.getDiscountedType()>1?youhuiNovel.getDiscountedRebate()+"折":(youhuiNovel.getDiscountedType().equals(0)?"本周免费":"限时免费"));
			}
			
			
			//查询当前用户是否收藏、推荐本书、点赞小说
			request.setAttribute("praise", "");
			if(memberId!=-1){
				QueryList<AnzhiNovelMultifunction> mulfunList=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(10, 1, " and (action_type=1 or action_type=3 or action_type=4) and novel_id="+novelId+" and member_id="+memberId);
				for(AnzhiNovelMultifunction anm:mulfunList.getList()){
					if(anm.getActionType().equals(1)){
						jsonBack.put("yetSouCang", "yes");
					}else if(anm.getActionType().equals(3)){
						jsonBack.put("yetTuiJianNovel", "yes");
					}else if(anm.getActionType().equals(4)){
						jsonBack.put("yetDianZan", "yes");
					}
				}
				//查询当前用户点赞的评论
				QueryList<AnzhiCommentPraise> praiseList=anzhicommentpraiseDao.findAnzhiCommentPraiseAll(500, 1, " and novel_id="+novelId+" and member_id="+memberId);
				String praise="";
				for(AnzhiCommentPraise acp:praiseList.getList()){
					praise+=acp.getCommentId()+",";
				}
				praise=praise.equals("")?"":praise.substring(0,praise.length()-1);
				jsonBack.put("praise", praise);
			}
			
			QueryList<AnzhiNews> newsList=anzhinewsDao.findAnzhiNewsAll(4, 1, " and news_type=0");
			JSONArray arr=new JSONArray();
			for(AnzhiNews acp:newsList.getList()){
				arr.add(JSONObject.fromObject(acp));
			}
			jsonBack.put("newsdata", arr);
			
			if(request.getSession().getAttribute("updateNovelClickNum")!=null){
				if(request.getSession().getAttribute("updateNovelClickNum").toString().equals("yes")){
					//更新一下小说的点击量
					this.updateTableFieldAppend("anzhi_novel", novelId, "click_num", 1);
					//添加小说点击量
					AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
					anm.setActionType(0);
					anm.setAddTime(this.getNowTime());
					anm.setMemberId(memberId);
					anm.setNovelId(novelId);
					anm.setState(0);
					List<Pojo> pojoList=new ArrayList<Pojo>();
					pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
					this.excuteUpdate(pojoList);
				}
			}
		}
		return jsonBack;
	}

	public void loadSameTypeNovel(HttpServletRequest request,int novelId) {
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelAll(5, 1, " and id="+novelId,"id");
		if(list.getList().size()!=0){
			AnzhiNovel an=list.getList().get(0);
			QueryList<AnzhiNovel> sameTypeNovelList=anzhinovelDao.findAnzhiNovelAll(5, 1, " and id in (select novel_id from anzhi_novel_type where big_type='"+this.getNovelType(an.getNovelType())+"' group by novel_id)", "id");
			request.setAttribute("anzhinovelList", sameTypeNovelList);
		}
	}

	public void loadDaShangJsp(HttpServletRequest request, AnzhiMember am) {
		//查询当前用户的月票
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
		if(ls.getTotal()>=yuePiaoNum){
			//说明已经投过月票
			request.setAttribute("yuepiao", "no");
		}else{
			request.setAttribute("yuepiao", "yes");
		}
		
		
		//查询本月的消费--确定“订阅票”
		int dingYueAnzhi=this.getIntBySqlDb("select sum(consume_anzhi_money) from anzhi_consume where member_id="+am.getId()+" and consume_time between '"+this.getDateType(4)+"' and '"+this.getDateType(0)+"'");
		if(dingYueAnzhi>(20*100)){
			request.setAttribute("dingyuepiao", "yes");
		}else{
			request.setAttribute("dingyuepiao", "no");
		}
		
		//获得当前用户的推荐票
			//根据用户经验获得推荐票数
		int tuijianpiao=this.getTuijianPiao(this.getDuzhejingyanLevel(am.getMemberExperience()));
			//获得今天已经投了多少推荐票
		int yetTuiJianPiao=this.getIntBySqlDb("select sum(reward_num) from anzhi_novel_reward where member_id="+am.getId()+" and reward_type=0 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		
		int remainTuiJianPiao=(tuijianpiao-yetTuiJianPiao)>=0?((tuijianpiao-yetTuiJianPiao)):0;
		request.setAttribute("remainTuiJianPiao", remainTuiJianPiao);
		request.setAttribute("totalTuijianpiao", tuijianpiao);
		request.setAttribute("yetTuiJianPiao", yetTuiJianPiao);
	}

	/**
	 * 书籍类型查询
	 */
	public String recommand(HttpServletRequest request) {
		int menutype=this.getInt(request, "menutype");
		if(menutype==-1||menutype>7){
			request.setAttribute("loadMoreData","no" );//参数请求错误，不用加载其他数据
		}else{
			//加载幻灯片
			QueryList<AnzhiNovel> pptlist = anzhinovelDao.findAnzhiNovelAll(4, 1, "", "recommand_time", menutype+"1");
			voteChange(pptlist);
			//加载单个推荐小说
			QueryList<AnzhiNovel> signlist = anzhinovelDao.findAnzhiNovelAll(1, 1, "", "recommand_time", menutype+"2");
			voteChange(signlist);
			//加载换批推荐小说
			QueryList<AnzhiNovel> morelist = anzhinovelDao.findAnzhiNovelAll(2, 1, "", "recommand_time", menutype+"3");
			voteChange(morelist);
			//加载该类型的前100部小说
			QueryList<AnzhiNovel> anzhinovelList = anzhinovelDao.findAnzhiNovelAll(100, 1, " and novel_type like '%"+novelBigTypeData[menutype]+"@%'", "id");
			request.setAttribute("pptlist",novelTypeChange(pptlist));
			request.setAttribute("pptFirst",pptlist.getList().size()==0?null:pptlist.getList().get(0));
			request.setAttribute("signNovel",signlist.getList().size()==0?null:signlist.getList().get(0));
			request.setAttribute("morelist",novelTypeChange(morelist));
			request.setAttribute("anzhinovelList",novelTypeChange(anzhinovelList));
			request.setAttribute("loadMoreData","yes");
			request.setAttribute("novelTypeName",novelBigTypeData[menutype]);//设置小说类型名称
		}
		return "recommand";
	}
	
	public void voteChange(QueryList<AnzhiNovel> list){
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			if(an.getVote()!=null){
				String d=an.getVote();
				while(d.indexOf("\r")!=-1||d.indexOf("<br/>")!=-1||d.indexOf("<br />")!=-1||d.indexOf("<p>")!=-1||d.indexOf("</p>")!=-1||d.indexOf("\t")!=-1||d.indexOf("\r\n")!=-1||d.indexOf("&nbsp;")!=-1||d.indexOf("\n")!=-1){
					d=d.replaceAll("<br/>", "");
					d=d.replaceAll("<br />", "");
					d=d.replaceAll("<p>", "");
					d=d.replaceAll("</p>", "");
					d=d.replaceAll("\t", "");
					d=d.replaceAll("\r\n", "");
					d=d.replaceAll("&nbsp;", "");
					d=d.replaceAll("\n", "");
					d=d.replaceAll("\r", "");
				}
				if(d.length()>95){
					d=d.substring(0, 95)+"..";
				}
				an.setVote(d);
			}
		}
	}

	/**
	 * 排行榜
	 * 最近30天 and date_sub(curdate(), INTERVAL 30 DAY) <= date(`add_time`)
	 * 本月的：and date_format(add_time,'%Y-%m')=date_format(now(),'%Y-%m')
	 */
	public void leaderboard(HttpServletRequest request) {
		//String nowMonth=" and date_sub(curdate(), INTERVAL 30 DAY) <= date(`add_time`)";
		String nowMonth=" and datediff(day,add_time,getdate())<=30";
		//String nowMonth=" and date_format(add_time,'%Y-%m')=date_format(now(),'%Y-%m')";
		
		//月票榜(前20)每月清零一次，即时刷新--也即查询本月的数据
		QueryList<AnzhiNovel> yuepiao=anzhinovelDao.findAnzhiNovelPaiHangBang(23, 1, " and state>1","anzhi_novel_yuepiao");
		//新书月票榜(前20，上架第一个月的新书)每月清零一次，即时刷新，该书当月上架计在该榜
		QueryList<AnzhiNovel> xinshuYuepiao=anzhinovelDao.findAnzhiNovelPaiHangBang(20, 1, " and state>1 "+nowMonth,"anzhi_novel_yuepiao");
		//点击榜(前10)每天即时刷新，不清零
		//QueryList<AnzhiNovel> dianji=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_dianjilv");
		QueryList<AnzhiNovel> dianji=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1", "click_num");
		//新书点击榜(开新书的第一个月，前10)从新书上传开始，30天内，即时刷新
		//QueryList<AnzhiNovel> xinDianji=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1"+nowMonth,"anzhi_novel_dianjilv");
		QueryList<AnzhiNovel> xinDianji=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1"+nowMonth,"click_num");
		//收藏版(前10)每天即时刷新，不清零
		//QueryList<AnzhiNovel> shoucang=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_shoucang");
		QueryList<AnzhiNovel> shoucang=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1","total_save_num");
		//新书收藏榜(开新书第一个月，前10)从新书上传开始，30天内，即时刷新
		//QueryList<AnzhiNovel> xinShoucang=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1"+nowMonth,"anzhi_novel_shoucang");
		QueryList<AnzhiNovel> xinShoucang=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1"+nowMonth,"total_save_num");
		
		//推荐榜(前10)每天即时刷新，不清零
		//QueryList<AnzhiNovel> tuijian=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_tuijian");
		QueryList<AnzhiNovel> tuijian=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1","total_recommand");
		//新书推荐榜(开新书第一个月，前10)从新书上传开始，30天内，即时刷新
		//QueryList<AnzhiNovel> xinTuijian=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1"+nowMonth,"anzhi_novel_tuijian");
		QueryList<AnzhiNovel> xinTuijian=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1"+nowMonth,"total_recommand");
		//更新榜(前10)每天按字数即时刷新，当天24：00清零
		QueryList<AnzhiNovel> gengxin=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_gengxin");
		//书友打赏榜(前10)每天即时刷新，不清零
		QueryList<AnzhiNovel> dashang=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_dashang");
		//订阅榜(前20)每天即时刷新，不清零
		//QueryList<AnzhiNovel> dingyue=anzhinovelDao.findAnzhiNovelPaiHangBang(10, 1, " and state>1","anzhi_novel_dingyue");
		QueryList<AnzhiNovel> dingyue=anzhinovelDao.findAnzhiNovelAll(10, 1, " and state>1","total_dingyue_num");
		//完结精品榜(5本，手动调)
		QueryList<AnzhiNovel> wanjie=anzhinovelDao.findAnzhiNovelAll(5, 1, " and id in (select novel_id from anzhi_recommend where recommend_position='101')","id");
		
		request.setAttribute("yuepiao",novelTypeChange(yuepiao) );
		request.setAttribute("xinshuYuepiao",novelTypeChange(xinshuYuepiao) );
		request.setAttribute("dianji",novelTypeChange(dianji) );
		request.setAttribute("xinDianji",novelTypeChange(xinDianji) );
		request.setAttribute("shoucang",novelTypeChange(shoucang) );
		request.setAttribute("xinShoucang",novelTypeChange(xinShoucang) );
		request.setAttribute("tuijian",novelTypeChange(tuijian) );
		request.setAttribute("xinTuijian",novelTypeChange(xinTuijian) );
		request.setAttribute("gengxin",novelTypeChange(gengxin) );
		request.setAttribute("dashang",novelTypeChange(dashang) );
		request.setAttribute("dingyue",novelTypeChange(dingyue) );
		request.setAttribute("wanjie",novelTypeChange(wanjie) );
		//设置月票第1、2、3名小说
		request.setAttribute("firstNovel",yuepiao.getList().size()>0?yuepiao.getList().get(0):null );
		request.setAttribute("secondNovel",yuepiao.getList().size()>1?yuepiao.getList().get(1):null );
		request.setAttribute("threeNovel",yuepiao.getList().size()>2?yuepiao.getList().get(2):null );
	}

	/**
	 * 生成静态html数据
	 */
	public void createPaiHangBangJsp(String path, HttpServletRequest request) {
		if(this.checkParam(request, "data")){
			String data=request.getParameter("data");
			String htmlName=request.getParameter("htmlName");
			File html=new File(path+"//"+htmlName+".html");
			//创建jsp文件
			if (!html.exists()) { 
				try {
					html.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			} 
			FileOutputStream fo;
			try {
				fo = new FileOutputStream(html,false);
				OutputStreamWriter  os=new OutputStreamWriter(fo,"utf-8");
				os.write(data);
				os.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	public void morePahangbang(HttpServletRequest request) {
		if(this.getInt(request, "types")!=-1){
			//String nowMonth=" and date_sub(curdate(), INTERVAL 30 DAY) <= date(`add_time`)";
			String nowMonth=" and datediff(day,add_time,getdate())<=30";
			//String nowMonth=" and date_format(add_time,'%Y-%m')=date_format(now(),'%Y-%m')";
			
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
			int pageNum=this.getPageNum(request);
			int types=this.getInt(request, "types");
			QueryList<AnzhiNovel> list=null;
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
			request.setAttribute("paihangbangType",paihangbangType[types-1]);
			request.setAttribute("anzhinovelList",novelTypeChange(list));
		}
	}

	/**
	 * 优惠书坊
	 * 
	 */
	public void youhuishufang(HttpServletRequest request) {
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
	}

	public QueryList<AnzhiNovelMultiJoinNovel> findAnzhiNovelMultiJoinNovelAll(
			int size, int pageNum, String condition, String orderField) {
		return anzhinovelDao.findAnzhiNovelMultiJoinNovelAll(size, pageNum, condition, orderField);
	}

	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size, int pageNum,
			String condition, String orderField, String recommandPosition) {
		QueryList<AnzhiNovel> morelist = anzhinovelDao.findAnzhiNovelAll(size, pageNum, "", orderField, recommandPosition);
		return morelist;
	}

	public String index(HttpServletRequest request) {
		QueryList<AnzhiNovel> yuepiao=anzhinovelDao.findAnzhiNovelPaiHangBang(4, 1, " and state>1","anzhi_novel_yuepiao");
		QueryList<AnzhiNovel> dashenlist = anzhinovelDao.findAnzhiNovelAll(50, 1, " and recommend_state=0 ", "id", "121");
		QueryList<AnzhiNovel> dashenBest = anzhinovelDao.findAnzhiNovelAll(1, 1, null, "id", "111");
		
		QueryList<AnzhiPicture> list = anzhipictureDao.findAnzhiPictureAll(500, 1, " and state=1");
		String[] pictureTypeSesion=new String[]{"sessionShouyetoubu","sessionPaihangbang","sessionZuojiafuli","sessionDashentuijian","sessionHezuoqudaotoubu","sessionBianjizhuanqutoubu","sessionBanquanweihutoubu","sessionHuodongzhuanqu","sessionYonghuzhinantoubu","sessionZuozhetougaotoubu","sessionChenpinyingcaitoubu","sessionLianxiwomentoubu","sessionGonggao","sessionZaixianchongzhi","sessionZuojiafulitoubu"};
		for(AnzhiPicture ap:list.getList()){
			request.getSession().setAttribute(pictureTypeSesion[ap.getPictureType()], ap.getPictureUrl());
		}
		
		request.setAttribute("dashenlist",novelTypeChange(dashenlist));
		request.setAttribute("yuepiaoshuju",novelTypeChange(yuepiao));
		request.setAttribute("dashenBest",dashenBest.getList().size()==0?null:dashenBest.getList().get(0));
		return "index";
	}

	public void lineNewproject(HttpServletRequest request) {
		QueryList<AnzhiNovelLabel> ls=anzhinovellabelDao.findAnzhiNovelLabelAll(500, 1, " and father_id=0");
		for(int i=0;i<ls.getList().size();i++){
			AnzhiNovelLabel anl=ls.getList().get(i);
			anl.setChildRenLs(anzhinovellabelDao.findAnzhiNovelLabelAll(500, 1, " and father_id="+anl.getId()).getList());
		}
		request.setAttribute("novelLableList", ls.getList());
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

	public JSONObject loadNeedDoTaskNum(HttpServletRequest request) {
		JSONObject jsonBack=new JSONObject();
		if(request.getSession().getAttribute("loginUsers")!=null){
			String[] domIds=new String[]{"anzhiauthor/signedCheck.do",
					"anzhireport/findAnzhiReportAll.do",
					"anzhichapter/nopassCheck.do",
					"anzhichapter/delChapterCheck.do",
					"anzhinovel/signedCheck.do",
					"anzhinovel/novelUpCheck.do",
					"anzhinovel/novelDownCheck.do",
					"anzhibenefit/findAnzhiBenefitAll.do",
					"anzhicash/findAnzhiCashAll.do",
					"anzhinovel/novelTitleUpdateCheck.do",
					"anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do",
					"anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do",
					"anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do",
					"anzhinovel/delNovelCheck.do",
					"anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do",
					"anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do"};
			String[] sql=new String[]{"select count(*) from anzhi_novel_multi_join_author where 1=1  and action_type=12 and state=0",
					"select count(*) from anzhi_report_view where state=0",
					"select count(*) from anzhi_novel_multi_join_chapter where 1=1  and action_type=10 and state=0",
					"select count(*) from anzhi_novel_multi_join_chapter where 1=1  and action_type=9 and state=0",
					"select count(*) from anzhi_novel_multi_join_novel where 1=1  and action_type=11 and state=0",
					"select count(*) from anzhi_novel_multi_join_novel where 1=1  and action_type=7 and state=0",
					"select count(*) from anzhi_novel_multi_join_novel where 1=1  and action_type=8 and state=0",
					"select count(*) from anzhi_benefit_view where benefit_state=0",
					"select count(*) from anzhi_cash_view where state=0",
					"select count(*) from anzhi_novel_multi_join_novel where 1=1  and action_type=13 and state=0",
					"select count(*) from anzhi_web_editor_fuli_apply_view where state=0",
					"select count(*) from anzhi_web_editor_goods_change_view where state=0",
					"select count(*) from anzhi_web_editor_apply_view where state=0",
					"select count(*) from anzhi_novel_multi_join_novel where 1=1  and action_type=6 and state=0",
					"select count(*) from anzhi_web_editor_apply where state=0",
					"select count(*) from anzhi_web_editor_tuijian where is_jiajing=2 or is_hot=2"};
			JSONArray arr=new JSONArray();
			for(int i=0;i<domIds.length;i++){
				NeedDoTaskNum n=new NeedDoTaskNum();
				n.setDomId(domIds[i]);
				n.setNums(this.getIntBySqlDb(sql[i]));
				arr.add(JSONObject.fromObject(n));
			}
			jsonBack.put("data",arr);
		}
		if(request.getSession().getAttribute("loginWebEditorUser")!=null){
			String[] domIds=new String[]{
					"anzhichapter/nopassCheck.do"};
			String[] sql=new String[]{
					"select count(*) from anzhi_novel_multi_join_chapter where 1=1  and action_type=10 and state=0"};
			JSONArray arr=new JSONArray();
			for(int i=0;i<domIds.length;i++){
				NeedDoTaskNum n=new NeedDoTaskNum();
				n.setDomId(domIds[i]);
				n.setNums(this.getIntBySqlDb(sql[i]));
				arr.add(JSONObject.fromObject(n));
			}
			jsonBack.put("data",arr);
		}
		
		
		//anzhiauthor/signedCheck.do 作者签约申请管理
		//anzhireport/findAnzhiReportAll.do 举报审核
		//anzhichapter/nopassCheck.do 未通过章节审核
		//anzhichapter/delChapterCheck.do 作者删章节审核
		//anzhinovel/signedCheck.do 作品签约申请管理
		//anzhinovel/novelUpCheck.do 作品自主上架申请管理
		//anzhinovel/novelDownCheck.do 作品自主下架申请管理
		//anzhibenefit/findAnzhiBenefitAll.do 作者福利申请管理
		//anzhicash/findAnzhiCashAll.do 作者提现申请管理
		//anzhinovel/novelTitleUpdateCheck.do 作者修改作品名称审核
		//anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do 网编福利申请管理
		//anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do 积分兑换申请管理
		//anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do 网编申请管理
		return jsonBack;
	}

	public QueryList<AnzhiNovel> shuku(int size, int pageNum, String condition,
			String orderField) {
		String c=" and state>1";
		if(orderField.equals("total_shang_num")){
			return anzhinovelDao.findAnzhiNovelPaiHangBang(size, pageNum, c,"anzhi_novel_dashang");
		}
		return anzhinovelDao.shuku(size, pageNum, condition, orderField);
	}

	public void findAnzhiNovelManage(HttpServletRequest request, int size,
			int pageNum, String condition, String orderField) {
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelAll(size, pageNum, condition,"id");
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			an.setIsWebUp(0);
			an.setIsPingTaiUp(0);
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
		request.setAttribute("anzhinovelList", list);
	}

	public List<NovelFansList> findmoreFanSi(int novelId) {
		return this.excuteQuery(new NovelFansList(), "select top 100 member_id,member_nick,sum(reward_anzhi_money) as total_money from anzhi_novel_reward_view where novel_id="+novelId+" group by member_id,member_nick order by total_money desc");
	}

	public QueryList<AnzhiNovel> findAnzhiNovelThirdRecommand(int size,
			int pageNum, String condition) {
		// TODO Auto-generated method stub
		return anzhinovelDao.findAnzhiNovelThirdRecommand(size, pageNum, condition);
	}
}