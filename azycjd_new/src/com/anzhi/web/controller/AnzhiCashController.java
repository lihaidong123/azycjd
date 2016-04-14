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
import com.anzhi.web.pojo.AnzhiCash;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiCashService;
import java.util.Date;
@Controller
public class AnzhiCashController extends GetCondition {
	@Autowired
	private IAnzhiCashService anzhicashService;
	@RequestMapping(value="/anzhicash/addAnzhiCash")
	public void addAnzhiCash(HttpServletRequest request,HttpServletResponse response,AnzhiCash anzhicash){
		if(request.getSession().getAttribute("addAnzhiCashSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiCashSession","true");
				if(anzhicash.getId()==null||anzhicash.getId()==0){
					AnzhiMember member=this.getLoginMember(request);
					response.setCharacterEncoding("utf-8");
					if(member==null){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
							anzhicashService.addAnzhiCash(anzhicash,member,request);
							response.getWriter().write("yes");
					}
					
				}else{
					anzhicashService.updateAnzhiCash(anzhicash);
				}
				response.sendRedirect(request.getContextPath()+"/anzhicash/findAnzhiCashAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiCashSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicash/addBatchAnzhiCash",method=RequestMethod.POST)
	public String addBatchAnzhiCash(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiCash> list=new ArrayList<AnzhiCash>();
		anzhicashService.addBatchAnzhiCash(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicash/delAnzhiCash",method=RequestMethod.POST)
	public void delAnzhiCash(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiCashSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCashSession","true");
				int id=request.getParameter("anzhicashId")==null?0:Integer.parseInt(request.getParameter("anzhicashId"));
				anzhicashService.delAnzhiCash(id);
				response.sendRedirect(request.getContextPath()+"/anzhicash/findAnzhiCashAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCashSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicash/delBatchAnzhiCash",method=RequestMethod.POST)
	public String delBatchAnzhiCash(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhicashIds");
		anzhicashService.delBatchAnzhiCash(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicash/updateAnzhiCash",method=RequestMethod.POST)
	public String updateAnzhiCash(HttpServletRequest request,HttpServletResponse response,AnzhiCash anzhicash){
		if(request.getSession().getAttribute("updateAnzhiCashSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiCashSession","true");
				anzhicashService.updateAnzhiCash(anzhicash);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiCashSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicash/findAnzhiCashAll")
	public String findAnzhiCashAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicashConditionArr, request, response);
		QueryList<AnzhiCash> list = anzhicashService.findAnzhiCashAll(size, pageNum, condition);
		request.setAttribute("anzhicashList", list);
		return this.getPageName(request, "admin/AnzhiCashManager");
	}

	@RequestMapping(value="/anzhicash/findAnzhiCashById",method=RequestMethod.POST)
	public String findAnzhiCashById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiCash> list = anzhicashService.findAnzhiCashAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhicashId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiCashAction");
	}

	@RequestMapping(value="/anzhicash/anzhicashAction",method=RequestMethod.POST)
	public String anzhicashAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiCashAction");
	}
	
	@RequestMapping(value="/anzhicash/findAnzhiCashMySelf",method=RequestMethod.POST)
	public String findAnzhiCashMySelf(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicashConditionArr, request, response);
		int memberid=this.getLoginMemberId(request);
		if(memberid == -1){
			return this.getPageName(request, "index");
		}
		QueryList<AnzhiCash> list = anzhicashService.findAnzhiCashAll(size, pageNum, " and member_id="+memberid);
		request.setAttribute("anzhicashList", list);
		return this.getPageName(request, "index/line_cash_manage");
	}


}