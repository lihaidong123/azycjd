package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiHeadImgUseRecord;
import com.anzhi.web.dao.IAnzhiHeadImgUseRecordDao;
import java.util.Date;
@Repository
public class AnzhiHeadImgUseRecordDaoImpl extends ActionDb implements IAnzhiHeadImgUseRecordDao {
	public Pojo addAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_head_img_use_record values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiheadimguserecord.getMemberId(),
			anzhiheadimguserecord.getUseImg(),
			anzhiheadimguserecord.getAddTime(),
			anzhiheadimguserecord.getState()
		});
		return pojo;
	}

	public boolean addBatchAnzhiHeadImgUseRecord(List<AnzhiHeadImgUseRecord> list){
		return this.excuteBatchUpdate("insert into anzhi_head_img_use_record values(?,?,?,?)",list);
	}

	public Pojo delAnzhiHeadImgUseRecord(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_head_img_use_record where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiHeadImgUseRecord(String ids){
		return this.excuteBatchUpdate("delete from anzhi_head_img_use_record where id=?",ids);
	}

	public Pojo updateAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_head_img_use_record set member_id=?,use_img=?,add_time=?,state=? where id=?");
		pojo.setObj(new Object[]{
			anzhiheadimguserecord.getMemberId(),
			anzhiheadimguserecord.getUseImg(),
			anzhiheadimguserecord.getAddTime(),
			anzhiheadimguserecord.getState()
		,	anzhiheadimguserecord.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiHeadImgUseRecord> findAnzhiHeadImgUseRecordAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiHeadImgUseRecord(),"anzhi_head_img_use_record",size,pageNum,condition);
	}


}