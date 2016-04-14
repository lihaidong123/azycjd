package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiRecharge;
import com.anzhi.web.dao.IAnzhiRechargeDao;
import java.util.Date;
@Repository
public class AnzhiRechargeDaoImpl extends ActionDb implements IAnzhiRechargeDao {
	public Pojo addAnzhiRecharge(AnzhiRecharge anzhirecharge){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_recharge values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhirecharge.getMemberId(),
			anzhirecharge.getRechargeMoney(),
			anzhirecharge.getRechargeAnzhiMoney(),
			anzhirecharge.getBeforeBalance(),
			anzhirecharge.getAfterBalance(),
			anzhirecharge.getAddTime(),
			anzhirecharge.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiRecharge(List<AnzhiRecharge> list){
		return this.excuteBatchUpdate("insert into anzhi_recharge values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiRecharge(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_recharge where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiRecharge(String ids){
		return this.excuteBatchUpdate("delete from anzhi_recharge where id=?",ids);
	}

	public Pojo updateAnzhiRecharge(AnzhiRecharge anzhirecharge){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_recharge set member_id=?,recharge_money=?,recharge_anzhi_money=?,before_balance=?,after_balance=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhirecharge.getMemberId(),
			anzhirecharge.getRechargeMoney(),
			anzhirecharge.getRechargeAnzhiMoney(),
			anzhirecharge.getBeforeBalance(),
			anzhirecharge.getAfterBalance(),
			anzhirecharge.getAddTime(),
			anzhirecharge.getVote()
		,	anzhirecharge.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiRecharge> findAnzhiRechargeAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiRecharge(),"anzhi_rechargemember",size,pageNum,condition);
	}


}