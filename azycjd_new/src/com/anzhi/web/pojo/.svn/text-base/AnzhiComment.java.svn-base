package com.anzhi.web.pojo;
import java.io.File;
import java.sql.Timestamp;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
import com.anzhi.web.util.QueryList;
public class AnzhiComment extends FatherPojo implements java.io.Serializable {
	public AnzhiComment(){
	}
	public AnzhiComment setValues(Object[] obj) {
		AnzhiComment model=new AnzhiComment();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setTableId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setCommentTitle(obj[3]==null?"":obj[3].toString());
		model.setCommentContent(obj[4]==null?"":obj[4].toString());
		model.setCommentType(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setCommentFatherid(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setState(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setAddTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		model.setIsTop(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setIsMarrow(obj[10]==null?0:Integer.parseInt(obj[10].toString()));
		model.setVote(obj[11]==null?"":obj[11].toString());
		model.setMemberNo(obj[12]==null?"":obj[12].toString());
		model.setMemberNick(obj[13]==null?"":obj[13].toString());
		model.setMemberHeadImg(obj[14]==null?"":obj[14].toString());
		model.setNovelTitle(obj[15]==null?"":obj[15].toString());
		model.setAuthorWriterName(obj[16]==null?"":obj[16].toString());
		return model;
	}
	
	//此字段异步加载
	private int dianZanNum;
	private int replyNum;
	
	public int getDianZanNum() {
		return dianZanNum;
	}
	public void setDianZanNum(int dianZanNum) {
		this.dianZanNum = dianZanNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer tableId;
	public void setTableId(Integer tableId){
		this.tableId=tableId;
	}
	public Integer getTableId(){
		return this.tableId;
	}
	private String commentTitle;
	public void setCommentTitle(String commentTitle){
		this.commentTitle=commentTitle;
	}
	public String getCommentTitle(){
		return this.commentTitle;
	}
	private String commentContent;
	public void setCommentContent(String commentContent){
		this.commentContent=commentContent;
	}
	public String getCommentContent(){
		return this.commentContent;
	}
	private Integer commentType;
	public void setCommentType(Integer commentType){
		this.commentType=commentType;
	}
	public Integer getCommentType(){
		return this.commentType;
	}
	private Integer commentFatherid;
	public void setCommentFatherid(Integer commentFatherid){
		this.commentFatherid=commentFatherid;
	}
	public Integer getCommentFatherid(){
		return this.commentFatherid;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private Integer isTop;
	public void setIsTop(Integer isTop){
		this.isTop=isTop;
	}
	public Integer getIsTop(){
		return this.isTop;
	}
	private Integer isMarrow;
	public void setIsMarrow(Integer isMarrow){
		this.isMarrow=isMarrow;
	}
	public Integer getIsMarrow(){
		return this.isMarrow;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	
	/**
	 * 评论类型名
	 */
	private String commentName;
	public String getCommentName() {
		return commentName;
	}
	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}
	
	/**
	 * 回复数
	 */
	private int commentNum;
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	private String memberNo;
	private String memberNick;
	private String memberHeadImg;
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberHeadImg() {
		return memberHeadImg;
	}
	public void setMemberHeadImg(String memberHeadImg) {
		this.memberHeadImg = this.setMemberHeadImgFather(memberHeadImg);
	}
	/*
	 * 查找评论的对象的名称和作者
	 */
	private String commentfathertitle;
	private String commentfathername;

	public String getCommentfathertitle() {
		return commentfathertitle;
	}
	public void setCommentfathertitle(String commentfathertitle) {
		this.commentfathertitle = commentfathertitle;
	}
	public String getCommentfathername() {
		return commentfathername;
	}
	public void setCommentfathername(String commentfathername) {
		this.commentfathername = commentfathername;
	}
	
	private QueryList<AnzhiComment> replyList;

	public QueryList<AnzhiComment> getReplyList() {
		return replyList;
	}
	public void setReplyList(QueryList<AnzhiComment> replyList) {
		this.replyList = replyList;
	}
	
	private String novelTitle;
	private String authorWriterName;

	public String getNovelTitle() {
		return novelTitle;
	}
	public void setNovelTitle(String novelTitle) {
		this.novelTitle = novelTitle;
	}
	public String getAuthorWriterName() {
		return authorWriterName;
	}
	public void setAuthorWriterName(String authorWriterName) {
		this.authorWriterName = authorWriterName;
	}
	
}