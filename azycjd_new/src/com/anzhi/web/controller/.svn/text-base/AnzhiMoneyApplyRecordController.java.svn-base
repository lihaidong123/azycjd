package com.anzhi.web.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiMoneyApplyRecord;
import com.anzhi.web.service.IAnzhiMoneyApplyRecordService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiMoneyApplyRecordController extends GetCondition {
	@Autowired
	private IAnzhiMoneyApplyRecordService anzhimoneyapplyrecordService;
	@RequestMapping(value="/anzhimoneyapplyrecord/addAnzhiMoneyApplyRecord")
	public void addAnzhiMoneyApplyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		if(request.getSession().getAttribute("addAnzhiMoneyApplyRecordSession")==null){
			try{
				response.setContentType("text/html;charset=utf-8");
				request.getSession().setAttribute("addAnzhiMoneyApplyRecordSession","true");
				if(anzhimoneyapplyrecord.getId()==null||anzhimoneyapplyrecord.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					if(am!=null&&this.checkParam(request, "chognzhi_money")){
						try {
							String tn=new SimpleDateFormat("yyyyMMddHHmmss-S").format(new java.util.Date());
							anzhimoneyapplyrecord.setAddTime(getTimestamp());
							anzhimoneyapplyrecord.setChongMoney(Double.parseDouble(request.getParameter("chognzhi_money")));
							anzhimoneyapplyrecord.setMemberId(am.getId());
							anzhimoneyapplyrecord.setOrderNo(tn);
							anzhimoneyapplyrecord.setState(0);
							anzhimoneyapplyrecordService.addAnzhiMoneyApplyRecord(anzhimoneyapplyrecord);
							response.getWriter().write(tn);
						} catch (Exception e) {
							response.getWriter().write("操作异常!");
						}
					}else{
						response.getWriter().write("您还没有登录呢!");
					}
					
				}else{
					anzhimoneyapplyrecordService.updateAnzhiMoneyApplyRecord(anzhimoneyapplyrecord);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiMoneyApplyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/addBatchAnzhiMoneyApplyRecord")
	public String addBatchAnzhiMoneyApplyRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiMoneyApplyRecord> list=new ArrayList<AnzhiMoneyApplyRecord>();
		anzhimoneyapplyrecordService.addBatchAnzhiMoneyApplyRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/delAnzhiMoneyApplyRecord")
	public void delAnzhiMoneyApplyRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiMoneyApplyRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiMoneyApplyRecordSession","true");
				int id=request.getParameter("anzhimoneyapplyrecordId")==null?0:Integer.parseInt(request.getParameter("anzhimoneyapplyrecordId"));
				anzhimoneyapplyrecordService.delAnzhiMoneyApplyRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiMoneyApplyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/delBatchAnzhiMoneyApplyRecord")
	public String delBatchAnzhiMoneyApplyRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhimoneyapplyrecordIds");
		anzhimoneyapplyrecordService.delBatchAnzhiMoneyApplyRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/updateAnzhiMoneyApplyRecord")
	public String updateAnzhiMoneyApplyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiMoneyApplyRecord anzhimoneyapplyrecord){
		if(request.getSession().getAttribute("updateAnzhiMoneyApplyRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiMoneyApplyRecordSession","true");
				anzhimoneyapplyrecordService.updateAnzhiMoneyApplyRecord(anzhimoneyapplyrecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiMoneyApplyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll")
	public String findAnzhiMoneyApplyRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=request.getParameter("pageNum")!=null&&request.getParameter("pageNum")!=""?Integer.parseInt(request.getParameter("pageNum")):0;
		String condition=this.getCondition(anzhimoneyapplyrecordConditionArr, request, response);
		QueryList<AnzhiMoneyApplyRecord> list = anzhimoneyapplyrecordService.findAnzhiMoneyApplyRecordAll(size, pageNum, condition);
		request.setAttribute("anzhimoneyapplyrecordList", list);
		return this.getPageName(request, "admin/AnzhiMoneyApplyRecordManager");
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordById")
	public String findAnzhiMoneyApplyRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiMoneyApplyRecord> list = anzhimoneyapplyrecordService.findAnzhiMoneyApplyRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhimoneyapplyrecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiMoneyApplyRecordAction");
	}

	@RequestMapping(value="/anzhimoneyapplyrecord/anzhimoneyapplyrecordAction")
	public String anzhimoneyapplyrecordAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiMoneyApplyRecordAction");
	}


}