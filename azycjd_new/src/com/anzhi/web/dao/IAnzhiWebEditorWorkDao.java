package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorWork;
public interface IAnzhiWebEditorWorkDao {
	public Pojo addAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork);
	public boolean addBatchAnzhiWebEditorWork(List<AnzhiWebEditorWork> list);
	public Pojo delAnzhiWebEditorWork(int id);
	public boolean delBatchAnzhiWebEditorWork(String ids);
	public Pojo updateAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork);
	public QueryList<AnzhiWebEditorWork> findAnzhiWebEditorWorkAll(int size,int pageNum,String condition);

}