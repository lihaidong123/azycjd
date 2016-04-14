package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiOtherContent;
public interface IAnzhiOtherContentDao {
	public Pojo addAnzhiOtherContent(AnzhiOtherContent anzhiothercontent);
	public boolean addBatchAnzhiOtherContent(List<AnzhiOtherContent> list);
	public Pojo delAnzhiOtherContent(int id);
	public boolean delBatchAnzhiOtherContent(String ids);
	public Pojo updateAnzhiOtherContent(AnzhiOtherContent anzhiothercontent);
	public QueryList<AnzhiOtherContent> findAnzhiOtherContentAll(int size,int pageNum,String condition);

}