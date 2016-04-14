package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AuthorNovelConsume;
public interface IAnzhiConsumeService {
	public boolean addAnzhiConsume(AnzhiConsume anzhiconsume);
	public boolean addBatchAnzhiConsume(List<AnzhiConsume> list);
	public boolean delAnzhiConsume(int id);
	public boolean delBatchAnzhiConsume(String ids);
	public boolean updateAnzhiConsume(AnzhiConsume anzhiconsume);
	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size,int pageNum,String condition);
	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size,int pageNum,String condition,int loginid);
	public QueryList<AnzhiConsume> findAnzhiConsumeMyCome(int size,int pageNum,String condition,int loginid);
	public List<AuthorNovelConsume> findAnzhiConsumeMyComeByMonth(int size,int pageNum,String condition,int loginid,int novelid);
}