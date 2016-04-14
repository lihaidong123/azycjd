package com.anzhi.web.pojo;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelReward extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelReward(){
	}
	public AnzhiNovelReward setValues(Object[] obj) {
		AnzhiNovelReward model=new AnzhiNovelReward();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setChapterId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setMemberId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setRewardType(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setRewardNum(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setRewardAnzhiMoney(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setState(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setAddTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		model.setVote(obj[9]==null?"":obj[9].toString());
		model.setMemberNo(obj[10]==null?"":obj[10].toString());
		model.setMemberNick(obj[11]==null?"":obj[11].toString());
		model.setMemberHeadImg(obj[12]==null?"":obj[12].toString());
		return model;
	}
	private String memberNo;
	private String memberNick;
	private String memberHeadImg;
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
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
	private Integer rewardType;
	public void setRewardType(Integer rewardType){
		this.rewardType=rewardType;
	}
	public Integer getRewardType(){
		return this.rewardType;
	}
	private Integer rewardNum;
	public void setRewardNum(Integer rewardNum){
		this.rewardNum=rewardNum;
	}
	public Integer getRewardNum(){
		return this.rewardNum;
	}
	private Integer rewardAnzhiMoney;
	public void setRewardAnzhiMoney(Integer rewardAnzhiMoney){
		this.rewardAnzhiMoney=rewardAnzhiMoney;
	}
	public Integer getRewardAnzhiMoney(){
		return this.rewardAnzhiMoney;
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
	private String vote;

	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	
}