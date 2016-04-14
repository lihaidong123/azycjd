package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorAuthor;
import com.anzhi.web.util.QueryList;
public interface IAnzhiWebEditorAuthorService {
	public boolean addAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor);
	public boolean addBatchAnzhiWebEditorAuthor(List<AnzhiWebEditorAuthor> list);
	public boolean delAnzhiWebEditorAuthor(int id);
	public boolean delBatchAnzhiWebEditorAuthor(String ids);
	public boolean updateAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor);
	public QueryList<AnzhiWebEditorAuthor> findAnzhiWebEditorAuthorAll(int size,int pageNum,String condition);
	public String addAnzhiWebEditorAuthor(HttpServletRequest request,AnzhiWebEditor aw);
}