package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiNovelType;
import com.anzhi.web.dao.IAnzhiNovelTypeDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiNovelTypeService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelTypeServiceImpl extends ActionDb  implements IAnzhiNovelTypeService {
	@Autowired
	private IAnzhiNovelTypeDao anzhinoveltypeDao;
	public boolean addAnzhiNovelType(AnzhiNovelType anzhinoveltype){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinoveltypeDao.addAnzhiNovelType(anzhinoveltype));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelType(List<AnzhiNovelType> list){
		return anzhinoveltypeDao.addBatchAnzhiNovelType(list);
	}

	public boolean delAnzhiNovelType(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinoveltypeDao.delAnzhiNovelType(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelType(String ids){
		return anzhinoveltypeDao.delBatchAnzhiNovelType(ids);
	}

	public boolean updateAnzhiNovelType(AnzhiNovelType anzhinoveltype){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinoveltypeDao.updateAnzhiNovelType(anzhinoveltype));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelType> findAnzhiNovelTypeAll(int size,int pageNum,String condition){
		return anzhinoveltypeDao.findAnzhiNovelTypeAll(size,pageNum,condition);
	}


}