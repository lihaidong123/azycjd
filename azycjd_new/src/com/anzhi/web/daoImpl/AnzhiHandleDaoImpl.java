package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiHandle;
import com.anzhi.web.dao.IAnzhiHandleDao;
import java.util.Date;
@Repository
public class AnzhiHandleDaoImpl extends ActionDb implements IAnzhiHandleDao {
	public Pojo addAnzhiHandle(AnzhiHandle anzhihandle){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_handle values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhihandle.getTableId(),
			anzhihandle.getHandleType(),
			anzhihandle.getHandleVote(),
			anzhihandle.getHandleResult(),
			anzhihandle.getState(),
			anzhihandle.getAddTime(),
			anzhihandle.getAddMemberId()
		});
		return pojo;
	}

	public boolean addBatchAnzhiHandle(List<AnzhiHandle> list){
		return this.excuteBatchUpdate("insert into anzhi_handle values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiHandle(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_handle where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiHandle(String ids){
		return this.excuteBatchUpdate("delete from anzhi_handle where id=?",ids);
	}

	public Pojo updateAnzhiHandle(AnzhiHandle anzhihandle){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_handle set table_id=?,handle_type=?,handle_vote=?,handle_result=?,state=?,add_time=?,add_member_id=? where id=?");
		pojo.setObj(new Object[]{
			anzhihandle.getTableId(),
			anzhihandle.getHandleType(),
			anzhihandle.getHandleVote(),
			anzhihandle.getHandleResult(),
			anzhihandle.getState(),
			anzhihandle.getAddTime(),
			anzhihandle.getAddMemberId()
		,	anzhihandle.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiHandle> findAnzhiHandleAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiHandle(),"anzhi_handle_view",size,pageNum,condition);
	}


}