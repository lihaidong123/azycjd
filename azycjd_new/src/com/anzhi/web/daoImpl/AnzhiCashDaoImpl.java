package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiCash;
import com.anzhi.web.dao.IAnzhiCashDao;
import java.util.Date;
@Repository
public class AnzhiCashDaoImpl extends ActionDb implements IAnzhiCashDao {
	public Pojo addAnzhiCash(AnzhiCash anzhicash){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_cash values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhicash.getMemberId(),
			anzhicash.getAnzhiMoneyRemaining(),
			anzhicash.getAnzhiMoneyCash(),
			anzhicash.getCashMoney(),
			anzhicash.getVote(),
			anzhicash.getState(),
			anzhicash.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiCash(List<AnzhiCash> list){
		return this.excuteBatchUpdate("insert into anzhi_cash values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiCash(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_cash where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiCash(String ids){
		return this.excuteBatchUpdate("delete from anzhi_cash where id=?",ids);
	}

	public Pojo updateAnzhiCash(AnzhiCash anzhicash){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_cash set member_id=?,anzhi_money_remaining=?,anzhi_money_cash=?,cash_money=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhicash.getMemberId(),
			anzhicash.getAnzhiMoneyRemaining(),
			anzhicash.getAnzhiMoneyCash(),
			anzhicash.getCashMoney(),
			anzhicash.getVote(),
			anzhicash.getState(),
			anzhicash.getAddTime()
		,	anzhicash.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiCash> findAnzhiCashAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiCash(),"anzhi_cash_view",size,pageNum,condition);
	}


}