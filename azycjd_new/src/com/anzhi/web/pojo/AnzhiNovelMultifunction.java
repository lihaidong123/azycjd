package com.anzhi.web.pojo;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovelMultifunction extends FatherPojo implements java.io.Serializable {
	public AnzhiNovelMultifunction(){
	}
	public AnzhiNovelMultifunction setValues(Object[] obj) {
		AnzhiNovelMultifunction model=new AnzhiNovelMultifunction();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setActionType(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setVote(obj[6]==null?"":obj[6].toString());
		model.setNovelTitle(obj[7]==null?"":obj[7].toString());
		model.setUpdateTime(obj[8]==null?new Timestamp(new Date().getTime()):new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[8]));
		model.setTotalCharNum(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setAuthorWriterName(obj[10]==null?"":obj[10].toString());
		model.setMemberAuthorId(obj[11]==null?0:Integer.parseInt(obj[11].toString()));
		model.setNovelImg(obj[12]==null?"":obj[12].toString());
		model.setNovelSummary(obj[13]==null?"":obj[13].toString());
		model.setNovelType(obj[14]==null?"":obj[14].toString());
		model.setClickNum(obj[15]==null?0:Integer.parseInt(obj[15].toString()));
		model.setReadNum(obj[16]==null?0:Integer.parseInt(obj[16].toString()));
		return model;
	}
	
	//本字段异步请求
	private String newNovelName;
	
	public String getNewNovelName() {
		return newNovelName;
	}
	public void setNewNovelName(String newNovelName) {
		this.newNovelName = newNovelName;
	}
	//本字段异步请求
	private int newNovelchapterNum;

	public int getNewNovelchapterNum() {
		return newNovelchapterNum;
	}
	public void setNewNovelchapterNum(int newNovelchapterNum) {
		this.newNovelchapterNum = newNovelchapterNum;
	}
	
	//异步请求
	private List<AnzhiBookmark> anzhiBookmarkLs;
	
	
	public List<AnzhiBookmark> getAnzhiBookmarkLs() {
		return anzhiBookmarkLs;
	}
	public void setAnzhiBookmarkLs(List<AnzhiBookmark> anzhiBookmarkLs) {
		this.anzhiBookmarkLs = anzhiBookmarkLs;
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
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private Integer actionType;
	public void setActionType(Integer actionType){
		this.actionType=actionType;
	}
	public Integer getActionType(){
		return this.actionType;
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
	private String vote;
	
	public String getVote() {
		if(this.vote==null){
			this.vote="";
		}
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}

	private String novelTitle;
	public void setNovelTitle(String novelTitle){
		this.novelTitle=novelTitle;
	}
	public String getNovelTitle(){
		return this.novelTitle;
	}
	private Timestamp updateTime;
	public void setUpdateTime(Timestamp updateTime){
		this.updateTime=updateTime;
	}
	public Timestamp getUpdateTime(){
		return this.updateTime;
	}
	private int totalCharNum;//总字数
	public int getTotalCharNum() {
		return totalCharNum;
	}
	public void setTotalCharNum(int totalCharNum) {
		this.totalCharNum = totalCharNum;
	}
	private String authorWriterName;
	public void setAuthorWriterName(String authorWriterName){
		this.authorWriterName=authorWriterName;
	}
	public String getAuthorWriterName(){
		return this.authorWriterName;
	}
	private int memberAuthorId;

	public int getMemberAuthorId() {
		return memberAuthorId;
	}
	public void setMemberAuthorId(int memberAuthorId) {
		this.memberAuthorId = memberAuthorId;
	}
	private String novelImg;
	public void setNovelImg(String novelImg){
		if(novelImg!=null&&!novelImg.equals("")){
			if(novelImg.indexOf("UploadImages")!=-1){
				novelImg=projectName+""+novelImg;
			}else{
				String path=tomcatPath+novelImg;
				File f=new File(path);
				if(!f.exists()){ 
					novelImg=projectName+"/images/default_img.jpg";
				}
			}
		}else{
			novelImg=projectName+"/images/default_img.jpg";
		}
		this.novelImg=novelImg;
	}
	public String getNovelImg(){
		return this.novelImg;
	}
	private String novelSummary;
	public void setNovelSummary(String novelSummary){
		this.novelSummary=novelSummary;
	}
	public String getNovelSummary(){
		return this.novelSummary;
	}
	private String novelType;
	public void setNovelType(String novelType){
		this.novelType=novelType;
	}
	public String getNovelType(){
		return this.novelType;
	}
	private Integer clickNum;
	public void setClickNum(Integer clickNum){
		this.clickNum=clickNum;
	}
	public Integer getClickNum(){
		return this.clickNum;
	}
	private Integer readNum;
	public void setReadNum(Integer readNum){
		this.readNum=readNum;
	}
	public Integer getReadNum(){
		return this.readNum;
	}
	private Integer nstate;

	public Integer getNstate() {
		return nstate;
	}
	public void setNstate(Integer nstate) {
		this.nstate = nstate;
	}
	private String novelVote;

	public String getNovelVote() {
		return novelVote;
	}
	public void setNovelVote(String novelVote) {
		this.novelVote = novelVote;
	}
	
}