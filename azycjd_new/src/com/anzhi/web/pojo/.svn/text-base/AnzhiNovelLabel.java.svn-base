package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelLabel extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelLabel(){
	}
	public AnzhiNovelLabel setValues(Object[] obj) {
		AnzhiNovelLabel model=new AnzhiNovelLabel();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setLabelName(obj[1]==null?"":obj[1].toString());
		model.setFatherId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setVote(obj[3]==null?"":obj[3].toString());
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		return model;
	}
	private List<AnzhiNovelLabel> childRenLs;
	
	public List<AnzhiNovelLabel> getChildRenLs() {
		return childRenLs;
	}
	public void setChildRenLs(List<AnzhiNovelLabel> childRenLs) {
		this.childRenLs = childRenLs;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String labelName;
	public void setLabelName(String labelName){
		this.labelName=labelName;
	}
	public String getLabelName(){
		return this.labelName;
	}
	private Integer fatherId;
	public void setFatherId(Integer fatherId){
		this.fatherId=fatherId;
	}
	public Integer getFatherId(){
		return this.fatherId;
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
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}