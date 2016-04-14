package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiExperienceRecordService {
	public boolean addAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord);
	public boolean addAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord,HttpServletRequest request,AnzhiMember am);
	public boolean addBatchAnzhiExperienceRecord(List<AnzhiExperienceRecord> list);
	public boolean delAnzhiExperienceRecord(int id);
	public boolean delBatchAnzhiExperienceRecord(String ids);
	public boolean updateAnzhiExperienceRecord(AnzhiExperienceRecord anzhiexperiencerecord);
	public QueryList<AnzhiExperienceRecord> findAnzhiExperienceRecordAll(int size,int pageNum,String condition);

}