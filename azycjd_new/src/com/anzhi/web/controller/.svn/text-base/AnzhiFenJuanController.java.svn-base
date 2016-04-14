package com.anzhi.web.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.service.IAnzhiFenJuanService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiFenJuanController extends GetCondition {
	@Autowired
	private IAnzhiFenJuanService anzhifenjuanService;
	@RequestMapping(value="/anzhifenjuan/addAnzhiFenJuan",method=RequestMethod.POST)
	public void addAnzhiFenJuan(HttpServletRequest request,HttpServletResponse response,AnzhiFenJuan anzhifenjuan){
		if(request.getSession().getAttribute("addAnzhiFenJuanSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiFenJuanSession","true");
				if(anzhifenjuan.getId()==null||anzhifenjuan.getId()==0){
					anzhifenjuan.setAddTime(getTimestamp());
					anzhifenjuanService.addAnzhiFenJuan(anzhifenjuan);
				}else{
					anzhifenjuanService.updateAnzhiFenJuan(anzhifenjuan);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhifenjuan/findAnzhiFenJuanAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiFenJuanSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhifenjuan/addBatchAnzhiFenJuan",method=RequestMethod.POST)
	public String addBatchAnzhiFenJuan(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiFenJuan> list=new ArrayList<AnzhiFenJuan>();
		anzhifenjuanService.addBatchAnzhiFenJuan(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifenjuan/delAnzhiFenJuan",method=RequestMethod.POST)
	public void delAnzhiFenJuan(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiFenJuanSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiFenJuanSession","true");
				int id=request.getParameter("anzhifenjuanId")==null?0:Integer.parseInt(request.getParameter("anzhifenjuanId"));
				anzhifenjuanService.delAnzhiFenJuan(id);
				response.sendRedirect(request.getContextPath()+"/anzhifenjuan/findAnzhiFenJuanAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiFenJuanSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhifenjuan/delBatchAnzhiFenJuan",method=RequestMethod.POST)
	public String delBatchAnzhiFenJuan(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhifenjuanIds");
		anzhifenjuanService.delBatchAnzhiFenJuan(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifenjuan/updateAnzhiFenJuan",method=RequestMethod.POST)
	public String updateAnzhiFenJuan(HttpServletRequest request,HttpServletResponse response,AnzhiFenJuan anzhifenjuan){
		if(request.getSession().getAttribute("updateAnzhiFenJuanSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiFenJuanSession","true");
				anzhifenjuanService.updateAnzhiFenJuan(anzhifenjuan);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiFenJuanSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifenjuan/findAnzhiFenJuanAll")
	public String findAnzhiFenJuanAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhifenjuanConditionArr, request, response);
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(size, pageNum, condition,request);
		request.setAttribute("anzhifenjuanList", list);
		return this.getPageName(request, "index/line_bookmanage_roll");
	}
	
	@RequestMapping(value="/anzhifenjuan/findAnzhiFenJuanManage")
	public String findAnzhiFenJuanManage(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhifenjuanConditionArr, request, response);
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(size, pageNum, condition,request);
		request.setAttribute("anzhifenjuanList", list);
		return this.getPageName(request, "admin/AnzhiChapterManager");
	}

	@RequestMapping(value="/anzhifenjuan/findAnzhiFenJuanById",method=RequestMethod.POST)
	public String findAnzhiFenJuanById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhifenjuanId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiFenJuanAction");
	}

	@RequestMapping(value="/anzhifenjuan/anzhifenjuanAction",method=RequestMethod.POST)
	public String anzhifenjuanAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiFenJuanAction");
	}

	@RequestMapping(value="/anzhifenjuan/lineNewchapter",method=RequestMethod.POST)
	public void lineNewchapter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10000;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhifenjuanConditionArr, request, response);
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(size, pageNum, condition);
		JSONArray jsonItems=new JSONArray();
		for(AnzhiFenJuan p:list.getList()){
			jsonItems.add(JSONObject.fromObject(p));
		}
		JSONObject jsonBack=new JSONObject();
		jsonBack.put("data", jsonItems);
		jsonBack.put("inputId", request.getParameter("inputId"));
		jsonBack.put("valueField", request.getParameter("valueField"));
		jsonBack.put("displayField", request.getParameter("displayField"));
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(jsonBack);
	}

}