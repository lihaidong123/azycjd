package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiCommentService {
	public boolean addAnzhiComment(AnzhiComment anzhicomment);
	public boolean addAnzhiComment(HttpServletRequest request,AnzhiComment anzhicomment,AnzhiMember am);
	public boolean addBatchAnzhiComment(List<AnzhiComment> list);
	public boolean delAnzhiComment(int id);
	public boolean delBatchAnzhiComment(String ids);
	public boolean updateAnzhiComment(AnzhiComment anzhicomment);
	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition);
	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition,int loginid);
	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition,String orderField);
	public void findAnzhiCommentAllIndex(HttpServletRequest request);
	public QueryList<AnzhiComment> findAnzhiCommentreplyAll(int size,int pageNum,String condition,int loginid);
	public void commentAction(HttpServletRequest request);
	public void delAnzhiCommentAdmin(int id,int tableId,String path,int types);
	public void pinglunguanli(HttpServletRequest request,String condition);
}