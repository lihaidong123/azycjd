package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiExperienceRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiExperienceRecordServiceImpl extends ActionDb  implements IAnzhiExperienceRecordService {
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	public boolean addAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiExperienceRecord(List<AnzhiExperienceRecord> list){
		return anzhiexperiencerecordDao.addBatchAnzhiExperienceRecord(list);
	}

	public boolean delAnzhiExperienceRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiexperiencerecordDao.delAnzhiExperienceRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiExperienceRecord(String ids){
		return anzhiexperiencerecordDao.delBatchAnzhiExperienceRecord(ids);
	}

	public boolean updateAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiexperiencerecordDao.updateAnzhiExperienceRecord(anzhiexperiencerecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiExperienceRecord> findAnzhiExperienceRecordAll(int size,int pageNum,String condition){
		return anzhiexperiencerecordDao.findAnzhiExperienceRecordAll(size,pageNum,condition);
	}

	public boolean addAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord,HttpServletRequest request, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		
		//查找当前用户今天有没有签到
		int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=0 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(n==0){
			//如果没有记录，则添加。同时增加用户的经验
			pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
			
			//修改该用户的经验  先查找 后修改
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 5);	
			int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
			am.setMemberExperience(jingyan);
			request.getSession().setAttribute("loginUsers", am);
		}
		
		this.excuteUpdate(pojoList);
		return false;
	}


}