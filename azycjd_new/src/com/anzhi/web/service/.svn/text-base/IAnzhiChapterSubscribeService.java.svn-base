package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiChapterSubscribeService {
	public boolean addAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe);
	public boolean addBatchAnzhiChapterSubscribe(List<AnzhiChapterSubscribe> list);
	public boolean delAnzhiChapterSubscribe(int id);
	public boolean delBatchAnzhiChapterSubscribe(String ids);
	public boolean updateAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe);
	public QueryList<AnzhiChapterSubscribe> findAnzhiChapterSubscribeAll(int size,int pageNum,String condition);
	public String cashAnzhiChapterSubscribe(int fenJuanId,HttpServletRequest request,AnzhiMember am);
	public String cashAnzhiChapterSubscribe(int tableId,int types,HttpServletRequest request,AnzhiMember am);
	public void getDingYueChapter(HttpServletRequest request,HttpServletResponse response,AnzhiMember am);
	public void income(HttpServletRequest request);
}