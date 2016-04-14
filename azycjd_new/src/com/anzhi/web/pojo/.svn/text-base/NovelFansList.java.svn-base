package com.anzhi.web.pojo;

import com.anzhi.web.util.FatherPojo;

public class NovelFansList extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 该类用于小说基本信息界面，粉丝排行
	 */
	public NovelFansList(){
	}
	public NovelFansList setValues(Object[] obj) {
		NovelFansList model=new NovelFansList();
		model.setMemberId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberNick(obj[1]==null?"":obj[1].toString());
		model.setTotalMoney(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		return model;
	}
	private int memberId;
	private String memberNick;
	private int totalMoney;
	private String levelName;
	
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	
}
