package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiHeadImgUseRecord;
import com.anzhi.web.dao.IAnzhiHeadImgUseRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiHeadImgUseRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiHeadImgUseRecordServiceImpl extends ActionDb  implements IAnzhiHeadImgUseRecordService {
	@Autowired
	private IAnzhiHeadImgUseRecordDao anzhiheadimguserecordDao;
	public boolean addAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiheadimguserecordDao.addAnzhiHeadImgUseRecord(anzhiheadimguserecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiHeadImgUseRecord(List<AnzhiHeadImgUseRecord> list){
		return anzhiheadimguserecordDao.addBatchAnzhiHeadImgUseRecord(list);
	}

	public boolean delAnzhiHeadImgUseRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiheadimguserecordDao.delAnzhiHeadImgUseRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiHeadImgUseRecord(String ids){
		return anzhiheadimguserecordDao.delBatchAnzhiHeadImgUseRecord(ids);
	}

	public boolean updateAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiheadimguserecordDao.updateAnzhiHeadImgUseRecord(anzhiheadimguserecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiHeadImgUseRecord> findAnzhiHeadImgUseRecordAll(int size,int pageNum,String condition){
		return anzhiheadimguserecordDao.findAnzhiHeadImgUseRecordAll(size,pageNum,condition);
	}


}