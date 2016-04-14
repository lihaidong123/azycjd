package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiInteractive extends FatherPojo implements java.io.Serializable {
	public AnzhiInteractive(){
	}
	public AnzhiInteractive setValues(Object[] obj) {
		AnzhiInteractive model=new AnzhiInteractive();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setInteractiveTitle(obj[2]==null?"":obj[2].toString());
		model.setInteractiveContent(obj[3]==null?"":obj[3].toString());
		model.setInteractiveType(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setReplyContent(obj[5]==null?"":obj[5].toString());
		model.setReplyTitle(obj[6]==null?"":obj[6].toString());
		model.setReplyMemberId(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setReplyTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		model.setState(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setAddTime(obj[10]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[10]));
		model.setMemberNick(obj[11]==null?"":obj[11].toString());
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
	private String interactiveTitle;
	public void setInteractiveTitle(String interactiveTitle){
		this.interactiveTitle=interactiveTitle;
	}
	public String getInteractiveTitle(){
		return this.interactiveTitle;
	}
	private String interactiveContent;
	public void setInteractiveContent(String interactiveContent){
		this.interactiveContent=interactiveContent;
	}
	public String getInteractiveContent(){
		return this.interactiveContent;
	}
	private Integer interactiveType;
	public void setInteractiveType(Integer interactiveType){
		this.interactiveType=interactiveType;
	}
	public Integer getInteractiveType(){
		return this.interactiveType;
	}
	private String replyContent;
	public void setReplyContent(String replyContent){
		this.replyContent=replyContent;
	}
	public String getReplyContent(){
		return this.replyContent;
	}
	private String replyTitle;
	public void setReplyTitle(String replyTitle){
		this.replyTitle=replyTitle;
	}
	public String getReplyTitle(){
		return this.replyTitle;
	}
	private Integer replyMemberId;
	public void setReplyMemberId(Integer replyMemberId){
		this.replyMemberId=replyMemberId;
	}
	public Integer getReplyMemberId(){
		return this.replyMemberId;
	}
	private Timestamp replyTime;
	public void setReplyTime(Timestamp replyTime){
		this.replyTime=replyTime;
	}
	public Timestamp getReplyTime(){
		return this.replyTime;
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