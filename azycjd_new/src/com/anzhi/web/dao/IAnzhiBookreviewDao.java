package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiBookreview;
public interface IAnzhiBookreviewDao {
	public Pojo addAnzhiBookreview(AnzhiBookreview anzhibookreview);
	public boolean addBatchAnzhiBookreview(List<AnzhiBookreview> list);
	public Pojo delAnzhiBookreview(int id);
	public boolean delBatchAnzhiBookreview(String ids);
	public Pojo updateAnzhiBookreview(AnzhiBookreview anzhibookreview);
	public QueryList<AnzhiBookreview> findAnzhiBookreviewAll(int size,int pageNum,String condition);

}