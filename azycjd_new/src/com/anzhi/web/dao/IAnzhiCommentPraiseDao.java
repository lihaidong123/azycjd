package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiCommentPraise;
public interface IAnzhiCommentPraiseDao {
	public Pojo addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise);
	public boolean addBatchAnzhiCommentPraise(List<AnzhiCommentPraise> list);
	public Pojo delAnzhiCommentPraise(int id);
	public boolean delBatchAnzhiCommentPraise(String ids);
	public Pojo updateAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise);
	public QueryList<AnzhiCommentPraise> findAnzhiCommentPraiseAll(int size,int pageNum,String condition);

}