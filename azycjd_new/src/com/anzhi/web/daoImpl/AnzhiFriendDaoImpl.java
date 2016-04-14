package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiFriend;
import com.anzhi.web.dao.IAnzhiFriendDao;
import java.util.Date;
@Repository
public class AnzhiFriendDaoImpl extends ActionDb implements IAnzhiFriendDao {
	public Pojo addAnzhiFriend(AnzhiFriend anzhifriend){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_friend values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhifriend.getMemberId(),
			anzhifriend.getFriendMemberId(),
			anzhifriend.getAddTime(),
			anzhifriend.getState()
		});
		return pojo;
	}

	public boolean addBatchAnzhiFriend(List<AnzhiFriend> list){
		return this.excuteBatchUpdate("insert into anzhi_friend values(?,?,?,?)",list);
	}

	public Pojo delAnzhiFriend(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_friend where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiFriend(String ids){
		return this.excuteBatchUpdate("delete from anzhi_friend where id=?",ids);
	}

	public Pojo updateAnzhiFriend(AnzhiFriend anzhifriend){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_friend set member_id=?,friend_member_id=?,add_time=?,state=? where id=?");
		pojo.setObj(new Object[]{
			anzhifriend.getMemberId(),
			anzhifriend.getFriendMemberId(),
			anzhifriend.getAddTime(),
			anzhifriend.getState()
		,	anzhifriend.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiFriend> findAnzhiFriendAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiFriend(),"anzhi_friend",size,pageNum,condition);
	}

	public Pojo delMyAnzhiFriend(int myid, int myfriendid) {
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_friend where member_id=? and friend_member_id=?");
		pojo.setObj(new Object[]{myid,myfriendid});
		return pojo;
	}


}