package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiSystem;
import com.anzhi.web.dao.IAnzhiSystemDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiSystemService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiSystemServiceImpl extends ActionDb  implements IAnzhiSystemService {
	@Autowired
	private IAnzhiSystemDao anzhisystemDao;
	public boolean addAnzhiSystem(AnzhiSystem anzhisystem){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhisystemDao.addAnzhiSystem(anzhisystem));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiSystem(List<AnzhiSystem> list){
		return anzhisystemDao.addBatchAnzhiSystem(list);
	}

	public boolean delAnzhiSystem(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhisystemDao.delAnzhiSystem(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiSystem(String ids){
		return anzhisystemDao.delBatchAnzhiSystem(ids);
	}

	public boolean updateAnzhiSystem(AnzhiSystem anzhisystem){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhisystemDao.updateAnzhiSystem(anzhisystem));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiSystem> findAnzhiSystemAll(int size,int pageNum,String condition){
		return anzhisystemDao.findAnzhiSystemAll(size,pageNum,condition);
	}


}