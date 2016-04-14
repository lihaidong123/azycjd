package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiOtherContent;
public interface IAnzhiOtherContentService {
	public boolean addAnzhiOtherContent(AnzhiOtherContent anzhiothercontent);
	public boolean addBatchAnzhiOtherContent(List<AnzhiOtherContent> list);
	public boolean delAnzhiOtherContent(int id);
	public boolean delBatchAnzhiOtherContent(String ids);
	public boolean updateAnzhiOtherContent(AnzhiOtherContent anzhiothercontent);
	public QueryList<AnzhiOtherContent> findAnzhiOtherContentAll(int size,int pageNum,String condition);

}