package com.anzhi.web.service;

import java.util.List;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.Pojo;

public interface IUtilService<T> {
	public List<T> getList(FatherPojo fatherPojo,String sql);
	public boolean updateTableFields(String tableName,int id,String field,String value);
	public boolean updateTableFields(String tableName,int id,String field,int value);
	public Object getObjectByField(String tableName,int id,String field);
	public Object getObject(String sql);
	public String createDataService(String path);
	public String createNovelChapter(AnzhiNovel an,String path);
	public void createNovelChapterReadJsp(String path,AnzhiNovel an,AnzhiChapter ac);
	public String delRecord(int tableId,int tabNameIndex,AnzhiMember am,int actionType,int stateValue,String vote);
	public void updateNovelTotalNum();
	public void updateNovelImg();
}
