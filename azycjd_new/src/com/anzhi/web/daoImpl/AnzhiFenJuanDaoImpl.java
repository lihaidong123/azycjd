package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.dao.IAnzhiFenJuanDao;
import java.util.Date;
@Repository
public class AnzhiFenJuanDaoImpl extends ActionDb implements IAnzhiFenJuanDao {
	public Pojo addAnzhiFenJuan(AnzhiFenJuan anzhifenjuan){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_fen_juan values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhifenjuan.getNovelId(),
			anzhifenjuan.getJuanName(),
			anzhifenjuan.getJuanVote(),
			anzhifenjuan.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiFenJuan(List<AnzhiFenJuan> list){
		return this.excuteBatchUpdate("insert into anzhi_fen_juan values(?,?,?,?)",list);
	}

	public Pojo delAnzhiFenJuan(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_fen_juan where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiFenJuan(String ids){
		return this.excuteBatchUpdate("delete from anzhi_fen_juan where id=?",ids);
	}

	public Pojo updateAnzhiFenJuan(AnzhiFenJuan anzhifenjuan){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_fen_juan set novel_id=?,juan_name=?,juan_vote=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhifenjuan.getNovelId(),
			anzhifenjuan.getJuanName(),
			anzhifenjuan.getJuanVote(),
			anzhifenjuan.getAddTime()
		,	anzhifenjuan.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiFenJuan> findAnzhiFenJuanAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiFenJuan(),"anzhi_fen_juan",size,pageNum,condition);
	}


}