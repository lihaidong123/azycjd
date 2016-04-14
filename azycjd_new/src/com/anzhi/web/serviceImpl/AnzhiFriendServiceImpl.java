package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiFriend;
import com.anzhi.web.dao.IAnzhiFriendDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiFriendService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiFriendServiceImpl extends ActionDb  implements IAnzhiFriendService {
	@Autowired
	private IAnzhiFriendDao anzhifriendDao;
	public boolean addAnzhiFriend(AnzhiFriend anzhifriend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifriendDao.addAnzhiFriend(anzhifriend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiFriend(List<AnzhiFriend> list){
		return anzhifriendDao.addBatchAnzhiFriend(list);
	}

	public boolean delAnzhiFriend(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifriendDao.delAnzhiFriend(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiFriend(String ids){
		return anzhifriendDao.delBatchAnzhiFriend(ids);
	}

	public boolean updateAnzhiFriend(AnzhiFriend anzhifriend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifriendDao.updateAnzhiFriend(anzhifriend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiFriend> findAnzhiFriendAll(int size,int pageNum,String condition){
		return anzhifriendDao.findAnzhiFriendAll(size,pageNum,condition);
	}

	public boolean delMyAnzhiFriend(int myid, int myfriendid) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifriendDao.delMyAnzhiFriend(myid, myfriendid));
		this.excuteUpdate(pojoList);
		return true;
	}


}