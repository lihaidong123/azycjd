package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiTrendReply;
public interface IAnzhiTrendReplyService {
	public boolean addAnzhiTrendReply(AnzhiTrendReply anzhitrendreply);
	public boolean addBatchAnzhiTrendReply(List<AnzhiTrendReply> list);
	public boolean delAnzhiTrendReply(int id);
	public boolean delBatchAnzhiTrendReply(String ids);
	public boolean updateAnzhiTrendReply(AnzhiTrendReply anzhitrendreply);
	public QueryList<AnzhiTrendReply> findAnzhiTrendReplyAll(int size,int pageNum,String condition);

}