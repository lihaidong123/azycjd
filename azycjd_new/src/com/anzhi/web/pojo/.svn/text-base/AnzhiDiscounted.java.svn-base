package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiDiscounted extends FatherPojo implements java.io.Serializable {
	public AnzhiDiscounted(){
	}
	public AnzhiDiscounted setValues(Object[] obj) {
		AnzhiDiscounted model=new AnzhiDiscounted();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setDiscountedType(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setDiscountedEndDate(obj[3]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[3]));
		model.setDiscountedRebate(obj[4]==null?null:Double.parseDouble(obj[4].toString()));
		model.setVote(obj[5]==null?"":obj[5].toString());
		model.setState(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setAddMemberId(obj[8]==null?0:Integer.parseInt(obj[8].toString()));
		model.setNovelTitle(obj[9]==null?"":obj[9].toString());
		model.setAuthorwritername(obj[10]==null?"":obj[10].toString());
		return model;
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
	private Integer discountedType;
	public void setDiscountedType(Integer discountedType){
		this.discountedType=discountedType;
	}
	public Integer getDiscountedType(){
		return this.discountedType;
	}
	private Timestamp discountedEndDate;
	public void setDiscountedEndDate(Timestamp discountedEndDate){
		this.discountedEndDate=discountedEndDate;
	}
	public Timestamp getDiscountedEndDate(){
		return this.discountedEndDate;
	}
	private Double discountedRebate;
	public void setDiscountedRebate(Double discountedRebate){
		this.discountedRebate=discountedRebate;
	}
	public Double getDiscountedRebate(){
		return this.discountedRebate;
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
	private Integer addMemberId;
	public void setAddMemberId(Integer addMemberId){
		this.addMemberId=addMemberId;
	}
	public Integer getAddMemberId(){
		return this.addMemberId;
	}
	//优惠位置名称
	private String discountedTypeName;
	public String getDiscountedTypeName() {
		return discountedTypeName;
	}
	public void setDiscountedTypeName(String discountedTypeName) {
		this.discountedTypeName = discountedTypeName;
	}
	
	private String novelTitle;
	public String getNovelTitle() {
		return novelTitle;
	}
	public void setNovelTitle(String novelTitle) {
		this.novelTitle = novelTitle;
	}
	
	private String authorwritername;
	public String getAuthorwritername() {
		return authorwritername;
	}
	public void setAuthorwritername(String authorwritername) {
		this.authorwritername = authorwritername;
	}
}