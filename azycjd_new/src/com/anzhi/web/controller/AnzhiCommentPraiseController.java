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
import com.anzhi.web.pojo.AnzhiCommentPraise;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiCommentPraiseService;
import java.util.Date;
@Controller
public class AnzhiCommentPraiseController extends GetCondition {
	@Autowired
	private IAnzhiCommentPraiseService anzhicommentpraiseService;
	@RequestMapping(value="/anzhicommentpraise/addAnzhiCommentPraise",method=RequestMethod.POST)
	public void addAnzhiCommentPraise(HttpServletRequest request,HttpServletResponse response,AnzhiCommentPraise anzhicommentpraise){
		if(request.getSession().getAttribute("addAnzhiCommentPraiseSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiCommentPraiseSession","true");
				if(anzhicommentpraise.getId()==null||anzhicommentpraise.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					response.setCharacterEncoding("utf-8");
					if(am==null||am.getId()==null){
						response.getWriter().write("您还没有登录呢");
					}else{
						anzhicommentpraise.setAddTime(getTimestamp());
						anzhicommentpraise.setMemberId(am.getId());
						anzhicommentpraise.setState(0);
						anzhicommentpraiseService.addAnzhiCommentPraise(anzhicommentpraise,request,am);
						response.getWriter().write("yes");
					}
				}else{
					anzhicommentpraiseService.updateAnzhiCommentPraise(anzhicommentpraise);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhicommentpraise/findAnzhiCommentPraiseAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiCommentPraiseSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicommentpraise/addBatchAnzhiCommentPraise",method=RequestMethod.POST)
	public String addBatchAnzhiCommentPraise(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiCommentPraise> list=new ArrayList<AnzhiCommentPraise>();
		anzhicommentpraiseService.addBatchAnzhiCommentPraise(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicommentpraise/delAnzhiCommentPraise",method=RequestMethod.POST)
	public void delAnzhiCommentPraise(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiCommentPraiseSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCommentPraiseSession","true");
				int id=request.getParameter("anzhicommentpraiseId")==null?0:Integer.parseInt(request.getParameter("anzhicommentpraiseId"));
				anzhicommentpraiseService.delAnzhiCommentPraise(id);
				response.sendRedirect(request.getContextPath()+"/anzhicommentpraise/findAnzhiCommentPraiseAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCommentPraiseSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhicommentpraise/delBatchAnzhiCommentPraise",method=RequestMethod.POST)
	public String delBatchAnzhiCommentPraise(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhicommentpraiseIds");
		anzhicommentpraiseService.delBatchAnzhiCommentPraise(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicommentpraise/updateAnzhiCommentPraise",method=RequestMethod.POST)
	public String updateAnzhiCommentPraise(HttpServletRequest request,HttpServletResponse response,AnzhiCommentPraise anzhicommentpraise){
		if(request.getSession().getAttribute("updateAnzhiCommentPraiseSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiCommentPraiseSession","true");
				anzhicommentpraiseService.updateAnzhiCommentPraise(anzhicommentpraise);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiCommentPraiseSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicommentpraise/findAnzhiCommentPraiseAll",method=RequestMethod.POST)
	public String findAnzhiCommentPraiseAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentpraiseConditionArr, request, response);
		QueryList<AnzhiCommentPraise> list = anzhicommentpraiseService.findAnzhiCommentPraiseAll(size, pageNum, condition);
		request.setAttribute("anzhicommentpraiseList", list);
		return this.getPageName(request, "admin/AnzhiCommentPraiseManager");
	}

	@RequestMapping(value="/anzhicommentpraise/findAnzhiCommentPraiseById",method=RequestMethod.POST)
	public String findAnzhiCommentPraiseById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiCommentPraise> list = anzhicommentpraiseService.findAnzhiCommentPraiseAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhicommentpraiseId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiCommentPraiseAction");
	}

	@RequestMapping(value="/anzhicommentpraise/anzhicommentpraiseAction",method=RequestMethod.POST)
	public String anzhicommentpraiseAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiCommentPraiseAction");
	}


}