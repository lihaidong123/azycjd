package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiConsume;
public interface IAnzhiConsumeDao {
	public Pojo addAnzhiConsume(AnzhiConsume anzhiconsume);
	public boolean addBatchAnzhiConsume(List<AnzhiConsume> list);
	public Pojo delAnzhiConsume(int id);
	public boolean delBatchAnzhiConsume(String ids);
	public Pojo updateAnzhiConsume(AnzhiConsume anzhiconsume);
	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size,int pageNum,String condition);

}