package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiWebEditorWork;
public interface IAnzhiWebEditorWorkService {
	public boolean addAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork);
	public boolean addBatchAnzhiWebEditorWork(List<AnzhiWebEditorWork> list);
	public boolean delAnzhiWebEditorWork(int id);
	public boolean delBatchAnzhiWebEditorWork(String ids);
	public boolean updateAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork);
	public QueryList<AnzhiWebEditorWork> findAnzhiWebEditorWorkAll(int size,int pageNum,String condition);

}