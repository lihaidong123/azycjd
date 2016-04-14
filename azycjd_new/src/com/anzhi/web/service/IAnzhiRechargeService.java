package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiRecharge;
public interface IAnzhiRechargeService {
	public boolean addAnzhiRecharge(AnzhiRecharge anzhirecharge);
	public boolean addBatchAnzhiRecharge(List<AnzhiRecharge> list);
	public boolean delAnzhiRecharge(int id);
	public boolean delBatchAnzhiRecharge(String ids);
	public boolean updateAnzhiRecharge(AnzhiRecharge anzhirecharge);
	public QueryList<AnzhiRecharge> findAnzhiRechargeAll(int size,int pageNum,String condition);

}