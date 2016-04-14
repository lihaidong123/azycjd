package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiInteractive;
import com.anzhi.web.dao.IAnzhiInteractiveDao;
import java.util.Date;
@Repository
public class AnzhiInteractiveDaoImpl extends ActionDb implements IAnzhiInteractiveDao {
	public Pojo addAnzhiInteractive(AnzhiInteractive anzhiinteractive){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_interactive values(?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiinteractive.getMemberId(),
			anzhiinteractive.getInteractiveTitle(),
			anzhiinteractive.getInteractiveContent(),
			anzhiinteractive.getInteractiveType(),
			anzhiinteractive.getReplyContent(),
			anzhiinteractive.getReplyTitle(),
			anzhiinteractive.getReplyMemberId(),
			anzhiinteractive.getReplyTime(),
			anzhiinteractive.getState(),
			anzhiinteractive.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiInteractive(List<AnzhiInteractive> list){
		return this.excuteBatchUpdate("insert into anzhi_interactive values(?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiInteractive(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_interactive where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiInteractive(String ids){
		return this.excuteBatchUpdate("delete from anzhi_interactive where id=?",ids);
	}

	public Pojo updateAnzhiInteractive(AnzhiInteractive anzhiinteractive){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_interactive set member_id=?,interactive_title=?,interactive_content=?,interactive_type=?,reply_content=?,reply_title=?,reply_member_id=?,reply_time=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiinteractive.getMemberId(),
			anzhiinteractive.getInteractiveTitle(),
			anzhiinteractive.getInteractiveContent(),
			anzhiinteractive.getInteractiveType(),
			anzhiinteractive.getReplyContent(),
			anzhiinteractive.getReplyTitle(),
			anzhiinteractive.getReplyMemberId(),
			anzhiinteractive.getReplyTime(),
			anzhiinteractive.getState(),
			anzhiinteractive.getAddTime()
		,	anzhiinteractive.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiInteractive> findAnzhiInteractiveAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiInteractive(),"anzhi_interactive_member",size,pageNum,condition);
	}


}