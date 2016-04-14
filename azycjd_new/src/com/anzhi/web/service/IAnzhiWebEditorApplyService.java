package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditorApply;
import com.anzhi.web.util.QueryList;
public interface IAnzhiWebEditorApplyService {
	public boolean addAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply);
	public boolean addBatchAnzhiWebEditorApply(List<AnzhiWebEditorApply> list);
	public boolean delAnzhiWebEditorApply(int id);
	public boolean delBatchAnzhiWebEditorApply(String ids);
	public boolean updateAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply);
	public QueryList<AnzhiWebEditorApply> findAnzhiWebEditorApplyAll(int size,int pageNum,String condition);
	public String updateApply(HttpServletRequest request);
}