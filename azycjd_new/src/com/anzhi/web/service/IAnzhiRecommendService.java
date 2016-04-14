package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiRecommend;
public interface IAnzhiRecommendService {
	public boolean addAnzhiRecommend(AnzhiRecommend anzhirecommend);
	public boolean addAnzhiRecommend(AnzhiRecommend anzhirecommend,String recommendPost,String recommendPosition,String vote,String[] b,int memberId);
	public boolean addBatchAnzhiRecommend(List<AnzhiRecommend> list);
	public boolean delAnzhiRecommend(int id);
	public boolean delBatchAnzhiRecommend(String ids);
	public boolean updateAnzhiRecommend(AnzhiRecommend anzhirecommend);
	public QueryList<AnzhiRecommend> findAnzhiRecommendAll(int size,int pageNum,String condition);
	public boolean updateAnzhiRecommend(AnzhiRecommend anzhirecommend,String recommendPost,String recommendPosition,String vote,String[] b,int memberId,int id);

}