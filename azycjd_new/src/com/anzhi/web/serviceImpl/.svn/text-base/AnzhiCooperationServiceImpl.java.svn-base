package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiCooperation;
import com.anzhi.web.dao.IAnzhiCooperationDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiCooperationService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiCooperationServiceImpl extends ActionDb  implements IAnzhiCooperationService {
	@Autowired
	private IAnzhiCooperationDao anzhicooperationDao;
	public boolean addAnzhiCooperation(AnzhiCooperation anzhicooperation){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicooperationDao.addAnzhiCooperation(anzhicooperation));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiCooperation(List<AnzhiCooperation> list){
		return anzhicooperationDao.addBatchAnzhiCooperation(list);
	}

	public boolean delAnzhiCooperation(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicooperationDao.delAnzhiCooperation(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiCooperation(String ids){
		return anzhicooperationDao.delBatchAnzhiCooperation(ids);
	}

	public boolean updateAnzhiCooperation(AnzhiCooperation anzhicooperation){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicooperationDao.updateAnzhiCooperation(anzhicooperation));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiCooperation> findAnzhiCooperationAll(int size,int pageNum,String condition){
		return anzhicooperationDao.findAnzhiCooperationAll(size,pageNum,condition);
	}


}