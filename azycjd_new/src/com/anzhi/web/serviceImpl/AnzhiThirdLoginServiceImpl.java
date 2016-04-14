package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiThirdLogin;
import com.anzhi.web.dao.IAnzhiThirdLoginDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiThirdLoginService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiThirdLoginServiceImpl extends ActionDb  implements IAnzhiThirdLoginService {
	@Autowired
	private IAnzhiThirdLoginDao anzhithirdloginDao;
	public boolean addAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhithirdloginDao.addAnzhiThirdLogin(anzhithirdlogin));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiThirdLogin(List<AnzhiThirdLogin> list){
		return anzhithirdloginDao.addBatchAnzhiThirdLogin(list);
	}

	public boolean delAnzhiThirdLogin(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhithirdloginDao.delAnzhiThirdLogin(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiThirdLogin(String ids){
		return anzhithirdloginDao.delBatchAnzhiThirdLogin(ids);
	}

	public boolean updateAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhithirdloginDao.updateAnzhiThirdLogin(anzhithirdlogin));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiThirdLogin> findAnzhiThirdLoginAll(int size,int pageNum,String condition){
		return anzhithirdloginDao.findAnzhiThirdLoginAll(size,pageNum,condition);
	}


}