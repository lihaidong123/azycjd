package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiComment;
public interface IAnzhiCommentDao {
	public Pojo addAnzhiComment(AnzhiComment anzhicomment);
	public boolean addBatchAnzhiComment(List<AnzhiComment> list);
	public Pojo delAnzhiComment(int id);
	public boolean delBatchAnzhiComment(String ids);
	public Pojo updateAnzhiComment(AnzhiComment anzhicomment);
	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition);
	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition,String orderField);
}