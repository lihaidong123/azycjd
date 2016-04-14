package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiRecharge;
public interface IAnzhiRechargeDao {
	public Pojo addAnzhiRecharge(AnzhiRecharge anzhirecharge);
	public boolean addBatchAnzhiRecharge(List<AnzhiRecharge> list);
	public Pojo delAnzhiRecharge(int id);
	public boolean delBatchAnzhiRecharge(String ids);
	public Pojo updateAnzhiRecharge(AnzhiRecharge anzhirecharge);
	public QueryList<AnzhiRecharge> findAnzhiRechargeAll(int size,int pageNum,String condition);

}