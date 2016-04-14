package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiChapterUpdateRecord;
import com.anzhi.web.dao.IAnzhiChapterUpdateRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiChapterUpdateRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiChapterUpdateRecordServiceImpl extends ActionDb  implements IAnzhiChapterUpdateRecordService {
	@Autowired
	private IAnzhiChapterUpdateRecordDao anzhichapterupdaterecordDao;
	public boolean addAnzhiChapterUpdateRecord(AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichapterupdaterecordDao.addAnzhiChapterUpdateRecord(anzhichapterupdaterecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiChapterUpdateRecord(List<AnzhiChapterUpdateRecord> list){
		return anzhichapterupdaterecordDao.addBatchAnzhiChapterUpdateRecord(list);
	}

	public boolean delAnzhiChapterUpdateRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichapterupdaterecordDao.delAnzhiChapterUpdateRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiChapterUpdateRecord(String ids){
		return anzhichapterupdaterecordDao.delBatchAnzhiChapterUpdateRecord(ids);
	}

	public boolean updateAnzhiChapterUpdateRecord(AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhichapterupdaterecordDao.updateAnzhiChapterUpdateRecord(anzhichapterupdaterecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiChapterUpdateRecord> findAnzhiChapterUpdateRecordAll(int size,int pageNum,String condition){
		return anzhichapterupdaterecordDao.findAnzhiChapterUpdateRecordAll(size,pageNum,condition);
	}


}