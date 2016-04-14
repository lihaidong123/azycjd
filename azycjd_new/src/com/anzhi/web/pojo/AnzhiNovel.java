package com.anzhi.web.pojo;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNovel extends FatherPojo implements java.io.Serializable {
	public AnzhiNovel(){
	}
	public AnzhiNovel setValues(Object[] obj) {
		AnzhiNovel model=new AnzhiNovel();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelTitle(obj[1]==null?"":obj[1].toString());
		model.setNovelSummary(obj[2]==null?"":obj[2].toString());
		model.setAuthorId(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		model.setUpdateTime(obj[6]==null?new Timestamp(new Date().getTime()):new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		model.setNovelType(obj[7]==null?"":obj[7].toString());
		model.setVote(obj[8]==null?"":obj[8].toString());
		model.setNovelImg(obj[9]==null?"":obj[9].toString());
		model.setNovelLabel(obj[10]==null?"":obj[10].toString());
		model.setAuthorizationLevel(obj[11]==null?0:Integer.parseInt(obj[11].toString()));
		model.setCategories(obj[12]==null?"":obj[12].toString());
		model.setLeadingRole(obj[13]==null?"":obj[13].toString());
		model.setSupportingRole(obj[14]==null?"":obj[14].toString());
		model.setHtmlState(obj[15]==null?0:Integer.parseInt(obj[15].toString()));
		model.setClickNum(obj[16]==null?0:Integer.parseInt(obj[16].toString()));
		model.setMyEditor(obj[17]==null?"":obj[17].toString());
		model.setPostedWay(obj[18]==null?0:Integer.parseInt(obj[18].toString()));
		model.setEnName(obj[19]==null?"":obj[19].toString());
		model.setReadNum(obj[20]==null?0:Integer.parseInt(obj[20].toString()));
		model.setIsSigned(obj[21]==null?0:Integer.parseInt(obj[21].toString()));
		model.setIsJinbi(obj[22]==null?0:Integer.parseInt(obj[22].toString()));
		model.setIsWangwen(obj[23]==null?0:Integer.parseInt(obj[23].toString()));
		model.setTotalRecommand(obj[24]==null?0:Integer.parseInt(obj[24].toString()));
		model.setTotalCharNum(obj[25]==null?0:Integer.parseInt(obj[25].toString()));
		model.setTotalSaveNum(obj[26]==null?0:Integer.parseInt(obj[26].toString()));
		model.setTotalDingyueNum(obj[27]==null?0:Integer.parseInt(obj[27].toString()));
		model.setTotalShangNum(obj[28]==null?0:Integer.parseInt(obj[28].toString()));
		model.setTotalCommentNum(obj[29]==null?0:Integer.parseInt(obj[29].toString()));
		model.setAuthorWriterName(obj[30]==null?"":obj[30].toString());
		try {
			model.setNum(obj[31]==null?0:Integer.parseInt(obj[31].toString()));//如果是排行榜查询，则对应的是次数。如果是优惠书坊查询，则对应的是novel_id
			model.setDiscountedType(obj[32]==null?0:Integer.parseInt(obj[32].toString()));
			model.setDiscountedEndDate(obj[33]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[33]));
			model.setDiscountedRebate(obj[34]==null?null:Double.parseDouble(obj[34].toString()));
			model.setDiscountedId(obj[35]==null?0:Integer.parseInt(obj[35].toString()));
		} catch (Exception e) {
			model.setNum((model.getNum()>0)?model.getNum():0);
			model.setDiscountedType(0);
			model.setDiscountedEndDate(null);
			model.setDiscountedRebate(0.0);
			model.setDiscountedId(0);
		}
		return model;
	}
	
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String novelTitle;
	public void setNovelTitle(String novelTitle){
		this.novelTitle=novelTitle;
	}
	public String getNovelTitle(){
		return this.novelTitle;
	}
	private String novelSummary;
	public void setNovelSummary(String novelSummary){
		this.novelSummary=novelSummary;
	}
	public String getNovelSummary(){
		return this.novelSummary;
	}
	private Integer authorId;
	public void setAuthorId(Integer authorId){
		this.authorId=authorId;
	}
	public Integer getAuthorId(){
		return this.authorId;
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
	private Timestamp updateTime;
	public void setUpdateTime(Timestamp updateTime){
		this.updateTime=updateTime;
	}
	public Timestamp getUpdateTime(){
		return this.updateTime;
	}
	private String novelType;
	public void setNovelType(String novelType){
		this.novelType=novelType;
	}
	public String getNovelType(){
		return this.novelType;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
		this.mVote = vote;
	}
	public String getVote(){
		if(this.vote==null){
			this.vote="";
		}
		return this.vote;
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
		this.mNovelImg = novelImg;
	}
	public String getNovelImg(){
		return this.novelImg;
	}
	private String novelLabel;
	public void setNovelLabel(String novelLabel){
		this.novelLabel=novelLabel;
	}
	public String getNovelLabel(){
		return this.novelLabel;
	}
	private Integer authorizationLevel;
	public void setAuthorizationLevel(Integer authorizationLevel){
		this.authorizationLevel=authorizationLevel;
	}
	public Integer getAuthorizationLevel(){
		return this.authorizationLevel;
	}
	private String categories;
	public void setCategories(String categories){
		this.categories=categories;
	}
	public String getCategories(){
		return this.categories;
	}
	private String leadingRole;
	public void setLeadingRole(String leadingRole){
		this.leadingRole=leadingRole;
	}
	public String getLeadingRole(){
		return this.leadingRole;
	}
	private String supportingRole;
	public void setSupportingRole(String supportingRole){
		this.supportingRole=supportingRole;
	}
	public String getSupportingRole(){
		return this.supportingRole;
	}
	private Integer htmlState;
	public void setHtmlState(Integer htmlState){
		this.htmlState=htmlState;
	}
	public Integer getHtmlState(){
		return this.htmlState;
	}
	private Integer clickNum;
	public void setClickNum(Integer clickNum){
		this.clickNum=clickNum;
	}
	public Integer getClickNum(){
		return this.clickNum;
	}
	private String myEditor;
	public void setMyEditor(String myEditor){
		this.myEditor=myEditor;
	}
	public String getMyEditor(){
		return this.myEditor;
	}
	private Integer postedWay;
	public void setPostedWay(Integer postedWay){
		this.postedWay=postedWay;
	}
	public Integer getPostedWay(){
		return this.postedWay;
	}
	private String enName;
	public void setEnName(String enName){
		this.enName=enName;
	}
	public String getEnName(){
		return this.enName;
	}
	private Integer readNum;
	public void setReadNum(Integer readNum){
		this.readNum=readNum;
	}
	public Integer getReadNum(){
		return this.readNum;
	}
	private Integer isSigned;
	public void setIsSigned(Integer isSigned){
		this.isSigned=isSigned;
	}
	public Integer getIsSigned(){
		return this.isSigned;
	}
	private Integer isJinbi;
	public void setIsJinbi(Integer isJinbi){
		this.isJinbi=isJinbi;
	}
	public Integer getIsJinbi(){
		return this.isJinbi;
	}
	private Integer isWangwen;
	public void setIsWangwen(Integer isWangwen){
		this.isWangwen=isWangwen;
	}
	public Integer getIsWangwen(){
		return this.isWangwen;
	}
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
	
	private int totalSaveNum;//收藏数
	private int totalCharNum;//总字数
	private int totalRecommand;//总推荐数
	private int totalDingyueNum;//订阅数
	private int totalShangNum;//打赏数
	private int totalCommentNum;//评论数
	
	public int getTotalSaveNum() {
		return totalSaveNum;
	}
	public void setTotalSaveNum(int totalSaveNum) {
		this.totalSaveNum = totalSaveNum;
	}
	public int getTotalRecommand() {
		return totalRecommand;
	}
	public void setTotalRecommand(int totalRecommand) {
		this.totalRecommand = totalRecommand;
	}
	public int getTotalCharNum() {
		return totalCharNum;
	}
	public void setTotalCharNum(int totalCharNum) {
		this.totalCharNum = totalCharNum;
	}
	public int getTotalDingyueNum() {
		return totalDingyueNum;
	}
	public void setTotalDingyueNum(int totalDingyueNum) {
		this.totalDingyueNum = totalDingyueNum;
	}
	public int getTotalShangNum() {
		return totalShangNum;
	}
	public void setTotalShangNum(int totalShangNum) {
		this.totalShangNum = totalShangNum;
	}
	public int getTotalCommentNum() {
		return totalCommentNum;
	}
	public void setTotalCommentNum(int totalCommentNum) {
		this.totalCommentNum = totalCommentNum;
	}
	private int num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	private int discountedId;
	public int getDiscountedId() {
		return discountedId;
	}
	public void setDiscountedId(int discountedId) {
		this.discountedId = discountedId;
	}
	
	private Integer isWebUp;//0-未上架
	private Integer isPingTaiUp;//1-已上架
	public Integer getIsWebUp() {
		return isWebUp;
	}
	public void setIsWebUp(Integer isWebUp) {
		this.isWebUp = isWebUp;
	}
	public Integer getIsPingTaiUp() {
		return isPingTaiUp;
	}
	public void setIsPingTaiUp(Integer isPingTaiUp) {
		this.isPingTaiUp = isPingTaiUp;
	}
	private String mNovelImg;
	public String getmNovelImg() {
		return mNovelImg;
	}
	public void setmNovelImg(String mNovelImg) {
		this.mNovelImg = mNovelImg;
	}
	
	private String mVote;
	public String getmVote() {
		return mVote;
	}
	public void setmVote(String mVote) {
		this.mVote = mVote;
	}
	
	private List<AnZhiFuLi> fuLiList;
	public List<AnZhiFuLi> getFuLiList() {
		return fuLiList;
	}
	public void setFuLiList(List<AnZhiFuLi> fuLiList) {
		this.fuLiList = fuLiList;
	}
	
	
}