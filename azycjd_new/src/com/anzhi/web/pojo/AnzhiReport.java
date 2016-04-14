package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiReport extends FatherPojo implements java.io.Serializable {
	public AnzhiReport(){
	}
	public AnzhiReport setValues(Object[] obj) {
		AnzhiReport model=new AnzhiReport();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setTableId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setTableType(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setReportReason(obj[3]==null?"":obj[3].toString());
		model.setReportVote(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setAddMemberId(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		
		model.setNovelTitle(obj[8]==null?"":obj[8].toString());
		model.setMemberNo(obj[9]==null?"":obj[9].toString());
		model.setMemberNick(obj[10]==null?"":obj[10].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
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
	private String reportReason;
	public void setReportReason(String reportReason){
		this.reportReason=reportReason;
	}
	public String getReportReason(){
		return this.reportReason;
	}
	private String reportVote;
	
	public String getReportVote() {
		return reportVote;
	}
	public void setReportVote(String reportVote) {
		this.reportVote = reportVote;
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
	private Integer addMemberId;
	public void setAddMemberId(Integer addMemberId){
		this.addMemberId=addMemberId;
	}
	public Integer getAddMemberId(){
		return this.addMemberId;
	}

	private String novelTitle;
	private String memberNo;
	private String memberNick;
	public String getNovelTitle() {
		return novelTitle;
	}
	public void setNovelTitle(String novelTitle) {
		this.novelTitle = novelTitle;
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
	
}