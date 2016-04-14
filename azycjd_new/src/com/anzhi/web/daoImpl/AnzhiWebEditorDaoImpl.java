package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import java.util.Date;
@Repository
public class AnzhiWebEditorDaoImpl extends ActionDb implements IAnzhiWebEditorDao {
	public Pojo addAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditor.getEditorNo(),
			anzhiwebeditor.getEditorPassword(),
			anzhiwebeditor.getEditorJiebie(),
			anzhiwebeditor.getEditorName(),
			anzhiwebeditor.getEditorCode(),
			anzhiwebeditor.getEditorAddress(),
			anzhiwebeditor.getEditorTel(),
			anzhiwebeditor.getEditorQq(),
			anzhiwebeditor.getEditorScore(),
			anzhiwebeditor.getEditorLevel(),
			anzhiwebeditor.getEditorVote(),
			anzhiwebeditor.getEditorShifu(),
			anzhiwebeditor.getEditorHeadImg(),
			anzhiwebeditor.getState(),
			anzhiwebeditor.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditor(List<AnzhiWebEditor> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditor(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditor(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor where id=?",ids);
	}

	public Pojo updateAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor set editor_no=?,editor_password=?,editor_jiebie=?,editor_name=?,editor_code=?,editor_address=?,editor_tel=?,editor_qq=?,editor_score=?,editor_level=?,editor_vote=?,editor_shifu=?,editor_head_img=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditor.getEditorNo(),
			anzhiwebeditor.getEditorPassword(),
			anzhiwebeditor.getEditorJiebie(),
			anzhiwebeditor.getEditorName(),
			anzhiwebeditor.getEditorCode(),
			anzhiwebeditor.getEditorAddress(),
			anzhiwebeditor.getEditorTel(),
			anzhiwebeditor.getEditorQq(),
			anzhiwebeditor.getEditorScore(),
			anzhiwebeditor.getEditorLevel(),
			anzhiwebeditor.getEditorVote(),
			anzhiwebeditor.getEditorShifu(),
			anzhiwebeditor.getEditorHeadImg(),
			anzhiwebeditor.getState(),
			anzhiwebeditor.getAddTime()
		,	anzhiwebeditor.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditor> findAnzhiWebEditorAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiWebEditor(),"anzhi_web_editor",size,pageNum,condition);
	}

	public Pojo updateScore(int id, double addScore) {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor set editor_score=editor_score+? where id=?");
		pojo.setObj(new Object[]{
				addScore,
				id
		});
		return pojo;
	}


}