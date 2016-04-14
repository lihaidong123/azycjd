package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorServiceImpl extends ActionDb  implements IAnzhiWebEditorService {
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	public boolean addAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorDao.addAnzhiWebEditor(anzhiwebeditor));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditor(List<AnzhiWebEditor> list){
		return anzhiwebeditorDao.addBatchAnzhiWebEditor(list);
	}

	public boolean delAnzhiWebEditor(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorDao.delAnzhiWebEditor(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditor(String ids){
		return anzhiwebeditorDao.delBatchAnzhiWebEditor(ids);
	}

	public boolean updateAnzhiWebEditor(AnzhiWebEditor anzhiwebeditor){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorDao.updateAnzhiWebEditor(anzhiwebeditor));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditor> findAnzhiWebEditorAll(int size,int pageNum,String condition){
		return anzhiwebeditorDao.findAnzhiWebEditorAll(size,pageNum,condition);
	}


}