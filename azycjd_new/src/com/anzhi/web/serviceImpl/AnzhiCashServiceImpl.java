package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiCash;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.dao.IAnzhiCashDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiCashService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiCashServiceImpl extends ActionDb  implements IAnzhiCashService {
	@Autowired
	private IAnzhiCashDao anzhicashDao;
	public boolean addAnzhiCash(AnzhiCash anzhicash){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicashDao.addAnzhiCash(anzhicash));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiCash(List<AnzhiCash> list){
		return anzhicashDao.addBatchAnzhiCash(list);
	}

	public boolean delAnzhiCash(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicashDao.delAnzhiCash(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiCash(String ids){
		return anzhicashDao.delBatchAnzhiCash(ids);
	}

	public boolean updateAnzhiCash(AnzhiCash anzhicash){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicashDao.updateAnzhiCash(anzhicash));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiCash> findAnzhiCashAll(int size,int pageNum,String condition){
		return anzhicashDao.findAnzhiCashAll(size,pageNum,condition);
	}

	public boolean addAnzhiCash(AnzhiCash anzhicash, AnzhiMember member,HttpServletRequest request) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		//查找当前登录用户的安之币余额
		int money=this.getIntBySqlDb("select member_money from anzhi_member where id="+member.getId());
		
		//如果有安之币则进行提现操作
		if(money>0){
			//添加提现记录
			anzhicash.setAddTime(this.getNowTime());
			anzhicash.setMemberId(member.getId());
			anzhicash.setState(0);
			anzhicash.setAnzhiMoneyRemaining(money);
			pojoList.add(anzhicashDao.addAnzhiCash(anzhicash));
			
			//修改安之member的账户金额
			this.updateTableFieldAppend("anzhi_member", member.getId(), "member_money", -anzhicash.getAnzhiMoneyCash());	
			//修改缓存中的用户安之余额
			member.setMemberMoney(money-anzhicash.getAnzhiMoneyCash());
			request.getSession().setAttribute("loginUsers", member);
		}
		
		this.excuteUpdate(pojoList);
		return true;
	}


}