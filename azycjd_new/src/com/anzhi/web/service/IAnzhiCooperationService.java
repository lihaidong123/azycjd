package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiCooperation;
public interface IAnzhiCooperationService {
	public boolean addAnzhiCooperation(AnzhiCooperation anzhicooperation);
	public boolean addBatchAnzhiCooperation(List<AnzhiCooperation> list);
	public boolean delAnzhiCooperation(int id);
	public boolean delBatchAnzhiCooperation(String ids);
	public boolean updateAnzhiCooperation(AnzhiCooperation anzhicooperation);
	public QueryList<AnzhiCooperation> findAnzhiCooperationAll(int size,int pageNum,String condition);

}