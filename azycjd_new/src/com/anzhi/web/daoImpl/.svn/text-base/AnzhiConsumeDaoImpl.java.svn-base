package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import java.util.Date;
@Repository
public class AnzhiConsumeDaoImpl extends ActionDb implements IAnzhiConsumeDao {
	public Pojo addAnzhiConsume(AnzhiConsume anzhiconsume){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_consume values(?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiconsume.getMemberId(),
			anzhiconsume.getConsumeAnzhiMoney(),
			anzhiconsume.getTableId(),
			anzhiconsume.getTableType(),
			anzhiconsume.getConsumeType(),
			anzhiconsume.getConsumeTime(),
			anzhiconsume.getConsumeBeforeMoney(),
			anzhiconsume.getConsumeAfterMoney(),
			anzhiconsume.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiConsume(List<AnzhiConsume> list){
		return this.excuteBatchUpdate("insert into anzhi_consume values(?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiConsume(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_consume where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiConsume(String ids){
		return this.excuteBatchUpdate("delete from anzhi_consume where id=?",ids);
	}

	public Pojo updateAnzhiConsume(AnzhiConsume anzhiconsume){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_consume set member_id=?,consume_anzhi_money=?,table_id=?,table_type=?,consume_type=?,consume_time=?,consume_before_money=?,consume_after_money=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhiconsume.getMemberId(),
			anzhiconsume.getConsumeAnzhiMoney(),
			anzhiconsume.getTableId(),
			anzhiconsume.getTableType(),
			anzhiconsume.getConsumeType(),
			anzhiconsume.getConsumeTime(),
			anzhiconsume.getConsumeBeforeMoney(),
			anzhiconsume.getConsumeAfterMoney(),
			anzhiconsume.getVote()
		,	anzhiconsume.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiConsume(),"anzhi_consumenovel_view",size,pageNum,condition);
	}


}