package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiNovelLabel;
public interface IAnzhiNovelLabelService {
	public boolean addAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel);
	public boolean addBatchAnzhiNovelLabel(List<AnzhiNovelLabel> list);
	public boolean delAnzhiNovelLabel(int id);
	public boolean delBatchAnzhiNovelLabel(String ids);
	public boolean updateAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel);
	public QueryList<AnzhiNovelLabel> findAnzhiNovelLabelAll(int size,int pageNum,String condition);

}