package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiCooperation extends FatherPojo implements java.io.Serializable {
	public AnzhiCooperation(){
	}
	public AnzhiCooperation setValues(Object[] obj) {
		AnzhiCooperation model=new AnzhiCooperation();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setCooperationUnit(obj[1]==null?"":obj[1].toString());
		model.setCooperationUrl(obj[2]==null?"":obj[2].toString());
		model.setCooperationImg(obj[3]==null?"":obj[3].toString());
		model.setVote(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddMemberId(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String cooperationUnit;
	public void setCooperationUnit(String cooperationUnit){
		this.cooperationUnit=cooperationUnit;
	}
	public String getCooperationUnit(){
		return this.cooperationUnit;
	}
	private String cooperationUrl;
	public void setCooperationUrl(String cooperationUrl){
		this.cooperationUrl=cooperationUrl;
	}
	public String getCooperationUrl(){
		return this.cooperationUrl;
	}
	private String cooperationImg;
	public void setCooperationImg(String cooperationImg){
		this.cooperationImg=cooperationImg;
	}
	public String getCooperationImg(){
		return this.cooperationImg;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}
	private Integer addMemberId;
	public void setAddMemberId(Integer addMemberId){
		this.addMemberId=addMemberId;
	}
	public Integer getAddMemberId(){
		return this.addMemberId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}