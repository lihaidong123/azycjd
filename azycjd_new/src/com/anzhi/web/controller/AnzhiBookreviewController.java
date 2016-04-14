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
import com.anzhi.web.pojo.AnzhiBookreview;
import com.anzhi.web.service.IAnzhiBookreviewService;
import java.util.Date;
@Controller
public class AnzhiBookreviewController extends GetCondition {
	@Autowired
	private IAnzhiBookreviewService anzhibookreviewService;
	@RequestMapping(value="/anzhibookreview/addAnzhiBookreview",method=RequestMethod.POST)
	public void addAnzhiBookreview(HttpServletRequest request,HttpServletResponse response,AnzhiBookreview anzhibookreview){
		if(request.getSession().getAttribute("addAnzhiBookreviewSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiBookreviewSession","true");
				if(anzhibookreview.getId()==null||anzhibookreview.getId()==0){
					anzhibookreviewService.addAnzhiBookreview(anzhibookreview);
				}else{
					anzhibookreviewService.updateAnzhiBookreview(anzhibookreview);
				}
				response.sendRedirect(request.getContextPath()+"/anzhibookreview/findAnzhiBookreviewAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiBookreviewSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibookreview/addBatchAnzhiBookreview",method=RequestMethod.POST)
	public String addBatchAnzhiBookreview(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiBookreview> list=new ArrayList<AnzhiBookreview>();
		anzhibookreviewService.addBatchAnzhiBookreview(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookreview/delAnzhiBookreview",method=RequestMethod.POST)
	public void delAnzhiBookreview(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiBookreviewSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiBookreviewSession","true");
				int id=request.getParameter("anzhibookreviewId")==null?0:Integer.parseInt(request.getParameter("anzhibookreviewId"));
				anzhibookreviewService.delAnzhiBookreview(id);
				response.sendRedirect(request.getContextPath()+"/anzhibookreview/findAnzhiBookreviewAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiBookreviewSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibookreview/delBatchAnzhiBookreview",method=RequestMethod.POST)
	public String delBatchAnzhiBookreview(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhibookreviewIds");
		anzhibookreviewService.delBatchAnzhiBookreview(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookreview/updateAnzhiBookreview",method=RequestMethod.POST)
	public String updateAnzhiBookreview(HttpServletRequest request,HttpServletResponse response,AnzhiBookreview anzhibookreview){
		if(request.getSession().getAttribute("updateAnzhiBookreviewSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiBookreviewSession","true");
				anzhibookreviewService.updateAnzhiBookreview(anzhibookreview);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiBookreviewSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookreview/findAnzhiBookreviewAll",method=RequestMethod.POST)
	public String findAnzhiBookreviewAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhibookreviewConditionArr, request, response);
		QueryList<AnzhiBookreview> list = anzhibookreviewService.findAnzhiBookreviewAll(size, pageNum, condition);
		request.setAttribute("anzhibookreviewList", list);
		return this.getPageName(request, "admin/AnzhiBookreviewManager");
	}

	@RequestMapping(value="/anzhibookreview/findAnzhiBookreviewById",method=RequestMethod.POST)
	public String findAnzhiBookreviewById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiBookreview> list = anzhibookreviewService.findAnzhiBookreviewAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhibookreviewId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiBookreviewAction");
	}

	@RequestMapping(value="/anzhibookreview/anzhibookreviewAction",method=RequestMethod.POST)
	public String anzhibookreviewAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiBookreviewAction");
	}


}