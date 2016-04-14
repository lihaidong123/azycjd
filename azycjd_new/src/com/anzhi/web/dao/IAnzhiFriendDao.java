package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiFriend;
public interface IAnzhiFriendDao {
	public Pojo addAnzhiFriend(AnzhiFriend anzhifriend);
	public boolean addBatchAnzhiFriend(List<AnzhiFriend> list);
	public Pojo delAnzhiFriend(int id);
	public boolean delBatchAnzhiFriend(String ids);
	public Pojo updateAnzhiFriend(AnzhiFriend anzhifriend);
	public QueryList<AnzhiFriend> findAnzhiFriendAll(int size,int pageNum,String condition);
	public Pojo delMyAnzhiFriend(int myid,int myfriendid);
}