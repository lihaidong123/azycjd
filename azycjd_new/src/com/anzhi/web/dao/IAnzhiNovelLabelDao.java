package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelLabel;
public interface IAnzhiNovelLabelDao {
	public Pojo addAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel);
	public boolean addBatchAnzhiNovelLabel(List<AnzhiNovelLabel> list);
	public Pojo delAnzhiNovelLabel(int id);
	public boolean delBatchAnzhiNovelLabel(String ids);
	public Pojo updateAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel);
	public QueryList<AnzhiNovelLabel> findAnzhiNovelLabelAll(int size,int pageNum,String condition);

}