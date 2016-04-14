package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiMoneyApplyRecord;
import com.anzhi.web.dao.IAnzhiMoneyApplyRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiMoneyApplyRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiMoneyApplyRecordServiceImpl extends ActionDb  implements IAnzhiMoneyApplyRecordService {
	@Autowired
	private IAnzhiMoneyApplyRecordDao anzhimoneyapplyrecordDao;
	public boolean addAnzhiMoneyApplyRecord(AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimoneyapplyrecordDao.addAnzhiMoneyApplyRecord(anzhimoneyapplyrecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiMoneyApplyRecord(List<AnzhiMoneyApplyRecord> list){
		return anzhimoneyapplyrecordDao.addBatchAnzhiMoneyApplyRecord(list);
	}

	public boolean delAnzhiMoneyApplyRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimoneyapplyrecordDao.delAnzhiMoneyApplyRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiMoneyApplyRecord(String ids){
		return anzhimoneyapplyrecordDao.delBatchAnzhiMoneyApplyRecord(ids);
	}

	public boolean updateAnzhiMoneyApplyRecord(AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimoneyapplyrecordDao.updateAnzhiMoneyApplyRecord(anzhimoneyapplyrecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiMoneyApplyRecord> findAnzhiMoneyApplyRecordAll(int size,int pageNum,String condition){
		return anzhimoneyapplyrecordDao.findAnzhiMoneyApplyRecordAll(size,pageNum,condition);
	}


}