package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelReward;
public interface IAnzhiNovelRewardDao {
	public Pojo addAnzhiNovelReward(AnzhiNovelReward anzhinovelreward);
	public boolean addBatchAnzhiNovelReward(List<AnzhiNovelReward> list);
	public Pojo delAnzhiNovelReward(int id);
	public boolean delBatchAnzhiNovelReward(String ids);
	public Pojo updateAnzhiNovelReward(AnzhiNovelReward anzhinovelreward);
	public QueryList<AnzhiNovelReward> findAnzhiNovelRewardAll(int size,int pageNum,String condition);

}