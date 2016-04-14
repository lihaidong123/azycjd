package com.anzhi.web.dao;

import java.util.List;

import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.Pojo;

public interface IUtilDao<T> {
	public List<T> getList(FatherPojo fatherPojo,String sql);
	public Pojo updateTableField(String tableName,int id,String field,String value);
	public Object getObjectByField(String tableName,int id,String field);
	public Object getObject(String sql);
}
