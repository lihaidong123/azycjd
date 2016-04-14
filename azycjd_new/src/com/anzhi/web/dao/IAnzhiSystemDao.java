package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiSystem;
public interface IAnzhiSystemDao {
	public Pojo addAnzhiSystem(AnzhiSystem anzhisystem);
	public boolean addBatchAnzhiSystem(List<AnzhiSystem> list);
	public Pojo delAnzhiSystem(int id);
	public boolean delBatchAnzhiSystem(String ids);
	public Pojo updateAnzhiSystem(AnzhiSystem anzhisystem);
	public QueryList<AnzhiSystem> findAnzhiSystemAll(int size,int pageNum,String condition);

}