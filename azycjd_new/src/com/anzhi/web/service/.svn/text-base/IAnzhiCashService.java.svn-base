package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiCash;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiCashService {
	public boolean addAnzhiCash(AnzhiCash anzhicash);
	public boolean addBatchAnzhiCash(List<AnzhiCash> list);
	public boolean delAnzhiCash(int id);
	public boolean delBatchAnzhiCash(String ids);
	public boolean updateAnzhiCash(AnzhiCash anzhicash);
	public QueryList<AnzhiCash> findAnzhiCashAll(int size,int pageNum,String condition);
	public boolean addAnzhiCash(AnzhiCash anzhicash,AnzhiMember member,HttpServletRequest request);

}