package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiBookmark;
public interface IAnzhiBookmarkDao {
	public Pojo addAnzhiBookmark(AnzhiBookmark anzhibookmark);
	public boolean addBatchAnzhiBookmark(List<AnzhiBookmark> list);
	public Pojo delAnzhiBookmark(int id);
	public boolean delBatchAnzhiBookmark(String ids);
	public Pojo updateAnzhiBookmark(AnzhiBookmark anzhibookmark);
	public QueryList<AnzhiBookmark> findAnzhiBookmarkAll(int size,int pageNum,String condition);

}