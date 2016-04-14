package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiWebEditorWork;
import com.anzhi.web.dao.IAnzhiWebEditorWorkDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorWorkService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorWorkServiceImpl extends ActionDb  implements IAnzhiWebEditorWorkService {
	@Autowired
	private IAnzhiWebEditorWorkDao anzhiwebeditorworkDao;
	public boolean addAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorworkDao.addAnzhiWebEditorWork(anzhiwebeditorwork));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorWork(List<AnzhiWebEditorWork> list){
		return anzhiwebeditorworkDao.addBatchAnzhiWebEditorWork(list);
	}

	public boolean delAnzhiWebEditorWork(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorworkDao.delAnzhiWebEditorWork(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorWork(String ids){
		return anzhiwebeditorworkDao.delBatchAnzhiWebEditorWork(ids);
	}

	public boolean updateAnzhiWebEditorWork(AnzhiWebEditorWork anzhiwebeditorwork){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorworkDao.updateAnzhiWebEditorWork(anzhiwebeditorwork));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorWork> findAnzhiWebEditorWorkAll(int size,int pageNum,String condition){
		return anzhiwebeditorworkDao.findAnzhiWebEditorWorkAll(size,pageNum,condition);
	}


}