package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiRegistration;
import com.anzhi.web.service.IAnzhiRegistrationService;
import java.util.Date;
@Controller
public class AnzhiRegistrationController extends GetCondition {
	@Autowired
	private IAnzhiRegistrationService anzhiregistrationService;
	@RequestMapping(value="/anzhiregistration/addAnzhiRegistration",method=RequestMethod.POST)
	public void addAnzhiRegistration(HttpServletRequest request,HttpServletResponse response,AnzhiRegistration anzhiregistration){
		if(request.getSession().getAttribute("addAnzhiRegistrationSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiRegistrationSession","true");
				if(anzhiregistration.getId()==null||anzhiregistration.getId()==0){
					anzhiregistrationService.addAnzhiRegistration(anzhiregistration);
				}else{
					anzhiregistrationService.updateAnzhiRegistration(anzhiregistration);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiregistration/findAnzhiRegistrationAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiRegistrationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiregistration/addBatchAnzhiRegistration",method=RequestMethod.POST)
	public String addBatchAnzhiRegistration(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiRegistration> list=new ArrayList<AnzhiRegistration>();
		anzhiregistrationService.addBatchAnzhiRegistration(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiregistration/delAnzhiRegistration",method=RequestMethod.POST)
	public void delAnzhiRegistration(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiRegistrationSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiRegistrationSession","true");
				int id=request.getParameter("anzhiregistrationId")==null?0:Integer.parseInt(request.getParameter("anzhiregistrationId"));
				anzhiregistrationService.delAnzhiRegistration(id);
				response.sendRedirect(request.getContextPath()+"/anzhiregistration/findAnzhiRegistrationAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiRegistrationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiregistration/delBatchAnzhiRegistration",method=RequestMethod.POST)
	public String delBatchAnzhiRegistration(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiregistrationIds");
		anzhiregistrationService.delBatchAnzhiRegistration(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiregistration/updateAnzhiRegistration",method=RequestMethod.POST)
	public String updateAnzhiRegistration(HttpServletRequest request,HttpServletResponse response,AnzhiRegistration anzhiregistration){
		if(request.getSession().getAttribute("updateAnzhiRegistrationSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiRegistrationSession","true");
				anzhiregistrationService.updateAnzhiRegistration(anzhiregistration);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiRegistrationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiregistration/findAnzhiRegistrationAll",method=RequestMethod.POST)
	public String findAnzhiRegistrationAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiregistrationConditionArr, request, response);
		QueryList<AnzhiRegistration> list = anzhiregistrationService.findAnzhiRegistrationAll(size, pageNum, condition);
		request.setAttribute("anzhiregistrationList", list);
		return this.getPageName(request, "admin/AnzhiRegistrationManager");
	}

	@RequestMapping(value="/anzhiregistration/findAnzhiRegistrationById",method=RequestMethod.POST)
	public String findAnzhiRegistrationById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiRegistration> list = anzhiregistrationService.findAnzhiRegistrationAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiregistrationId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiRegistrationAction");
	}

	@RequestMapping(value="/anzhiregistration/anzhiregistrationAction",method=RequestMethod.POST)
	public String anzhiregistrationAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiRegistrationAction");
	}

	@RequestMapping(value="/anzhiregistration/findqiandao",method=RequestMethod.POST)
	public String findqiandao(HttpServletRequest request,HttpServletResponse response){
		AnzhiMember am=this.getLoginMember(request);
		if(am!=null&&am.getId()!=null){
			QueryList<AnzhiRegistration> list = anzhiregistrationService.findAnzhiRegistrationAll(10, 1, " and member="+am.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
			if(list.getList().size()==0){
				request.setAttribute("qiandao", "no");
			}else{
				request.setAttribute("qiandao", "yes");
			}
		}else{
			try {
				response.getWriter().write("您还没有登录呢");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return this.getPageName(request, "index/add_day_registration");
	}

}