package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyBuyRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiNovelReadMoneyBuyRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelReadMoneyBuyRecordServiceImpl extends ActionDb  implements IAnzhiNovelReadMoneyBuyRecordService {
	@Autowired
	private IAnzhiNovelReadMoneyBuyRecordDao anzhinovelreadmoneybuyrecordDao;
	public boolean addAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneybuyrecordDao.addAnzhiNovelReadMoneyBuyRecord(anzhinovelreadmoneybuyrecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelReadMoneyBuyRecord(List<AnzhiNovelReadMoneyBuyRecord> list){
		return anzhinovelreadmoneybuyrecordDao.addBatchAnzhiNovelReadMoneyBuyRecord(list);
	}

	public boolean delAnzhiNovelReadMoneyBuyRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneybuyrecordDao.delAnzhiNovelReadMoneyBuyRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelReadMoneyBuyRecord(String ids){
		return anzhinovelreadmoneybuyrecordDao.delBatchAnzhiNovelReadMoneyBuyRecord(ids);
	}

	public boolean updateAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneybuyrecordDao.updateAnzhiNovelReadMoneyBuyRecord(anzhinovelreadmoneybuyrecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelReadMoneyBuyRecord> findAnzhiNovelReadMoneyBuyRecordAll(int size,int pageNum,String condition){
		return anzhinovelreadmoneybuyrecordDao.findAnzhiNovelReadMoneyBuyRecordAll(size,pageNum,condition);
	}


}