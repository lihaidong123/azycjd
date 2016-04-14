package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorTuijian;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.dao.IAnzhiWebEditorTuijianDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorTuijianService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorTuijianServiceImpl extends ActionDb  implements IAnzhiWebEditorTuijianService {
	@Autowired
	private IAnzhiWebEditorTuijianDao anzhiwebeditortuijianDao;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	public boolean addAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditortuijianDao.addAnzhiWebEditorTuijian(anzhiwebeditortuijian));
		//加积分
		pojoList.add(anzhiwebeditorDao.updateScore(anzhiwebeditortuijian.getEditorId(), 1));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorTuijian(List<AnzhiWebEditorTuijian> list){
		return anzhiwebeditortuijianDao.addBatchAnzhiWebEditorTuijian(list);
	}

	public boolean delAnzhiWebEditorTuijian(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditortuijianDao.delAnzhiWebEditorTuijian(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorTuijian(String ids){
		return anzhiwebeditortuijianDao.delBatchAnzhiWebEditorTuijian(ids);
	}

	public boolean updateAnzhiWebEditorTuijian(AnzhiWebEditorTuijian anzhiwebeditortuijian){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditortuijianDao.updateAnzhiWebEditorTuijian(anzhiwebeditortuijian));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorTuijian> findAnzhiWebEditorTuijianAll(int size,int pageNum,String condition){
		return anzhiwebeditortuijianDao.findAnzhiWebEditorTuijianAll(size,pageNum,condition);
	}

	public String updateTuiJian(HttpServletRequest request) {
		String[] field=new String[]{"","is_jiajing","is_hot"};
		int typ=this.getInt(request, "types");
		int state=this.getInt(request, "state");
		this.updateTableFieldVoid("anzhi_web_editor_tuijian", this.getInt(request, "id"), field[typ], this.getInt(request, "state"));
		if(typ==1&&state==1){
			//加精成功，家积分
			//获得网编id
			int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_tuijian where id="+this.getInt(request, "id"));
			this.updateTableFieldAppend("anzhi_web_editor", editorId, "editor_score", 10);
		}else if(typ==2&&state==1){
			//热帖成功，家积分
			int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_tuijian where id="+this.getInt(request, "id"));
			this.updateTableFieldAppend("anzhi_web_editor", editorId, "editor_score", 10);
		}
		return "操作成功！";
	}


}