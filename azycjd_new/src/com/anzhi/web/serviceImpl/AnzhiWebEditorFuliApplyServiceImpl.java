package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiWebEditorFuliApply;
import com.anzhi.web.dao.IAnzhiWebEditorFuliApplyDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorFuliApplyService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorFuliApplyServiceImpl extends ActionDb  implements IAnzhiWebEditorFuliApplyService {
	@Autowired
	private IAnzhiWebEditorFuliApplyDao anzhiwebeditorfuliapplyDao;
	public boolean addAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorfuliapplyDao.addAnzhiWebEditorFuliApply(anzhiwebeditorfuliapply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorFuliApply(List<AnzhiWebEditorFuliApply> list){
		return anzhiwebeditorfuliapplyDao.addBatchAnzhiWebEditorFuliApply(list);
	}

	public boolean delAnzhiWebEditorFuliApply(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorfuliapplyDao.delAnzhiWebEditorFuliApply(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorFuliApply(String ids){
		return anzhiwebeditorfuliapplyDao.delBatchAnzhiWebEditorFuliApply(ids);
	}

	public boolean updateAnzhiWebEditorFuliApply(AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorfuliapplyDao.updateAnzhiWebEditorFuliApply(anzhiwebeditorfuliapply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorFuliApply> findAnzhiWebEditorFuliApplyAll(int size,int pageNum,String condition){
		return anzhiwebeditorfuliapplyDao.findAnzhiWebEditorFuliApplyAll(size,pageNum,condition);
	}


}