package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiTrendReply;
public interface IAnzhiTrendReplyDao {
	public Pojo addAnzhiTrendReply(AnzhiTrendReply anzhitrendreply);
	public boolean addBatchAnzhiTrendReply(List<AnzhiTrendReply> list);
	public Pojo delAnzhiTrendReply(int id);
	public boolean delBatchAnzhiTrendReply(String ids);
	public Pojo updateAnzhiTrendReply(AnzhiTrendReply anzhitrendreply);
	public QueryList<AnzhiTrendReply> findAnzhiTrendReplyAll(int size,int pageNum,String condition);

}