package com.anzhi.web.pojo;
import java.util.List;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiAuthor extends FatherPojo implements java.io.Serializable {
	public AnzhiAuthor(){
	}
	public AnzhiAuthor setValues(Object[] obj) {
		AnzhiAuthor model=new AnzhiAuthor();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setMemberId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setAuthorWriterName(obj[2]==null?"":obj[2].toString());
		model.setAuthorTel(obj[3]==null?"":obj[3].toString());
		model.setAuthorQq(obj[4]==null?"":obj[4].toString());
		model.setAuthorImage(obj[5]==null?"":obj[5].toString());
		model.setAuthorRealname(obj[6]==null?"":obj[6].toString());
		model.setAuthorAddress(obj[7]==null?"":obj[7].toString());
		model.setAuthorPost(obj[8]==null?"":obj[8].toString());
		model.setAuthorEmail(obj[9]==null?"":obj[9].toString());
		model.setAuthorMsn(obj[10]==null?"":obj[10].toString());
		model.setAuthorCredenttype(obj[11]==null?"":obj[11].toString());
		model.setAuthorCredentcode(obj[12]==null?"":obj[12].toString());
		model.setAuthorInfo(obj[13]==null?"":obj[13].toString());
		model.setAuthorState(obj[14]==null?0:Integer.parseInt(obj[14].toString()));
		model.setAddTime(obj[15]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[15]));
		model.setVote(obj[16]==null?"":obj[16].toString());
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
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private String authorWriterName;
	public void setAuthorWriterName(String authorWriterName){
		this.authorWriterName=authorWriterName;
	}
	public String getAuthorWriterName(){
		return this.authorWriterName;
	}
	private String authorTel;
	public void setAuthorTel(String authorTel){
		this.authorTel=authorTel;
	}
	public String getAuthorTel(){
		return this.authorTel;
	}
	private String authorQq;
	public void setAuthorQq(String authorQq){
		this.authorQq=authorQq;
	}
	public String getAuthorQq(){
		return this.authorQq;
	}
	private String authorImage;
	public void setAuthorImage(String authorImage){
		if(authorImage!=null&&!authorImage.equals("")){
			if(authorImage.indexOf("UploadImages")!=-1){
				authorImage=projectName+""+authorImage;
			}else{
				String path=tomcatPath+authorImage;
				File f=new File(path);
				if(!f.exists()){ 
					authorImage=projectName+"/images/8_p_1.png";
				}
			}
		}else{
			authorImage=projectName+"/images/8_p_1.png";
		}
		this.authorImage=authorImage;
	}
	
	public void setAuthorImageNew(String authorImage){
		this.authorImage=authorImage;
	}
	public String getAuthorImage(){
		return this.authorImage;
	}
	private String authorRealname;
	public void setAuthorRealname(String authorRealname){
		this.authorRealname=authorRealname;
	}
	public String getAuthorRealname(){
		return this.authorRealname;
	}
	private String authorAddress;
	public void setAuthorAddress(String authorAddress){
		this.authorAddress=authorAddress;
	}
	public String getAuthorAddress(){
		return this.authorAddress;
	}
	private String authorPost;
	public void setAuthorPost(String authorPost){
		this.authorPost=authorPost;
	}
	public String getAuthorPost(){
		return this.authorPost;
	}
	private String authorEmail;
	public void setAuthorEmail(String authorEmail){
		this.authorEmail=authorEmail;
	}
	public String getAuthorEmail(){
		return this.authorEmail;
	}
	private String authorMsn;
	public void setAuthorMsn(String authorMsn){
		this.authorMsn=authorMsn;
	}
	public String getAuthorMsn(){
		return this.authorMsn;
	}
	private String authorCredenttype;
	public void setAuthorCredenttype(String authorCredenttype){
		this.authorCredenttype=authorCredenttype;
	}
	public String getAuthorCredenttype(){
		return this.authorCredenttype;
	}
	private String authorCredentcode;
	public void setAuthorCredentcode(String authorCredentcode){
		this.authorCredentcode=authorCredentcode;
	}
	public String getAuthorCredentcode(){
		return this.authorCredentcode;
	}
	private String authorInfo;
	public void setAuthorInfo(String authorInfo){
		this.authorInfo=authorInfo;
	}
	public String getAuthorInfo(){
		return this.authorInfo;
	}
	private Integer authorState;
	public void setAuthorState(Integer authorState){
		this.authorState=authorState;
	}
	public Integer getAuthorState(){
		return this.authorState;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}

}