package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiIllegalChar extends FatherPojo implements java.io.Serializable {
	public AnzhiIllegalChar(){
	}
	public AnzhiIllegalChar setValues(Object[] obj) {
		AnzhiIllegalChar model=new AnzhiIllegalChar();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setCharName(obj[1]==null?"":obj[1].toString());
		model.setCharVote(obj[2]==null?"":obj[2].toString());
		model.setState(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setAddMemberId(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String charName;
	public void setCharName(String charName){
		this.charName=charName;
	}
	public String getCharName(){
		return this.charName;
	}
	private String charVote;
	public void setCharVote(String charVote){
		this.charVote=charVote;
	}
	public String getCharVote(){
		return this.charVote;
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