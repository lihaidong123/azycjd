package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiTrendReply extends FatherPojo implements java.io.Serializable {
	public AnzhiTrendReply(){
	}
	public AnzhiTrendReply setValues(Object[] obj) {
		AnzhiTrendReply model=new AnzhiTrendReply();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setTrendId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setReplyContent(obj[3]==null?"":obj[3].toString());
		model.setFatherId(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setState(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
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
	private Integer trendId;
	public void setTrendId(Integer trendId){
		this.trendId=trendId;
	}
	public Integer getTrendId(){
		return this.trendId;
	}
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private String replyContent;
	public void setReplyContent(String replyContent){
		this.replyContent=replyContent;
	}
	public String getReplyContent(){
		return repString(this.replyContent);
	}
	private Integer fatherId;
	public void setFatherId(Integer fatherId){
		this.fatherId=fatherId;
	}
	public Integer getFatherId(){
		return this.fatherId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
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
		return this.memberHeadImg;
	}
}