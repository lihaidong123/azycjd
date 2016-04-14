package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinNovel;
import com.anzhi.web.pojo.NovelFansList;
import com.anzhi.web.util.QueryList;
public interface IAnzhiNovelService {
	public int addAnzhiNovel(HttpServletRequest request,AnzhiNovel anzhinovel);
	public boolean addBatchAnzhiNovel(List<AnzhiNovel> list);
	public boolean delAnzhiNovel(int id);
	public boolean delBatchAnzhiNovel(String ids);
	public boolean updateAnzhiNovel(HttpServletRequest request,AnzhiNovel anzhinovel,boolean con,String novelTile);
	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField);
	public JSONObject getNovelMoreData(HttpServletRequest request,int novelId,int memberId);
	public void loadSameTypeNovel(HttpServletRequest request,int novelId);
	public void loadDaShangJsp(HttpServletRequest request,AnzhiMember am);
	public String recommand(HttpServletRequest request);
	public void leaderboard(HttpServletRequest request);
	public void createPaiHangBangJsp(String path,HttpServletRequest request);
	public void morePahangbang(HttpServletRequest request);
	public void youhuishufang(HttpServletRequest request);
	public void createNovel(String path,int novelId);
	public QueryList<AnzhiNovelMultiJoinNovel> findAnzhiNovelMultiJoinNovelAll(int size,int pageNum,String condition,String orderField);
	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField,String recommandPosition);
	public String index(HttpServletRequest request);
	public void lineNewproject(HttpServletRequest request);
	public JSONObject loadNeedDoTaskNum(HttpServletRequest request);
	public QueryList<AnzhiNovel> shuku(int size, int pageNum, String condition,
			String orderField);
	public void findAnzhiNovelManage(HttpServletRequest request,int size,int pageNum,String condition,String orderField);
	public List<NovelFansList> findmoreFanSi(int novelId);
	public QueryList<AnzhiNovel> findAnzhiNovelThirdRecommand(int size,int pageNum,String condition);
}