package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorTuijian;
import com.anzhi.web.dao.IAnzhiWebEditorTuijianDao;
@Repository
public class AnzhiWebEditorTuijianDaoImpl extends ActionDb implements IAnzhiWebEditorTuijianDao {
	public Pojo addAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_tuijian values(?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditortuijian.getEditorId(),
			anzhiwebeditortuijian.getTuijianName(),
			anzhiwebeditortuijian.getTuijianVote(),
			anzhiwebeditortuijian.getTuijianUrl(),
			anzhiwebeditortuijian.getIsJiajing(),
			anzhiwebeditortuijian.getIsHot(),
			anzhiwebeditortuijian.getState(),
			anzhiwebeditortuijian.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorTuijian(List<AnzhiWebEditorTuijian> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_tuijian values(?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorTuijian(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_tuijian where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorTuijian(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_tuijian where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_tuijian set editor_id=?,tuijian_name=?,tuijian_vote=?,tuijian_url=?,is_jiajing=?,is_hot=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditortuijian.getEditorId(),
			anzhiwebeditortuijian.getTuijianName(),
			anzhiwebeditortuijian.getTuijianVote(),
			anzhiwebeditortuijian.getTuijianUrl(),
			anzhiwebeditortuijian.getIsJiajing(),
			anzhiwebeditortuijian.getIsHot(),
			anzhiwebeditortuijian.getState(),
			anzhiwebeditortuijian.getAddTime()
		,	anzhiwebeditortuijian.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorTuijian> findAnzhiWebEditorTuijianAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorTuijian> ls=this.excuteQuery(new AnzhiWebEditorTuijian(),"anzhi_web_editor_tuijian_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}