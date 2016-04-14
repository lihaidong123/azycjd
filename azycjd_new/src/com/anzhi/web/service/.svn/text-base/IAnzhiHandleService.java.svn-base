package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiHandle;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.util.QueryList;
public interface IAnzhiHandleService {
	public boolean addAnzhiHandle(AnzhiHandle anzhihandle,AnzhiWebEditor aw,HttpServletRequest request);
	public boolean addBatchAnzhiHandle(List<AnzhiHandle> list);
	public boolean delAnzhiHandle(int id);
	public boolean delBatchAnzhiHandle(String ids);
	public boolean updateAnzhiHandle(AnzhiHandle anzhihandle);
	public QueryList<AnzhiHandle> findAnzhiHandleAll(int size,int pageNum,String condition);
	public String adminCheck(HttpServletRequest request,AnzhiMember am);
}