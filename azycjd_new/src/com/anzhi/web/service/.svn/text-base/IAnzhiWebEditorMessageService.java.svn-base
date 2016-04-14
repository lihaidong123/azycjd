package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
import com.anzhi.web.util.QueryList;
public interface IAnzhiWebEditorMessageService {
	public boolean addAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage);
	public boolean addBatchAnzhiWebEditorMessage(List<AnzhiWebEditorMessage> list);
	public boolean delAnzhiWebEditorMessage(int id);
	public boolean delBatchAnzhiWebEditorMessage(String ids);
	public boolean updateAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage);
	public QueryList<AnzhiWebEditorMessage> findAnzhiWebEditorMessageAll(int size,int pageNum,String condition);
	public void setDefault(HttpServletRequest request);
	public String cuigeng(HttpServletRequest request,AnzhiWebEditor aw);
}