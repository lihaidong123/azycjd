package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

import ynzc.wuyuehu.ExcelAnnotation;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiBenefit extends FatherPojo implements java.io.Serializable {
	public AnzhiBenefit(){
	}
	public AnzhiBenefit setValues(Object[] obj) {
		AnzhiBenefit model=new AnzhiBenefit();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setApplyReason(obj[2]==null?"":obj[2].toString());
		model.setBenefitState(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setAddTime(obj[4]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[4]));
		model.setBenefitType(obj[5]==null?"":obj[5].toString());
		model.setVote(obj[6]==null?"":obj[6].toString());
		model.setNovelTitle(obj[7]==null?"":obj[7].toString());
		model.setAuthorWriterName(obj[8]==null?"":obj[8].toString());
		model.setAt(obj[9]==null?"":obj[9].toString());
		return model;
	}
	@ExcelAnnotation(name = "序号")
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	@ExcelAnnotation(name = "小说编号")
	private Integer novelId;
	public void setNovelId(Integer novelId){
		this.novelId=novelId;
	}
	public Integer getNovelId(){
		return this.novelId;
	}
	@ExcelAnnotation(name = "申请说明")
	private String applyReason;
	public void setApplyReason(String applyReason){
		this.applyReason=applyReason;
	}
	public String getApplyReason(){
		return this.applyReason;
	}
	@ExcelAnnotation(name = "状态")
	private Integer benefitState;
	public void setBenefitState(Integer benefitState){
		this.benefitState=benefitState;
	}
	public Integer getBenefitState(){
		return this.benefitState;
	}
	@ExcelAnnotation(name = "申请时间")
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	@ExcelAnnotation(name = "申请类型")
	private String benefitType;
	public void setBenefitType(String benefitType){
		this.benefitType=benefitType;
	}
	public String getBenefitType(){
		return this.benefitType;
	}
	@ExcelAnnotation(name = "备注说明")
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	//小说名称
	@ExcelAnnotation(name = "申请小说")
	private String novelTitle;
	public String getNovelTitle() {
		return novelTitle;
	}
	public void setNovelTitle(String novelTitle) {
		this.novelTitle = novelTitle;
	}
	
	//福利类型名称
	@ExcelAnnotation(name = "福利类型名称")
	private String benefitTypeName;
	public String getBenefitTypeName() {
		return benefitTypeName;
	}
	public void setBenefitTypeName(String benefitTypeName) {
		this.benefitTypeName = benefitTypeName;
	}
	@ExcelAnnotation(name = "申请作家")
	private String authorWriterName;


	public String getAuthorWriterName() {
		if(this.authorWriterName==null){
			this.authorWriterName="";
		}
		return authorWriterName;
	}
	public void setAuthorWriterName(String authorWriterName) {
		this.authorWriterName = authorWriterName;
	}
	
	@ExcelAnnotation(name = "申请作家")
	private String at;
	public String getAt() {
		return at;
	}
	public void setAt(String at) {
		this.at = at;
	}
	
}