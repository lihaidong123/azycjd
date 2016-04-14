package com.anzhi.web.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinChapter;
import com.anzhi.web.pojo.ChapterSubscribeNum;
import com.anzhi.web.util.QueryList;
public interface IAnzhiChapterService {
	public boolean addAnzhiChapter(String path,AnzhiChapter anzhichapter);
	public boolean addBatchAnzhiChapter(List<AnzhiChapter> list);
	public boolean delAnzhiChapter(int id);
	public boolean delBatchAnzhiChapter(String ids);
	public boolean updateAnzhiChapter(String path,AnzhiChapter anzhichapter,int updateNum);
	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition);
	public QueryList<ChapterSubscribeNum> findChapterSubscribeNumAll(int size,int pageNum,String condition,int novelId);
	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition,String orderField);
	public void dingyuechaxu(HttpServletRequest request);
	public String cashRead(HttpServletRequest request,int chapterId,AnzhiMember am);
	public String loadBuyChapter(HttpServletRequest request,int chapterId,AnzhiMember am);
	public QueryList<AnzhiNovelMultiJoinChapter> findAnzhiNovelMultiJoinChapterAll(int size,int pageNum,String condition,String orderField);
	public String addSetChaptetVip(HttpServletRequest request);
	public File novelTxt(String path,int novelId);
}