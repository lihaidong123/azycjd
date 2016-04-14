package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiInteractive;
import com.anzhi.web.dao.IAnzhiInteractiveDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiInteractiveService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiInteractiveServiceImpl extends ActionDb  implements IAnzhiInteractiveService {
	@Autowired
	private IAnzhiInteractiveDao anzhiinteractiveDao;
	public boolean addAnzhiInteractive(AnzhiInteractive anzhiinteractive){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiinteractiveDao.addAnzhiInteractive(anzhiinteractive));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiInteractive(List<AnzhiInteractive> list){
		return anzhiinteractiveDao.addBatchAnzhiInteractive(list);
	}

	public boolean delAnzhiInteractive(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiinteractiveDao.delAnzhiInteractive(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiInteractive(String ids){
		return anzhiinteractiveDao.delBatchAnzhiInteractive(ids);
	}

	public boolean updateAnzhiInteractive(AnzhiInteractive anzhiinteractive){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiinteractiveDao.updateAnzhiInteractive(anzhiinteractive));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiInteractive> findAnzhiInteractiveAll(int size,int pageNum,String condition){
		return anzhiinteractiveDao.findAnzhiInteractiveAll(size,pageNum,condition);
	}


}