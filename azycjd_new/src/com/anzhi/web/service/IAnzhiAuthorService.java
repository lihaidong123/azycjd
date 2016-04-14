package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinAuthor;
public interface IAnzhiAuthorService {
	public boolean addAnzhiAuthor(AnzhiAuthor anzhiauthor,AnzhiMember anzhimember);
	public boolean addBatchAnzhiAuthor(List<AnzhiAuthor> list);
	public boolean delAnzhiAuthor(int id);
	public boolean delBatchAnzhiAuthor(String ids);
	public boolean updateAnzhiAuthor(AnzhiAuthor anzhiauthor);
	public QueryList<AnzhiAuthor> findAnzhiAuthorAll(int size,int pageNum,String condition);
	public QueryList<AnzhiNovelMultiJoinAuthor> findAnzhiNovelMultiJoinAuthor(int size,int pageNum,String condition);
	public void findAnzhiAuthorByDetail(HttpServletRequest request);
	public void fuliShenQin(HttpServletRequest request,AnzhiMember am);
}