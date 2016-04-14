package com.anzhi.web.dao;
import java.util.List;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinChapter;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
public interface IAnzhiChapterDao {
	public Pojo addAnzhiChapter(AnzhiChapter anzhichapter);
	public boolean addBatchAnzhiChapter(List<AnzhiChapter> list);
	public Pojo delAnzhiChapter(int id);
	public boolean delBatchAnzhiChapter(String ids);
	public Pojo updateAnzhiChapter(AnzhiChapter anzhichapter);
	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition);
	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition,String orderField);
	public QueryList<AnzhiNovelMultiJoinChapter> findAnzhiNovelMultiJoinChapterAll(int size,int pageNum,String condition,String orderField);
}