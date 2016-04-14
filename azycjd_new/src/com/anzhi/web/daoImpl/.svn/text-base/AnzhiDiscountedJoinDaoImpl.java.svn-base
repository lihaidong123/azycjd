package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.dao.IAnzhiDiscountedJoinDao;
import java.util.Date;
@Repository
public class AnzhiDiscountedJoinDaoImpl extends ActionDb implements IAnzhiDiscountedJoinDao {
	public Pojo addAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_discounted_join values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhidiscountedjoin.getDiscountedId(),
			anzhidiscountedjoin.getMemberId(),
			anzhidiscountedjoin.getVote(),
			anzhidiscountedjoin.getState(),
			anzhidiscountedjoin.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiDiscountedJoin(List<AnzhiDiscountedJoin> list){
		return this.excuteBatchUpdate("insert into anzhi_discounted_join values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiDiscountedJoin(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_discounted_join where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiDiscountedJoin(String ids){
		return this.excuteBatchUpdate("delete from anzhi_discounted_join where id=?",ids);
	}

	public Pojo updateAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_discounted_join set discounted_id=?,member_id=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhidiscountedjoin.getDiscountedId(),
			anzhidiscountedjoin.getMemberId(),
			anzhidiscountedjoin.getVote(),
			anzhidiscountedjoin.getState(),
			anzhidiscountedjoin.getAddTime()
		,	anzhidiscountedjoin.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiDiscountedJoin> findAnzhiDiscountedJoinAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiDiscountedJoin(),"anzhi_discounted_join",size,pageNum,condition);
	}


}