package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
public interface IAnzhiWebEditorMessageDao {
	public Pojo addAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage);
	public boolean addBatchAnzhiWebEditorMessage(List<AnzhiWebEditorMessage> list);
	public Pojo delAnzhiWebEditorMessage(int id);
	public Pojo updateAnzhiWebEditorMessage(int editorId);
	public boolean delBatchAnzhiWebEditorMessage(String ids);
	public Pojo updateAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage);
	public QueryList<AnzhiWebEditorMessage> findAnzhiWebEditorMessageAll(int size,int pageNum,String condition);

}