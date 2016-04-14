package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.dao.IAnzhiCommentDao;
import java.util.Date;
@Repository
public class AnzhiCommentDaoImpl extends ActionDb implements IAnzhiCommentDao {
	public Pojo addAnzhiComment(AnzhiComment anzhicomment){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_comment values(?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhicomment.getMemberId(),
			anzhicomment.getTableId(),
			anzhicomment.getCommentTitle(),
			anzhicomment.getCommentContent(),
			anzhicomment.getCommentType(),
			anzhicomment.getCommentFatherid(),
			anzhicomment.getState(),
			anzhicomment.getAddTime(),
			anzhicomment.getIsTop(),
			anzhicomment.getIsMarrow(),
			anzhicomment.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiComment(List<AnzhiComment> list){
		return this.excuteBatchUpdate("insert into anzhi_comment values(?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiComment(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_comment where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiComment(String ids){
		return this.excuteBatchUpdate("delete from anzhi_comment where id=?",ids);
	}

	public Pojo updateAnzhiComment(AnzhiComment anzhicomment){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_comment set member_id=?,table_id=?,comment_title=?,comment_content=?,comment_type=?,comment_fatherid=?,state=?,add_time=?,is_top=?,is_marrow=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhicomment.getMemberId(),
			anzhicomment.getTableId(),
			anzhicomment.getCommentTitle(),
			anzhicomment.getCommentContent(),
			anzhicomment.getCommentType(),
			anzhicomment.getCommentFatherid(),
			anzhicomment.getState(),
			anzhicomment.getAddTime(),
			anzhicomment.getIsTop(),
			anzhicomment.getIsMarrow(),
			anzhicomment.getVote()
		,	anzhicomment.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiComment(),"anzhi_comment_view",size,pageNum,condition);
	}

	public QueryList<AnzhiComment> findAnzhiCommentAll(int size, int pageNum,
			String condition, String orderField) {
		return this.excuteQuery(new AnzhiComment(),"anzhi_comment_view",size,pageNum,condition,orderField);
	}


}