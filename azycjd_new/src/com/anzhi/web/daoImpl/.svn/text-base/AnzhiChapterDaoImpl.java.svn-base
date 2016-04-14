package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinChapter;
import com.anzhi.web.dao.IAnzhiChapterDao;
import java.util.Date;
@Repository
public class AnzhiChapterDaoImpl extends ActionDb implements IAnzhiChapterDao {
	public Pojo addAnzhiChapter(AnzhiChapter anzhichapter){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_chapter values(?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhichapter.getFenJuanId(),
			anzhichapter.getChapterTitle(),
			anzhichapter.getChapterContent(),
			anzhichapter.getChapterVote(),
			anzhichapter.getState(),
			anzhichapter.getAddTime(),
			anzhichapter.getLastUpdateTime(),
			anzhichapter.getChapterCharNum(),
			anzhichapter.getReadType(),
			anzhichapter.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiChapter(List<AnzhiChapter> list){
		return this.excuteBatchUpdate("insert into anzhi_chapter values(?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiChapter(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_chapter where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiChapter(String ids){
		return this.excuteBatchUpdate("delete from anzhi_chapter where id=?",ids);
	}

	public Pojo updateAnzhiChapter(AnzhiChapter anzhichapter){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_chapter set fen_juan_id=?,chapter_title=?,chapter_content=?,chapter_vote=?,state=?,add_time=?,last_update_time=?,chapter_char_num=?,read_type=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhichapter.getFenJuanId(),
			anzhichapter.getChapterTitle(),
			anzhichapter.getChapterContent(),
			anzhichapter.getChapterVote(),
			anzhichapter.getState(),
			anzhichapter.getAddTime(),
			anzhichapter.getLastUpdateTime(),
			anzhichapter.getChapterCharNum(),
			anzhichapter.getReadType(),
			anzhichapter.getVote()
		,	anzhichapter.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiChapter(),"anzhi_chapter_report",size,pageNum,condition);
	}

	public QueryList<AnzhiChapter> findAnzhiChapterAll(int size, int pageNum,
			String condition, String orderField) {
		return this.excuteQuery(new AnzhiChapter(),"anzhi_chapter_report",size,pageNum,condition,orderField);
	}

	public QueryList<AnzhiNovelMultiJoinChapter> findAnzhiNovelMultiJoinChapterAll(
			int size, int pageNum, String condition, String orderField) {
		return this.excuteQuery(new AnzhiNovelMultiJoinChapter(),"anzhi_novel_multi_join_chapter",size,pageNum,condition,orderField);
	}


}