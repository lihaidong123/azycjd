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
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiReport;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiReportService;
import java.util.Date;
@Controller
public class AnzhiReportController extends GetCondition {
	@Autowired
	private IAnzhiReportService anzhireportService;
	@Autowired
	private IAnzhiChapterService anzhichapterService;
	@RequestMapping(value="/anzhireport/addAnzhiReport",method=RequestMethod.POST)
	public void addAnzhiReport(HttpServletRequest request,HttpServletResponse response,AnzhiReport anzhireport){
		if(request.getSession().getAttribute("addAnzhiReportSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiReportSession","true");
				if(anzhireport.getId()==null||anzhireport.getId()==0){
					response.setContentType("text/html;charset=utf-8");
					AnzhiMember am=this.getLoginMember(request);
					if(am==null||am.getId()==null){
						response.getWriter().write("您还没有登录呢");
						return;
					}
					response.getWriter().write(anzhireportService.addAnzhiReport(anzhireport,request,am));
				}else{
					anzhireportService.updateAnzhiReport(anzhireport);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhireport/findAnzhiReportAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiReportSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhireport/addBatchAnzhiReport",method=RequestMethod.POST)
	public String addBatchAnzhiReport(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiReport> list=new ArrayList<AnzhiReport>();
		anzhireportService.addBatchAnzhiReport(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhireport/delAnzhiReport",method=RequestMethod.POST)
	public void delAnzhiReport(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiReportSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiReportSession","true");
				int id=request.getParameter("anzhireportId")==null?0:Integer.parseInt(request.getParameter("anzhireportId"));
				anzhireportService.delAnzhiReport(id);
				response.sendRedirect(request.getContextPath()+"/anzhireport/findAnzhiReportAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiReportSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhireport/delBatchAnzhiReport",method=RequestMethod.POST)
	public String delBatchAnzhiReport(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhireportIds");
		anzhireportService.delBatchAnzhiReport(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhireport/updateAnzhiReport",method=RequestMethod.POST)
	public String updateAnzhiReport(HttpServletRequest request,HttpServletResponse response,AnzhiReport anzhireport){
		if(request.getSession().getAttribute("updateAnzhiReportSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiReportSession","true");
				anzhireportService.updateAnzhiReport(anzhireport);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiReportSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhireport/findAnzhiReportAll")
	public String findAnzhiReportAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhireportConditionArr, request, response);
		QueryList<AnzhiReport> list = anzhireportService.findAnzhiReportAll(size, pageNum, condition);
		request.setAttribute("anzhireportList", list);
		return this.getPageName(request, "admin/AnzhiReportManager");
	}

	@RequestMapping(value="/anzhireport/findAnzhiReportById",method=RequestMethod.POST)
	public String findAnzhiReportById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiReport> list = anzhireportService.findAnzhiReportAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhireportId")));
		if(list.getList().size()!=0){
			AnzhiReport ar=list.getList().get(0);
			request.setAttribute("pojo",ar );
			QueryList<AnzhiChapter> ls=anzhichapterService.findAnzhiChapterAll(1, 1, " and id="+ar.getTableType());
			if(ls.getList().size()!=0){
				request.setAttribute("chapterpojo",ls.getList().get(0));
			}
		}
		return this.getPageName(request, "admin/AnzhiReportAction");
	}

	@RequestMapping(value="/anzhireport/anzhireportAction",method=RequestMethod.POST)
	public String anzhireportAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiReportAction");
	}


}