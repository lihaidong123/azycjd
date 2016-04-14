package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiChapter extends FatherPojo implements java.io.Serializable {
	public AnzhiChapter(){
	}
	public AnzhiChapter setValues(Object[] obj) {
		AnzhiChapter model=new AnzhiChapter();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setFenJuanId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setChapterTitle(obj[2]==null?"":obj[2].toString());
		model.setChapterContent(obj[3]==null?"":obj[3].toString());
		model.setChapterVote(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setLastUpdateTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setChapterCharNum(obj[8]==null?0:Integer.parseInt(obj[8].toString()));
		model.setReadType(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setVote(obj[10]==null?"":obj[10].toString());
		
		model.setNovelId(obj[11]==null?0:Integer.parseInt(obj[11].toString()));
		model.setJuanName(obj[12]==null?"":obj[12].toString());
		model.setJuanVote(obj[13]==null?"":obj[13].toString());
		
		model.setNovelTitle(obj[14]==null?"":obj[14].toString());
		model.setAuthorId(obj[15]==null?0:Integer.parseInt(obj[15].toString()));
		model.setAuthorWriterName(obj[16]==null?"":obj[16].toString());
		try {
			model.setNoPassVote(obj[17]==null?"no":obj[17].toString());
		} catch (Exception e) {
			model.setNoPassVote("no");
		}
		return model;
	}
	
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
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
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}

	private int anzhibi;
	public int getAnzhibi() {
		return anzhibi;
	}
	public void setAnzhibi(int anzhibi) {
		this.anzhibi = anzhibi;
	}
	
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
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

	private String noPassVote;
	public String getNoPassVote() {
		return noPassVote;
	}
	public void setNoPassVote(String noPassVote) {
		this.noPassVote = noPassVote;
	}
	
}