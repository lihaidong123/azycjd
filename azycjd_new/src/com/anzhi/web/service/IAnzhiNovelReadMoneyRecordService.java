package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyRecord;
public interface IAnzhiNovelReadMoneyRecordService {
	public boolean addAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord);
	public boolean addAnzhiNovelReadMoneyRecordMore(String memberArrId,String readMoney);
	public boolean addBatchAnzhiNovelReadMoneyRecord(List<AnzhiNovelReadMoneyRecord> list);
	public boolean delAnzhiNovelReadMoneyRecord(int id);
	public boolean delBatchAnzhiNovelReadMoneyRecord(String ids);
	public boolean updateAnzhiNovelReadMoneyRecord(AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord);
	public QueryList<AnzhiNovelReadMoneyRecord> findAnzhiNovelReadMoneyRecordAll(int size,int pageNum,String condition);

}