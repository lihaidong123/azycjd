package com.anzhi.web.pojo;

import com.anzhi.web.util.FatherPojo;

public class AnZhiIncome extends FatherPojo implements java.io.Serializable,Comparable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -802939883740983701L;
	private int menmberId;
	private String writerName;
	private Double zhangjieIncome;
	private Double dashangIncome;
	private Double yuedubiIncome;
	public int getMenmberId() {
		return menmberId;
	}
	public void setMenmberId(int menmberId) {
		this.menmberId = menmberId;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	
	public Double getZhangjieIncome() {
		return zhangjieIncome;
	}
	public void setZhangjieIncome(Double zhangjieIncome) {
		this.zhangjieIncome = zhangjieIncome;
	}
	public Double getDashangIncome() {
		return dashangIncome;
	}
	public void setDashangIncome(Double dashangIncome) {
		this.dashangIncome = dashangIncome;
	}
	public Double getYuedubiIncome() {
		return yuedubiIncome;
	}
	public void setYuedubiIncome(Double yuedubiIncome) {
		this.yuedubiIncome = yuedubiIncome;
	}
	public int compareTo(Object o) {
		AnZhiIncome ai=(AnZhiIncome)o;
		return ai.getZhangjieIncome().compareTo(this.zhangjieIncome);
	}
	
}
