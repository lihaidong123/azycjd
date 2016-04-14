package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiRegistration;
import com.anzhi.web.dao.IAnzhiRegistrationDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiRegistrationService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiRegistrationServiceImpl extends ActionDb  implements IAnzhiRegistrationService {
	@Autowired
	private IAnzhiRegistrationDao anzhiregistrationDao;
	public boolean addAnzhiRegistration(AnzhiRegistration anzhiregistration){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiregistrationDao.addAnzhiRegistration(anzhiregistration));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiRegistration(List<AnzhiRegistration> list){
		return anzhiregistrationDao.addBatchAnzhiRegistration(list);
	}

	public boolean delAnzhiRegistration(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiregistrationDao.delAnzhiRegistration(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiRegistration(String ids){
		return anzhiregistrationDao.delBatchAnzhiRegistration(ids);
	}

	public boolean updateAnzhiRegistration(AnzhiRegistration anzhiregistration){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiregistrationDao.updateAnzhiRegistration(anzhiregistration));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiRegistration> findAnzhiRegistrationAll(int size,int pageNum,String condition){
		return anzhiregistrationDao.findAnzhiRegistrationAll(size,pageNum,condition);
	}


}