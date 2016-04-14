package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiTrend;
public interface IAnzhiTrendDao {
	public Pojo addAnzhiTrend(AnzhiTrend anzhitrend);
	public boolean addBatchAnzhiTrend(List<AnzhiTrend> list);
	public Pojo delAnzhiTrend(int id);
	public boolean delBatchAnzhiTrend(String ids);
	public Pojo updateAnzhiTrend(AnzhiTrend anzhitrend);
	public QueryList<AnzhiTrend> findAnzhiTrendAll(int size,int pageNum,String condition);

}