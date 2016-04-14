package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiTrendReply;
import com.anzhi.web.dao.IAnzhiTrendReplyDao;
import java.util.Date;
@Repository
public class AnzhiTrendReplyDaoImpl extends ActionDb implements IAnzhiTrendReplyDao {
	public Pojo addAnzhiTrendReply(AnzhiTrendReply anzhitrendreply){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_trend_reply values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhitrendreply.getTrendId(),
			anzhitrendreply.getMemberId(),
			anzhitrendreply.getReplyContent(),
			anzhitrendreply.getFatherId(),
			anzhitrendreply.getAddTime(),
			anzhitrendreply.getState()
		});
		return pojo;
	}

	public boolean addBatchAnzhiTrendReply(List<AnzhiTrendReply> list){
		return this.excuteBatchUpdate("insert into anzhi_trend_reply values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiTrendReply(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_trend_reply where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiTrendReply(String ids){
		return this.excuteBatchUpdate("delete from anzhi_trend_reply where id=?",ids);
	}

	public Pojo updateAnzhiTrendReply(AnzhiTrendReply anzhitrendreply){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_trend_reply set trend_id=?,member_id=?,reply_content=?,father_id=?,add_time=?,state=? where id=?");
		pojo.setObj(new Object[]{
			anzhitrendreply.getTrendId(),
			anzhitrendreply.getMemberId(),
			anzhitrendreply.getReplyContent(),
			anzhitrendreply.getFatherId(),
			anzhitrendreply.getAddTime(),
			anzhitrendreply.getState()
		,	anzhitrendreply.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiTrendReply> findAnzhiTrendReplyAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiTrendReply(),"anzhi_trendreplymember_view",size,pageNum,condition);
	}


}