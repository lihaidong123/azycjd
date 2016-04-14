package com.anzhi.web.controller;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiIllegalChar;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.service.IAnzhiIllegalCharService;
import java.util.Date;
@Controller
public class AnzhiIllegalCharController extends GetCondition {
	@Autowired
	private IAnzhiIllegalCharService anzhiillegalcharService;
	@RequestMapping(value="/anzhiillegalchar/addAnzhiIllegalChar")
	public void addAnzhiIllegalChar(HttpServletRequest request,HttpServletResponse response,AnzhiIllegalChar anzhiillegalchar){
		if(request.getSession().getAttribute("addAnzhiIllegalCharSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiIllegalCharSession","true");
				anzhiillegalchar.setAddTime(getTimestamp());
				if(anzhiillegalchar.getId()==null||anzhiillegalchar.getId()==0){
					anzhiillegalcharService.addAnzhiIllegalChar(anzhiillegalchar);
				}else{
					anzhiillegalcharService.updateAnzhiIllegalChar(anzhiillegalchar);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiillegalchar/findAnzhiIllegalCharAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiIllegalCharSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiillegalchar/addBatchAnzhiIllegalChar")
	public String addBatchAnzhiIllegalChar(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiIllegalChar> list=new ArrayList<AnzhiIllegalChar>();
		anzhiillegalcharService.addBatchAnzhiIllegalChar(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiillegalchar/delAnzhiIllegalChar")
	public void delAnzhiIllegalChar(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiIllegalCharSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiIllegalCharSession","true");
				int id=request.getParameter("anzhiillegalcharId")==null?0:Integer.parseInt(request.getParameter("anzhiillegalcharId"));
				anzhiillegalcharService.delAnzhiIllegalChar(id);
				response.sendRedirect(request.getContextPath()+"/anzhiillegalchar/findAnzhiIllegalCharAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiIllegalCharSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiillegalchar/delBatchAnzhiIllegalChar")
	public String delBatchAnzhiIllegalChar(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiillegalcharIds");
		anzhiillegalcharService.delBatchAnzhiIllegalChar(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiillegalchar/updateAnzhiIllegalChar")
	public String updateAnzhiIllegalChar(HttpServletRequest request,HttpServletResponse response,AnzhiIllegalChar anzhiillegalchar){
		if(request.getSession().getAttribute("updateAnzhiIllegalCharSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiIllegalCharSession","true");
				anzhiillegalcharService.updateAnzhiIllegalChar(anzhiillegalchar);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiIllegalCharSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiillegalchar/findAnzhiIllegalCharAll")
	public String findAnzhiIllegalCharAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiillegalcharConditionArr, request, response);
		QueryList<AnzhiIllegalChar> list = anzhiillegalcharService.findAnzhiIllegalCharAll(size, pageNum, condition);
		request.setAttribute("anzhiillegalcharList", list);
		return this.getPageName(request, "admin/AnzhiIllegalCharManager");
	}

	@RequestMapping(value="/anzhiillegalchar/findAnzhiIllegalCharById")
	public String findAnzhiIllegalCharById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiIllegalChar> list = anzhiillegalcharService.findAnzhiIllegalCharAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiillegalcharId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiIllegalCharAction");
	}

	@RequestMapping(value="/anzhiillegalchar/anzhiillegalcharAction")
	public String anzhiillegalcharAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiIllegalCharAction");
	}
	
	@RequestMapping(value="/anzhiillegalchar/checkFeiFa")
	public void checkFeiFa(HttpServletRequest request,HttpServletResponse response) throws IOException{
		QueryList<AnzhiIllegalChar> list = anzhiillegalcharService.findAnzhiIllegalCharAll(5000, 1, null);
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		JSONObject jsonBack=new JSONObject();
		JSONArray arr=new JSONArray();
		for(AnzhiIllegalChar acp:list.getList()){
			arr.add(JSONObject.fromObject(acp));
		}
		jsonBack.put("data", arr);
		out.print(jsonBack);
	}

}