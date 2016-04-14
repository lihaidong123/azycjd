package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiCommentPraise;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiCommentPraiseService {
	public boolean addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise);
	public boolean addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise,HttpServletRequest request,AnzhiMember am);
	public boolean addBatchAnzhiCommentPraise(List<AnzhiCommentPraise> list);
	public boolean delAnzhiCommentPraise(int id);
	public boolean delBatchAnzhiCommentPraise(String ids);
	public boolean updateAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise);
	public QueryList<AnzhiCommentPraise> findAnzhiCommentPraiseAll(int size,int pageNum,String condition);

}