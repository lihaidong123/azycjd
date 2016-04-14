package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiSystem;
import com.anzhi.web.dao.IAnzhiSystemDao;
import java.util.Date;
@Repository
public class AnzhiSystemDaoImpl extends ActionDb implements IAnzhiSystemDao {
	public Pojo addAnzhiSystem(AnzhiSystem anzhisystem){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_system values(?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhisystem.getAboutUs(),
			anzhisystem.getUserGuide(),
			anzhisystem.getAuthorProject(),
			anzhisystem.getTalentsWanted(),
			anzhisystem.getTouchUs(),
			anzhisystem.getChannelsCooperation(),
			anzhisystem.getEditArea(),
			anzhisystem.getCopyrightProtection(),
			anzhisystem.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiSystem(List<AnzhiSystem> list){
		return this.excuteBatchUpdate("insert into anzhi_system values(?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiSystem(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_system where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiSystem(String ids){
		return this.excuteBatchUpdate("delete from anzhi_system where id=?",ids);
	}

	public Pojo updateAnzhiSystem(AnzhiSystem anzhisystem){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_system set about_us=?,user_guide=?,author_project=?,talents_wanted=?,touch_us=?,channels_cooperation=?,edit_area=?,copyright_protection=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhisystem.getAboutUs(),
			anzhisystem.getUserGuide(),
			anzhisystem.getAuthorProject(),
			anzhisystem.getTalentsWanted(),
			anzhisystem.getTouchUs(),
			anzhisystem.getChannelsCooperation(),
			anzhisystem.getEditArea(),
			anzhisystem.getCopyrightProtection(),
			anzhisystem.getVote()
		,	anzhisystem.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiSystem> findAnzhiSystemAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiSystem(),"anzhi_system",size,pageNum,condition);
	}


}