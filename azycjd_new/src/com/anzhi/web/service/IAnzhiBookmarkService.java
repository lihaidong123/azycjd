package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiBookmark;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiBookmarkService {
	public String addAnzhiBookmark(AnzhiBookmark anzhibookmark,HttpServletRequest request,AnzhiMember am);
	public boolean addBatchAnzhiBookmark(List<AnzhiBookmark> list);
	public boolean delAnzhiBookmark(int id);
	public boolean delBatchAnzhiBookmark(String ids);
	public boolean updateAnzhiBookmark(AnzhiBookmark anzhibookmark);
	public QueryList<AnzhiBookmark> findAnzhiBookmarkAll(int size,int pageNum,String condition);

}