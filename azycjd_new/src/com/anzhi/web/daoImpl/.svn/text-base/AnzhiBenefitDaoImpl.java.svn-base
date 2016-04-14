package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiBenefit;
import com.anzhi.web.dao.IAnzhiBenefitDao;
import java.util.Date;
@Repository
public class AnzhiBenefitDaoImpl extends ActionDb implements IAnzhiBenefitDao {
	public Pojo addAnzhiBenefit(AnzhiBenefit anzhibenefit){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_benefit values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhibenefit.getNovelId(),
			anzhibenefit.getApplyReason(),
			anzhibenefit.getBenefitState(),
			anzhibenefit.getAddTime(),
			anzhibenefit.getBenefitType(),
			anzhibenefit.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiBenefit(List<AnzhiBenefit> list){
		return this.excuteBatchUpdate("insert into anzhi_benefit values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiBenefit(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_benefit where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiBenefit(String ids){
		return this.excuteBatchUpdate("delete from anzhi_benefit where id=?",ids);
	}

	public Pojo updateAnzhiBenefit(AnzhiBenefit anzhibenefit){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_benefit set benefit_state=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhibenefit.getBenefitState(),
			anzhibenefit.getVote()
		,	anzhibenefit.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiBenefit> findAnzhiBenefitAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiBenefit(),"anzhi_benefit_view",size,pageNum,condition);
	}


}