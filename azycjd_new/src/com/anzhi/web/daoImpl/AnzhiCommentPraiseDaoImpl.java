package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiCommentPraise;
import com.anzhi.web.dao.IAnzhiCommentPraiseDao;
import java.util.Date;
@Repository
public class AnzhiCommentPraiseDaoImpl extends ActionDb implements IAnzhiCommentPraiseDao {
	public Pojo addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_comment_praise values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhicommentpraise.getCommentId(),
			anzhicommentpraise.getNovelId(),
			anzhicommentpraise.getChapterId(),
			anzhicommentpraise.getMemberId(),
			anzhicommentpraise.getState(),
			anzhicommentpraise.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiCommentPraise(List<AnzhiCommentPraise> list){
		return this.excuteBatchUpdate("insert into anzhi_comment_praise values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiCommentPraise(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_comment_praise where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiCommentPraise(String ids){
		return this.excuteBatchUpdate("delete from anzhi_comment_praise where id=?",ids);
	}

	public Pojo updateAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_comment_praise set comment_id=?,novel_id=?,chapter_id=?,member_id=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhicommentpraise.getCommentId(),
			anzhicommentpraise.getNovelId(),
			anzhicommentpraise.getChapterId(),
			anzhicommentpraise.getMemberId(),
			anzhicommentpraise.getState(),
			anzhicommentpraise.getAddTime()
		,	anzhicommentpraise.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiCommentPraise> findAnzhiCommentPraiseAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiCommentPraise(),"anzhi_comment_praise",size,pageNum,condition);
	}


}