package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelReward;
public interface IAnzhiNovelRewardService {
	public boolean addAnzhiNovelReward(AnzhiNovelReward anzhinovelreward);
	public boolean addBatchAnzhiNovelReward(List<AnzhiNovelReward> list);
	public boolean delAnzhiNovelReward(int id);
	public boolean delBatchAnzhiNovelReward(String ids);
	public boolean updateAnzhiNovelReward(AnzhiNovelReward anzhinovelreward);
	public QueryList<AnzhiNovelReward> findAnzhiNovelRewardAll(int size,int pageNum,String condition);
	public String cashDaShang(HttpServletRequest request,AnzhiMember am,AnzhiNovelReward anzhinovelreward);
}