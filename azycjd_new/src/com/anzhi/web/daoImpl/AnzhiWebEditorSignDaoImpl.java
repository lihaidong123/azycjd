package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorSign;
import com.anzhi.web.dao.IAnzhiWebEditorSignDao;
@Repository
public class AnzhiWebEditorSignDaoImpl extends ActionDb implements IAnzhiWebEditorSignDao {
	public Pojo addAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_sign values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorsign.getEditorId(),
			anzhiwebeditorsign.getSignVote(),
			anzhiwebeditorsign.getState(),
			anzhiwebeditorsign.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorSign(List<AnzhiWebEditorSign> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_sign values(?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorSign(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_sign where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorSign(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_sign where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_sign set editor_id=?,sign_vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorsign.getEditorId(),
			anzhiwebeditorsign.getSignVote(),
			anzhiwebeditorsign.getState(),
			anzhiwebeditorsign.getAddTime()
		,	anzhiwebeditorsign.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorSign> findAnzhiWebEditorSignAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorSign> ls=this.excuteQuery(new AnzhiWebEditorSign(),"anzhi_web_editor_sign_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}