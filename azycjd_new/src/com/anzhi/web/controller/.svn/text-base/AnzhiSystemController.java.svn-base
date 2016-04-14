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
import com.anzhi.web.pojo.AnzhiSystem;
import com.anzhi.web.service.IAnzhiSystemService;
import java.util.Date;
@Controller
public class AnzhiSystemController extends GetCondition {
	@Autowired
	private IAnzhiSystemService anzhisystemService;
	@RequestMapping(value="/anzhisystem/addAnzhiSystem",method=RequestMethod.POST)
	public void addAnzhiSystem(HttpServletRequest request,HttpServletResponse response,AnzhiSystem anzhisystem){
		if(request.getSession().getAttribute("addAnzhiSystemSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiSystemSession","true");
				if(anzhisystem.getId()==null||anzhisystem.getId()==0){
					anzhisystemService.addAnzhiSystem(anzhisystem);
				}else{
					anzhisystemService.updateAnzhiSystem(anzhisystem);
				}
				response.sendRedirect(request.getContextPath()+"/anzhisystem/findAnzhiSystemAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiSystemSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhisystem/addBatchAnzhiSystem",method=RequestMethod.POST)
	public String addBatchAnzhiSystem(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiSystem> list=new ArrayList<AnzhiSystem>();
		anzhisystemService.addBatchAnzhiSystem(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhisystem/delAnzhiSystem",method=RequestMethod.POST)
	public void delAnzhiSystem(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiSystemSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiSystemSession","true");
				int id=request.getParameter("anzhisystemId")==null?0:Integer.parseInt(request.getParameter("anzhisystemId"));
				anzhisystemService.delAnzhiSystem(id);
				response.sendRedirect(request.getContextPath()+"/anzhisystem/findAnzhiSystemAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiSystemSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhisystem/delBatchAnzhiSystem",method=RequestMethod.POST)
	public String delBatchAnzhiSystem(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhisystemIds");
		anzhisystemService.delBatchAnzhiSystem(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhisystem/updateAnzhiSystem",method=RequestMethod.POST)
	public String updateAnzhiSystem(HttpServletRequest request,HttpServletResponse response,AnzhiSystem anzhisystem){
		if(request.getSession().getAttribute("updateAnzhiSystemSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiSystemSession","true");
				anzhisystemService.updateAnzhiSystem(anzhisystem);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiSystemSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhisystem/findAnzhiSystemAll",method=RequestMethod.POST)
	public String findAnzhiSystemAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhisystemConditionArr, request, response);
		QueryList<AnzhiSystem> list = anzhisystemService.findAnzhiSystemAll(size, pageNum, condition);
		request.setAttribute("anzhisystemList", list);
		return this.getPageName(request, "admin/AnzhiSystemManager");
	}

	@RequestMapping(value="/anzhisystem/findAnzhiSystemById",method=RequestMethod.POST)
	public String findAnzhiSystemById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiSystem> list = anzhisystemService.findAnzhiSystemAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhisystemId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiSystemAction");
	}

	@RequestMapping(value="/anzhisystem/anzhisystemAction",method=RequestMethod.POST)
	public String anzhisystemAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiSystemAction");
	}


}