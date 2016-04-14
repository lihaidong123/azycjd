package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.dao.IAnzhiDiscountedJoinDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiDiscountedJoinService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiDiscountedJoinServiceImpl extends ActionDb  implements IAnzhiDiscountedJoinService {
	@Autowired
	private IAnzhiDiscountedJoinDao anzhidiscountedjoinDao;
	public boolean addAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedjoinDao.addAnzhiDiscountedJoin(anzhidiscountedjoin));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiDiscountedJoin(List<AnzhiDiscountedJoin> list){
		return anzhidiscountedjoinDao.addBatchAnzhiDiscountedJoin(list);
	}

	public boolean delAnzhiDiscountedJoin(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedjoinDao.delAnzhiDiscountedJoin(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiDiscountedJoin(String ids){
		return anzhidiscountedjoinDao.delBatchAnzhiDiscountedJoin(ids);
	}

	public boolean updateAnzhiDiscountedJoin(AnzhiDiscountedJoin anzhidiscountedjoin){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedjoinDao.updateAnzhiDiscountedJoin(anzhidiscountedjoin));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiDiscountedJoin> findAnzhiDiscountedJoinAll(int size,int pageNum,String condition){
		return anzhidiscountedjoinDao.findAnzhiDiscountedJoinAll(size,pageNum,condition);
	}


}