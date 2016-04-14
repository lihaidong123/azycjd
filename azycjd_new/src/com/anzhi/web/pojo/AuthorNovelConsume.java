package com.anzhi.web.pojo;

import com.anzhi.web.util.FatherPojo;

public class AuthorNovelConsume extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public AuthorNovelConsume(){
		
	}
	public AuthorNovelConsume setValues(Object[] obj) {
		AuthorNovelConsume model=new AuthorNovelConsume();
		model.setConsumeTime(obj[0]==null?"":obj[0].toString());
		model.setConsumeMoney(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setDaShang(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setVipRead(obj[3]==null?0:Integer.parseInt(obj[3].toString()));
		return model;
	}
	private String consumeTime;
	private int consumeMoney;
	private int daShang;
	private int vipRead;
	public String getConsumeTime() {
		return consumeTime;
	}
	public void setConsumeTime(String consumeTime) {
		this.consumeTime = consumeTime;
	}
	public int getConsumeMoney() {
		return consumeMoney;
	}
	public void setConsumeMoney(int consumeMoney) {
		this.consumeMoney = consumeMoney;
	}
	public int getDaShang() {
		return daShang;
	}
	public void setDaShang(int daShang) {
		this.daShang = daShang;
	}
	public int getVipRead() {
		return vipRead;
	}
	public void setVipRead(int vipRead) {
		this.vipRead = vipRead;
	}
}
