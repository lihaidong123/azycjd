package com.anzhi.web.pojo;

import java.sql.Timestamp;
import java.util.Date;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;

public class AnzhiNovelMultiJoinNovel extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2798971076634233524L;
	public AnzhiNovelMultiJoinNovel(){}
	public AnzhiNovelMultiJoinNovel setValues(Object[] obj) {
		AnzhiNovelMultiJoinNovel model=new AnzhiNovelMultiJoinNovel();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setActionType(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setVote(obj[6]==null?"":obj[6].toString());
		model.setNovelTitle(obj[7]==null?"":obj[7].toString());
		model.setAuthorId(obj[8]==null?0:Integer.parseInt(obj[8].toString()));
		model.setNovelState(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setUpdateTime(obj[10]==null?new Timestamp(new Date().getTime()):new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[10]));
		model.setNovelType(obj[11]==null?"":obj[11].toString());
		model.setClickNum(obj[12]==null?0:Integer.parseInt(obj[12].toString()));
		model.setReadNum(obj[13]==null?0:Integer.parseInt(obj[13].toString()));
		model.setIsSigned(obj[14]==null?0:Integer.parseInt(obj[14].toString()));
		model.setTotalRecommand(obj[15]==null?0:Integer.parseInt(obj[15].toString()));
		model.setTotalCharNum(obj[16]==null?0:Integer.parseInt(obj[16].toString()));
		model.setTotalSaveNum(obj[17]==null?0:Integer.parseInt(obj[17].toString()));
		model.setTotalDingyueNum(obj[18]==null?0:Integer.parseInt(obj[18].toString()));
		model.setTotalShangNum(obj[19]==null?0:Integer.parseInt(obj[19].toString()));
		model.setTotalCommentNum(obj[20]==null?0:Integer.parseInt(obj[20].toString()));
		model.setAuthorWriterName(obj[21]==null?"":obj[21].toString());
		return model;
	}
	
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer actionType;
	public void setActionType(Integer actionType){
		this.actionType=actionType;
	}
	public Integer getActionType(){
		return this.actionType;
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
	private String vote;
	
	public String getVote() {
		if(this.vote==null){
			this.vote="";
		}
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	
	private String novelTitle;
	public void setNovelTitle(String novelTitle){
		this.novelTitle=novelTitle;
	}
	public String getNovelTitle(){
		return this.novelTitle;
	}
	
	private Integer authorId;
	public void setAuthorId(Integer authorId){
		this.authorId=authorId;
	}
	public Integer getAuthorId(){
		return this.authorId;
	}
	private Integer novelState;
	
	public Integer getNovelState() {
		return novelState;
	}
	public void setNovelState(Integer novelState) {
		this.novelState = novelState;
	}

	private Timestamp updateTime;
	public void setUpdateTime(Timestamp updateTime){
		this.updateTime=updateTime;
	}
	public Timestamp getUpdateTime(){
		return this.updateTime;
	}
	private String novelType;
	public void setNovelType(String novelType){
		this.novelType=novelType;
	}
	public String getNovelType(){
		return this.novelType;
	}
	
	private Integer clickNum;
	public void setClickNum(Integer clickNum){
		this.clickNum=clickNum;
	}
	public Integer getClickNum(){
		return this.clickNum;
	}
	
	
	private Integer readNum;
	public void setReadNum(Integer readNum){
		this.readNum=readNum;
	}
	public Integer getReadNum(){
		return this.readNum;
	}
	private Integer isSigned;
	public void setIsSigned(Integer isSigned){
		this.isSigned=isSigned;
	}
	public Integer getIsSigned(){
		return this.isSigned;
	}
	
	private String authorWriterName;


	public String getAuthorWriterName() {
		if(this.authorWriterName==null){
			this.authorWriterName="";
		}
		return authorWriterName;
	}
	public void setAuthorWriterName(String authorWriterName) {
		this.authorWriterName = authorWriterName;
	}
	
	private int totalSaveNum;//收藏数
	private int totalCharNum;//总字数
	private int totalRecommand;//总推荐数
	private int totalDingyueNum;//订阅数
	private int totalShangNum;//打赏数
	private int totalCommentNum;//评论数
	
	public int getTotalSaveNum() {
		return totalSaveNum;
	}
	public void setTotalSaveNum(int totalSaveNum) {
		this.totalSaveNum = totalSaveNum;
	}
	public int getTotalRecommand() {
		return totalRecommand;
	}
	public void setTotalRecommand(int totalRecommand) {
		this.totalRecommand = totalRecommand;
	}
	public int getTotalCharNum() {
		return totalCharNum;
	}
	public void setTotalCharNum(int totalCharNum) {
		this.totalCharNum = totalCharNum;
	}
	public int getTotalDingyueNum() {
		return totalDingyueNum;
	}
	public void setTotalDingyueNum(int totalDingyueNum) {
		this.totalDingyueNum = totalDingyueNum;
	}
	public int getTotalShangNum() {
		return totalShangNum;
	}
	public void setTotalShangNum(int totalShangNum) {
		this.totalShangNum = totalShangNum;
	}
	public int getTotalCommentNum() {
		return totalCommentNum;
	}
	public void setTotalCommentNum(int totalCommentNum) {
		this.totalCommentNum = totalCommentNum;
	}
}
