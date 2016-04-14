package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiBookmark;
import com.anzhi.web.dao.IAnzhiBookmarkDao;
import java.util.Date;
@Repository
public class AnzhiBookmarkDaoImpl extends ActionDb implements IAnzhiBookmarkDao {
	public Pojo addAnzhiBookmark(AnzhiBookmark anzhibookmark){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_bookmark values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhibookmark.getMemberId(),
			anzhibookmark.getNovelId(),
			anzhibookmark.getChapterId(),
			anzhibookmark.getAddTime(),
			anzhibookmark.getReadAddress(),
			anzhibookmark.getBookmarkType(),
			anzhibookmark.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiBookmark(List<AnzhiBookmark> list){
		return this.excuteBatchUpdate("insert into anzhi_bookmark values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiBookmark(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_bookmark where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiBookmark(String ids){
		return this.excuteBatchUpdate("delete from anzhi_bookmark where id=?",ids);
	}

	public Pojo updateAnzhiBookmark(AnzhiBookmark anzhibookmark){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_bookmark set member_id=?,novel_id=?,chapter_id=?,add_time=?,read_address=?,vote=?,bookmark_type=? where id=?");
		pojo.setObj(new Object[]{
			anzhibookmark.getMemberId(),
			anzhibookmark.getNovelId(),
			anzhibookmark.getChapterId(),
			anzhibookmark.getAddTime(),
			anzhibookmark.getReadAddress(),
			anzhibookmark.getVote(),
			anzhibookmark.getBookmarkType()
		,	anzhibookmark.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiBookmark> findAnzhiBookmarkAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiBookmark(),"anzhi_bookmark_novelauthor_view",size,pageNum,condition);
	}


}