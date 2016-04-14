package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiIllegalChar;
public interface IAnzhiIllegalCharService {
	public boolean addAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar);
	public boolean addBatchAnzhiIllegalChar(List<AnzhiIllegalChar> list);
	public boolean delAnzhiIllegalChar(int id);
	public boolean delBatchAnzhiIllegalChar(String ids);
	public boolean updateAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar);
	public QueryList<AnzhiIllegalChar> findAnzhiIllegalCharAll(int size,int pageNum,String condition);

}