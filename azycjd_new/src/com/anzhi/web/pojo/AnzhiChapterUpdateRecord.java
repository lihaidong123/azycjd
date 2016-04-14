package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiChapterUpdateRecord extends FatherPojo implements java.io.Serializable {
	public AnzhiChapterUpdateRecord(){
	}
	public AnzhiChapterUpdateRecord setValues(Object[] obj) {
		AnzhiChapterUpdateRecord model=new AnzhiChapterUpdateRecord();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setChapterId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setUpdateNum(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setAddTime(obj[3]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[3]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer chapterId;
	public void setChapterId(Integer chapterId){
		this.chapterId=chapterId;
	}
	public Integer getChapterId(){
		return this.chapterId;
	}
	private Integer updateNum;
	public void setUpdateNum(Integer updateNum){
		this.updateNum=updateNum;
	}
	public Integer getUpdateNum(){
		return this.updateNum;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}