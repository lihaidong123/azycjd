package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiTrend extends FatherPojo implements java.io.Serializable {
	public AnzhiTrend(){
	}
	public AnzhiTrend setValues(Object[] obj) {
		AnzhiTrend model=new AnzhiTrend();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setTrendContent(obj[2]==null?"":obj[2].toString());
		model.setVote(obj[3]==null?"":obj[3].toString());
		model.setAddTime(obj[4]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[4]));
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setMemberNick(obj[6]==null?"":obj[6].toString());
		model.setMemberHeadImg(obj[7]==null?"":obj[7].toString());
		return model;
	}
	/**
	 * 读取该动态下的所有回复
	 */
	private List<AnzhiTrendReply> ls;
	public List<AnzhiTrendReply> getLs() {
		return ls;
	}
	public void setLs(List<AnzhiTrendReply> ls) {
		this.ls = ls;
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
	private String trendContent;
	public void setTrendContent(String trendContent){
		this.trendContent=trendContent;
	}
	public String getTrendContent(){
		return repString(this.trendContent);
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
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