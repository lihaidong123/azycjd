package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorSign;
public interface IAnzhiWebEditorSignDao {
	public Pojo addAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign);
	public boolean addBatchAnzhiWebEditorSign(List<AnzhiWebEditorSign> list);
	public Pojo delAnzhiWebEditorSign(int id);
	public boolean delBatchAnzhiWebEditorSign(String ids);
	public Pojo updateAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign);
	public QueryList<AnzhiWebEditorSign> findAnzhiWebEditorSignAll(int size,int pageNum,String condition);

}