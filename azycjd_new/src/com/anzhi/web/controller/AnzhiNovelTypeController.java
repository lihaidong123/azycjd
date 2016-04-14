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
import com.anzhi.web.pojo.AnzhiNovelType;
import com.anzhi.web.service.IAnzhiNovelTypeService;
import java.util.Date;
@Controller
public class AnzhiNovelTypeController extends GetCondition {
	@Autowired
	private IAnzhiNovelTypeService anzhinoveltypeService;
	@RequestMapping(value="/anzhinoveltype/addAnzhiNovelType",method=RequestMethod.POST)
	public void addAnzhiNovelType(HttpServletRequest request,HttpServletResponse response,AnzhiNovelType anzhinoveltype){
		if(request.getSession().getAttribute("addAnzhiNovelTypeSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelTypeSession","true");
				if(anzhinoveltype.getId()==null||anzhinoveltype.getId()==0){
					anzhinoveltypeService.addAnzhiNovelType(anzhinoveltype);
				}else{
					anzhinoveltypeService.updateAnzhiNovelType(anzhinoveltype);
				}
				response.sendRedirect(request.getContextPath()+"/anzhinoveltype/findAnzhiNovelTypeAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelTypeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinoveltype/addBatchAnzhiNovelType",method=RequestMethod.POST)
	public String addBatchAnzhiNovelType(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelType> list=new ArrayList<AnzhiNovelType>();
		anzhinoveltypeService.addBatchAnzhiNovelType(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinoveltype/delAnzhiNovelType",method=RequestMethod.POST)
	public void delAnzhiNovelType(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelTypeSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelTypeSession","true");
				int id=request.getParameter("anzhinoveltypeId")==null?0:Integer.parseInt(request.getParameter("anzhinoveltypeId"));
				anzhinoveltypeService.delAnzhiNovelType(id);
				response.sendRedirect(request.getContextPath()+"/anzhinoveltype/findAnzhiNovelTypeAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelTypeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinoveltype/delBatchAnzhiNovelType",method=RequestMethod.POST)
	public String delBatchAnzhiNovelType(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinoveltypeIds");
		anzhinoveltypeService.delBatchAnzhiNovelType(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinoveltype/updateAnzhiNovelType",method=RequestMethod.POST)
	public String updateAnzhiNovelType(HttpServletRequest request,HttpServletResponse response,AnzhiNovelType anzhinoveltype){
		if(request.getSession().getAttribute("updateAnzhiNovelTypeSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelTypeSession","true");
				anzhinoveltypeService.updateAnzhiNovelType(anzhinoveltype);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelTypeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinoveltype/findAnzhiNovelTypeAll",method=RequestMethod.POST)
	public String findAnzhiNovelTypeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinoveltypeConditionArr, request, response);
		QueryList<AnzhiNovelType> list = anzhinoveltypeService.findAnzhiNovelTypeAll(size, pageNum, condition);
		request.setAttribute("anzhinoveltypeList", list);
		return this.getPageName(request, "admin/AnzhiNovelTypeManager");
	}

	@RequestMapping(value="/anzhinoveltype/findAnzhiNovelTypeById",method=RequestMethod.POST)
	public String findAnzhiNovelTypeById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelType> list = anzhinoveltypeService.findAnzhiNovelTypeAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinoveltypeId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNovelTypeAction");
	}

	@RequestMapping(value="/anzhinoveltype/anzhinoveltypeAction",method=RequestMethod.POST)
	public String anzhinoveltypeAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelTypeAction");
	}


}