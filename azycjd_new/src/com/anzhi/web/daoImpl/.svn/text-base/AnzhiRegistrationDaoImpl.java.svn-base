package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiRegistration;
import com.anzhi.web.dao.IAnzhiRegistrationDao;
import java.util.Date;
@Repository
public class AnzhiRegistrationDaoImpl extends ActionDb implements IAnzhiRegistrationDao {
	public Pojo addAnzhiRegistration(AnzhiRegistration anzhiregistration){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_registration values(?,?,?)");
		pojo.setObj(new Object[]{
			anzhiregistration.getMemberId(),
			anzhiregistration.getAddTime(),
			anzhiregistration.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiRegistration(List<AnzhiRegistration> list){
		return this.excuteBatchUpdate("insert into anzhi_registration values(?,?,?)",list);
	}

	public Pojo delAnzhiRegistration(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_registration where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiRegistration(String ids){
		return this.excuteBatchUpdate("delete from anzhi_registration where id=?",ids);
	}

	public Pojo updateAnzhiRegistration(AnzhiRegistration anzhiregistration){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_registration set member_id=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhiregistration.getMemberId(),
			anzhiregistration.getAddTime(),
			anzhiregistration.getVote()
		,	anzhiregistration.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiRegistration> findAnzhiRegistrationAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiRegistration(),"anzhi_registration",size,pageNum,condition);
	}


}