package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.dao.IAnzhiFenJuanDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiFenJuanService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiFenJuanServiceImpl extends ActionDb  implements IAnzhiFenJuanService {
	@Autowired
	private IAnzhiFenJuanDao anzhifenjuanDao;
	public boolean addAnzhiFenJuan(AnzhiFenJuan anzhifenjuan){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifenjuanDao.addAnzhiFenJuan(anzhifenjuan));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiFenJuan(List<AnzhiFenJuan> list){
		return anzhifenjuanDao.addBatchAnzhiFenJuan(list);
	}

	public boolean delAnzhiFenJuan(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifenjuanDao.delAnzhiFenJuan(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiFenJuan(String ids){
		return anzhifenjuanDao.delBatchAnzhiFenJuan(ids);
	}

	public boolean updateAnzhiFenJuan(AnzhiFenJuan anzhifenjuan){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhifenjuanDao.updateAnzhiFenJuan(anzhifenjuan));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiFenJuan> findAnzhiFenJuanAll(int size,int pageNum,String condition){
		return anzhifenjuanDao.findAnzhiFenJuanAll(size,pageNum,condition);
	}

	public QueryList<AnzhiFenJuan> findAnzhiFenJuanAll(int size, int pageNum,
			String condition, HttpServletRequest request) {
		QueryList<AnzhiFenJuan> list=anzhifenjuanDao.findAnzhiFenJuanAll(size,pageNum,condition);
		if((request.getParameter("novelId")!=null&&!request.getParameter("novelId").equals(""))||(request.getParameter("bookid")!=null&&!request.getParameter("bookid").equals(""))||(request.getParameter("book_id")!=null&&!request.getParameter("book_id").equals(""))||(request.getParameter("ProductID")!=null&&!request.getParameter("ProductID").equals(""))){
			for(AnzhiFenJuan a:list.getList()){
				a.setLs(this.excuteQuery(new AnzhiChapter(), "select * from anzhi_chapter_report_nopass where fen_juan_id="+a.getId()+" order by id asc"));
			}
		}
		return list;
	}


}