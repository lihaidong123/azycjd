package com.anzhi.web.pojo;

import com.anzhi.web.util.FatherPojo;

public class ChapterDingYue extends FatherPojo implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 该类用于章节订阅查询
	 */

	public ChapterDingYue(){
	}
	public ChapterDingYue setValues(Object[] obj) {
		ChapterDingYue model=new ChapterDingYue();
		model.setChapterId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		return model;
	}
	private int chapterId;
	public int getChapterId() {
		return chapterId;
	}
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
	
	@Override
	public boolean equals(Object obj) {
		ChapterDingYue t=(ChapterDingYue)(obj);
		if(t.getChapterId()==this.getChapterId()){
			return true;
		}
		return false;
	}
}
