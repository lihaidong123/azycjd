package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiNovelLabel;
import com.anzhi.web.dao.IAnzhiNovelLabelDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiNovelLabelService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelLabelServiceImpl extends ActionDb  implements IAnzhiNovelLabelService {
	@Autowired
	private IAnzhiNovelLabelDao anzhinovellabelDao;
	public boolean addAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovellabelDao.addAnzhiNovelLabel(anzhinovellabel));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelLabel(List<AnzhiNovelLabel> list){
		return anzhinovellabelDao.addBatchAnzhiNovelLabel(list);
	}

	public boolean delAnzhiNovelLabel(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovellabelDao.delAnzhiNovelLabel(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelLabel(String ids){
		return anzhinovellabelDao.delBatchAnzhiNovelLabel(ids);
	}

	public boolean updateAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovellabelDao.updateAnzhiNovelLabel(anzhinovellabel));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelLabel> findAnzhiNovelLabelAll(int size,int pageNum,String condition){
		return anzhinovellabelDao.findAnzhiNovelLabelAll(size,pageNum,condition);
	}


}