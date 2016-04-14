package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiCooperation;
import com.anzhi.web.dao.IAnzhiCooperationDao;
import java.util.Date;
@Repository
public class AnzhiCooperationDaoImpl extends ActionDb implements IAnzhiCooperationDao {
	public Pojo addAnzhiCooperation(AnzhiCooperation anzhicooperation){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_cooperation values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhicooperation.getCooperationUnit(),
			anzhicooperation.getCooperationUrl(),
			anzhicooperation.getCooperationImg(),
			anzhicooperation.getVote(),
			anzhicooperation.getState(),
			anzhicooperation.getAddMemberId(),
			anzhicooperation.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiCooperation(List<AnzhiCooperation> list){
		return this.excuteBatchUpdate("insert into anzhi_cooperation values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiCooperation(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_cooperation where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiCooperation(String ids){
		return this.excuteBatchUpdate("delete from anzhi_cooperation where id=?",ids);
	}

	public Pojo updateAnzhiCooperation(AnzhiCooperation anzhicooperation){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_cooperation set cooperation_unit=?,cooperation_url=?,cooperation_img=?,vote=?,state=?,add_member_id=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhicooperation.getCooperationUnit(),
			anzhicooperation.getCooperationUrl(),
			anzhicooperation.getCooperationImg(),
			anzhicooperation.getVote(),
			anzhicooperation.getState(),
			anzhicooperation.getAddMemberId(),
			anzhicooperation.getAddTime()
		,	anzhicooperation.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiCooperation> findAnzhiCooperationAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiCooperation(),"anzhi_cooperation",size,pageNum,condition);
	}


}