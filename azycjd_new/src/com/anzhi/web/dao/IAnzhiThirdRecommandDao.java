package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiThirdRecommand;
public interface IAnzhiThirdRecommandDao {
	public Pojo addAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand);
	public boolean addBatchAnzhiThirdRecommand(List<AnzhiThirdRecommand> list);
	public Pojo delAnzhiThirdRecommand(int id);
	public boolean delBatchAnzhiThirdRecommand(String ids);
	public Pojo updateAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand);
	public QueryList<AnzhiThirdRecommand> findAnzhiThirdRecommandAll(int size,int pageNum,String condition);

}