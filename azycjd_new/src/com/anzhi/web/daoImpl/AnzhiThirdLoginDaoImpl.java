package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiThirdLogin;
import com.anzhi.web.dao.IAnzhiThirdLoginDao;
import java.util.Date;
@Repository
public class AnzhiThirdLoginDaoImpl extends ActionDb implements IAnzhiThirdLoginDao {
	public Pojo addAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_third_login values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhithirdlogin.getMemberId(),
			anzhithirdlogin.getThirdLoginPid(),
			anzhithirdlogin.getThirdLoginType(),
			anzhithirdlogin.getState(),
			anzhithirdlogin.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiThirdLogin(List<AnzhiThirdLogin> list){
		return this.excuteBatchUpdate("insert into anzhi_third_login values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiThirdLogin(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_third_login where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiThirdLogin(String ids){
		return this.excuteBatchUpdate("delete from anzhi_third_login where id=?",ids);
	}

	public Pojo updateAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_third_login set member_id=?,third_login_pid=?,third_login_type=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhithirdlogin.getMemberId(),
			anzhithirdlogin.getThirdLoginPid(),
			anzhithirdlogin.getThirdLoginType(),
			anzhithirdlogin.getState(),
			anzhithirdlogin.getAddTime()
		,	anzhithirdlogin.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiThirdLogin> findAnzhiThirdLoginAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiThirdLogin(),"anzhi_third_login",size,pageNum,condition);
	}


}