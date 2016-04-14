package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
public interface IAnzhiDiscountedJoinService {
	public boolean addAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin);
	public boolean addBatchAnzhiDiscountedJoin(List<AnzhiDiscountedJoin> list);
	public boolean delAnzhiDiscountedJoin(int id);
	public boolean delBatchAnzhiDiscountedJoin(String ids);
	public boolean updateAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin);
	public QueryList<AnzhiDiscountedJoin> findAnzhiDiscountedJoinAll(int size,int pageNum,String condition);

}