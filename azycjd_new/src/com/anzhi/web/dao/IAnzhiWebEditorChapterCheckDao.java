package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorChapterCheck;
public interface IAnzhiWebEditorChapterCheckDao {
	public Pojo addAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck);
	public boolean addBatchAnzhiWebEditorChapterCheck(List<AnzhiWebEditorChapterCheck> list);
	public Pojo delAnzhiWebEditorChapterCheck(int id);
	public boolean delBatchAnzhiWebEditorChapterCheck(String ids);
	public Pojo updateAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck);
	public QueryList<AnzhiWebEditorChapterCheck> findAnzhiWebEditorChapterCheckAll(int size,int pageNum,String condition);

}