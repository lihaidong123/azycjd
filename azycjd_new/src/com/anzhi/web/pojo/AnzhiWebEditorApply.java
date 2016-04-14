package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorApply extends FatherPojo implements java.io.Serializable {
	public AnzhiWebEditorApply(){
	}
	public AnzhiWebEditorApply setValues(Object[] obj) {
		AnzhiWebEditorApply model=new AnzhiWebEditorApply();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setXingming(obj[2]==null?"":obj[2].toString());
		model.setXingbie(obj[3]==null?"":obj[3].toString());
		model.setBianjiming(obj[4]==null?"":obj[4].toString());
		model.setQq(obj[5]==null?"":obj[5].toString());
		model.setTel(obj[6]==null?"":obj[6].toString());
		model.setBirthdays(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setShengfenzhenghao(obj[8]==null?"":obj[8].toString());
		model.setZhiye(obj[9]==null?"":obj[9].toString());
		model.setVote(obj[10]==null?"":obj[10].toString());
		model.setEditorVote(obj[11]==null?"":obj[11].toString());
		model.setState(obj[12]==null?0:Integer.parseInt(obj[12].toString()));
		model.setAddTime(obj[13]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[13]));
		
		model.setMemberNo(obj[14]==null?"":obj[14].toString());
		model.setMenberPassword(obj[15]==null?"":obj[15].toString());
		model.setMemberNick(obj[16]==null?"":obj[16].toString());
		model.setMemberHeadImg(obj[17]==null?"":obj[17].toString());
		model.setMemberQq(obj[18]==null?"":obj[18].toString());
		model.setMemberSex(obj[19]==null?"":obj[19].toString());
		model.setMemberAddress(obj[20]==null?"":obj[20].toString());
		model.setMemberBirthday(obj[21]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[21]));
		model.setMemberEmail(obj[22]==null?"":obj[22].toString());
		model.setIsAccptMessage(obj[23]==null?0:Integer.parseInt(obj[23].toString()));
		model.setBookshelfPublic(obj[24]==null?0:Integer.parseInt(obj[24].toString()));
		model.setMemberRealName(obj[25]==null?"":obj[25].toString());
		model.setMemberCode(obj[26]==null?"":obj[26].toString());
		model.setMemberTel(obj[27]==null?"":obj[27].toString());
		model.setMemberExperience(obj[28]==null?0:Integer.parseInt(obj[28].toString()));
		model.setMemberType(obj[29]==null?0:Integer.parseInt(obj[29].toString()));
		model.setMemberMoney(obj[30]==null?0:Integer.parseInt(obj[30].toString()));
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
	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	private String xingming;
	public void setXingming(String xingming){
		this.xingming=xingming;
	}
	public String getXingming(){
		return this.xingming;
	}
	private String xingbie;
	public void setXingbie(String xingbie){
		this.xingbie=xingbie;
	}
	public String getXingbie(){
		return this.xingbie;
	}
	private String bianjiming;
	public void setBianjiming(String bianjiming){
		this.bianjiming=bianjiming;
	}
	public String getBianjiming(){
		return this.bianjiming;
	}
	private String qq;
	public void setQq(String qq){
		this.qq=qq;
	}
	public String getQq(){
		return this.qq;
	}
	private String tel;
	public void setTel(String tel){
		this.tel=tel;
	}
	public String getTel(){
		return this.tel;
	}
	private Timestamp birthdays;
	public void setBirthdays(Timestamp birthdays){
		this.birthdays=birthdays;
	}
	public Timestamp getBirthdays(){
		return this.birthdays;
	}
	private String shengfenzhenghao;
	public void setShengfenzhenghao(String shengfenzhenghao){
		this.shengfenzhenghao=shengfenzhenghao;
	}
	public String getShengfenzhenghao(){
		return this.shengfenzhenghao;
	}
	private String zhiye;
	public void setZhiye(String zhiye){
		this.zhiye=zhiye;
	}
	public String getZhiye(){
		return this.zhiye;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	private String editorVote;
	public void setEditorVote(String editorVote){
		this.editorVote=editorVote;
	}
	public String getEditorVote(){
		return this.editorVote;
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
	private String memberQq;
	public void setMemberQq(String memberQq){
		this.memberQq=memberQq;
	}
	public String getMemberQq(){
		return this.memberQq;
	}
	private String memberSex;
	public void setMemberSex(String memberSex){
		this.memberSex=memberSex;
	}
	public String getMemberSex(){
		return this.memberSex;
	}
	private String memberAddress;
	public void setMemberAddress(String memberAddress){
		this.memberAddress=memberAddress;
	}
	public String getMemberAddress(){
		return this.memberAddress;
	}

	private Timestamp memberBirthday;
	public void setMemberBirthday(Timestamp memberBirthday){
		this.memberBirthday=memberBirthday;
	}
	public Timestamp getMemberBirthday(){
		return this.memberBirthday;
	}
	private String memberEmail;
	public void setMemberEmail(String memberEmail){
		this.memberEmail=memberEmail;
	}
	public String getMemberEmail(){
		return this.memberEmail;
	}

	private Integer isAccptMessage;
	public void setIsAccptMessage(Integer isAccptMessage){
		this.isAccptMessage=isAccptMessage;
	}
	public Integer getIsAccptMessage(){
		return this.isAccptMessage;
	}
	private Integer bookshelfPublic;
	public void setBookshelfPublic(Integer bookshelfPublic){
		this.bookshelfPublic=bookshelfPublic;
	}
	public Integer getBookshelfPublic(){
		return this.bookshelfPublic;
	}
	private String memberRealName;
	public void setMemberRealName(String memberRealName){
		this.memberRealName=memberRealName;
	}
	public String getMemberRealName(){
		return this.memberRealName;
	}
	private String memberCode;
	public void setMemberCode(String memberCode){
		this.memberCode=memberCode;
	}
	public String getMemberCode(){
		return this.memberCode;
	}
	private String memberTel;
	public void setMemberTel(String memberTel){
		this.memberTel=memberTel;
	}
	public String getMemberTel(){
		return this.memberTel;
	}
	private Integer memberExperience;
	public void setMemberExperience(Integer memberExperience){
		this.memberExperience=memberExperience;
	}
	public Integer getMemberExperience(){
		return this.memberExperience;
	}
	private Integer memberType;
	public void setMemberType(Integer memberType){
		this.memberType=memberType;
	}
	public Integer getMemberType(){
		return this.memberType;
	}
	private Integer memberMoney;
	public void setMemberMoney(Integer memberMoney){
		this.memberMoney=memberMoney;
	}
	public Integer getMemberMoney(){
		return this.memberMoney;
	}
}