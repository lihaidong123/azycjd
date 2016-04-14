package com.anzhi.web.pojo;
import java.sql.Timestamp;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiConsume extends FatherPojo implements java.io.Serializable {
	public AnzhiConsume(){
	}
	public AnzhiConsume setValues(Object[] obj) {
		AnzhiConsume model=new AnzhiConsume();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setConsumeAnzhiMoney(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setTableId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setTableType(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setConsumeType(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setConsumeTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setConsumeBeforeMoney(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setConsumeAfterMoney(obj[8]==null?0:Integer.parseInt(obj[8].toString()));
		model.setVote(obj[9]==null?"":obj[9].toString());
		model.setNovelTitle(obj[10]==null?"":obj[10].toString());
		model.setAuthorId(obj[11]==null?0:Integer.parseInt(obj[11].toString()));
		model.setMemberNick(obj[12]==null?"":obj[12].toString());
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
	private Integer consumeAnzhiMoney;
	public void setConsumeAnzhiMoney(Integer consumeAnzhiMoney){
		this.consumeAnzhiMoney=consumeAnzhiMoney;
	}
	public Integer getConsumeAnzhiMoney(){
		return this.consumeAnzhiMoney;
	}
	private Integer tableId;
	public void setTableId(Integer tableId){
		this.tableId=tableId;
	}
	public Integer getTableId(){
		return this.tableId;
	}
	private Integer tableType;
	public void setTableType(Integer tableType){
		this.tableType=tableType;
	}
	public Integer getTableType(){
		return this.tableType;
	}
	private Integer consumeType;
	public void setConsumeType(Integer consumeType){
		this.consumeType=consumeType;
	}
	public Integer getConsumeType(){
		return this.consumeType;
	}
	private Timestamp consumeTime;
	public void setConsumeTime(Timestamp consumeTime){
		this.consumeTime=consumeTime;
	}
	public Timestamp getConsumeTime(){
		return this.consumeTime;
	}
	private Integer consumeBeforeMoney;
	public void setConsumeBeforeMoney(Integer consumeBeforeMoney){
		this.consumeBeforeMoney=consumeBeforeMoney;
	}
	public Integer getConsumeBeforeMoney(){
		return this.consumeBeforeMoney;
	}
	private Integer consumeAfterMoney;
	public void setConsumeAfterMoney(Integer consumeAfterMoney){
		this.consumeAfterMoney=consumeAfterMoney;
	}
	public Integer getConsumeAfterMoney(){
		return this.consumeAfterMoney;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}

	//本字段异步请求
	private String consumeName;
	public String getConsumeName() {
		return consumeName;
	}
	public void setConsumeName(String consumeName) {
		this.consumeName = consumeName;
	}
	
	private String novelTitle;
	public void setNovelTitle(String novelTitle){
		this.novelTitle=novelTitle;
	}
	public String getNovelTitle(){
		return this.novelTitle;
	}
	/*
	 * 异步加载收入金额
	 */
	private int novelMoney;
	public int getNovelMoney() {
		return novelMoney;
	}
	public void setNovelMoney(int novelMoney) {
		this.novelMoney = novelMoney;
	}
	
	private String memberNick;
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	
	private Integer authorId;
	public void setAuthorId(Integer authorId){
		this.authorId=authorId;
	}
	public Integer getAuthorId(){
		return this.authorId;
	}
	
	
}