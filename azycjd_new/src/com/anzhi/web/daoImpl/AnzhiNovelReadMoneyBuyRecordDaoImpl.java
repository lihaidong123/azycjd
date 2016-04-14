package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyBuyRecordDao;
import java.util.Date;
@Repository
public class AnzhiNovelReadMoneyBuyRecordDaoImpl extends ActionDb implements IAnzhiNovelReadMoneyBuyRecordDao {
	public Pojo addAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_read_money_buy_record values(?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovelreadmoneybuyrecord.getChapterId(),
			anzhinovelreadmoneybuyrecord.getMemberId(),
			anzhinovelreadmoneybuyrecord.getUserMoney(),
			anzhinovelreadmoneybuyrecord.getBeforeReadMoney(),
			anzhinovelreadmoneybuyrecord.getAfterReadMoney(),
			anzhinovelreadmoneybuyrecord.getVote(),
			anzhinovelreadmoneybuyrecord.getState(),
			anzhinovelreadmoneybuyrecord.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelReadMoneyBuyRecord(List<AnzhiNovelReadMoneyBuyRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_read_money_buy_record values(?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelReadMoneyBuyRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_read_money_buy_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelReadMoneyBuyRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_read_money_buy_record where id=?",ids);
	}

	public Pojo updateAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_read_money_buy_record set chapter_id=?,member_id=?,user_money=?,before_read_money=?,after_read_money=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovelreadmoneybuyrecord.getChapterId(),
			anzhinovelreadmoneybuyrecord.getMemberId(),
			anzhinovelreadmoneybuyrecord.getUserMoney(),
			anzhinovelreadmoneybuyrecord.getBeforeReadMoney(),
			anzhinovelreadmoneybuyrecord.getAfterReadMoney(),
			anzhinovelreadmoneybuyrecord.getVote(),
			anzhinovelreadmoneybuyrecord.getState(),
			anzhinovelreadmoneybuyrecord.getAddTime()
		,	anzhinovelreadmoneybuyrecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelReadMoneyBuyRecord> findAnzhiNovelReadMoneyBuyRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelReadMoneyBuyRecord(),"anzhi_novel_read_money_buy_record",size,pageNum,condition);
	}


}