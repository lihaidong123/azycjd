package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorGoods extends FatherPojo implements java.io.Serializable {
	public AnzhiWebEditorGoods(){
	}
	public AnzhiWebEditorGoods setValues(Object[] obj) {
		AnzhiWebEditorGoods model=new AnzhiWebEditorGoods();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setGoodsName(obj[1]==null?"":obj[1].toString());
		model.setGoodsImg(obj[2]==null?"":obj[2].toString());
		model.setGoodsScore(obj[3]==null?"":obj[3].toString());
		model.setGoodsVote(obj[4]==null?"":obj[4].toString());
		model.setGoodsType(obj[5]==null?"":obj[5].toString());
		model.setState(obj[6]==null?0:Integer.parseInt(obj[6].toString()));
		model.setAddTime(obj[7]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[7]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
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
	private String goodsVote;
	public void setGoodsVote(String goodsVote){
		this.goodsVote=goodsVote;
	}
	public String getGoodsVote(){
		return this.goodsVote;
	}
	private String goodsType;
	public void setGoodsType(String goodsType){
		this.goodsType=goodsType;
	}
	public String getGoodsType(){
		return this.goodsType;
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

}