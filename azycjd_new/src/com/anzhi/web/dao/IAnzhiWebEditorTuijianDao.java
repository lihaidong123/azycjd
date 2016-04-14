package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorTuijian;
public interface IAnzhiWebEditorTuijianDao {
	public Pojo addAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian);
	public boolean addBatchAnzhiWebEditorTuijian(List<AnzhiWebEditorTuijian> list);
	public Pojo delAnzhiWebEditorTuijian(int id);
	public boolean delBatchAnzhiWebEditorTuijian(String ids);
	public Pojo updateAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian);
	public QueryList<AnzhiWebEditorTuijian> findAnzhiWebEditorTuijianAll(int size,int pageNum,String condition);

}