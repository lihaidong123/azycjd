package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelType extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelType(){
	}
	public AnzhiNovelType setValues(Object[] obj) {
		AnzhiNovelType model=new AnzhiNovelType();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setBigType(obj[2]==null?"":obj[2].toString());
		model.setSmallType(obj[3]==null?"":obj[3].toString());
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
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
	}
	private String bigType;
	public void setBigType(String bigType){
		this.bigType=bigType;
	}
	public String getBigType(){
		return this.bigType;
	}
	private String smallType;
	public void setSmallType(String smallType){
		this.smallType=smallType;
	}
	public String getSmallType(){
		return this.smallType;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}