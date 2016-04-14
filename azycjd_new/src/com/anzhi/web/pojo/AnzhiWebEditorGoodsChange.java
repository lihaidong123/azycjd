package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorGoodsChange extends WebEditorFather implements java.io.Serializable {
	public AnzhiWebEditorGoodsChange(){
	}
	public AnzhiWebEditorGoodsChange setValues(Object[] obj) {
		AnzhiWebEditorGoodsChange model=new AnzhiWebEditorGoodsChange();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setGoodsId(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setChangeVote(obj[3]==null?"":obj[3].toString());
		model.setState(obj[4]==null?0:Integer.parseInt(obj[4].toString()));
		model.setAddTime(obj[5]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[5]));
		
		model.setGoodsName(obj[6]==null?"":obj[6].toString());
		model.setGoodsImg(obj[7]==null?"":obj[7].toString());
		model.setGoodsScore(obj[8]==null?"":obj[8].toString());
		model.setGoodsType(obj[9]==null?"":obj[9].toString());
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer goodsId;
	public void setGoodsId(Integer goodsId){
		this.goodsId=goodsId;
	}
	public Integer getGoodsId(){
		return this.goodsId;
	}
	private String changeVote;
	public void setChangeVote(String changeVote){
		this.changeVote=changeVote;
	}
	public String getChangeVote(){
		return this.changeVote;
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
	private String goodsName;
	public void setGoodsName(String goodsName){
		this.goodsName=goodsName;
	}
	public String getGoodsName(){
		return this.goodsName;
	}
	private String goodsImg;
	public void setGoodsImg(String goodsImg){
		this.goodsImg=goodsImg;
	}
	public String getGoodsImg(){
		return this.goodsImg;
	}
	private String goodsScore;
	public void setGoodsScore(String goodsScore){
		this.goodsScore=goodsScore;
	}
	public String getGoodsScore(){
		return this.goodsScore;
	}
	private String goodsType;
	public void setGoodsType(String goodsType){
		this.goodsType=goodsType;
	}
	public String getGoodsType(){
		return this.goodsType;
	}
}