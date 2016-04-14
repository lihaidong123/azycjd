package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorAuthor;
import com.anzhi.web.dao.IAnzhiWebEditorAuthorDao;
@Repository
public class AnzhiWebEditorAuthorDaoImpl extends ActionDb implements IAnzhiWebEditorAuthorDao {
	public Pojo addAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_author values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorauthor.getEditorId(),
			anzhiwebeditorauthor.getNovelId(),
			anzhiwebeditorauthor.getVote(),
			anzhiwebeditorauthor.getState(),
			anzhiwebeditorauthor.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorAuthor(List<AnzhiWebEditorAuthor> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_author values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorAuthor(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_author where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorAuthor(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_author where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_author set editor_id=?,novel_id=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorauthor.getEditorId(),
			anzhiwebeditorauthor.getNovelId(),
			anzhiwebeditorauthor.getVote(),
			anzhiwebeditorauthor.getState(),
			anzhiwebeditorauthor.getAddTime()
		,	anzhiwebeditorauthor.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorAuthor> findAnzhiWebEditorAuthorAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorAuthor> ls=this.excuteQuery(new AnzhiWebEditorAuthor(),"anzhi_web_editor_author_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}