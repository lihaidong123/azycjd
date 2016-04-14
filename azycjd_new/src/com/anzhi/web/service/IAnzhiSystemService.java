package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiSystem;
public interface IAnzhiSystemService {
	public boolean addAnzhiSystem(AnzhiSystem anzhisystem);
	public boolean addBatchAnzhiSystem(List<AnzhiSystem> list);
	public boolean delAnzhiSystem(int id);
	public boolean delBatchAnzhiSystem(String ids);
	public boolean updateAnzhiSystem(AnzhiSystem anzhisystem);
	public QueryList<AnzhiSystem> findAnzhiSystemAll(int size,int pageNum,String condition);

}