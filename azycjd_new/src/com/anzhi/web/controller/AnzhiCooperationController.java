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
import com.anzhi.web.pojo.AnzhiCooperation;
import com.anzhi.web.service.IAnzhiCooperationService;
import java.util.Date;
@Controller
public class AnzhiCooperationController extends GetCondition {
	@Autowired
	private IAnzhiCooperationService anzhicooperationService;
	@RequestMapping(value="/anzhicooperation/addAnzhiCooperation",method=RequestMethod.POST)
	public void addAnzhiCooperation(HttpServletRequest request,HttpServletResponse response,AnzhiCooperation anzhicooperation){
		if(request.getSession().getAttribute("addAnzhiCooperationSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiCooperationSession","true");
				anzhicooperation.setAddTime(this.getTimestamp());
				if(anzhicooperation.getId()==null||anzhicooperation.getId()==0){
					int memberId=this.getLoginMemberId(request);
					response.setCharacterEncoding("utf-8");
					if(memberId==-1){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
						anzhicooperation.setAddMemberId(this.getLoginMemberId(request));
						anzhicooperation.setState(0);
						anzhicooperationService.addAnzhiCooperation(anzhicooperation);
						response.getWriter().write("yes");
					}
				}else{
					anzhicooperationService.updateAnzhiCooperation(anzhicooperation);
				}
				response.sendRedirect(request.getContextPath()+"/anzhicooperation/findAnzhiCooperationAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiCooperationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicooperation/addBatchAnzhiCooperation",method=RequestMethod.POST)
	public String addBatchAnzhiCooperation(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiCooperation> list=new ArrayList<AnzhiCooperation>();
		anzhicooperationService.addBatchAnzhiCooperation(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicooperation/delAnzhiCooperation",method=RequestMethod.POST)
	public void delAnzhiCooperation(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiCooperationSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCooperationSession","true");
				int id=request.getParameter("anzhicooperationId")==null?0:Integer.parseInt(request.getParameter("anzhicooperationId"));
				anzhicooperationService.delAnzhiCooperation(id);
				response.sendRedirect(request.getContextPath()+"/anzhicooperation/findAnzhiCooperationAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCooperationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicooperation/delBatchAnzhiCooperation",method=RequestMethod.POST)
	public String delBatchAnzhiCooperation(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhicooperationIds");
		anzhicooperationService.delBatchAnzhiCooperation(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicooperation/updateAnzhiCooperation",method=RequestMethod.POST)
	public String updateAnzhiCooperation(HttpServletRequest request,HttpServletResponse response,AnzhiCooperation anzhicooperation){
		if(request.getSession().getAttribute("updateAnzhiCooperationSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiCooperationSession","true");
				anzhicooperationService.updateAnzhiCooperation(anzhicooperation);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiCooperationSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicooperation/findAnzhiCooperationAll")
	public String findAnzhiCooperationAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicooperationConditionArr, request, response);
		QueryList<AnzhiCooperation> list = anzhicooperationService.findAnzhiCooperationAll(size, pageNum, condition);
		request.setAttribute("anzhicooperationList", list);
		return this.getPageName(request, "admin/AnzhiCooperationManager");
	}

	@RequestMapping(value="/anzhicooperation/findAnzhiCooperationById",method=RequestMethod.POST)
	public String findAnzhiCooperationById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiCooperation> list = anzhicooperationService.findAnzhiCooperationAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhicooperationId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiCooperationAction");
	}

	@RequestMapping(value="/anzhicooperation/anzhicooperationAction",method=RequestMethod.POST)
	public String anzhicooperationAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiCooperationAction");
	}

	@RequestMapping(value="/anzhicooperation/findAnzhiCooperationAllQian")
	public String findAnzhiCooperationAllQian(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10000;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicooperationConditionArr, request, response);
		QueryList<AnzhiCooperation> list = anzhicooperationService.findAnzhiCooperationAll(size, pageNum, condition);
		request.setAttribute("anzhicooperationList", list);
		return this.getPageName(request, "hezuoqudao");
	}
}