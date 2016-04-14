package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiRecharge extends FatherPojo implements java.io.Serializable {
	public AnzhiRecharge(){
	}
	public AnzhiRecharge setValues(Object[] obj) {
		AnzhiRecharge model=new AnzhiRecharge();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setRechargeMoney(obj[2]==null?null:Double.parseDouble(obj[2].toString()));
		model.setRechargeAnzhiMoney(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setBeforeBalance(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAfterBalance(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setVote(obj[7]==null?"":obj[7].toString());
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
	private Double rechargeMoney;
	public void setRechargeMoney(Double rechargeMoney){
		this.rechargeMoney=rechargeMoney;
	}
	public Double getRechargeMoney(){
		return this.rechargeMoney;
	}
	private Integer rechargeAnzhiMoney;
	public void setRechargeAnzhiMoney(Integer rechargeAnzhiMoney){
		this.rechargeAnzhiMoney=rechargeAnzhiMoney;
	}
	public Integer getRechargeAnzhiMoney(){
		return this.rechargeAnzhiMoney;
	}
	private Integer beforeBalance;
	public void setBeforeBalance(Integer beforeBalance){
		this.beforeBalance=beforeBalance;
	}
	public Integer getBeforeBalance(){
		return this.beforeBalance;
	}
	private Integer afterBalance;
	public void setAfterBalance(Integer afterBalance){
		this.afterBalance=afterBalance;
	}
	public Integer getAfterBalance(){
		return this.afterBalance;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	
	private String memberNick;
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
}