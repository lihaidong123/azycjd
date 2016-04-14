package com.anzhi.web.dao;
import java.util.List;

import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinNovel;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
public interface IAnzhiNovelDao {
	public Pojo addAnzhiNovel(AnzhiNovel anzhinovel);
	public boolean addBatchAnzhiNovel(List<AnzhiNovel> list);
	public Pojo delAnzhiNovel(int id);
	public boolean delBatchAnzhiNovel(String ids);
	public Pojo updateAnzhiNovel(AnzhiNovel anzhinovel);
	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField);
	public QueryList<AnzhiNovel> shuku(int size,int pageNum,String condition,String orderField);
	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField,String recommandPosition);
	public QueryList<AnzhiNovel> findAnzhiNovelPaiHangBang(int size,int pageNum,String condition,String tabName);
	public QueryList<AnzhiNovel> findAnzhiNovelYouHui(int size,int pageNum,String condition);
	public QueryList<AnzhiNovelMultiJoinNovel> findAnzhiNovelMultiJoinNovelAll(int size,int pageNum,String condition,String orderField);
	public QueryList<AnzhiNovel> findAnzhiNovelThirdRecommand(int size,int pageNum,String condition);
}