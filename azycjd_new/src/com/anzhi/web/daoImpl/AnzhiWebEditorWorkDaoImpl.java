package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorWork;
import com.anzhi.web.dao.IAnzhiWebEditorWorkDao;
import java.util.Date;
@Repository
public class AnzhiWebEditorWorkDaoImpl extends ActionDb implements IAnzhiWebEditorWorkDao {
	public Pojo addAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_work values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorwork.getEditorId(),
			anzhiwebeditorwork.getWorkName(),
			anzhiwebeditorwork.getWorkVote(),
			anzhiwebeditorwork.getWorkUrl(),
			anzhiwebeditorwork.getState(),
			anzhiwebeditorwork.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorWork(List<AnzhiWebEditorWork> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_work values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorWork(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_work where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorWork(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_work where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_work set editor_id=?,work_name=?,work_vote=?,work_url=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorwork.getEditorId(),
			anzhiwebeditorwork.getWorkName(),
			anzhiwebeditorwork.getWorkVote(),
			anzhiwebeditorwork.getWorkUrl(),
			anzhiwebeditorwork.getState(),
			anzhiwebeditorwork.getAddTime()
		,	anzhiwebeditorwork.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorWork> findAnzhiWebEditorWorkAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorWork> ls=this.excuteQuery(new AnzhiWebEditorWork(),"anzhi_web_editor_work_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}