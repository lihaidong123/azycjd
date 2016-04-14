package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiTrend;
public interface IAnzhiTrendService {
	public boolean addAnzhiTrend(AnzhiTrend anzhitrend);
	public boolean addAnzhiTrend(AnzhiTrend anzhitrend,HttpServletRequest request,AnzhiMember am);
	public boolean addBatchAnzhiTrend(List<AnzhiTrend> list);
	public boolean delAnzhiTrend(int id);
	public boolean delBatchAnzhiTrend(String ids);
	public boolean updateAnzhiTrend(AnzhiTrend anzhitrend);
	public QueryList<AnzhiTrend> findAnzhiTrendAll(int size,int pageNum,String condition);

}