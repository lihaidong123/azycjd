package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
public interface IAnzhiDiscountedJoinDao {
	public Pojo addAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin);
	public boolean addBatchAnzhiDiscountedJoin(List<AnzhiDiscountedJoin> list);
	public Pojo delAnzhiDiscountedJoin(int id);
	public boolean delBatchAnzhiDiscountedJoin(String ids);
	public Pojo updateAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin);
	public QueryList<AnzhiDiscountedJoin> findAnzhiDiscountedJoinAll(int size,int pageNum,String condition);

}