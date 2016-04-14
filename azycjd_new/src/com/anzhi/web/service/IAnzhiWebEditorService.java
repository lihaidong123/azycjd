package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiWebEditor;
public interface IAnzhiWebEditorService {
	public boolean addAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor);
	public boolean addBatchAnzhiWebEditor(List<AnzhiWebEditor> list);
	public boolean delAnzhiWebEditor(int id);
	public boolean delBatchAnzhiWebEditor(String ids);
	public boolean updateAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor);
	public QueryList<AnzhiWebEditor> findAnzhiWebEditorAll(int size,int pageNum,String condition);

}