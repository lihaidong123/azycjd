package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiCash;
public interface IAnzhiCashDao {
	public Pojo addAnzhiCash(AnzhiCash anzhicash);
	public boolean addBatchAnzhiCash(List<AnzhiCash> list);
	public Pojo delAnzhiCash(int id);
	public boolean delBatchAnzhiCash(String ids);
	public Pojo updateAnzhiCash(AnzhiCash anzhicash);
	public QueryList<AnzhiCash> findAnzhiCashAll(int size,int pageNum,String condition);

}