package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
public interface IAnzhiNovelReadMoneyBuyRecordService {
	public boolean addAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord);
	public boolean addBatchAnzhiNovelReadMoneyBuyRecord(List<AnzhiNovelReadMoneyBuyRecord> list);
	public boolean delAnzhiNovelReadMoneyBuyRecord(int id);
	public boolean delBatchAnzhiNovelReadMoneyBuyRecord(String ids);
	public boolean updateAnzhiNovelReadMoneyBuyRecord(AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord);
	public QueryList<AnzhiNovelReadMoneyBuyRecord> findAnzhiNovelReadMoneyBuyRecordAll(int size,int pageNum,String condition);

}