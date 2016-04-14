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
import com.anzhi.web.pojo.AnzhiRecharge;
import com.anzhi.web.service.IAnzhiRechargeService;
import java.util.Date;
@Controller
public class AnzhiRechargeController extends GetCondition {
	@Autowired
	private IAnzhiRechargeService anzhirechargeService;
	@RequestMapping(value="/anzhirecharge/addAnzhiRecharge",method=RequestMethod.POST)
	public void addAnzhiRecharge(HttpServletRequest request,HttpServletResponse response,AnzhiRecharge anzhirecharge){
		if(request.getSession().getAttribute("addAnzhiRechargeSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiRechargeSession","true");
				if(anzhirecharge.getId()==null||anzhirecharge.getId()==0){
					anzhirechargeService.addAnzhiRecharge(anzhirecharge);
				}else{
					anzhirechargeService.updateAnzhiRecharge(anzhirecharge);
				}
				response.sendRedirect(request.getContextPath()+"/anzhirecharge/findAnzhiRechargeAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiRechargeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhirecharge/addBatchAnzhiRecharge",method=RequestMethod.POST)
	public String addBatchAnzhiRecharge(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiRecharge> list=new ArrayList<AnzhiRecharge>();
		anzhirechargeService.addBatchAnzhiRecharge(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecharge/delAnzhiRecharge",method=RequestMethod.POST)
	public void delAnzhiRecharge(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiRechargeSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiRechargeSession","true");
				int id=request.getParameter("anzhirechargeId")==null?0:Integer.parseInt(request.getParameter("anzhirechargeId"));
				anzhirechargeService.delAnzhiRecharge(id);
				response.sendRedirect(request.getContextPath()+"/anzhirecharge/findAnzhiRechargeAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiRechargeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhirecharge/delBatchAnzhiRecharge",method=RequestMethod.POST)
	public String delBatchAnzhiRecharge(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhirechargeIds");
		anzhirechargeService.delBatchAnzhiRecharge(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecharge/updateAnzhiRecharge",method=RequestMethod.POST)
	public String updateAnzhiRecharge(HttpServletRequest request,HttpServletResponse response,AnzhiRecharge anzhirecharge){
		if(request.getSession().getAttribute("updateAnzhiRechargeSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiRechargeSession","true");
				anzhirechargeService.updateAnzhiRecharge(anzhirecharge);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiRechargeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecharge/findAnzhiRechargeAll",method=RequestMethod.POST)
	public String findAnzhiRechargeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhirechargeConditionArr, request, response);
		QueryList<AnzhiRecharge> list = anzhirechargeService.findAnzhiRechargeAll(size, pageNum, condition);
		request.setAttribute("anzhirechargeList", list);
		return this.getPageName(request, "admin/AnzhiRechargeManager");
	}

	@RequestMapping(value="/anzhirecharge/findAnzhiRechargeById",method=RequestMethod.POST)
	public String findAnzhiRechargeById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiRecharge> list = anzhirechargeService.findAnzhiRechargeAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhirechargeId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiRechargeAction");
	}

	@RequestMapping(value="/anzhirecharge/anzhirechargeAction",method=RequestMethod.POST)
	public String anzhirechargeAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiRechargeAction");
	}
	
	@RequestMapping(value="/anzhirecharge/findMyAnzhiRechargeAll")
	public String findMyAnzhiRechargeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhirechargeConditionArr, request, response);
		QueryList<AnzhiRecharge> list = anzhirechargeService.findAnzhiRechargeAll(size, pageNum, " and member_id='"+this.getLoginMemberId(request)+"'");
		request.setAttribute("myanzhirechargeList", list);
		return this.getPageName(request, "index/information_account_recharge");
	}

}