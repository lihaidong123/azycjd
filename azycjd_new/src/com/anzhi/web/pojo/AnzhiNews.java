package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiNews extends FatherPojo implements java.io.Serializable {
	public AnzhiNews(){
	}
	public AnzhiNews setValues(Object[] obj) {
		AnzhiNews model=new AnzhiNews();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNewsAuthor(obj[1]==null?"":obj[1].toString());
		model.setNewsTitle(obj[2]==null?"":obj[2].toString());
		model.setNewsContent(obj[3]==null?"":obj[3].toString());
		model.setNewsType(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setNewsState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setNewsClicknum(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setVote(obj[8]==null?"":obj[8].toString());
		model.setState(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		return model;
	}
	private int state;
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private String newsAuthor;
	public void setNewsAuthor(String newsAuthor){
		this.newsAuthor=newsAuthor;
	}
	public String getNewsAuthor(){
		return this.newsAuthor;
	}
	private String newsTitle;
	public void setNewsTitle(String newsTitle){
		this.newsTitle=newsTitle;
	}
	public String getNewsTitle(){
		return this.newsTitle;
	}
	private String newsContent;
	public void setNewsContent(String newsContent){
		this.newsContent=newsContent;
	}
	public String getNewsContent(){
		return this.newsContent;
	}
	private Integer newsType;
	public void setNewsType(Integer newsType){
		this.newsType=newsType;
	}
	public Integer getNewsType(){
		return this.newsType;
	}
	private Integer newsState;
	public void setNewsState(Integer newsState){
		this.newsState=newsState;
	}
	public Integer getNewsState(){
		return this.newsState;
	}
	private Integer newsClicknum;
	public void setNewsClicknum(Integer newsClicknum){
		this.newsClicknum=newsClicknum;
	}
	public Integer getNewsClicknum(){
		return this.newsClicknum;
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