package com.anzhi.web.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiDiscounted;
import com.anzhi.web.service.IAnzhiDiscountedService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiDiscountedController extends GetCondition {
	@Autowired
	private IAnzhiDiscountedService anzhidiscountedService;
	@RequestMapping(value="/anzhidiscounted/addAnzhiDiscounted",method=RequestMethod.POST)
	public void addAnzhiDiscounted(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("addAnzhiDiscountedSession")==null){
			try{
				AnzhiDiscounted anzhidiscounted=new AnzhiDiscounted();
				String id=request.getParameter("id");
				request.getSession().setAttribute("addAnzhiDiscountedSession","true");
				if(id==null||id.equals("")){
					String discountedType=request.getParameter("discountedType");
					String a=request.getParameter("novelId");
					String[] b=a.split(","); 
					String discountedEndDate=request.getParameter("discountedEndDate");
					String[] shijian= discountedEndDate.split(",");
					if(discountedType.equals("0")){
						discountedEndDate=shijian[0];
					}else{
						discountedEndDate=shijian[1];
					}
					
					String discountedRebate=request.getParameter("discountedRebate");
					String vote=request.getParameter("vote");
					int memberId=this.getLoginMemberId(request);
					response.setCharacterEncoding("utf-8");
					if(memberId==-1){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
						anzhidiscounted.setAddTime(this.getTimestamp());
						anzhidiscounted.setAddMemberId(this.getLoginMemberId(request));
						anzhidiscounted.setState(0);
						anzhidiscountedService.addAnzhiDiscounted(anzhidiscounted,discountedType,b,discountedEndDate,discountedRebate,vote,memberId);
					}
				}else{
					String discountedType=request.getParameter("discountedType");
					String a=request.getParameter("novelId");
					String[] b=a.split(","); 
					String discountedEndDate=request.getParameter("discountedEndDate");
					String[] shijian= discountedEndDate.split(",");
					if(discountedType.equals("0")){
						discountedEndDate=shijian[0];
					}else{
						discountedEndDate=shijian[1];
					}
					
					String discountedRebate=request.getParameter("discountedRebate");
					String vote=request.getParameter("vote");
					int memberId=this.getLoginMemberId(request);
					response.setCharacterEncoding("utf-8");
					if(memberId==-1){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
					anzhidiscounted.setAddTime(this.getTimestamp());
					anzhidiscounted.setAddMemberId(this.getLoginMemberId(request));
					anzhidiscounted.setState(0);
					anzhidiscountedService.updateAnzhiDiscounted(anzhidiscounted,discountedType,b,discountedEndDate,discountedRebate,vote,memberId,Integer.parseInt(id));
					response.sendRedirect(request.getContextPath()+"/anzhidiscounted/findAnzhiDiscountedAll.do");
				}
			}
				
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiDiscountedSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhidiscounted/addBatchAnzhiDiscounted",method=RequestMethod.POST)
	public String addBatchAnzhiDiscounted(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiDiscounted> list=new ArrayList<AnzhiDiscounted>();
		anzhidiscountedService.addBatchAnzhiDiscounted(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscounted/delAnzhiDiscounted",method=RequestMethod.POST)
	public void delAnzhiDiscounted(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiDiscountedSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiDiscountedSession","true");
				int id=request.getParameter("anzhidiscountedId")==null?0:Integer.parseInt(request.getParameter("anzhidiscountedId"));
				anzhidiscountedService.delAnzhiDiscounted(id);
				response.sendRedirect(request.getContextPath()+"/anzhidiscounted/findAnzhiDiscountedAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiDiscountedSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhidiscounted/delBatchAnzhiDiscounted",method=RequestMethod.POST)
	public String delBatchAnzhiDiscounted(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhidiscountedIds");
		anzhidiscountedService.delBatchAnzhiDiscounted(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscounted/updateAnzhiDiscounted",method=RequestMethod.POST)
	public String updateAnzhiDiscounted(HttpServletRequest request,HttpServletResponse response,AnzhiDiscounted anzhidiscounted){
		if(request.getSession().getAttribute("updateAnzhiDiscountedSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiDiscountedSession","true");
				anzhidiscountedService.updateAnzhiDiscounted(anzhidiscounted);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiDiscountedSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscounted/findAnzhiDiscountedAll")
	public String findAnzhiDiscountedAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhidiscountedConditionArr, request, response);
		QueryList<AnzhiDiscounted> list = anzhidiscountedService.findAnzhiDiscountedAll(size, pageNum, condition);
		for(AnzhiDiscounted ad:list.getList()){
			for(String s:discountedTypeTypeDate){
				String[] tmp=s.split(",");
				if(Integer.parseInt(tmp[0])==ad.getDiscountedType()){
					ad.setDiscountedTypeName(tmp[1]);
				}
			}
		}
		request.setAttribute("anzhidiscountedList", list);
		return this.getPageName(request, "admin/AnzhiDiscountedManager");
	}

	@RequestMapping(value="/anzhidiscounted/findAnzhiDiscountedById",method=RequestMethod.POST)
	public String findAnzhiDiscountedById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiDiscounted> list = anzhidiscountedService.findAnzhiDiscountedAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhidiscountedId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiDiscountedAction");
	}

	@RequestMapping(value="/anzhidiscounted/anzhidiscountedAction",method=RequestMethod.POST)
	public String anzhidiscountedAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiDiscountedAction");
	}


}