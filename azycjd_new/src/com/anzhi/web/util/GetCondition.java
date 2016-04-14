package com.anzhi.web.util;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
public class GetCondition extends DateFormat{
	@Autowired 
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	public String[] anzhinovelConditionArr=new String[]{
		"id,int,id",
		"novel_title,varchar,novelTitle",
		"novel_summary,varchar,novelSummary",
		"author_id,int,authorId",
		"state,int,state",
		"add_time,datetime,addTime",
		"update_time,datetime,updateTime",
		"novel_type,varchar,novelType",
		"vote,varchar,vote",
		"novel_img,varchar,novelImg",
		"novel_label,varchar,novelLabel",
		"authorization_level,int,authorizationLevel",
		"categories,varchar,categories",
		"leading_role,varchar,leadingRole",
		"supporting_role,varchar,supportingRole",
		"html_state,int,htmlState",
		"click_num,int,clickNum",
		"my_editor,varchar,myEditor",
		"posted_way,int,postedWay",
		"en_name,varchar,enName",
		"read_num,int,readNum",
		"is_signed,int,isSigned",
		"is_jinbi,int,isJinbi",
		"is_wangwen,int,isWangwen",
		"author_writer_name,varchar,authorWriterName",
		"anzhinovel,varchar,anzhinovel"
	};
	public String[] anzhimemberConditionArr=new String[]{
		"id,int,id",
		"member_no,varchar,memberNo",
		"menber_password,varchar,menberPassword",
		"member_nick,varchar,memberNick",
		"member_head_img,varchar,memberHeadImg",
		"member_qq,varchar,memberQq",
		"member_sex,varchar,memberSex",
		"member_address,varchar,memberAddress",
		"add_time,datetime,addTime",
		"member_birthday,datetime,memberBirthday",
		"member_email,varchar,memberEmail",
		"vote,varchar,vote",
		"is_accpt_message,int,isAccptMessage",
		"bookshelf_public,int,bookshelfPublic",
		"member_real_name,varchar,memberRealName",
		"member_code,varchar,memberCode",
		"member_tel,varchar,memberTel",
		"member_experience,int,memberExperience",
		"member_type,int,memberType",
		"member_money,int,memberMoney",
		"state,int,state",
		"anzhimember,varchar,anzhimember"
	};
	public String[] anzhiheadimguserecordConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"use_img,varchar,useImg",
		"add_time,datetime,addTime",
		"state,int,state",
		"anzhiheadimguserecord,varchar,anzhiheadimguserecord"
	};
	public String[] anzhifriendConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"friend_member_id,int,friendMemberId",
		"add_time,datetime,addTime",
		"state,int,state",
		"anzhifriend,varchar,anzhifriend"
	};
	public String[] anzhitrendConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"trend_content,varchar,trendContent",
		"vote,varchar,vote",
		"add_time,datetime,addTime",
		"state,int,state",
		"anzhitrend,varchar,anzhitrend"
	};
	public String[] anzhitrendreplyConditionArr=new String[]{
		"id,int,id",
		"trend_id,int,trendId",
		"member_id,int,memberId",
		"reply_content,varchar,replyContent",
		"father_id,int,fatherId",
		"add_time,datetime,addTime",
		"state,int,state",
		"anzhitrendreply,varchar,anzhitrendreply"
	};
	public String[] anzhirechargeConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"recharge_money,double,rechargeMoney",
		"recharge_anzhi_money,int,rechargeAnzhiMoney",
		"before_balance,int,beforeBalance",
		"after_balance,int,afterBalance",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"anzhirecharge,varchar,anzhirecharge"
	};
	public String[] anzhiconsumeConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"consume_anzhi_money,int,consumeAnzhiMoney",
		"table_id,int,tableId",
		"table_type,int,tableType",
		"consume_type,int,consumeType",
		"consume_time,datetime,consumeTime",
		"consume_before_money,int,consumeBeforeMoney",
		"consume_after_money,int,consumeAfterMoney",
		"vote,varchar,vote",
		"anzhiconsume,varchar,anzhiconsume"
	};
	public String[] anzhibookmarkConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"novel_id,int,novelId",
		"chapter_id,int,chapterId",
		"add_time,datetime,addTime",
		"read_address,double,readAddress",
		"vote,varchar,vote",
		"anzhibookmark,varchar,anzhibookmark"
	};
	public String[] anzhicommentConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"table_id,int,tableId",
		"comment_title,varchar,commentTitle",
		"comment_content,varchar,commentContent",
		"comment_type,int,commentType",
		"comment_fatherid,int,commentFatherid",
		"state,int,state",
		"add_time,datetime,addTime",
		"is_top,int,isTop",
		"is_marrow,int,isMarrow",
		"vote,varchar,vote",
		"member_no,varchar,memberNo",
		"member_nick,varchar,memberNick",
		"novel_title,varchar,novelTitle",
		"author_writer_name,varchar,authorWriterName",
		"anzhicomment,varchar,anzhicomment"
	};
	public String[] anzhinewsConditionArr=new String[]{
		"id,int,id",
		"news_author,varchar,newsAuthor",
		"news_title,varchar,newsTitle",
		"news_content,varchar,newsContent",
		"news_type,int,newsType",
		"news_state,int,newsState",
		"news_clicknum,int,newsClicknum",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"anzhinews,varchar,anzhinews"
	};
	public String[] anzhimessageConditionArr=new String[]{
		"id,int,id",
		"member_id_receive,int,memberIdReceive",
		"member_id_send,int,memberIdSend",
		"message_title,varchar,messageTitle",
		"message_content,varchar,messageContent",
		"message_type,int,messageType",
		"message_read,int,messageRead",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"member_no,varchar,memberNo",
		"member_nick,varchar,memberNick",
		"send_member_no,varchar,sendMemberNo",
		"send_member_nick,varchar,sendMemberNick",
		"anzhimessage,varchar,anzhimessage"
	};
	public String[] anzhiregistrationConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"anzhiregistration,varchar,anzhiregistration"
	};
	public String[] anzhiauthorConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"author_writer_name,varchar,authorWriterName",
		"author_tel,varchar,authorTel",
		"author_qq,varchar,authorQq",
		"author_image,varchar,authorImage",
		"author_realname,varchar,authorRealname",
		"author_address,varchar,authorAddress",
		"author_post,varchar,authorPost",
		"author_email,varchar,authorEmail",
		"author_msn,varchar,authorMsn",
		"author_credenttype,varchar,authorCredenttype",
		"author_credentcode,varchar,authorCredentcode",
		"author_info,varchar,authorInfo",
		"author_state,int,authorState",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"anzhiauthor,varchar,anzhiauthor"
	};
	public String[] anzhifenjuanConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"juan_name,varchar,juanName",
		"juan_vote,varchar,juanVote",
		"add_time,datetime,addTime",
		"anzhifenjuan,varchar,anzhifenjuan"
	};
	public String[] anzhichapterConditionArr=new String[]{
		"id,int,id",
		"fen_juan_id,int,fenJuanId",
		"chapter_title,varchar,chapterTitle",
		"chapter_content,varchar,chapterContent",
		"chapter_vote,varchar,chapterVote",
		"state,int,state",
		"add_time,datetime,addTime",
		"last_update_time,datetime,lastUpdateTime",
		"chapter_char_num,int,chapterCharNum",
		"read_type,int,readType",
		"vote,varchar,vote",
		"anzhichapter,varchar,anzhichapter"
	};
	public String[] anzhichapterupdaterecordConditionArr=new String[]{
		"id,int,id",
		"chapter_id,int,chapterId",
		"update_num,int,updateNum",
		"add_time,datetime,addTime",
		"anzhichapterupdaterecord,varchar,anzhichapterupdaterecord"
	};
	public String[] anzhichaptersubscribeConditionArr=new String[]{
		"id,int,id",
		"chapter_id,int,chapterId",
		"member_id,int,memberId",
		"add_time,datetime,addTime",
		"state,int,state",
		"vote,varchar,vote",
		"anzhichaptersubscribe,varchar,anzhichaptersubscribe"
	};
	public String[] anzhibookreviewConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"member_id,int,memberId",
		"bookreview_title,varchar,bookreviewTitle",
		"bookreview_content,varchar,bookreviewContent",
		"bookreview_clicknum,int,bookreviewClicknum",
		"bookreview_replynum,int,bookreviewReplynum",
		"bookreview_replyadd_time,datetime,bookreviewReplyaddTime",
		"is_top,int,isTop",
		"is_marrow,int,isMarrow",
		"is_reward,int,isReward",
		"vote,varchar,vote",
		"anzhibookreview,varchar,anzhibookreview"
	};
	public String[] anzhibenefitConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"apply_reason,varchar,applyReason",
		"benefit_state,int,benefitState",
		"add_time,datetime,addTime",
		"benefit_type,varchar,benefitType",
		"vote,varchar,vote",
		"anzhibenefit,varchar,anzhibenefit"
	};
	public String[] anzhisystemConditionArr=new String[]{
		"id,int,id",
		"about_us,varchar,aboutUs",
		"user_guide,varchar,userGuide",
		"author_project,varchar,authorProject",
		"talents_wanted,varchar,talentsWanted",
		"touch_us,varchar,touchUs",
		"channels_cooperation,varchar,channelsCooperation",
		"edit_area,varchar,editArea",
		"copyright_protection,varchar,copyrightProtection",
		"vote,varchar,vote",
		"anzhisystem,varchar,anzhisystem"
	};
	public String[] anzhidiscountedConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"discounted_type,int,discountedType",
		"discounted_end_date,datetime,discountedEndDate",
		"discounted_rebate,double,discountedRebate",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"add_member_id,int,addMemberId",
		"anzhidiscounted,varchar,anzhidiscounted"
	};
	public String[] anzhidiscountedjoinConditionArr=new String[]{
		"id,int,id",
		"discounted_id,int,discountedId",
		"member_id,int,memberId",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhidiscountedjoin,varchar,anzhidiscountedjoin"
	};
	public String[] anzhireportConditionArr=new String[]{
		"id,int,id",
		"table_id,int,tableId",
		"table_type,int,tableType",
		"report_reason,varchar,reportReason",
		"state,int,state",
		"add_time,datetime,addTime",
		"add_member_id,int,addMemberId",
		"novel_title,varchar,novelTitle",
		"member_no,varchar,memberNo",
		"member_nick,varchar,memberNick",
		"anzhireport,varchar,anzhireport"
	};
	public String[] anzhihandleConditionArr=new String[]{
		"id,int,id",
		"table_id,int,tableId",
		"handle_type,int,handleType",
		"handle_vote,varchar,handleVote",
		"handle_result,int,handleResult",
		"state,int,state",
		"add_time,datetime,addTime",
		"add_member_id,int,addMemberId",
		"member_no,varchar,memberNo",
		"member_nick,varchar,memberNick",
		"anzhihandle,varchar,anzhihandle"
	};
	public String[] anzhicashConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"anzhi_money_remaining,int,anzhiMoneyRemaining",
		"anzhi_money_cash,int,anzhiMoneyCash",
		"cash_money,double,cashMoney",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhicash,varchar,anzhicash"
	};
	public String[] anzhirecommendConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"recommend_post,varchar,recommendPost",
		"recommend_position,varchar,recommendPosition",
		"vote,varchar,vote",
		"state,int,state",
		"add_member_id,int,addMemberId",
		"add_time,datetime,addTime",
		"anzhirecommend,varchar,anzhirecommend"
	};
	public String[] anzhicooperationConditionArr=new String[]{
		"id,int,id",
		"cooperation_unit,varchar,cooperationUnit",
		"cooperation_url,varchar,cooperationUrl",
		"cooperation_img,varchar,cooperationImg",
		"vote,varchar,vote",
		"state,int,state",
		"add_member_id,int,addMemberId",
		"add_time,datetime,addTime",
		"anzhicooperation,varchar,anzhicooperation"
	};
	public String[] anzhinoveltypeConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"big_type,varchar,bigType",
		"small_type,varchar,smallType",
		"add_time,datetime,addTime",
		"anzhinoveltype,varchar,anzhinoveltype"
	};
	
	public String[] anzhinovelmultifunctionConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"member_id,int,memberId",
		"action_type,int,actionType",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhinovelmultifunction,varchar,anzhinovelmultifunction"
	};
	public String[] anzhinovelrewardConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"chapter_id,int,chapterId",
		"member_id,int,memberId",
		"reward_type,int,rewardType",
		"reward_num,int,rewardNum",
		"reward_anzhi_money,int,rewardAnzhiMoney",
		"state,int,state",
		"add_time,datetime,addTime",
		"vote,varchar,vote",
		"anzhinovelreward,varchar,anzhinovelreward"
	};
	public String[] anzhicommentpraiseConditionArr=new String[]{
		"id,int,id",
		"comment_id,int,commentId",
		"novel_id,int,novelId",
		"chapter_id,int,chapterId",
		"member_id,int,memberId",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhicommentpraise,varchar,anzhicommentpraise"
	};
	public String[] anzhiexperiencerecordConditionArr=new String[]{
		"id,int,id",
		"experience_type,int,experienceType",
		"experience_num,int,experienceNum",
		"member_id,int,memberId",
		"state,int,state",
		"vote,varchar,vote",
		"add_time,datetime,addTime",
		"member_no,varchar,memberNo",
		"member_nick,varchar,memberNick",
		"anzhiexperiencerecord,varchar,anzhiexperiencerecord"
	};
	public String[] anzhiillegalcharConditionArr=new String[]{
		"id,int,id",
		"char_name,varchar,charName",
		"char_vote,varchar,charVote",
		"state,int,state",
		"add_member_id,int,addMemberId",
		"add_time,datetime,addTime",
		"anzhiillegalchar,varchar,anzhiillegalchar"
	};
	public String[] anzhiothercontentConditionArr=new String[]{
		"id,int,id",
		"abotus,varchar,abotus",
		"yonghuzhinan,varchar,yonghuzhinan",
		"zuozhetougao,varchar,zuozhetougao",
		"chengpinyingcai,varchar,chengpinyingcai",
		"lianxiwomen,varchar,lianxiwomen",
		"bianjizhuanqu,varchar,bianjizhuanqu",
		"banquanweihu,varchar,banquanweihu",
		"anzhiothercontent,varchar,anzhiothercontent"
	};
	public String[] anzhipictureConditionArr=new String[]{
		"id,int,id",
		"picture_name,varchar,pictureName",
		"picture_url,varchar,pictureUrl",
		"picture_vote,varchar,pictureVote",
		"picture_type,int,pictureType",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhipicture,varchar,anzhipicture"
	};
	public String[] anzhiwebeditorConditionArr=new String[]{
		"id,int,id",
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhiwebeditor,varchar,anzhiwebeditor"
	};
	public String[] anzhiwebeditorworkConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"work_name,varchar,workName",
		"work_vote,varchar,workVote",
		"work_url,varchar,workUrl",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"anzhiwebeditorwork,varchar,anzhiwebeditorwork"
	};
	public String[] anzhiwebeditorsignConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"sign_vote,varchar,signVote",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"anzhiwebeditorsign,varchar,anzhiwebeditorsign"
	};
	public String[] anzhiwebeditorgoodsConditionArr=new String[]{
		"id,int,id",
		"goods_name,varchar,goodsName",
		"goods_img,varchar,goodsImg",
		"goods_score,varchar,goodsScore",
		"goods_vote,varchar,goodsVote",
		"goods_type,varchar,goodsType",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhiwebeditorgoods,varchar,anzhiwebeditorgoods"
	};
	public String[] anzhiwebeditorgoodschangeConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"goods_id,int,goodsId",
		"change_vote,varchar,changeVote",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		
		"goods_name,varchar,goodsName",
		"goods_img,varchar,goodsImg",
		"goods_score,varchar,goodsScore",
		"goods_type,varchar,goodsType",
		"anzhiwebeditorgoodschange,varchar,anzhiwebeditorgoodschange"
	};
	public String[] anzhiwebeditortuijianConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"tuijian_name,varchar,tuijianName",
		"tuijian_vote,varchar,tuijianVote",
		"tuijian_url,varchar,tuijianUrl",
		"is_jiajing,int,isJiajing",
		"is_hot,int,isHot",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"anzhiwebeditortuijian,varchar,anzhiwebeditortuijian"
	};
	public String[] anzhiwebeditorfuliapplyConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"apply_name,varchar,applyName",
		"apply_vote,varchar,applyVote",
		"apply_type,varchar,applyType",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"anzhiwebeditorfuliapply,varchar,anzhiwebeditorfuliapply"
	};
	public String[] anzhiwebeditorchaptercheckConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"chapter_id,int,chapterId",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		"anzhiwebeditorchaptercheck,varchar,anzhiwebeditorchaptercheck"
	};
	public String[] anzhiwebeditorauthorConditionArr=new String[]{
		"id,int,id",
		"editor_id,int,editorId",
		"novel_id,int,novelId",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"editor_no,varchar,editorNo",
		"editor_password,varchar,editorPassword",
		"editor_jiebie,varchar,editorJiebie",
		"editor_name,varchar,editorName",
		"editor_code,varchar,editorCode",
		"editor_address,varchar,editorAddress",
		"editor_tel,varchar,editorTel",
		"editor_qq,varchar,editorQq",
		"editor_score,double,editorScore",
		"editor_level,varchar,editorLevel",
		"editor_vote,varchar,editorVote",
		"editor_shifu,varchar,editorShifu",
		"editor_head_img,varchar,editorHeadImg",
		
		"novel_title,varchar,novelTitle",
		"novel_summary,varchar,novelSummary",
		"author_id,int,authorId",
		"novel_state,int,novelState",
		"novel_add_time,datetime,novelAddTime",
		"update_time,datetime,updateTime",
		"novel_type,varchar,novelType",
		"novel_vote,varchar,novelVote",
		"novel_img,varchar,novelImg",
		"novel_label,varchar,novelLabel",
		"authorization_level,int,authorizationLevel",
		"categories,varchar,categories",
		"leading_role,varchar,leadingRole",
		"supporting_role,varchar,supportingRole",
		"html_state,int,htmlState",
		"click_num,int,clickNum",
		"my_editor,varchar,myEditor",
		"posted_way,int,postedWay",
		"en_name,varchar,enName",
		"read_num,int,readNum",
		"is_signed,int,isSigned",
		"is_jinbi,int,isJinbi",
		"is_wangwen,int,isWangwen",
		"anzhiwebeditorauthor,varchar,anzhiwebeditorauthor"
	};
	public String[] anzhiwebeditorapplyConditionArr=new String[]{
		"id,int,id",
		"member_id,varchar,memberId",
		"xingming,varchar,xingming",
		"xingbie,varchar,xingbie",
		"bianjiming,varchar,bianjiming",
		"qq,varchar,qq",
		"tel,varchar,tel",
		"birthdays,datetime,birthdays",
		"shengfenzhenghao,varchar,shengfenzhenghao",
		"zhiye,varchar,zhiye",
		"vote,varchar,vote",
		"editor_vote,varchar,editorVote",
		"state,int,state",
		"add_time,datetime,addTime",
		
		"member_no,varchar,memberNo",
		"menber_password,varchar,menberPassword",
		"member_nick,varchar,memberNick",
		"member_head_img,varchar,memberHeadImg",
		"member_qq,varchar,memberQq",
		"member_sex,varchar,memberSex",
		"member_address,varchar,memberAddress",
		"member_birthday,datetime,memberBirthday",
		"member_email,varchar,memberEmail",
		"is_accpt_message,int,isAccptMessage",
		"bookshelf_public,int,bookshelfPublic",
		"member_real_name,varchar,memberRealName",
		"member_code,varchar,memberCode",
		"member_tel,varchar,memberTel",
		"member_experience,int,memberExperience",
		"member_type,int,memberType",
		"member_money,int,memberMoney",
		"anzhiwebeditorapply,varchar,anzhiwebeditorapply"
	};
	public String[] anzhiwebeditormessageConditionArr=new String[]{
		"id,int,id",
		"table_id,int,tableId",
		"types,int,types",
		"mess_content,varchar,messContent",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhiwebeditormessage,varchar,anzhiwebeditormessage"
	};
	public String[] anzhinovellabelConditionArr=new String[]{
		"id,int,id",
		"label_name,varchar,labelName",
		"father_id,int,fatherId",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhinovellabel,varchar,anzhinovellabel"
	};
	public String[] anzhinovelreadmoneybuyrecordConditionArr=new String[]{
		"id,int,id",
		"chapter_id,int,chapterId",
		"member_id,int,memberId",
		"user_money,int,userMoney",
		"before_read_money,int,beforeReadMoney",
		"after_read_money,int,afterReadMoney",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhinovelreadmoneybuyrecord,varchar,anzhinovelreadmoneybuyrecord"
	};
	public String[] anzhinovelreadmoneyrecordConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"read_money,int,readMoney",
		"vote,varchar,vote",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhinovelreadmoneyrecord,varchar,anzhinovelreadmoneyrecord"
	};
	public String[] anzhimoneyapplyrecordConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"chong_money,double,chongMoney",
		"order_no,varchar,orderNo",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhimoneyapplyrecord,varchar,anzhimoneyapplyrecord"
	};
	public String[] anzhiinteractiveConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"interactive_title,varchar,interactiveTitle",
		"interactive_content,varchar,interactiveContent",
		"interactive_type,int,interactiveType",
		"reply_content,varchar,replyContent",
		"reply_title,varchar,replyTitle",
		"reply_member_id,int,replyMemberId",
		"reply_time,datetime,replyTime",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhiinteractive,varchar,anzhiinteractive"
	};
	public String[] anzhithirdloginConditionArr=new String[]{
		"id,int,id",
		"member_id,int,memberId",
		"third_login_pid,varchar,thirdLoginPid",
		"third_login_type,int,thirdLoginType",
		"state,int,state",
		"add_time,datetime,addTime",
		"anzhithirdlogin,varchar,anzhithirdlogin"
	};
	public String[] anzhithirdrecommandConditionArr=new String[]{
		"id,int,id",
		"novel_id,int,novelId",
		"third_type,int,thirdType",
		"recommand_vote,varchar,recommandVote",
		"state,int,state",
		"add_time,datetime,addTime",
		"novel_title,varchar,novelTitle",
		"anzhithirdrecommand,varchar,anzhithirdrecommand"
	};
	public String getCondition(String[] arr,HttpServletRequest request,HttpServletResponse response){
		String condition="";
		for(String s:arr){
			String[] tmp=s.split(",");
			if(request.getParameter(tmp[2])!=null){
				if(!request.getParameter(tmp[2]).trim().equals("")){
					if(tmp[1].equals("int")){
						try {
							condition+=" and "+tmp[0]+"="+Integer.parseInt(StringEscapeUtils.escapeSql(request.getParameter(tmp[2]).trim()));
						} catch (NumberFormatException e) {
							condition+=" and "+tmp[0]+"=-1";
						}
					}else if(tmp[1].equals("varchar")){
						condition+=" and "+tmp[0]+" like '%"+StringEscapeUtils.escapeSql(request.getParameter(tmp[2]).trim())+"%'";
					}else if(tmp[1].equals("double")){
						try {
							condition+=" and "+tmp[0]+"="+Double.parseDouble(StringEscapeUtils.escapeSql(request.getParameter(tmp[2]).trim()));
						} catch (NumberFormatException e) {
							condition+=" and "+tmp[0]+"=-1";
						}
					}else if(tmp[1].equals("float")){
						condition+=" and "+tmp[0]+"="+Double.parseDouble(StringEscapeUtils.escapeSql(request.getParameter(tmp[2]).trim()));
					}
				}
			}
		}
		return condition;
	}

	
	
	public String getNow(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
	public String getNowStr(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	public String getNowStr(String str){
		return new SimpleDateFormat(str).format(new Date());
	}
	
	public Timestamp getTimestamp(){
		return new Timestamp(new Date().getTime());
	}
	
	public Timestamp getTimestamp(String str){
		try {
			return new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(str).getTime());
		} catch (ParseException e) {
			return new Timestamp(new Date().getTime());
		}
	}
	
	public String getPageName(HttpServletRequest request,String pageName){
		if(request.getParameter("pageName")!=null){
			pageName=request.getParameter("pageName");
		}
		return pageName;
	}
	
	//加密
	public  String getMD5Str(String str) {
		MessageDigest messageDigest = null;
		try {
			messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.reset();
			messageDigest.update(str.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException caught!");
			System.exit(-1);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		byte[] byteArray = messageDigest.digest();
		StringBuffer md5StrBuff = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++) {
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}
		return md5StrBuff.toString();
	}
	
	//文件上传
	public  String fileUpload(HttpServletRequest request,HttpServletResponse response,FileItem f,String filePathes) throws Exception{
		if(f.getName()!=null&&!f.getName().trim().equals("")){
			try {
				String fileNameString=f.getName();
				fileNameString=this.getFileName()+fileNameString.substring(fileNameString.lastIndexOf("."), fileNameString.length());
				String fileName = new File(f.getName()).getName();
				String filePath = request.getRealPath("//") + "//upload//"+filePathes+"//";
				File dir = new File(filePath);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				File uploadFile = new File(filePath + "//" + fileNameString);
				f.write(uploadFile);
				return fileNameString;
			} catch (Exception e) {
				// TODO Auto-generated catch block
			}
		}
		return "";
	}
	
	//设置上传文件的名称
	public String getFileName(){
		String fileName="";
		SimpleDateFormat fd=new SimpleDateFormat("yyyyMMddHHmmss-SS");
		fileName+=fd.format(new Date());
		return fileName;
	}
	
	//获得登录用户
	public AnzhiMember getLoginMember(HttpServletRequest request){
		if(request.getSession().getAttribute("loginUsers")!=null){
			return (AnzhiMember)request.getSession().getAttribute("loginUsers");
		}
		return null;
	}
	
	//获得登录作者
	public AnzhiAuthor getLoginAuthor(HttpServletRequest request){
		if(request.getSession().getAttribute("loginAuthors")!=null){
			return (AnzhiAuthor)request.getSession().getAttribute("loginAuthors");
		}
		
		return null;
	}
	
	//获得登录网编
	public AnzhiWebEditor getLoginWebEditor(HttpServletRequest request){
		if(request.getSession().getAttribute("loginWebEditorUser")!=null){
			return (AnzhiWebEditor)request.getSession().getAttribute("loginWebEditorUser");
		}
		return null;
	}
	
	public Timestamp getTimestamp(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&request.getParameter(param)!=""){
			try {
				return new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter(param)).getTime());
			} catch (ParseException e) {
				return new Timestamp(new Date().getTime());
			}
		}else{
			return new Timestamp(new Date().getTime());
		}
	}
	
	public Timestamp getTimestampFull(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&request.getParameter(param)!=""){
			try {
				return new Timestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(request.getParameter(param)).getTime());
			} catch (ParseException e) {
				return new Timestamp(new Date().getTime());
			}
		}else{
			return new Timestamp(new Date().getTime());
		}
	}
	
	public Timestamp getTimestampFull(String times,AnzhiChapter anzhichapter){
		if(anzhichapter.getState().equals(1)||anzhichapter.getState().equals(0)){
			//如果是立即发布或草稿箱。直接用当前时间
			return new Timestamp(new Date().getTime());
		}else if(anzhichapter.getState().equals(2)){
			//如果是定时发布
			if(times!=null&&times!=""){
				try {
					return new Timestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(times).getTime());
				} catch (ParseException e) {
					return new Timestamp(new Date().getTime());
				}
			}else{
				return new Timestamp(new Date().getTime());
			}
		}
		return new Timestamp(new Date().getTime());
	}
	
	public boolean checkParam(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&!request.getParameter(param).equals("")){
			return true;
		}
		return false;
	}
	
	/**
	 * 
	 * 获得登录者的id
	 * @param request
	 * @return
	 */
	public int getLoginMemberId(HttpServletRequest request){
		AnzhiMember am=this.getLoginMember(request);
		try {
			return am.getId();
		} catch (Exception e) {
			return -1;
		}
	}
	/**
	 * 
	 * 获得整形的请求参数值
	 * @param request
	 * @return
	 */
	public int getInt(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&!request.getParameter(param).equals("")){
			try {
				int n= Integer.parseInt(request.getParameter(param));
				if(n<0){
					return -1;
				}
				return n;
			} catch (NumberFormatException e) {
				return -1;
			}
		}
		return -1;
	}
	
	/**
	 * 根据查询sql获得，传入类型的泛型集合
	 * @param f
	 * @param sql
	 * @return
	 */
	public List getListData(FatherPojo f,String sql){
		return utilService.getList(f, sql);
	}
	
	/**
	 * 修该表的指定字段的值
	 * @param tableName 表名
	 * @param id 记录id
	 * @param field 修改字段名称
	 * @param value 修改的值
	 */
	public void updateTableField(String tableName, int id, String field,
			int value) {
		utilService.updateTableFields(tableName, id, field, value);
	}
	
	/**
	 * 修该表的指定字段的值
	 * @param tableName 表名
	 * @param id 记录id
	 * @param field 修改字段名称
	 * @param value 修改的值
	 */
	public void updateTableField(String tableName, int id, String field,
			String value) {
		utilService.updateTableFields(tableName, id, field, value);
	}
	/**
	 * 获得表字段的值[只有一个]
	 * @param tableName 表名
	 * @param id 记录id
	 * @param field 修改字段名称
	 */
	public Object getObjectByField(String tableName, int id, String field) {
		return utilService.getObjectByField(tableName, id, field);
	}
	/**
	 * 获得表字段的值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public Object getObject(String sql) {
		return utilService.getObject(sql);
	}
	
	/**
	 * 获得表字段的整形值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public String getStringBySql(String sql){
		Object obj= getObject(sql);
		try {
			if(obj!=null){
				return obj.toString();
			}else{
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}
	
	
	/**
	 * 获得表字段的整形值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public int getIntBySql(String sql){
		Object obj= getObject(sql);
		try {
			if(obj!=null){
				return Integer.parseInt(obj.toString());
			}else{
				return 0;
			}
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	
	/**
	 * 获得表字段的整形值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public double getDoubleBySql(String sql){
		Object obj= getObject(sql);
		try {
			if(obj!=null){
				return Double.parseDouble(obj.toString());
			}else{
				return 0;
			}
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	
	/**
	 * 获得小说类型
	 * @param oldChar
	 * @return
	 */
	public String getNovelType(String oldChar){
		String types="";
		if(oldChar!=null&&!oldChar.equals("")){
			String[] arr=oldChar.split("/");
			for(String s:arr){
				if(!s.equals("")){
					String[] st=s.split("@");
					types+=st.length>0?st[0]+"/":"";
				}
			}
		}
		return types.equals("")?types:types.substring(0,types.length()-1);
	}
	
	/**
	 * 根据传入的小说集合改变小说类型
	 * @param oldChar
	 * @return
	 */
	public QueryList<AnzhiNovel> novelTypeChange(QueryList<AnzhiNovel> list){
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			an.setNovelType(this.getNovelType(an.getNovelType()));
		}
		return list;
	}
	
	/**
	 * 验证码验证
	 */
	public String randCodeCheck(HttpServletRequest request,AnzhiMember am){
		if(request.getSession().getAttribute("rand")==null){
			return "验证码输入错误！";
		}
		if(!request.getSession().getAttribute("rand").toString().equals(request.getParameter("randCode"))){
			return "验证码输入错误！";
		}
		if(am==null||am.getId()==null||am.getId().equals(0)){
			return "您还没有登录呢！";
		}
		return "yes";
	}
	
	//根据小说文字计算需要的安之币
	public int getAnZhiBi(int charNum){
		return (charNum/1000)*4;
	}
	
	//获得登录的网编
	public String getWebEditorCondition(HttpServletRequest request,String condition){
		AnzhiMember anzhimember=this.getLoginMember(request);
		if(anzhimember!=null&&anzhimember.getMemberType()==2){
			condition+=" and 1=1";
			return condition;
		}
		if(request.getSession().getAttribute("loginWebEditorUser")==null){
			condition+=" and 1=3";
			return condition;
		}
		
		if(request.getSession().getAttribute("loginWebEditorUser")!=null){
			AnzhiWebEditor t=(AnzhiWebEditor)request.getSession().getAttribute("loginWebEditorUser");
			condition+=" and editor_id="+t.getId();
		}else if(request.getSession().getAttribute("loginUsers")==null){
			condition+=" and 1=3";
		}
		return condition;
	}
	
	/**
	 * 修改小说目录、生成章节阅读界面
	 * @param path
	 * @param anzhichapter
	 * @param novelId
	 * @param ac
	 * @return
	 */
	public void updateNovelMenu(String path,int novelId){
		QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
		if(ls.getList().size()!=0){
			AnzhiNovel an=ls.getList().get(0);
			//更新小说目录
			utilService.createNovelChapter(an, path);
		}
	}
	
	public int getPageNum(HttpServletRequest request){
		int pageNum=this.getInt(request, "pageNum");
		if(pageNum<1){
			pageNum=1;
		}
		return pageNum;
	}
}