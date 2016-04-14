package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiTrendReply;
import com.anzhi.web.dao.IAnzhiTrendReplyDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiTrendReplyService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiTrendReplyServiceImpl extends ActionDb  implements IAnzhiTrendReplyService {
	@Autowired
	private IAnzhiTrendReplyDao anzhitrendreplyDao;
	public boolean addAnzhiTrendReply(AnzhiTrendReply anzhitrendreply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendreplyDao.addAnzhiTrendReply(anzhitrendreply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiTrendReply(List<AnzhiTrendReply> list){
		return anzhitrendreplyDao.addBatchAnzhiTrendReply(list);
	}

	public boolean delAnzhiTrendReply(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendreplyDao.delAnzhiTrendReply(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiTrendReply(String ids){
		return anzhitrendreplyDao.delBatchAnzhiTrendReply(ids);
	}

	public boolean updateAnzhiTrendReply(AnzhiTrendReply anzhitrendreply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendreplyDao.updateAnzhiTrendReply(anzhitrendreply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiTrendReply> findAnzhiTrendReplyAll(int size,int pageNum,String condition){
		return anzhitrendreplyDao.findAnzhiTrendReplyAll(size,pageNum,condition);
	}


}