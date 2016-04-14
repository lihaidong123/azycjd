package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiMessage extends FatherPojo implements java.io.Serializable {
	public AnzhiMessage(){
	}
	public AnzhiMessage setValues(Object[] obj) {
		AnzhiMessage model=new AnzhiMessage();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberIdReceive(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberIdSend(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setMessageTitle(obj[3]==null?"":obj[3].toString());
		model.setMessageContent(obj[4]==null?"":obj[4].toString());
		model.setMessageType(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setMessageRead(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setVote(obj[8]==null?"":obj[8].toString());
		model.setMemberNo(obj[9]==null?"":obj[9].toString());
		model.setMemberNick(obj[10]==null?"":obj[10].toString());
		model.setSendMemberNo(obj[11]==null?"":obj[11].toString());
		model.setSendMemberNick(obj[12]==null?"":obj[12].toString());
		return model;
	}
	private String memberNo;
	private String memberNick;
	private String sendMemberNo;
	private String sendMemberNick;
	
	public String getSendMemberNo() {
		return sendMemberNo;
	}
	public void setSendMemberNo(String sendMemberNo) {
		this.sendMemberNo = sendMemberNo;
	}
	public String getSendMemberNick() {
		return sendMemberNick;
	}
	public void setSendMemberNick(String sendMemberNick) {
		this.sendMemberNick = sendMemberNick;
	}
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
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer memberIdReceive;
	public void setMemberIdReceive(Integer memberIdReceive){
		this.memberIdReceive=memberIdReceive;
	}
	public Integer getMemberIdReceive(){
		return this.memberIdReceive;
	}
	private Integer memberIdSend;
	public void setMemberIdSend(Integer memberIdSend){
		this.memberIdSend=memberIdSend;
	}
	public Integer getMemberIdSend(){
		return this.memberIdSend;
	}
	private String messageTitle;
	public void setMessageTitle(String messageTitle){
		this.messageTitle=messageTitle;
	}
	public String getMessageTitle(){
		return this.messageTitle;
	}
	private String messageContent;
	public void setMessageContent(String messageContent){
		this.messageContent=messageContent;
	}
	public String getMessageContent(){
		return repString(this.messageContent);
	}
	private Integer messageType;
	public void setMessageType(Integer messageType){
		this.messageType=messageType;
	}
	public Integer getMessageType(){
		return this.messageType;
	}
	private Integer messageRead;
	public void setMessageRead(Integer messageRead){
		this.messageRead=messageRead;
	}
	public Integer getMessageRead(){
		return this.messageRead;
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

}