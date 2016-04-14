package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiHandle;
public interface IAnzhiHandleDao {
	public Pojo addAnzhiHandle(AnzhiHandle anzhihandle);
	public boolean addBatchAnzhiHandle(List<AnzhiHandle> list);
	public Pojo delAnzhiHandle(int id);
	public boolean delBatchAnzhiHandle(String ids);
	public Pojo updateAnzhiHandle(AnzhiHandle anzhihandle);
	public QueryList<AnzhiHandle> findAnzhiHandleAll(int size,int pageNum,String condition);

}