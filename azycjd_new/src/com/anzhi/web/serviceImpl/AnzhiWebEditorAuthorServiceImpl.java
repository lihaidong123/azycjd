package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiWebEditorAuthorDao;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorAuthor;
import com.anzhi.web.service.IAnzhiWebEditorAuthorService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorAuthorServiceImpl extends ActionDb  implements IAnzhiWebEditorAuthorService {
	@Autowired
	private IAnzhiWebEditorAuthorDao anzhiwebeditorauthorDao;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	public boolean addAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorauthorDao.addAnzhiWebEditorAuthor(anzhiwebeditorauthor));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorAuthor(List<AnzhiWebEditorAuthor> list){
		return anzhiwebeditorauthorDao.addBatchAnzhiWebEditorAuthor(list);
	}

	public boolean delAnzhiWebEditorAuthor(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorauthorDao.delAnzhiWebEditorAuthor(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorAuthor(String ids){
		return anzhiwebeditorauthorDao.delBatchAnzhiWebEditorAuthor(ids);
	}

	public boolean updateAnzhiWebEditorAuthor(AnzhiWebEditorAuthor anzhiwebeditorauthor){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorauthorDao.updateAnzhiWebEditorAuthor(anzhiwebeditorauthor));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorAuthor> findAnzhiWebEditorAuthorAll(int size,int pageNum,String condition){
		return anzhiwebeditorauthorDao.findAnzhiWebEditorAuthorAll(size,pageNum,condition);
	}

	public String addAnzhiWebEditorAuthor(HttpServletRequest request,AnzhiWebEditor aw) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		if(aw!=null&&request.getParameter("novelId")!=null&&!request.getParameter("novelId").equals("")){
			String[] arr=request.getParameter("novelId").split(",");
			boolean isInsert=true;
			String novT="";
			for(String s:arr){
				int nums=this.getIntBySqlDb("select count(*) from anzhi_web_editor_author where novel_id="+Integer.parseInt(s));
				if(nums!=0){
					isInsert=false;
					break;
				}
				AnzhiWebEditorAuthor anzhiwebeditorauthor=new AnzhiWebEditorAuthor();
				anzhiwebeditorauthor.setEditorId(aw.getId());
				anzhiwebeditorauthor.setNovelId(Integer.parseInt(s));
				anzhiwebeditorauthor.setVote(request.getParameter("vote"));
				anzhiwebeditorauthor.setState(0);
				anzhiwebeditorauthor.setAddTime(getNowTime());
				pojoList.add(anzhiwebeditorauthorDao.addAnzhiWebEditorAuthor(anzhiwebeditorauthor));
			}
			//驻站文报备后就自动加上积分
			if(arr.length!=0){
				pojoList.add(anzhiwebeditorDao.updateScore(aw.getId(), arr.length*10));
			}
			if(!isInsert){
				return "您选择的书已经报备过了！";	
			}
			this.excuteUpdate(pojoList);
		}
		return "yes";
	}


}