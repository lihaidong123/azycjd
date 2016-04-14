package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiSystem extends FatherPojo implements java.io.Serializable {
	public AnzhiSystem(){
	}
	public AnzhiSystem setValues(Object[] obj) {
		AnzhiSystem model=new AnzhiSystem();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setAboutUs(obj[1]==null?"":obj[1].toString());
		model.setUserGuide(obj[2]==null?"":obj[2].toString());
		model.setAuthorProject(obj[3]==null?"":obj[3].toString());
		model.setTalentsWanted(obj[4]==null?"":obj[4].toString());
		model.setTouchUs(obj[5]==null?"":obj[5].toString());
		model.setChannelsCooperation(obj[6]==null?"":obj[6].toString());
		model.setEditArea(obj[7]==null?"":obj[7].toString());
		model.setCopyrightProtection(obj[8]==null?"":obj[8].toString());
		model.setVote(obj[9]==null?"":obj[9].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String aboutUs;
	public void setAboutUs(String aboutUs){
		this.aboutUs=aboutUs;
	}
	public String getAboutUs(){
		return this.aboutUs;
	}
	private String userGuide;
	public void setUserGuide(String userGuide){
		this.userGuide=userGuide;
	}
	public String getUserGuide(){
		return this.userGuide;
	}
	private String authorProject;
	public void setAuthorProject(String authorProject){
		this.authorProject=authorProject;
	}
	public String getAuthorProject(){
		return this.authorProject;
	}
	private String talentsWanted;
	public void setTalentsWanted(String talentsWanted){
		this.talentsWanted=talentsWanted;
	}
	public String getTalentsWanted(){
		return this.talentsWanted;
	}
	private String touchUs;
	public void setTouchUs(String touchUs){
		this.touchUs=touchUs;
	}
	public String getTouchUs(){
		return this.touchUs;
	}
	private String channelsCooperation;
	public void setChannelsCooperation(String channelsCooperation){
		this.channelsCooperation=channelsCooperation;
	}
	public String getChannelsCooperation(){
		return this.channelsCooperation;
	}
	private String editArea;
	public void setEditArea(String editArea){
		this.editArea=editArea;
	}
	public String getEditArea(){
		return this.editArea;
	}
	private String copyrightProtection;
	public void setCopyrightProtection(String copyrightProtection){
		this.copyrightProtection=copyrightProtection;
	}
	public String getCopyrightProtection(){
		return this.copyrightProtection;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}

}