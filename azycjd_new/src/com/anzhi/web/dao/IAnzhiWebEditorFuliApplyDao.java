package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorFuliApply;
public interface IAnzhiWebEditorFuliApplyDao {
	public Pojo addAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply);
	public boolean addBatchAnzhiWebEditorFuliApply(List<AnzhiWebEditorFuliApply> list);
	public Pojo delAnzhiWebEditorFuliApply(int id);
	public boolean delBatchAnzhiWebEditorFuliApply(String ids);
	public Pojo updateAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply);
	public QueryList<AnzhiWebEditorFuliApply> findAnzhiWebEditorFuliApplyAll(int size,int pageNum,String condition);

}