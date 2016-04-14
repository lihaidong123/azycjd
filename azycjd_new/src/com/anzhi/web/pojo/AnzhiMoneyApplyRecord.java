package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiMoneyApplyRecord extends FatherPojo implements java.io.Serializable {
	public AnzhiMoneyApplyRecord(){
	}
	public AnzhiMoneyApplyRecord setValues(Object[] obj) {
		AnzhiMoneyApplyRecord model=new AnzhiMoneyApplyRecord();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setChongMoney(obj[2]==null?null:Double.parseDouble(obj[2].toString()));
		model.setOrderNo(obj[3]==null?"":obj[3].toString());
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
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
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Double chongMoney;
	public void setChongMoney(Double chongMoney){
		this.chongMoney=chongMoney;
	}
	public Double getChongMoney(){
		return this.chongMoney;
	}
	private String orderNo;
	public void setOrderNo(String orderNo){
		this.orderNo=orderNo;
	}
	public String getOrderNo(){
		return this.orderNo;
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