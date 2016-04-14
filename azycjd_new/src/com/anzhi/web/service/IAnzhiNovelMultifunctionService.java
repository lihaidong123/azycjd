package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
public interface IAnzhiNovelMultifunctionService {
	public boolean addAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction);
	public boolean saveAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction);
	public boolean addBatchAnzhiNovelMultifunction(List<AnzhiNovelMultifunction> list);
	public boolean delAnzhiNovelMultifunction(int id);
	public boolean delBatchAnzhiNovelMultifunction(String ids);
	public boolean updateAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction);
	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(int size,int pageNum,String condition);
	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(int size,int pageNum,String condition,int type,int loginid);
	public boolean delAnzhiNovelMultifunction(int novelId, int memberId,
			int actionType);
}