package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiChapterSubscribe extends FatherPojo implements java.io.Serializable {
	public AnzhiChapterSubscribe(){
	}
	public AnzhiChapterSubscribe setValues(Object[] obj) {
		AnzhiChapterSubscribe model=new AnzhiChapterSubscribe();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setChapterId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setAddTime(obj[3]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[3]));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setVote(obj[5]==null?"":obj[5].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer chapterId;
	public void setChapterId(Integer chapterId){
		this.chapterId=chapterId;
	}
	public Integer getChapterId(){
		return this.chapterId;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
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

}