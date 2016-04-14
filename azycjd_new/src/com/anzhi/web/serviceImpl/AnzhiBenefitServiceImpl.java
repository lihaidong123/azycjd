package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiBenefit;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.dao.IAnzhiBenefitDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiBenefitService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiBenefitServiceImpl extends ActionDb  implements IAnzhiBenefitService {
	@Autowired
	private IAnzhiBenefitDao anzhibenefitDao;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	public boolean addAnzhiBenefit(AnzhiBenefit anzhibenefit){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		anzhibenefit.setAddTime(getNowTime());
		pojoList.add(anzhibenefitDao.addAnzhiBenefit(anzhibenefit));
		if(anzhibenefit.getBenefitType().equals("1")){
			//添加已经申请完结福利 标识
			AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
			anm.setActionType(19);
			anm.setAddTime(this.getNowTime());
			anm.setMemberId(0);
			anm.setNovelId(anzhibenefit.getNovelId());
			anm.setState(0);
			anm.setVote(anzhibenefit.getApplyReason());
			pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		}else if(anzhibenefit.getBenefitType().equals("0")){
			//添加已经申请上架福利 标识
			AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
			anm.setActionType(18);
			anm.setAddTime(this.getNowTime());
			anm.setMemberId(0);
			anm.setNovelId(anzhibenefit.getNovelId());
			anm.setState(0);
			anm.setVote(anzhibenefit.getApplyReason());
			pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiBenefit(List<AnzhiBenefit> list){
		return anzhibenefitDao.addBatchAnzhiBenefit(list);
	}

	public boolean delAnzhiBenefit(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibenefitDao.delAnzhiBenefit(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiBenefit(String ids){
		return anzhibenefitDao.delBatchAnzhiBenefit(ids);
	}

	public boolean updateAnzhiBenefit(AnzhiBenefit anzhibenefit){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhibenefitDao.updateAnzhiBenefit(anzhibenefit));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiBenefit> findAnzhiBenefitAll(int size,int pageNum,String condition){
		return anzhibenefitDao.findAnzhiBenefitAll(size,pageNum,condition);
	}


}