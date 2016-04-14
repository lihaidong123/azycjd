package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyRecord;
import com.anzhi.web.dao.IAnzhiNovelReadMoneyRecordDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.OverrideTimestamp;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiNovelReadMoneyRecordService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelReadMoneyRecordServiceImpl extends ActionDb  implements IAnzhiNovelReadMoneyRecordService {
	@Autowired
	private IAnzhiNovelReadMoneyRecordDao anzhinovelreadmoneyrecordDao;
	public boolean addAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneyrecordDao.addAnzhiNovelReadMoneyRecord(anzhinovelreadmoneyrecord));
		//同时修改用户的阅读币余额
		int readMoney=this.getIntBySqlDb("select read_money from anzhi_member where id="+anzhinovelreadmoneyrecord.getMemberId());
		this.updateTableFieldAppend("anzhi_member", anzhinovelreadmoneyrecord.getMemberId(), "read_money", (anzhinovelreadmoneyrecord.getReadMoney()));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelReadMoneyRecord(List<AnzhiNovelReadMoneyRecord> list){
		return anzhinovelreadmoneyrecordDao.addBatchAnzhiNovelReadMoneyRecord(list);
	}

	public boolean delAnzhiNovelReadMoneyRecord(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneyrecordDao.delAnzhiNovelReadMoneyRecord(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelReadMoneyRecord(String ids){
		return anzhinovelreadmoneyrecordDao.delBatchAnzhiNovelReadMoneyRecord(ids);
	}

	public boolean updateAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelreadmoneyrecordDao.updateAnzhiNovelReadMoneyRecord(anzhinovelreadmoneyrecord));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelReadMoneyRecord> findAnzhiNovelReadMoneyRecordAll(int size,int pageNum,String condition){
		return anzhinovelreadmoneyrecordDao.findAnzhiNovelReadMoneyRecordAll(size,pageNum,condition);
	}

	public boolean addAnzhiNovelReadMoneyRecordMore(String memberArrId,
			String readMoney) {
		String[] arr=memberArrId.split(",");
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<arr.length;i++){
			String s=arr[i];
			AnzhiNovelReadMoneyRecord model=new AnzhiNovelReadMoneyRecord();
			model.setMemberId(Integer.parseInt(s));
			model.setReadMoney(Integer.parseInt(readMoney));
			model.setVote("批量充值");
			model.setState(0);
			model.setAddTime(getNowTime());
			pojoList.add(anzhinovelreadmoneyrecordDao.addAnzhiNovelReadMoneyRecord(model));
			//同时修改用户的阅读币余额
			this.updateTableFieldAppend("anzhi_member", Integer.parseInt(s), "read_money", (Integer.parseInt(readMoney)));
		}
		this.excuteUpdate(pojoList);
		return true;
	}


}