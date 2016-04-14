package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiBenefit;
public interface IAnzhiBenefitService {
	public boolean addAnzhiBenefit(AnzhiBenefit anzhibenefit);
	public boolean addBatchAnzhiBenefit(List<AnzhiBenefit> list);
	public boolean delAnzhiBenefit(int id);
	public boolean delBatchAnzhiBenefit(String ids);
	public boolean updateAnzhiBenefit(AnzhiBenefit anzhibenefit);
	public QueryList<AnzhiBenefit> findAnzhiBenefitAll(int size,int pageNum,String condition);

}