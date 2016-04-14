package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiReport;
public interface IAnzhiReportService {
	public String addAnzhiReport(AnzhiReport anzhireport,HttpServletRequest request,AnzhiMember am);
	public boolean addBatchAnzhiReport(List<AnzhiReport> list);
	public boolean delAnzhiReport(int id);
	public boolean delBatchAnzhiReport(String ids);
	public boolean updateAnzhiReport(AnzhiReport anzhireport);
	public QueryList<AnzhiReport> findAnzhiReportAll(int size,int pageNum,String condition);

}