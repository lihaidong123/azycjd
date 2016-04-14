package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiChapterUpdateRecord;
import com.anzhi.web.dao.IAnzhiChapterUpdateRecordDao;
import java.util.Date;
@Repository
public class AnzhiChapterUpdateRecordDaoImpl extends ActionDb implements IAnzhiChapterUpdateRecordDao {
	public Pojo addAnzhiChapterUpdateRecord(AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_chapter_update_record values(?,?,?)");
		pojo.setObj(new Object[]{
			anzhichapterupdaterecord.getChapterId(),
			anzhichapterupdaterecord.getUpdateNum(),
			anzhichapterupdaterecord.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiChapterUpdateRecord(List<AnzhiChapterUpdateRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_chapter_update_record values(?,?,?)",list);
	}

	public Pojo delAnzhiChapterUpdateRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_chapter_update_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiChapterUpdateRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_chapter_update_record where id=?",ids);
	}

	public Pojo updateAnzhiChapterUpdateRecord(AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_chapter_update_record set chapter_id=?,update_num=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhichapterupdaterecord.getChapterId(),
			anzhichapterupdaterecord.getUpdateNum(),
			anzhichapterupdaterecord.getAddTime()
		,	anzhichapterupdaterecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiChapterUpdateRecord> findAnzhiChapterUpdateRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiChapterUpdateRecord(),"anzhi_chapter_update_record",size,pageNum,condition);
	}


}