package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
public interface IAnzhiChapterSubscribeDao {
	public Pojo addAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe);
	public boolean addBatchAnzhiChapterSubscribe(List<AnzhiChapterSubscribe> list);
	public Pojo delAnzhiChapterSubscribe(int id);
	public boolean delBatchAnzhiChapterSubscribe(String ids);
	public Pojo updateAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe);
	public QueryList<AnzhiChapterSubscribe> findAnzhiChapterSubscribeAll(int size,int pageNum,String condition);

}