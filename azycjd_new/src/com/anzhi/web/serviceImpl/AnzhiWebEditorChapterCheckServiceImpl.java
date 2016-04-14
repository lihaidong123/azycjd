package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiWebEditorChapterCheck;
import com.anzhi.web.dao.IAnzhiWebEditorChapterCheckDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorChapterCheckService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorChapterCheckServiceImpl extends ActionDb  implements IAnzhiWebEditorChapterCheckService {
	@Autowired
	private IAnzhiWebEditorChapterCheckDao anzhiwebeditorchaptercheckDao;
	public boolean addAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorchaptercheckDao.addAnzhiWebEditorChapterCheck(anzhiwebeditorchaptercheck));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorChapterCheck(List<AnzhiWebEditorChapterCheck> list){
		return anzhiwebeditorchaptercheckDao.addBatchAnzhiWebEditorChapterCheck(list);
	}

	public boolean delAnzhiWebEditorChapterCheck(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorchaptercheckDao.delAnzhiWebEditorChapterCheck(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorChapterCheck(String ids){
		return anzhiwebeditorchaptercheckDao.delBatchAnzhiWebEditorChapterCheck(ids);
	}

	public boolean updateAnzhiWebEditorChapterCheck(AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorchaptercheckDao.updateAnzhiWebEditorChapterCheck(anzhiwebeditorchaptercheck));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorChapterCheck> findAnzhiWebEditorChapterCheckAll(int size,int pageNum,String condition){
		return anzhiwebeditorchaptercheckDao.findAnzhiWebEditorChapterCheckAll(size,pageNum,condition);
	}


}