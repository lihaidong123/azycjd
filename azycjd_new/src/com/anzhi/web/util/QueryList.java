package com.anzhi.web.util;
import java.util.List;
import com.anzhi.web.util.QueryList;
public class QueryList<T> {
	private int total;
	private List<T> list;
	private int totalNum;
	private int firstNum;
	private int endNum;
	private int upNum;
	private int downNum;
	private int num;
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getFirstNum() {
		return firstNum;
	}
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getUpNum() {
		return upNum;
	}
	public void setUpNum(int upNum) {
		if(upNum<1){
			upNum=1;
		}
		this.upNum = upNum;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		if(downNum>totalNum){
			downNum=totalNum;
		}
		if(downNum==1){
			downNum=2;
		}
		this.downNum = downNum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum() {
		return num;
	}
}