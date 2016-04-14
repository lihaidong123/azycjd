package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiRecommend extends FatherPojo implements java.io.Serializable {
	public AnzhiRecommend(){
	}
	public AnzhiRecommend setValues(Object[] obj) {
		AnzhiRecommend model=new AnzhiRecommend();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setRecommendPost(obj[2]==null?"":obj[2].toString());
		model.setRecommendPosition(obj[3]==null?"":obj[3].toString());
		model.setVote(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddMemberId(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setNovelTitle(obj[8]==null?"":obj[8].toString());
		model.setAuthorwritername(obj[9]==null?"":obj[9].toString());
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
	private String recommendPost;
	public void setRecommendPost(String recommendPost){
		this.recommendPost=recommendPost;
	}
	public String getRecommendPost(){
		return this.recommendPost;
	}
	private String recommendPosition;
	public void setRecommendPosition(String recommendPosition){
		this.recommendPosition=recommendPosition;
	}
	public String getRecommendPosition(){
		return this.recommendPosition;
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
	private Integer addMemberId;
	public void setAddMemberId(Integer addMemberId){
		this.addMemberId=addMemberId;
	}
	public Integer getAddMemberId(){
		return this.addMemberId;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
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