package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiFenJuan;
public interface IAnzhiFenJuanService {
	public boolean addAnzhiFenJuan(AnzhiFenJuan anzhifenjuan);
	public boolean addBatchAnzhiFenJuan(List<AnzhiFenJuan> list);
	public boolean delAnzhiFenJuan(int id);
	public boolean delBatchAnzhiFenJuan(String ids);
	public boolean updateAnzhiFenJuan(AnzhiFenJuan anzhifenjuan);
	public QueryList<AnzhiFenJuan> findAnzhiFenJuanAll(int size,int pageNum,String condition);
	public QueryList<AnzhiFenJuan> findAnzhiFenJuanAll(int size,int pageNum,String condition,HttpServletRequest request);
}