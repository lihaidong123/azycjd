package com.anzhi.web.pojo;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiMember extends FatherPojo implements java.io.Serializable {
	public AnzhiMember(){
	}
	public AnzhiMember setValues(Object[] obj) {
		AnzhiMember model=new AnzhiMember();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberNo(obj[1]==null?"":obj[1].toString());
		model.setMenberPassword(obj[2]==null?"":obj[2].toString());
		model.setMemberNick(obj[3]==null?"":obj[3].toString());
		model.setMemberHeadImg(obj[4]==null?"":obj[4].toString());
		model.setMemberQq(obj[5]==null?"":obj[5].toString());
		model.setMemberSex(obj[6]==null?"":obj[6].toString());
		model.setMemberAddress(obj[7]==null?"":obj[7].toString());
		model.setAddTime(obj[8]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		model.setMemberBirthday(obj[9]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[9]));
		model.setMemberEmail(obj[10]==null?"":obj[10].toString());
		model.setVote(obj[11]==null?"":obj[11].toString());
		model.setIsAccptMessage(obj[12]==null?0:Integer.parseInt(obj[12].toString()));
		model.setBookshelfPublic(obj[13]==null?0:Integer.parseInt(obj[13].toString()));
		model.setMemberRealName(obj[14]==null?"":obj[14].toString());
		model.setMemberCode(obj[15]==null?"":obj[15].toString());
		model.setMemberTel(obj[16]==null?"":obj[16].toString());
		model.setMemberExperience(obj[17]==null?0:Integer.parseInt(obj[17].toString()));
		model.setMemberType(obj[18]==null?0:Integer.parseInt(obj[18].toString()));
		model.setMemberMoney(obj[19]==null?0:Integer.parseInt(obj[19].toString()));
		model.setState(obj[20]==null?0:Integer.parseInt(obj[20].toString()));
		model.setIsAddComment(obj[21]==null?0:Integer.parseInt(obj[21].toString()));
		model.setIsNoLogin(obj[22]==null?0:Integer.parseInt(obj[22].toString()));
		model.setReadMoney(obj[23]==null?0:Integer.parseInt(obj[23].toString()));
		return model;
	}
	
	/**
	 * 异步加载这些字段的值
	 */
	private int useAnzhiMonay;//记录该用户已经消费的安之币总和

	public int getUseAnzhiMonay() {
		return useAnzhiMonay;
	}
	public void setUseAnzhiMonay(int useAnzhiMonay) {
		this.useAnzhiMonay = useAnzhiMonay;
	}

	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
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
		this.memberHeadImg=this.setMemberHeadImgFather(memberHeadImg);
	}
	
	public void setHeadImg(String memberHeadImg){
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
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
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
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
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
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}
	private int isAddComment;
	private int isNoLogin;

	public int getIsAddComment() {
		return isAddComment;
	}
	public void setIsAddComment(int isAddComment) {
		this.isAddComment = isAddComment;
	}
	public int getIsNoLogin() {
		return isNoLogin;
	}
	public void setIsNoLogin(int isNoLogin) {
		this.isNoLogin = isNoLogin;
	}
	public Integer readMoney;

	public Integer getReadMoney() {
		return readMoney;
	}
	public void setReadMoney(Integer readMoney) {
		this.readMoney = readMoney;
	}
	private int isSignBook;

	public int getIsSignBook() {
		return isSignBook;
	}
	public void setIsSignBook(int isSignBook) {
		this.isSignBook = isSignBook;
	}
	
}