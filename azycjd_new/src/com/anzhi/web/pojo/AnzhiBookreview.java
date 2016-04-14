package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiBookreview extends FatherPojo implements java.io.Serializable {
	public AnzhiBookreview(){
	}
	public AnzhiBookreview setValues(Object[] obj) {
		AnzhiBookreview model=new AnzhiBookreview();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNovelId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setMemberId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setBookreviewTitle(obj[3]==null?"":obj[3].toString());
		model.setBookreviewContent(obj[4]==null?"":obj[4].toString());
		model.setBookreviewClicknum(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setBookreviewReplynum(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setBookreviewReplyaddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		model.setIsTop(obj[8]==null?0:Integer.parseInt(obj[8].toString()));
		model.setIsMarrow(obj[9]==null?0:Integer.parseInt(obj[9].toString()));
		model.setIsReward(obj[10]==null?0:Integer.parseInt(obj[10].toString()));
		model.setVote(obj[11]==null?"":obj[11].toString());
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
	private Integer memberId;
	public void setMemberId(Integer memberId){
		this.memberId=memberId;
	}
	public Integer getMemberId(){
		return this.memberId;
	}
	private String bookreviewTitle;
	public void setBookreviewTitle(String bookreviewTitle){
		this.bookreviewTitle=bookreviewTitle;
	}
	public String getBookreviewTitle(){
		return this.bookreviewTitle;
	}
	private String bookreviewContent;
	public void setBookreviewContent(String bookreviewContent){
		this.bookreviewContent=bookreviewContent;
	}
	public String getBookreviewContent(){
		return this.bookreviewContent;
	}
	private Integer bookreviewClicknum;
	public void setBookreviewClicknum(Integer bookreviewClicknum){
		this.bookreviewClicknum=bookreviewClicknum;
	}
	public Integer getBookreviewClicknum(){
		return this.bookreviewClicknum;
	}
	private Integer bookreviewReplynum;
	public void setBookreviewReplynum(Integer bookreviewReplynum){
		this.bookreviewReplynum=bookreviewReplynum;
	}
	public Integer getBookreviewReplynum(){
		return this.bookreviewReplynum;
	}
	private Timestamp bookreviewReplyaddTime;
	public void setBookreviewReplyaddTime(Timestamp bookreviewReplyaddTime){
		this.bookreviewReplyaddTime=bookreviewReplyaddTime;
	}
	public Timestamp getBookreviewReplyaddTime(){
		return this.bookreviewReplyaddTime;
	}
	private Integer isTop;
	public void setIsTop(Integer isTop){
		this.isTop=isTop;
	}
	public Integer getIsTop(){
		return this.isTop;
	}
	private Integer isMarrow;
	public void setIsMarrow(Integer isMarrow){
		this.isMarrow=isMarrow;
	}
	public Integer getIsMarrow(){
		return this.isMarrow;
	}
	private Integer isReward;
	public void setIsReward(Integer isReward){
		this.isReward=isReward;
	}
	public Integer getIsReward(){
		return this.isReward;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}

}