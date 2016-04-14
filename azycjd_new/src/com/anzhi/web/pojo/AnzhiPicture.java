package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiPicture extends FatherPojo implements java.io.Serializable {
	public AnzhiPicture(){
	}
	public AnzhiPicture setValues(Object[] obj) {
		AnzhiPicture model=new AnzhiPicture();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setPictureName(obj[1]==null?"":obj[1].toString());
		model.setPictureUrl(obj[2]==null?"":obj[2].toString());
		model.setPictureVote(obj[3]==null?"":obj[3].toString());
		model.setPictureType(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
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
	private String pictureName;
	public void setPictureName(String pictureName){
		this.pictureName=pictureName;
	}
	public String getPictureName(){
		return this.pictureName;
	}
	private String pictureUrl;
	public void setPictureUrl(String pictureUrl){
		this.pictureUrl=pictureUrl;
	}
	public String getPictureUrl(){
		return this.pictureUrl;
	}
	private String pictureVote;
	public void setPictureVote(String pictureVote){
		this.pictureVote=pictureVote;
	}
	public String getPictureVote(){
		return this.pictureVote;
	}
	private Integer pictureType;
	public void setPictureType(Integer pictureType){
		this.pictureType=pictureType;
	}
	public Integer getPictureType(){
		return this.pictureType;
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