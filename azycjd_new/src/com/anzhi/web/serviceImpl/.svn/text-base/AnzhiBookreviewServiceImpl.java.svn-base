package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiBookreview;
import com.anzhi.web.dao.IAnzhiBookreviewDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiBookreviewService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiBookreviewServiceImpl extends ActionDb  implements IAnzhiBookreviewService {
	@Autowired
	private IAnzhiBookreviewDao anzhibookreviewDao;
	public boolean addAnzhiBookreview(AnzhiBookreview anzhibookreview){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibookreviewDao.addAnzhiBookreview(anzhibookreview));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiBookreview(List<AnzhiBookreview> list){
		return anzhibookreviewDao.addBatchAnzhiBookreview(list);
	}

	public boolean delAnzhiBookreview(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibookreviewDao.delAnzhiBookreview(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiBookreview(String ids){
		return anzhibookreviewDao.delBatchAnzhiBookreview(ids);
	}

	public boolean updateAnzhiBookreview(AnzhiBookreview anzhibookreview){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibookreviewDao.updateAnzhiBookreview(anzhibookreview));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiBookreview> findAnzhiBookreviewAll(int size,int pageNum,String condition){
		return anzhibookreviewDao.findAnzhiBookreviewAll(size,pageNum,condition);
	}


}