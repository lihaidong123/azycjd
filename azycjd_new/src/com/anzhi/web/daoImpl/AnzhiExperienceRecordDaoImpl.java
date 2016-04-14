package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import java.util.Date;
@Repository
public class AnzhiExperienceRecordDaoImpl extends ActionDb implements IAnzhiExperienceRecordDao {
	public Pojo addAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_experience_record values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiexperiencerecord.getExperienceType(),
			anzhiexperiencerecord.getExperienceNum(),
			anzhiexperiencerecord.getMemberId(),
			anzhiexperiencerecord.getState(),
			anzhiexperiencerecord.getVote(),
			anzhiexperiencerecord.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiExperienceRecord(List<AnzhiExperienceRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_experience_record values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiExperienceRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_experience_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiExperienceRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_experience_record where id=?",ids);
	}

	public Pojo updateAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_experience_record set experience_type=?,experience_num=?,member_id=?,state=?,vote=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiexperiencerecord.getExperienceType(),
			anzhiexperiencerecord.getExperienceNum(),
			anzhiexperiencerecord.getMemberId(),
			anzhiexperiencerecord.getState(),
			anzhiexperiencerecord.getVote(),
			anzhiexperiencerecord.getAddTime()
		,	anzhiexperiencerecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiExperienceRecord> findAnzhiExperienceRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiExperienceRecord(),"anzhi_experience_record_view",size,pageNum,condition);
	}


}