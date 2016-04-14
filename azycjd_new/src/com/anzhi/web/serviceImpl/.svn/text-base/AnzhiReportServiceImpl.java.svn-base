package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiReport;
import com.anzhi.web.dao.IAnzhiReportDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiReportService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiReportServiceImpl extends ActionDb  implements IAnzhiReportService {
	@Autowired
	private IAnzhiReportDao anzhireportDao;
	public String addAnzhiReport(AnzhiReport anzhireport,HttpServletRequest request,AnzhiMember am){
		int n=this.getIntBySqlDb("select count(*) from anzhi_report where add_member_id="+am.getId()+" and table_id="+anzhireport.getTableId()+" and table_type="+anzhireport.getTableType());
		if(n!=0){
			return "该小说下的这个章节您已经举报了。我们会尽快处理。感谢您的监督！";
		}
		anzhireport.setAddMemberId(am.getId());
		anzhireport.setAddTime(getNowTime());
		anzhireport.setState(0);
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhireportDao.addAnzhiReport(anzhireport));
		this.excuteUpdate(pojoList);
		return "yes";
	}

	public boolean addBatchAnzhiReport(List<AnzhiReport> list){
		return anzhireportDao.addBatchAnzhiReport(list);
	}

	public boolean delAnzhiReport(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhireportDao.delAnzhiReport(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiReport(String ids){
		return anzhireportDao.delBatchAnzhiReport(ids);
	}

	public boolean updateAnzhiReport(AnzhiReport anzhireport){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhireportDao.updateAnzhiReport(anzhireport));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiReport> findAnzhiReportAll(int size,int pageNum,String condition){
		return anzhireportDao.findAnzhiReportAll(size,pageNum,condition);
	}


}