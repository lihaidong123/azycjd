package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiIllegalChar;
import com.anzhi.web.dao.IAnzhiIllegalCharDao;
import java.util.Date;
@Repository
public class AnzhiIllegalCharDaoImpl extends ActionDb implements IAnzhiIllegalCharDao {
	public Pojo addAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_illegal_char values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiillegalchar.getCharName(),
			anzhiillegalchar.getCharVote(),
			anzhiillegalchar.getState(),
			anzhiillegalchar.getAddMemberId(),
			anzhiillegalchar.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiIllegalChar(List<AnzhiIllegalChar> list){
		return this.excuteBatchUpdate("insert into anzhi_illegal_char values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiIllegalChar(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_illegal_char where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiIllegalChar(String ids){
		return this.excuteBatchUpdate("delete from anzhi_illegal_char where id=?",ids);
	}

	public Pojo updateAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_illegal_char set char_name=?,char_vote=?,state=?,add_member_id=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiillegalchar.getCharName(),
			anzhiillegalchar.getCharVote(),
			anzhiillegalchar.getState(),
			anzhiillegalchar.getAddMemberId(),
			anzhiillegalchar.getAddTime()
		,	anzhiillegalchar.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiIllegalChar> findAnzhiIllegalCharAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiIllegalChar(),"anzhi_illegal_char",size,pageNum,condition);
	}


}