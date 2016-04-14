package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorChapterCheck;
import com.anzhi.web.dao.IAnzhiWebEditorChapterCheckDao;
@Repository
public class AnzhiWebEditorChapterCheckDaoImpl extends ActionDb implements IAnzhiWebEditorChapterCheckDao {
	public Pojo addAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_chapter_check values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorchaptercheck.getEditorId(),
			anzhiwebeditorchaptercheck.getChapterId(),
			anzhiwebeditorchaptercheck.getState(),
			anzhiwebeditorchaptercheck.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorChapterCheck(List<AnzhiWebEditorChapterCheck> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_chapter_check values(?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorChapterCheck(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_chapter_check where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorChapterCheck(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_chapter_check where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_chapter_check set editor_id=?,chapter_id=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorchaptercheck.getEditorId(),
			anzhiwebeditorchaptercheck.getChapterId(),
			anzhiwebeditorchaptercheck.getState(),
			anzhiwebeditorchaptercheck.getAddTime()
		,	anzhiwebeditorchaptercheck.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorChapterCheck> findAnzhiWebEditorChapterCheckAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorChapterCheck> ls=this.excuteQuery(new AnzhiWebEditorChapterCheck(),"anzhi_web_editor_chapter_check",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}