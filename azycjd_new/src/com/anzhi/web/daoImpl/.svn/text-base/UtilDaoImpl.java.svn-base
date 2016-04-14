package com.anzhi.web.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.anzhi.web.dao.IUtilDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.Pojo;
@Repository
public class UtilDaoImpl<T> extends ActionDb implements IUtilDao<T> {

	public List<T> getList(FatherPojo fatherPojo, String sql) {
		// TODO Auto-generated method stub
		return this.excuteQuery(fatherPojo, sql);
	}

	public Pojo updateTableField(String tableName, int id, String field,
			String value) {
		Pojo pojo=new Pojo();
		pojo.setSql("update "+tableName+" set "+field+"=? where id=?");
		pojo.setObj(new Object[]{
			value,
			id
		});
		return pojo;
	}

	public Object getObjectByField(String tableName, int id, String field) {
		String sql="select "+field+" from "+tableName+" where id="+id;
		return getObject(sql);
	}

	public Object getObject(String sql) {
		// TODO Auto-generated method stub
		return this.getObjectBySql(sql);
	}

}
