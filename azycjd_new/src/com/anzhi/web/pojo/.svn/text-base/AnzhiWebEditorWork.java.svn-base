package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorWork extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorWork(){
	}
	public AnzhiWebEditorWork setValues(Object[] obj) {
		AnzhiWebEditorWork model=new AnzhiWebEditorWork();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setWorkName(obj[2]==null?"":obj[2].toString());
		model.setWorkVote(obj[3]==null?"":obj[3].toString());
		model.setWorkUrl(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String workName;
	public void setWorkName(String workName){
		this.workName=workName;
	}
	public String getWorkName(){
		return this.workName;
	}
	private String workVote;
	public void setWorkVote(String workVote){
		this.workVote=workVote;
	}
	public String getWorkVote(){
		return this.workVote;
	}
	private String workUrl;
	public void setWorkUrl(String workUrl){
		this.workUrl=workUrl;
	}
	public String getWorkUrl(){
		return this.workUrl;
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