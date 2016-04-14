package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelReadMoneyRecord extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelReadMoneyRecord(){
	}
	public AnzhiNovelReadMoneyRecord setValues(Object[] obj) {
		AnzhiNovelReadMoneyRecord model=new AnzhiNovelReadMoneyRecord();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setReadMoney(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setVote(obj[3]==null?"":obj[3].toString());
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setMemberNo(obj[6]==null?"":obj[6].toString());
		model.setMemberNick(obj[7]==null?"":obj[7].toString());
		model.setMemberHeadImg(obj[8]==null?"":obj[8].toString());
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
	private Integer readMoney;
	public void setReadMoney(Integer readMoney){
		this.readMoney=readMoney;
	}
	public Integer getReadMoney(){
		return this.readMoney;
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

	private String memberNo;
	public void setMemberNo(String memberNo){
		this.memberNo=memberNo;
	}
	public String getMemberNo(){
		return this.memberNo;
	}
	private String menberPassword;
	public void setMenberPassword(String menberPassword){
		this.menberPassword=menberPassword;
	}
	public String getMenberPassword(){
		return this.menberPassword;
	}
	private String memberNick;
	public void setMemberNick(String memberNick){
		this.memberNick=memberNick;
	}
	public String getMemberNick(){
		return this.memberNick;
	}
	private String memberHeadImg;
	public void setMemberHeadImg(String memberHeadImg){
		this.memberHeadImg=memberHeadImg;
	}
	public String getMemberHeadImg(){
		if(memberHeadImg==null||memberHeadImg.equals("")){
			memberHeadImg="./images/defaultHead.png";
		}
		return this.memberHeadImg;
	}
}