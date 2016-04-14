package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorSign extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorSign(){
	}
	public AnzhiWebEditorSign setValues(Object[] obj) {
		AnzhiWebEditorSign model=new AnzhiWebEditorSign();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setSignVote(obj[2]==null?"":obj[2].toString());
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
	private String signVote;
	public void setSignVote(String signVote){
		this.signVote=signVote;
	}
	public String getSignVote(){
		return this.signVote;
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