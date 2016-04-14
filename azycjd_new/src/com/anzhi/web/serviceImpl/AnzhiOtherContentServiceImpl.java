package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiOtherContent;
import com.anzhi.web.dao.IAnzhiOtherContentDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiOtherContentService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiOtherContentServiceImpl extends ActionDb  implements IAnzhiOtherContentService {
	@Autowired
	private IAnzhiOtherContentDao anzhiothercontentDao;
	public boolean addAnzhiOtherContent(AnzhiOtherContent anzhiothercontent){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiothercontentDao.addAnzhiOtherContent(anzhiothercontent));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiOtherContent(List<AnzhiOtherContent> list){
		return anzhiothercontentDao.addBatchAnzhiOtherContent(list);
	}

	public boolean delAnzhiOtherContent(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiothercontentDao.delAnzhiOtherContent(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiOtherContent(String ids){
		return anzhiothercontentDao.delBatchAnzhiOtherContent(ids);
	}

	public boolean updateAnzhiOtherContent(AnzhiOtherContent anzhiothercontent){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiothercontentDao.updateAnzhiOtherContent(anzhiothercontent));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiOtherContent> findAnzhiOtherContentAll(int size,int pageNum,String condition){
		return anzhiothercontentDao.findAnzhiOtherContentAll(size,pageNum,condition);
	}


}