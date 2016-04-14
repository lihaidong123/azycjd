package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiDiscounted;
import com.anzhi.web.pojo.AnzhiRecommend;
import com.anzhi.web.dao.IAnzhiDiscountedDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiDiscountedService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiDiscountedServiceImpl extends ActionDb  implements IAnzhiDiscountedService {
	@Autowired
	private IAnzhiDiscountedDao anzhidiscountedDao;
	public boolean addAnzhiDiscounted(AnzhiDiscounted anzhidiscounted){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedDao.addAnzhiDiscounted(anzhidiscounted));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiDiscounted(List<AnzhiDiscounted> list){
		return anzhidiscountedDao.addBatchAnzhiDiscounted(list);
	}

	public boolean delAnzhiDiscounted(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedDao.delAnzhiDiscounted(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiDiscounted(String ids){
		return anzhidiscountedDao.delBatchAnzhiDiscounted(ids);
	}

	public boolean updateAnzhiDiscounted(AnzhiDiscounted anzhidiscounted){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhidiscountedDao.updateAnzhiDiscounted(anzhidiscounted));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiDiscounted> findAnzhiDiscountedAll(int size,int pageNum,String condition){
		return anzhidiscountedDao.findAnzhiDiscountedAll(size,pageNum,condition);
	}

	public boolean addAnzhiDiscounted(AnzhiDiscounted anzhidiscounted,
			String discountedType, String[] b, String discountedEndDate,
			String discountedRebate, String vote, int memberId) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<b.length;i++){
			AnzhiDiscounted azdiscounted =new AnzhiDiscounted();
			azdiscounted.setNovelId(Integer.parseInt(b[i]));
			azdiscounted.setAddMemberId(memberId);
			azdiscounted.setState(0);
			azdiscounted.setAddTime(this.getNowTime());
			azdiscounted.setDiscountedType(Integer.parseInt(discountedType));
			if(discountedRebate==""||discountedRebate==null){
				azdiscounted.setDiscountedRebate(0.0);
			}else{
				azdiscounted.setDiscountedRebate(Double.parseDouble(discountedRebate));
			}
			azdiscounted.setDiscountedEndDate(Timestamp.valueOf(discountedEndDate));
			azdiscounted.setVote(vote);
			pojoList.add(anzhidiscountedDao.addAnzhiDiscounted(azdiscounted));
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean updateAnzhiDiscounted(AnzhiDiscounted anzhidiscounted,
			String discountedType, String[] b, String discountedEndDate,
			String discountedRebate, String vote, int memberId,int id) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<b.length;i++){
			AnzhiDiscounted azdiscounted =new AnzhiDiscounted();
			azdiscounted.setNovelId(Integer.parseInt(b[i]));
			azdiscounted.setAddMemberId(memberId);
			azdiscounted.setState(0);
			azdiscounted.setAddTime(this.getNowTime());
			azdiscounted.setDiscountedType(Integer.parseInt(discountedType));
			if(discountedRebate==""||discountedRebate==null){
				azdiscounted.setDiscountedRebate(0.0);
			}else{
				azdiscounted.setDiscountedRebate(Double.parseDouble(discountedRebate));
			}
			azdiscounted.setDiscountedEndDate(Timestamp.valueOf(discountedEndDate));
			azdiscounted.setVote(vote);
			azdiscounted.setId(id);
			pojoList.add(anzhidiscountedDao.updateAnzhiDiscounted(azdiscounted));
		}
		this.excuteUpdate(pojoList);
		return true;
	}


}