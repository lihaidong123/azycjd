package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiExperienceRecord extends FatherPojo implements java.io.Serializable {
	public AnzhiExperienceRecord(){
	}
	public AnzhiExperienceRecord setValues(Object[] obj) {
		AnzhiExperienceRecord model=new AnzhiExperienceRecord();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setExperienceType(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setExperienceNum(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setMemberId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setVote(obj[5]==null?"":obj[5].toString());
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setMemberNo(obj[7]==null?"":obj[7].toString());
		model.setMemberNick(obj[8]==null?"":obj[8].toString());
		model.setMemberHeadImg(obj[9]==null?"":obj[9].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer experienceType;
	public void setExperienceType(Integer experienceType){
		this.experienceType=experienceType;
	}
	public Integer getExperienceType(){
		return this.experienceType;
	}
	private Integer experienceNum;
	public void setExperienceNum(Integer experienceNum){
		this.experienceNum=experienceNum;
	}
	public Integer getExperienceNum(){
		return this.experienceNum;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

	private String memberNo;
	public void setMemberNo(String memberNo){
		this.memberNo=memberNo;
	}
	public String getMemberNo(){
		return this.memberNo;
	}
	
	private String memberNick;
	public void setMemberNick(String memberNick){
		this.memberNick=memberNick;
	}
	public String getMemberNick(){
		return this.memberNick;
	}
	private String memberHeadImg;
	public void setMemberHeadImg(String memberHeadImg){
		this.memberHeadImg=memberHeadImg;
	}
	public String getMemberHeadImg(){
		return this.memberHeadImg;
	}
}