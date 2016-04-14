package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiHeadImgUseRecord;
public interface IAnzhiHeadImgUseRecordService {
	public boolean addAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord);
	public boolean addBatchAnzhiHeadImgUseRecord(List<AnzhiHeadImgUseRecord> list);
	public boolean delAnzhiHeadImgUseRecord(int id);
	public boolean delBatchAnzhiHeadImgUseRecord(String ids);
	public boolean updateAnzhiHeadImgUseRecord(AnzhiHeadImgUseRecord anzhiheadimguserecord);
	public QueryList<AnzhiHeadImgUseRecord> findAnzhiHeadImgUseRecordAll(int size,int pageNum,String condition);

}