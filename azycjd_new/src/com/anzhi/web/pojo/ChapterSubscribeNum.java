package com.anzhi.web.pojo;

import java.sql.Timestamp;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;

public class ChapterSubscribeNum extends FatherPojo implements java.io.Serializable{
	public ChapterSubscribeNum(){
	}
	public ChapterSubscribeNum setValues(Object[] obj) {
		ChapterSubscribeNum model=new ChapterSubscribeNum();
		model.setChapterId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setChapterTitle(obj[1]==null?"":obj[1].toString());
		model.setContentNum(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setLastUpdateTime(obj[3]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[3]));
		model.setNums(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		return model;
	}	
	
	private int chapterId;
	private String chapterTitle;
	private int contentNum;
	private Timestamp lastUpdateTime;
	private int nums;
	public int getChapterId() {
		return chapterId;
	}
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapterTitle() {
		return chapterTitle;
	}
	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
}
