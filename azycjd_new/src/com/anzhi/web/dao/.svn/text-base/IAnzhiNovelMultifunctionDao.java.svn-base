package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
public interface IAnzhiNovelMultifunctionDao {
	public Pojo addAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction);
	public boolean addBatchAnzhiNovelMultifunction(List<AnzhiNovelMultifunction> list);
	public Pojo delAnzhiNovelMultifunction(int id);
	public Pojo updateAnzhiNovelMultifunction(int novelId,int actionType,int state,int newValue);
	public Pojo delAnzhiNovelMultifunction(int novelId,int memberId,int actionType);
	public boolean delBatchAnzhiNovelMultifunction(String ids);
	public Pojo updateAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction);
	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(int size,int pageNum,String condition);

}