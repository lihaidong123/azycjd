package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyRecord;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyRecordDao;
import java.util.Date;
@Repository
public class AnzhiNovelReadMoneyRecordDaoImpl extends ActionDb implements IAnzhiNovelReadMoneyRecordDao {
	public Pojo addAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_read_money_record values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovelreadmoneyrecord.getMemberId(),
			anzhinovelreadmoneyrecord.getReadMoney(),
			anzhinovelreadmoneyrecord.getVote(),
			anzhinovelreadmoneyrecord.getState(),
			anzhinovelreadmoneyrecord.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelReadMoneyRecord(List<AnzhiNovelReadMoneyRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_read_money_record values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelReadMoneyRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_read_money_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelReadMoneyRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_read_money_record where id=?",ids);
	}

	public Pojo updateAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_read_money_record set member_id=?,read_money=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovelreadmoneyrecord.getMemberId(),
			anzhinovelreadmoneyrecord.getReadMoney(),
			anzhinovelreadmoneyrecord.getVote(),
			anzhinovelreadmoneyrecord.getState(),
			anzhinovelreadmoneyrecord.getAddTime()
		,	anzhinovelreadmoneyrecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelReadMoneyRecord> findAnzhiNovelReadMoneyRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelReadMoneyRecord(),"anzhi_novel_read_money_record_view",size,pageNum,condition);
	}


}