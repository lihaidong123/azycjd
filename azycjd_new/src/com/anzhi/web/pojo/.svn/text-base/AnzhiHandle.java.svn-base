package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiHandle extends FatherPojo implements java.io.Serializable {
	public AnzhiHandle(){
	}
	public AnzhiHandle setValues(Object[] obj) {
		AnzhiHandle model=new AnzhiHandle();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setTableId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setHandleType(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setHandleVote(obj[3]==null?"":obj[3].toString());
		model.setHandleResult(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setAddMemberId(obj[7]==null?0:Integer.parseInt(obj[7].toString()));
		model.setMemberNo(obj[8]==null?"":obj[8].toString());
		model.setMemberNick(obj[9]==null?"":obj[9].toString());
		return model;
	}
	
	private List<AnzhiHandle> ls;
	
	public List<AnzhiHandle> getLs() {
		return ls;
	}
	public void setLs(List<AnzhiHandle> ls) {
		this.ls = ls;
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
	private Integer handleType;
	public void setHandleType(Integer handleType){
		this.handleType=handleType;
	}
	public Integer getHandleType(){
		return this.handleType;
	}
	private String handleVote;
	public void setHandleVote(String handleVote){
		this.handleVote=handleVote;
	}
	public String getHandleVote(){
		return this.handleVote;
	}
	private Integer handleResult;
	public void setHandleResult(Integer handleResult){
		this.handleResult=handleResult;
	}
	public Integer getHandleResult(){
		return this.handleResult;
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
	
	
	public Integer getAddMemberId() {
		return addMemberId;
	}
	public void setAddMemberId(Integer addMemberId) {
		this.addMemberId = addMemberId;
	}
	private String memberNo;
	private String memberNick;
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