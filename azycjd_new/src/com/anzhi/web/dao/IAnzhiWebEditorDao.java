package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditor;
public interface IAnzhiWebEditorDao {
	public Pojo addAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor);
	public boolean addBatchAnzhiWebEditor(List<AnzhiWebEditor> list);
	public Pojo delAnzhiWebEditor(int id);
	public boolean delBatchAnzhiWebEditor(String ids);
	public Pojo updateAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor);
	public QueryList<AnzhiWebEditor> findAnzhiWebEditorAll(int size,int pageNum,String condition);
	public Pojo updateScore(int id,double addScore);
}