package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiReport;
import com.anzhi.web.dao.IAnzhiReportDao;
import java.util.Date;
@Repository
public class AnzhiReportDaoImpl extends ActionDb implements IAnzhiReportDao {
	public Pojo addAnzhiReport(AnzhiReport anzhireport){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_report values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhireport.getTableId(),
			anzhireport.getTableType(),
			anzhireport.getReportReason(),
			anzhireport.getReportVote(),
			anzhireport.getState(),
			anzhireport.getAddTime(),
			anzhireport.getAddMemberId()
		});
		return pojo;
	}

	public boolean addBatchAnzhiReport(List<AnzhiReport> list){
		return this.excuteBatchUpdate("insert into anzhi_report values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiReport(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_report where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiReport(String ids){
		return this.excuteBatchUpdate("delete from anzhi_report where id=?",ids);
	}

	public Pojo updateAnzhiReport(AnzhiReport anzhireport){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_report set table_id=?,table_type=?,report_reason=?,report_vote=?,state=?,add_time=?,add_member_id=? where id=?");
		pojo.setObj(new Object[]{
			anzhireport.getTableId(),
			anzhireport.getTableType(),
			anzhireport.getReportReason(),
			anzhireport.getReportVote(),
			anzhireport.getState(),
			anzhireport.getAddTime(),
			anzhireport.getAddMemberId()
		,	anzhireport.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiReport> findAnzhiReportAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiReport(),"anzhi_report_view",size,pageNum,condition);
	}


}