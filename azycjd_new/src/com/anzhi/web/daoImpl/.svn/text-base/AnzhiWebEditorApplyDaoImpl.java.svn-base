package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorApply;
import com.anzhi.web.dao.IAnzhiWebEditorApplyDao;
import java.util.Date;
@Repository
public class AnzhiWebEditorApplyDaoImpl extends ActionDb implements IAnzhiWebEditorApplyDao {
	public Pojo addAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_apply values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorapply.getMemberId(),
			anzhiwebeditorapply.getXingming(),
			anzhiwebeditorapply.getXingbie(),
			anzhiwebeditorapply.getBianjiming(),
			anzhiwebeditorapply.getQq(),
			anzhiwebeditorapply.getTel(),
			anzhiwebeditorapply.getBirthdays(),
			anzhiwebeditorapply.getShengfenzhenghao(),
			anzhiwebeditorapply.getZhiye(),
			anzhiwebeditorapply.getVote(),
			anzhiwebeditorapply.getEditorVote(),
			anzhiwebeditorapply.getState(),
			anzhiwebeditorapply.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorApply(List<AnzhiWebEditorApply> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_apply values(?,?,?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorApply(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_apply where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorApply(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_apply where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_apply set member_id=?,xingming=?,xingbie=?,bianjiming=?,qq=?,tel=?,birthdays=?,shengfenzhenghao=?,zhiye=?,vote=?,editor_vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorapply.getMemberId(),
			anzhiwebeditorapply.getXingming(),
			anzhiwebeditorapply.getXingbie(),
			anzhiwebeditorapply.getBianjiming(),
			anzhiwebeditorapply.getQq(),
			anzhiwebeditorapply.getTel(),
			anzhiwebeditorapply.getBirthdays(),
			anzhiwebeditorapply.getShengfenzhenghao(),
			anzhiwebeditorapply.getZhiye(),
			anzhiwebeditorapply.getVote(),
			anzhiwebeditorapply.getEditorVote(),
			anzhiwebeditorapply.getState(),
			anzhiwebeditorapply.getAddTime()
		,	anzhiwebeditorapply.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorApply> findAnzhiWebEditorApplyAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiWebEditorApply(),"anzhi_web_editor_apply_view",size,pageNum,condition);
	}


}