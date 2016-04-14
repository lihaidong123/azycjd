package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiCommentPraise;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.dao.IAnzhiCommentPraiseDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiCommentPraiseService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiCommentPraiseServiceImpl extends ActionDb  implements IAnzhiCommentPraiseService {
	@Autowired
	private IAnzhiCommentPraiseDao anzhicommentpraiseDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	public boolean addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentpraiseDao.addAnzhiCommentPraise(anzhicommentpraise));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiCommentPraise(List<AnzhiCommentPraise> list){
		return anzhicommentpraiseDao.addBatchAnzhiCommentPraise(list);
	}

	public boolean delAnzhiCommentPraise(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentpraiseDao.delAnzhiCommentPraise(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiCommentPraise(String ids){
		return anzhicommentpraiseDao.delBatchAnzhiCommentPraise(ids);
	}

	public boolean updateAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentpraiseDao.updateAnzhiCommentPraise(anzhicommentpraise));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiCommentPraise> findAnzhiCommentPraiseAll(int size,int pageNum,String condition){
		return anzhicommentpraiseDao.findAnzhiCommentPraiseAll(size,pageNum,condition);
	}

	public boolean addAnzhiCommentPraise(AnzhiCommentPraise anzhicommentpraise,
			HttpServletRequest request, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentpraiseDao.addAnzhiCommentPraise(anzhicommentpraise));
		
		//查找当前用户今天有没有完成点赞任务
		int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=8 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(n==0){
			//如果没有记录，则添加。同时增加用户的经验
			AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
			anzhiexperiencerecord.setAddTime(this.getNowTime());
			anzhiexperiencerecord.setExperienceNum(2);
			anzhiexperiencerecord.setExperienceType(8);
			anzhiexperiencerecord.setMemberId(am.getId());
			anzhiexperiencerecord.setState(0);
			anzhiexperiencerecord.setVote("当日完成第一条点赞，增加2个经验");
			pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
			
			//修改该用户的经验  先查找 后修改
			
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 2);	
			int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
			am.setMemberExperience(jingyan);
			request.getSession().setAttribute("loginUsers", am);
		}
		
		this.excuteUpdate(pojoList);
		anzhinovelService.createNovel(request.getRealPath("//"), anzhicommentpraise.getNovelId());
		return false;
	}


}