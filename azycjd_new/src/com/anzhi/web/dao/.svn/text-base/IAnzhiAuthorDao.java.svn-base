package com.anzhi.web.dao;
import java.util.List;

import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinAuthor;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
public interface IAnzhiAuthorDao {
	public Pojo addAnzhiAuthor(AnzhiAuthor anzhiauthor);
	public boolean addBatchAnzhiAuthor(List<AnzhiAuthor> list);
	public Pojo delAnzhiAuthor(int id);
	public boolean delBatchAnzhiAuthor(String ids);
	public Pojo updateAnzhiAuthor(AnzhiAuthor anzhiauthor);
	public QueryList<AnzhiAuthor> findAnzhiAuthorAll(int size,int pageNum,String condition);
	public QueryList<AnzhiNovelMultiJoinAuthor> findAnzhiNovelMultiJoinAuthor(int size,int pageNum,String condition);
}