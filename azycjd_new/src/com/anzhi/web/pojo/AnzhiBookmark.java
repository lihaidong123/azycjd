package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiBookmark extends FatherPojo implements java.io.Serializable {
	public AnzhiBookmark(){
	}
	public AnzhiBookmark setValues(Object[] obj) {
		AnzhiBookmark model=new AnzhiBookmark();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setNovelId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setChapterId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setAddTime(obj[4]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[4]));
		model.setReadAddress(obj[5]==null?null:Double.parseDouble(obj[5].toString()));
		model.setBookmarkType(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setVote(obj[7]==null?"":obj[7].toString());
		model.setNovelTitle(obj[8]==null?"":obj[8].toString());
		model.setAuthorWriterName(obj[9]==null?"":obj[9].toString());
		model.setChapterTitle(obj[10]==null?"":obj[10].toString());
		return model;
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
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
	}
	private Integer chapterId;
	public void setChapterId(Integer chapterId){
		this.chapterId=chapterId;
	}
	public Integer getChapterId(){
		return this.chapterId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private Double readAddress;
	public void setReadAddress(Double readAddress){
		this.readAddress=readAddress;
	}
	public Double getReadAddress(){
		return this.readAddress;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	private String novelTitle;
	public void setNovelTitle(String novelTitle){
		this.novelTitle=novelTitle;
	}
	public String getNovelTitle(){
		return this.novelTitle;
	}
	private String authorWriterName;
	public void setAuthorWriterName(String authorWriterName){
		this.authorWriterName=authorWriterName;
	}
	public String getAuthorWriterName(){
		return this.authorWriterName;
	}
	private String chapterTitle;
	public String getChapterTitle() {
		return chapterTitle;
	}
	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}
	private Integer bookmarkType;
	public Integer getBookmarkType() {
		return bookmarkType;
	}
	public void setBookmarkType(Integer bookmarkType) {
		this.bookmarkType = bookmarkType;
	}
	
}