package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiThirdRecommand;
import com.anzhi.web.dao.IAnzhiThirdRecommandDao;
import java.util.Date;
@Repository
public class AnzhiThirdRecommandDaoImpl extends ActionDb implements IAnzhiThirdRecommandDao {
	public Pojo addAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_third_recommand values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhithirdrecommand.getNovelId(),
			anzhithirdrecommand.getThirdType(),
			anzhithirdrecommand.getRecommandVote(),
			anzhithirdrecommand.getRecommandState(),
			anzhithirdrecommand.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiThirdRecommand(List<AnzhiThirdRecommand> list){
		return this.excuteBatchUpdate("insert into anzhi_third_recommand values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiThirdRecommand(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_third_recommand where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiThirdRecommand(String ids){
		return this.excuteBatchUpdate("delete from anzhi_third_recommand where id=?",ids);
	}

	public Pojo updateAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_third_recommand set novel_id=?,third_type=?,recommand_vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhithirdrecommand.getNovelId(),
			anzhithirdrecommand.getThirdType(),
			anzhithirdrecommand.getRecommandVote(),
			anzhithirdrecommand.getState(),
			anzhithirdrecommand.getAddTime()
		,	anzhithirdrecommand.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiThirdRecommand> findAnzhiThirdRecommandAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiThirdRecommand(),"anzhi_third_recommand_view",size,pageNum,condition);
	}


}