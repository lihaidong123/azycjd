package com.anzhi.web.pojo;

import java.io.File;

import com.anzhi.web.util.FatherPojo;

public class CommentPraise extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	public CommentPraise(){
	}
	public CommentPraise setValues(Object[] obj) {
		CommentPraise model=new CommentPraise();
		model.setMemberId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberNick(obj[1]==null?"":obj[1].toString());
		model.setMemberHeadImg(obj[2]==null?"":obj[2].toString());
		model.setNovelId(0);
		model.setPraiseNum(0);
		return model;
	}
	private static final long serialVersionUID = 1L;
	private int memberId;
	private int novelId;
	private int praiseNum;
	private String memberNick;
	private String memberHeadImg;
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getNovelId() {
		return novelId;
	}
	public void setNovelId(int novelId) {
		this.novelId = novelId;
	}
	public int getPraiseNum() {
		return praiseNum;
	}
	public void setPraiseNum(int praiseNum) {
		this.praiseNum = praiseNum;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberHeadImg() {
		return memberHeadImg;
	}
	public void setMemberHeadImg(String memberHeadImg) {
		this.memberHeadImg = this.setMemberHeadImgFather(memberHeadImg);
	}
	
}
