package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorChapterCheck extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorChapterCheck(){
	}
	public AnzhiWebEditorChapterCheck setValues(Object[] obj) {
		AnzhiWebEditorChapterCheck model=new AnzhiWebEditorChapterCheck();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setChapterId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setState(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setAddTime(obj[4]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[4]));
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
}