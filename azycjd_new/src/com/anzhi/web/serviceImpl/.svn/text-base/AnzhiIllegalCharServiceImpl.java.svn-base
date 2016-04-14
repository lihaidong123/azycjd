package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiIllegalChar;
import com.anzhi.web.dao.IAnzhiIllegalCharDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiIllegalCharService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiIllegalCharServiceImpl extends ActionDb  implements IAnzhiIllegalCharService {
	@Autowired
	private IAnzhiIllegalCharDao anzhiillegalcharDao;
	public boolean addAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiillegalcharDao.addAnzhiIllegalChar(anzhiillegalchar));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiIllegalChar(List<AnzhiIllegalChar> list){
		return anzhiillegalcharDao.addBatchAnzhiIllegalChar(list);
	}

	public boolean delAnzhiIllegalChar(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiillegalcharDao.delAnzhiIllegalChar(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiIllegalChar(String ids){
		return anzhiillegalcharDao.delBatchAnzhiIllegalChar(ids);
	}

	public boolean updateAnzhiIllegalChar(AnzhiIllegalChar anzhiillegalchar){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiillegalcharDao.updateAnzhiIllegalChar(anzhiillegalchar));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiIllegalChar> findAnzhiIllegalCharAll(int size,int pageNum,String condition){
		return anzhiillegalcharDao.findAnzhiIllegalCharAll(size,pageNum,condition);
	}


}