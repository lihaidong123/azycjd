package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorTuijian extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorTuijian(){
	}
	public AnzhiWebEditorTuijian setValues(Object[] obj) {
		AnzhiWebEditorTuijian model=new AnzhiWebEditorTuijian();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setTuijianName(obj[2]==null?"":obj[2].toString());
		model.setTuijianVote(obj[3]==null?"":obj[3].toString());
		model.setTuijianUrl(obj[4]==null?"":obj[4].toString());
		model.setIsJiajing(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setIsHot(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setState(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setAddTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String tuijianName;
	public void setTuijianName(String tuijianName){
		this.tuijianName=tuijianName;
	}
	public String getTuijianName(){
		return this.tuijianName;
	}
	private String tuijianVote;
	public void setTuijianVote(String tuijianVote){
		this.tuijianVote=tuijianVote;
	}
	public String getTuijianVote(){
		return this.tuijianVote;
	}
	private String tuijianUrl;
	public void setTuijianUrl(String tuijianUrl){
		this.tuijianUrl=tuijianUrl;
	}
	public String getTuijianUrl(){
		return this.tuijianUrl;
	}
	private Integer isJiajing;
	public void setIsJiajing(Integer isJiajing){
		this.isJiajing=isJiajing;
	}
	public Integer getIsJiajing(){
		return this.isJiajing;
	}
	private Integer isHot;
	public void setIsHot(Integer isHot){
		this.isHot=isHot;
	}
	public Integer getIsHot(){
		return this.isHot;
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