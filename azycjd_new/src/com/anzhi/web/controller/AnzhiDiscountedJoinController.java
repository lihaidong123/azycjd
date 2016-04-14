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
import com.anzhi.web.pojo.AnzhiDiscountedJoin;
import com.anzhi.web.service.IAnzhiDiscountedJoinService;
import java.util.Date;
@Controller
public class AnzhiDiscountedJoinController extends GetCondition {
	@Autowired
	private IAnzhiDiscountedJoinService anzhidiscountedjoinService;
	@RequestMapping(value="/anzhidiscountedjoin/addAnzhiDiscountedJoin",method=RequestMethod.POST)
	public void addAnzhiDiscountedJoin(HttpServletRequest request,HttpServletResponse response,AnzhiDiscountedJoin anzhidiscountedjoin){
		if(request.getSession().getAttribute("addAnzhiDiscountedJoinSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiDiscountedJoinSession","true");
				if(anzhidiscountedjoin.getId()==null||anzhidiscountedjoin.getId()==0){
					anzhidiscountedjoinService.addAnzhiDiscountedJoin(anzhidiscountedjoin);
				}else{
					anzhidiscountedjoinService.updateAnzhiDiscountedJoin(anzhidiscountedjoin);
				}
				response.sendRedirect(request.getContextPath()+"/anzhidiscountedjoin/findAnzhiDiscountedJoinAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiDiscountedJoinSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhidiscountedjoin/addBatchAnzhiDiscountedJoin",method=RequestMethod.POST)
	public String addBatchAnzhiDiscountedJoin(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiDiscountedJoin> list=new ArrayList<AnzhiDiscountedJoin>();
		anzhidiscountedjoinService.addBatchAnzhiDiscountedJoin(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscountedjoin/delAnzhiDiscountedJoin",method=RequestMethod.POST)
	public void delAnzhiDiscountedJoin(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiDiscountedJoinSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiDiscountedJoinSession","true");
				int id=request.getParameter("anzhidiscountedjoinId")==null?0:Integer.parseInt(request.getParameter("anzhidiscountedjoinId"));
				anzhidiscountedjoinService.delAnzhiDiscountedJoin(id);
				response.sendRedirect(request.getContextPath()+"/anzhidiscountedjoin/findAnzhiDiscountedJoinAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiDiscountedJoinSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhidiscountedjoin/delBatchAnzhiDiscountedJoin",method=RequestMethod.POST)
	public String delBatchAnzhiDiscountedJoin(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhidiscountedjoinIds");
		anzhidiscountedjoinService.delBatchAnzhiDiscountedJoin(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscountedjoin/updateAnzhiDiscountedJoin",method=RequestMethod.POST)
	public String updateAnzhiDiscountedJoin(HttpServletRequest request,HttpServletResponse response,AnzhiDiscountedJoin anzhidiscountedjoin){
		if(request.getSession().getAttribute("updateAnzhiDiscountedJoinSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiDiscountedJoinSession","true");
				anzhidiscountedjoinService.updateAnzhiDiscountedJoin(anzhidiscountedjoin);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiDiscountedJoinSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhidiscountedjoin/findAnzhiDiscountedJoinAll",method=RequestMethod.POST)
	public String findAnzhiDiscountedJoinAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhidiscountedjoinConditionArr, request, response);
		QueryList<AnzhiDiscountedJoin> list = anzhidiscountedjoinService.findAnzhiDiscountedJoinAll(size, pageNum, condition);
		request.setAttribute("anzhidiscountedjoinList", list);
		return this.getPageName(request, "admin/AnzhiDiscountedJoinManager");
	}

	@RequestMapping(value="/anzhidiscountedjoin/findAnzhiDiscountedJoinById",method=RequestMethod.POST)
	public String findAnzhiDiscountedJoinById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiDiscountedJoin> list = anzhidiscountedjoinService.findAnzhiDiscountedJoinAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhidiscountedjoinId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiDiscountedJoinAction");
	}

	@RequestMapping(value="/anzhidiscountedjoin/anzhidiscountedjoinAction",method=RequestMethod.POST)
	public String anzhidiscountedjoinAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiDiscountedJoinAction");
	}


}