package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
import com.anzhi.web.dao.IAnzhiWebEditorMessageDao;
import java.util.Date;
@Repository
public class AnzhiWebEditorMessageDaoImpl extends ActionDb implements IAnzhiWebEditorMessageDao {
	public Pojo addAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_message values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditormessage.getEditorId(),
			anzhiwebeditormessage.getTypes(),
			anzhiwebeditormessage.getMessContent(),
			anzhiwebeditormessage.getVote(),
			anzhiwebeditormessage.getState(),
			anzhiwebeditormessage.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorMessage(List<AnzhiWebEditorMessage> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_message values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorMessage(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_message where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorMessage(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_message where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_message set editor_id=?,types=?,mess_content=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditormessage.getEditorId(),
			anzhiwebeditormessage.getTypes(),
			anzhiwebeditormessage.getMessContent(),
			anzhiwebeditormessage.getVote(),
			anzhiwebeditormessage.getState(),
			anzhiwebeditormessage.getAddTime()
		,	anzhiwebeditormessage.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorMessage> findAnzhiWebEditorMessageAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiWebEditorMessage(),"anzhi_web_editor_message",size,pageNum,condition);
	}

	public Pojo updateAnzhiWebEditorMessage(int editorId) {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_message set state=0 where editor_id=?");
		pojo.setObj(new Object[]{
			editorId
		});
		return pojo;
	}


}