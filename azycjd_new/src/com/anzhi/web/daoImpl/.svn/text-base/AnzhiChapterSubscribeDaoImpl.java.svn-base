package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.dao.IAnzhiChapterSubscribeDao;
import java.util.Date;
@Repository
public class AnzhiChapterSubscribeDaoImpl extends ActionDb implements IAnzhiChapterSubscribeDao {
	public Pojo addAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_chapter_subscribe values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhichaptersubscribe.getChapterId(),
			anzhichaptersubscribe.getMemberId(),
			anzhichaptersubscribe.getAddTime(),
			anzhichaptersubscribe.getState(),
			anzhichaptersubscribe.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiChapterSubscribe(List<AnzhiChapterSubscribe> list){
		return this.excuteBatchUpdate("insert into anzhi_chapter_subscribe values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiChapterSubscribe(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_chapter_subscribe where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiChapterSubscribe(String ids){
		return this.excuteBatchUpdate("delete from anzhi_chapter_subscribe where id=?",ids);
	}

	public Pojo updateAnzhiChapterSubscribe(AnzhiChapterSubscribe anzhichaptersubscribe){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_chapter_subscribe set chapter_id=?,member_id=?,add_time=?,state=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhichaptersubscribe.getChapterId(),
			anzhichaptersubscribe.getMemberId(),
			anzhichaptersubscribe.getAddTime(),
			anzhichaptersubscribe.getState(),
			anzhichaptersubscribe.getVote()
		,	anzhichaptersubscribe.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiChapterSubscribe> findAnzhiChapterSubscribeAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiChapterSubscribe(),"anzhi_chapter_subscribe",size,pageNum,condition);
	}


}