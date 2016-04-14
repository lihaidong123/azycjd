package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiChapterUpdateRecord;
import com.anzhi.web.service.IAnzhiChapterUpdateRecordService;
import java.util.Date;
@Controller
public class AnzhiChapterUpdateRecordController extends GetCondition {
	@Autowired
	private IAnzhiChapterUpdateRecordService anzhichapterupdaterecordService;
	@RequestMapping(value="/anzhichapterupdaterecord/addAnzhiChapterUpdateRecord",method=RequestMethod.POST)
	public void addAnzhiChapterUpdateRecord(HttpServletRequest request,HttpServletResponse response,AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		if(request.getSession().getAttribute("addAnzhiChapterUpdateRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiChapterUpdateRecordSession","true");
				if(anzhichapterupdaterecord.getId()==null||anzhichapterupdaterecord.getId()==0){
					anzhichapterupdaterecordService.addAnzhiChapterUpdateRecord(anzhichapterupdaterecord);
				}else{
					anzhichapterupdaterecordService.updateAnzhiChapterUpdateRecord(anzhichapterupdaterecord);
				}
				response.sendRedirect(request.getContextPath()+"/anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiChapterUpdateRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhichapterupdaterecord/addBatchAnzhiChapterUpdateRecord",method=RequestMethod.POST)
	public String addBatchAnzhiChapterUpdateRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiChapterUpdateRecord> list=new ArrayList<AnzhiChapterUpdateRecord>();
		anzhichapterupdaterecordService.addBatchAnzhiChapterUpdateRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapterupdaterecord/delAnzhiChapterUpdateRecord",method=RequestMethod.POST)
	public void delAnzhiChapterUpdateRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiChapterUpdateRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiChapterUpdateRecordSession","true");
				int id=request.getParameter("anzhichapterupdaterecordId")==null?0:Integer.parseInt(request.getParameter("anzhichapterupdaterecordId"));
				anzhichapterupdaterecordService.delAnzhiChapterUpdateRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiChapterUpdateRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhichapterupdaterecord/delBatchAnzhiChapterUpdateRecord",method=RequestMethod.POST)
	public String delBatchAnzhiChapterUpdateRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhichapterupdaterecordIds");
		anzhichapterupdaterecordService.delBatchAnzhiChapterUpdateRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapterupdaterecord/updateAnzhiChapterUpdateRecord",method=RequestMethod.POST)
	public String updateAnzhiChapterUpdateRecord(HttpServletRequest request,HttpServletResponse response,AnzhiChapterUpdateRecord anzhichapterupdaterecord){
		if(request.getSession().getAttribute("updateAnzhiChapterUpdateRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiChapterUpdateRecordSession","true");
				anzhichapterupdaterecordService.updateAnzhiChapterUpdateRecord(anzhichapterupdaterecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiChapterUpdateRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll",method=RequestMethod.POST)
	public String findAnzhiChapterUpdateRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhichapterupdaterecordConditionArr, request, response);
		QueryList<AnzhiChapterUpdateRecord> list = anzhichapterupdaterecordService.findAnzhiChapterUpdateRecordAll(size, pageNum, condition);
		request.setAttribute("anzhichapterupdaterecordList", list);
		return this.getPageName(request, "admin/AnzhiChapterUpdateRecordManager");
	}

	@RequestMapping(value="/anzhichapterupdaterecord/findAnzhiChapterUpdateRecordById",method=RequestMethod.POST)
	public String findAnzhiChapterUpdateRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiChapterUpdateRecord> list = anzhichapterupdaterecordService.findAnzhiChapterUpdateRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhichapterupdaterecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiChapterUpdateRecordAction");
	}

	@RequestMapping(value="/anzhichapterupdaterecord/anzhichapterupdaterecordAction",method=RequestMethod.POST)
	public String anzhichapterupdaterecordAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiChapterUpdateRecordAction");
	}


}