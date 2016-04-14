package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiFenJuan extends FatherPojo implements java.io.Serializable {
	public AnzhiFenJuan(){
	}
	public AnzhiFenJuan setValues(Object[] obj) {
		AnzhiFenJuan model=new AnzhiFenJuan();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setJuanName(obj[2]==null?"":obj[2].toString());
		model.setJuanVote(obj[3]==null?"":obj[3].toString());
		model.setAddTime(obj[4]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[4]));
		return model;
	}
	private List<AnzhiChapter> ls;
	public List<AnzhiChapter> getLs() {
		return ls;
	}
	public void setLs(List<AnzhiChapter> ls) {
		this.ls = ls;
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
	private String juanName;
	public void setJuanName(String juanName){
		this.juanName=juanName;
	}
	public String getJuanName(){
		return this.juanName;
	}
	private String juanVote;
	public void setJuanVote(String juanVote){
		this.juanVote=juanVote;
	}
	public String getJuanVote(){
		return this.juanVote;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}