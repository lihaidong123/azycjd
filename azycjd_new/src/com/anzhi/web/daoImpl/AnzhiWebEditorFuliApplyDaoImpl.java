package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorFuliApply;
import com.anzhi.web.dao.IAnzhiWebEditorFuliApplyDao;
@Repository
public class AnzhiWebEditorFuliApplyDaoImpl extends ActionDb implements IAnzhiWebEditorFuliApplyDao {
	public Pojo addAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_fuli_apply values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorfuliapply.getEditorId(),
			anzhiwebeditorfuliapply.getApplyName(),
			anzhiwebeditorfuliapply.getApplyVote(),
			anzhiwebeditorfuliapply.getApplyType(),
			anzhiwebeditorfuliapply.getState(),
			anzhiwebeditorfuliapply.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorFuliApply(List<AnzhiWebEditorFuliApply> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_fuli_apply values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorFuliApply(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_fuli_apply where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorFuliApply(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_fuli_apply where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_fuli_apply set editor_id=?,apply_name=?,apply_vote=?,apply_type=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorfuliapply.getEditorId(),
			anzhiwebeditorfuliapply.getApplyName(),
			anzhiwebeditorfuliapply.getApplyVote(),
			anzhiwebeditorfuliapply.getApplyType(),
			anzhiwebeditorfuliapply.getState(),
			anzhiwebeditorfuliapply.getAddTime()
		,	anzhiwebeditorfuliapply.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorFuliApply> findAnzhiWebEditorFuliApplyAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorFuliApply> ls=this.excuteQuery(new AnzhiWebEditorFuliApply(),"anzhi_web_editor_fuli_apply_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}