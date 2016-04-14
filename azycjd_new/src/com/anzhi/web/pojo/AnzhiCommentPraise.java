package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiCommentPraise extends FatherPojo implements java.io.Serializable {
	public AnzhiCommentPraise(){
	}
	public AnzhiCommentPraise setValues(Object[] obj) {
		AnzhiCommentPraise model=new AnzhiCommentPraise();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setCommentId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setNovelId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setChapterId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setMemberId(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
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
	private Integer commentId;
	public void setCommentId(Integer commentId){
		this.commentId=commentId;
	}
	public Integer getCommentId(){
		return this.commentId;
	}
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
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