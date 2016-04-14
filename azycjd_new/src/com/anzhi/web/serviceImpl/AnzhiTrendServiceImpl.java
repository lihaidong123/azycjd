package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiTrend;
import com.anzhi.web.pojo.AnzhiTrendReply;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiTrendDao;
import com.anzhi.web.dao.IAnzhiTrendReplyDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiTrendService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiTrendServiceImpl extends ActionDb  implements IAnzhiTrendService {
	@Autowired
	private IAnzhiTrendDao anzhitrendDao;
	@Autowired
	private IAnzhiTrendReplyDao anzhitrendreplyDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	public boolean addAnzhiTrend(AnzhiTrend anzhitrend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendDao.addAnzhiTrend(anzhitrend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiTrend(List<AnzhiTrend> list){
		return anzhitrendDao.addBatchAnzhiTrend(list);
	}

	public boolean delAnzhiTrend(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendDao.delAnzhiTrend(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiTrend(String ids){
		return anzhitrendDao.delBatchAnzhiTrend(ids);
	}

	public boolean updateAnzhiTrend(AnzhiTrend anzhitrend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendDao.updateAnzhiTrend(anzhitrend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiTrend> findAnzhiTrendAll(int size,int pageNum,String condition){
		QueryList<AnzhiTrend> list=anzhitrendDao.findAnzhiTrendAll(size,pageNum,condition);
		this.getAnzhiTrendReply(list.getList());
		return list;
	}
	
	/**
	 * 查询动态的回复
	 * 
	 */
	public void getAnzhiTrendReply(List<AnzhiTrend> list){
		for(AnzhiTrend ac:list){
			QueryList<AnzhiTrendReply> clist=anzhitrendreplyDao.findAnzhiTrendReplyAll(5000, 1, " and trend_id="+ac.getId());
			if(clist.getList().size()!=0){
				ac.setLs(clist.getList());
			}else{
				ac.setLs(null);
			}
		}
	}

	public boolean addAnzhiTrend(AnzhiTrend anzhitrend,	HttpServletRequest request, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhitrendDao.addAnzhiTrend(anzhitrend));

		//查找当前用户今天有没有完成写动态任务
		int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=1 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(n<3){
			//如果没有写满3条，则添加。同时增加用户的经验
			AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
			anzhiexperiencerecord.setAddTime(this.getNowTime());
			anzhiexperiencerecord.setExperienceNum(2);
			anzhiexperiencerecord.setExperienceType(1);
			anzhiexperiencerecord.setMemberId(am.getId());
			anzhiexperiencerecord.setState(0);
			anzhiexperiencerecord.setVote("当日完成发布动态一条，增加2个经验");
			pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
			
			//修改该用户的经验  先查找 后修改
			
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 2);	
			int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
			am.setMemberExperience(jingyan);
			request.getSession().setAttribute("loginUsers", am);
		}
		
		this.excuteUpdate(pojoList);
		return false;
	}


}