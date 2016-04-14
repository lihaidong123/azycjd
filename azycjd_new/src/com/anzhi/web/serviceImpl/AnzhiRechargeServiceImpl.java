package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiRecharge;
import com.anzhi.web.dao.IAnzhiRechargeDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiRechargeService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiRechargeServiceImpl extends ActionDb  implements IAnzhiRechargeService {
	@Autowired
	private IAnzhiRechargeDao anzhirechargeDao;
	public boolean addAnzhiRecharge(AnzhiRecharge anzhirecharge){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirechargeDao.addAnzhiRecharge(anzhirecharge));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiRecharge(List<AnzhiRecharge> list){
		return anzhirechargeDao.addBatchAnzhiRecharge(list);
	}

	public boolean delAnzhiRecharge(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirechargeDao.delAnzhiRecharge(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiRecharge(String ids){
		return anzhirechargeDao.delBatchAnzhiRecharge(ids);
	}

	public boolean updateAnzhiRecharge(AnzhiRecharge anzhirecharge){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirechargeDao.updateAnzhiRecharge(anzhirecharge));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiRecharge> findAnzhiRechargeAll(int size,int pageNum,String condition){
		return anzhirechargeDao.findAnzhiRechargeAll(size,pageNum,condition);
	}


}