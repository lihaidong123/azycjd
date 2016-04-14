package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiMessage;
public interface IAnzhiMessageDao {
	public Pojo addAnzhiMessage(AnzhiMessage anzhimessage);
	public boolean addBatchAnzhiMessage(List<AnzhiMessage> list);
	public Pojo delAnzhiMessage(int id);
	public boolean delBatchAnzhiMessage(String ids);
	public Pojo updateAnzhiMessage(AnzhiMessage anzhimessage);
	public QueryList<AnzhiMessage> findAnzhiMessageAll(int size,int pageNum,String condition);

}