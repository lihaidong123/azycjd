package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiMoneyApplyRecord;
import com.anzhi.web.dao.IAnzhiMoneyApplyRecordDao;
import java.util.Date;
@Repository
public class AnzhiMoneyApplyRecordDaoImpl extends ActionDb implements IAnzhiMoneyApplyRecordDao {
	public Pojo addAnzhiMoneyApplyRecord(AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_money_apply_record values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhimoneyapplyrecord.getMemberId(),
			anzhimoneyapplyrecord.getChongMoney(),
			anzhimoneyapplyrecord.getOrderNo(),
			anzhimoneyapplyrecord.getState(),
			anzhimoneyapplyrecord.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiMoneyApplyRecord(List<AnzhiMoneyApplyRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_money_apply_record values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiMoneyApplyRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_money_apply_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiMoneyApplyRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_money_apply_record where id=?",ids);
	}

	public Pojo updateAnzhiMoneyApplyRecord(AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_money_apply_record set member_id=?,chong_money=?,order_no=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhimoneyapplyrecord.getMemberId(),
			anzhimoneyapplyrecord.getChongMoney(),
			anzhimoneyapplyrecord.getOrderNo(),
			anzhimoneyapplyrecord.getState(),
			anzhimoneyapplyrecord.getAddTime()
		,	anzhimoneyapplyrecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiMoneyApplyRecord> findAnzhiMoneyApplyRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiMoneyApplyRecord(),"anzhi_money_apply_record",size,pageNum,condition);
	}


}