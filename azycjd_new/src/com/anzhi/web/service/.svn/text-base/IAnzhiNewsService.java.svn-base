package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.pojo.AnzhiNovel;
public interface IAnzhiNewsService {
	public boolean addAnzhiNews(AnzhiNews anzhinews);
	public boolean addBatchAnzhiNews(List<AnzhiNews> list);
	public boolean delAnzhiNews(int id);
	public boolean delBatchAnzhiNews(String ids);
	public boolean updateAnzhiNews(AnzhiNews anzhinews);
	public QueryList<AnzhiNews> findAnzhiNewsAll(int size,int pageNum,String condition);
	public void addCreateNewsHtml(String path);
}