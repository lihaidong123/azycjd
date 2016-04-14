package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiTrend;
import com.anzhi.web.dao.IAnzhiTrendDao;
import java.util.Date;
@Repository
public class AnzhiTrendDaoImpl extends ActionDb implements IAnzhiTrendDao {
	public Pojo addAnzhiTrend(AnzhiTrend anzhitrend){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_trend values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhitrend.getMemberId(),
			anzhitrend.getTrendContent(),
			anzhitrend.getVote(),
			anzhitrend.getAddTime(),
			anzhitrend.getState()
		});
		return pojo;
	}

	public boolean addBatchAnzhiTrend(List<AnzhiTrend> list){
		return this.excuteBatchUpdate("insert into anzhi_trend values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiTrend(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_trend where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiTrend(String ids){
		return this.excuteBatchUpdate("delete from anzhi_trend where id=?",ids);
	}

	public Pojo updateAnzhiTrend(AnzhiTrend anzhitrend){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_trend set member_id=?,trend_content=?,vote=?,add_time=?,state=? where id=?");
		pojo.setObj(new Object[]{
			anzhitrend.getMemberId(),
			anzhitrend.getTrendContent(),
			anzhitrend.getVote(),
			anzhitrend.getAddTime(),
			anzhitrend.getState()
		,	anzhitrend.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiTrend> findAnzhiTrendAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiTrend(),"anzhi_trendmember_view",size,pageNum,condition);
	}


}