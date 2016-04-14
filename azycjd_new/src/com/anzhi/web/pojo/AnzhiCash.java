package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiCash extends FatherPojo implements java.io.Serializable {
	public AnzhiCash(){
	}
	public AnzhiCash setValues(Object[] obj) {
		AnzhiCash model=new AnzhiCash();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setAnzhiMoneyRemaining(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setAnzhiMoneyCash(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setCashMoney(obj[4]==null?null:Double.parseDouble(obj[4].toString()));
		model.setVote(obj[5]==null?"":obj[5].toString());
		model.setState(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setMemberNick(obj[8]==null?"":obj[8].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer anzhiMoneyRemaining;
	public void setAnzhiMoneyRemaining(Integer anzhiMoneyRemaining){
		this.anzhiMoneyRemaining=anzhiMoneyRemaining;
	}
	public Integer getAnzhiMoneyRemaining(){
		return this.anzhiMoneyRemaining;
	}
	private Integer anzhiMoneyCash;
	public void setAnzhiMoneyCash(Integer anzhiMoneyCash){
		this.anzhiMoneyCash=anzhiMoneyCash;
	}
	public Integer getAnzhiMoneyCash(){
		return this.anzhiMoneyCash;
	}
	private Double cashMoney;
	public void setCashMoney(Double cashMoney){
		this.cashMoney=cashMoney;
	}
	public Double getCashMoney(){
		return this.cashMoney;
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
	
	private String memberNick;
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	

}