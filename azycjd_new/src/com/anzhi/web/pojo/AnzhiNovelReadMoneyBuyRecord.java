package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelReadMoneyBuyRecord extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelReadMoneyBuyRecord(){
	}
	public AnzhiNovelReadMoneyBuyRecord setValues(Object[] obj) {
		AnzhiNovelReadMoneyBuyRecord model=new AnzhiNovelReadMoneyBuyRecord();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setChapterId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setUserMoney(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setBeforeReadMoney(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAfterReadMoney(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setVote(obj[6]==null?"":obj[6].toString());
		model.setState(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setAddTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
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
	private Integer userMoney;
	public void setUserMoney(Integer userMoney){
		this.userMoney=userMoney;
	}
	public Integer getUserMoney(){
		return this.userMoney;
	}
	private Integer beforeReadMoney;
	public void setBeforeReadMoney(Integer beforeReadMoney){
		this.beforeReadMoney=beforeReadMoney;
	}
	public Integer getBeforeReadMoney(){
		return this.beforeReadMoney;
	}
	private Integer afterReadMoney;
	public void setAfterReadMoney(Integer afterReadMoney){
		this.afterReadMoney=afterReadMoney;
	}
	public Integer getAfterReadMoney(){
		return this.afterReadMoney;
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