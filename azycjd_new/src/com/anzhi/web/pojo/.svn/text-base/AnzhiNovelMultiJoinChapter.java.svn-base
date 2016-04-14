package com.anzhi.web.pojo;

import java.sql.Timestamp;
import java.util.Date;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;

public class AnzhiNovelMultiJoinChapter extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public AnzhiNovelMultiJoinChapter(){}
	public AnzhiNovelMultiJoinChapter setValues(Object[] obj) {
		AnzhiNovelMultiJoinChapter model=new AnzhiNovelMultiJoinChapter();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setActionType(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setVote(obj[6]==null?"":obj[6].toString());
		model.setFenJuanId(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setChapterTitle(obj[8]==null?"":obj[8].toString());
		model.setChapterContent(obj[9]==null?"":obj[9].toString());
		model.setChapterVote(obj[10]==null?"":obj[10].toString());
		model.setChapterState(obj[11]==null?0:Integer.parseInt(obj[11].toString()));
		model.setLastUpdateTime(obj[12]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[12]));
		model.setChapterCharNum(obj[13]==null?0:Integer.parseInt(obj[13].toString()));
		model.setReadType(obj[14]==null?0:Integer.parseInt(obj[14].toString()));
		model.setChapterReportNovelId(obj[15]==null?0:Integer.parseInt(obj[15].toString()));
		model.setJuanName(obj[16]==null?"":obj[16].toString());
		model.setJuanVote(obj[17]==null?"":obj[17].toString());
		model.setNovelTitle(obj[14]==null?"":obj[18].toString());
		model.setAuthorId(obj[19]==null?0:Integer.parseInt(obj[19].toString()));
		model.setAuthorWriterName(obj[20]==null?"":obj[20].toString());
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
	
	private Integer fenJuanId;
	public void setFenJuanId(Integer fenJuanId){
		this.fenJuanId=fenJuanId;
	}
	public Integer getFenJuanId(){
		return this.fenJuanId;
	}
	private String chapterTitle;
	public void setChapterTitle(String chapterTitle){
		this.chapterTitle=chapterTitle;
	}
	public String getChapterTitle(){
		return this.chapterTitle;
	}
	private String chapterContent;
	public void setChapterContent(String chapterContent){
		this.chapterContent=chapterContent;
	}
	public String getChapterContent(){
		return this.chapterContent;
	}
	private String chapterVote;
	public void setChapterVote(String chapterVote){
		this.chapterVote=chapterVote;
	}
	public String getChapterVote(){
		return this.chapterVote;
	}
	private Integer chapterState;
	
	
	private Timestamp lastUpdateTime;
	public void setLastUpdateTime(Timestamp lastUpdateTime){
		this.lastUpdateTime=lastUpdateTime;
	}
	public Timestamp getLastUpdateTime(){
		return this.lastUpdateTime;
	}
	private Integer chapterCharNum;
	public void setChapterCharNum(Integer chapterCharNum){
		this.chapterCharNum=chapterCharNum;
		this.anzhibi=(this.chapterCharNum/1000)*4;
	}
	public Integer getChapterCharNum(){
		return this.chapterCharNum;
	}
	private Integer readType;
	public void setReadType(Integer readType){
		this.readType=readType;
	}
	public Integer getReadType(){
		return this.readType;
	}
	

	private int anzhibi;
	public int getAnzhibi() {
		return anzhibi;
	}
	public void setAnzhibi(int anzhibi) {
		this.anzhibi = anzhibi;
	}
	
	private Integer chapterReportNovelId;
	
	public Integer getChapterState() {
		return chapterState;
	}
	public void setChapterState(Integer chapterState) {
		this.chapterState = chapterState;
	}
	public Integer getChapterReportNovelId() {
		return chapterReportNovelId;
	}
	public void setChapterReportNovelId(Integer chapterReportNovelId) {
		this.chapterReportNovelId = chapterReportNovelId;
	}

	private String juanName;
	public void setJuanName(String juanName){
		this.juanName=juanName;
	}
	public String getJuanName(){
		return this.juanName;
	}
	private String juanVote;
	public void setJuanVote(String juanVote){
		this.juanVote=juanVote;
	}
	public String getJuanVote(){
		return this.juanVote;
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
}
