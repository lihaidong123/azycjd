package com.anzhi.web.pojo;

import com.anzhi.web.util.FatherPojo;

public class DaojuPojo extends FatherPojo implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public DaojuPojo setValues(Object[] obj) {
		DaojuPojo model=new DaojuPojo();
		model.setRewardType(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setNums(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setAnzhiMoneys(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		return model;
	}
	public DaojuPojo(){
		
	}
	private String daoJuName;
	private int rewardType;
	private int nums;
	private int anzhiMoneys;
	public String getDaoJuName() {
		return daoJuName;
	}
	public void setDaoJuName(String daoJuName) {
		this.daoJuName = daoJuName;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public int getAnzhiMoneys() {
		return anzhiMoneys;
	}
	public void setAnzhiMoneys(int anzhiMoneys) {
		this.anzhiMoneys = anzhiMoneys;
	}
	public int getRewardType() {
		return rewardType;
	}
	public void setRewardType(int rewardType) {
		this.rewardType = rewardType;
	}
	
}
