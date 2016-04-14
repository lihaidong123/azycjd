package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorFuliApply extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorFuliApply(){
	}
	public AnzhiWebEditorFuliApply setValues(Object[] obj) {
		AnzhiWebEditorFuliApply model=new AnzhiWebEditorFuliApply();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setApplyName(obj[2]==null?"":obj[2].toString());
		model.setApplyVote(obj[3]==null?"":obj[3].toString());
		model.setApplyType(obj[4]==null?"":obj[4].toString());
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
	private String applyName;
	public void setApplyName(String applyName){
		this.applyName=applyName;
	}
	public String getApplyName(){
		return this.applyName;
	}
	private String applyVote;
	public void setApplyVote(String applyVote){
		this.applyVote=applyVote;
	}
	public String getApplyVote(){
		return this.applyVote;
	}
	private String applyType;
	public void setApplyType(String applyType){
		this.applyType=applyType;
	}
	public String getApplyType(){
		return this.applyType;
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