package com.anzhi.web.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class ImportData {
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	@Autowired 
	private JdbcTemplate template;
	@Autowired 
	private JdbcTemplate templateUser;
	
	
	//根据sql获得数据
	public List<Object[]> getData(String sql){
		List<Object[]> tmp=new ArrayList<Object[]>();
		try {
			SqlRowSet rs=template.queryForRowSet(sql);
			while(rs.next()){
				int colLength=rs.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<obj.length;i++){
					obj[i]=rs.getObject(i+1);
				}
				tmp.add(obj);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	
	//根据sql获得数据
	public List<Object[]> getDataUser(String sql){
		List<Object[]> tmp=new ArrayList<Object[]>();
		try {
			SqlRowSet rs=templateUser.queryForRowSet(sql);
			while(rs.next()){
				int colLength=rs.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<obj.length;i++){
					obj[i]=rs.getObject(i+1);
				}
				tmp.add(obj);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	
	//添加一条记录，并获得插入记录的id
	public int excuteUpdate(final String sql,final Object[] object){
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {	
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement pst = conn.prepareStatement(sql,
						new String[] { "id" });
				if(object!=null){
					for(int i=0;i<object.length;i++){
						pst.setObject(i+1, object[i]);
					}
				}
				return pst;
			}
		}, keyHolder);
		int ids = keyHolder.getKey().intValue();
		return ids;
	}
	
	//批量执行增删改
	public boolean excuteUpdate(List<Pojo> list){
		int wrongNum=0;
		for(int i=0;i<list.size();i++){
			Pojo p=list.get(i);
			System.out.println("总共条"+list.size()+"；记录执行到："+i);
			try {
				jdbcTemplate.update(p.getSql(), p.getObj());
			} catch (DataAccessException e) {
				writeNoImportData(p,i);
				wrongNum++;
			}
		}
		writeNoImportData(wrongNum);
		return false;
	}
	
	public void writeNoImportData(Pojo p,int k){
		java.io.File f=new java.io.File("d://dt.txt");
		try {
			FileOutputStream fis=new FileOutputStream(f,true);
			String inf=k+"、    "+p.getSql()+"\r\n";
			if(p.getObj()!=null){
				for(int i=0;i<p.getObj().length;i++){
					Object o=(p.getObj())[i];
					inf+=(o==null?"":o.toString())+"\r\n";
				}
			}
			inf+="\r\n\r\n\r\n\r\n\r\n";
			fis.write(inf.getBytes());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void writeNoImportData(int wrongNum){
		java.io.File f=new java.io.File("d://dt.txt");
		try {
			FileOutputStream fis=new FileOutputStream(f,true);
			String inf="总共未导入的记录为："+wrongNum;
			fis.write(inf.getBytes());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
