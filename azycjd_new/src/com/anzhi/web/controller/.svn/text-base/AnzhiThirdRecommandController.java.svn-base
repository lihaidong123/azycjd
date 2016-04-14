package com.anzhi.web.controller;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ynzc.wuyuehu.ExcelRead;

import com.anzhi.web.pojo.AnzhiThirdRecommand;
import com.anzhi.web.service.IAnzhiThirdRecommandService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiThirdRecommandController extends GetCondition {
	@Autowired
	private IAnzhiThirdRecommandService anzhithirdrecommandService;
	@RequestMapping(value="/anzhithirdrecommand/addAnzhiThirdRecommand")
	public void addAnzhiThirdRecommand(HttpServletRequest request,HttpServletResponse response,AnzhiThirdRecommand anzhithirdrecommand){
		if(request.getSession().getAttribute("addAnzhiThirdRecommandSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiThirdRecommandSession","true");
				if(anzhithirdrecommand.getId()==null||anzhithirdrecommand.getId()==0){
					if(this.checkParam(request, "cooperationImg")){
						String s=request.getParameter("cooperationImg");
						s=request.getRealPath("//")+s.replace("azycjd_new", "");
						ExcelRead er=new ExcelRead();
						List list=er.importExcel(s, 0);
						response.setCharacterEncoding("utf-8");
						response.setContentType("application/json;charset=utf-8");
						PrintWriter out=response.getWriter();
						JSONObject jsonBack=anzhithirdrecommandService.addAnzhiThirdRecommand(anzhithirdrecommand,list);
						out.print(jsonBack);
					}
				}else{
					anzhithirdrecommandService.updateAnzhiThirdRecommand(anzhithirdrecommand);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhithirdrecommand/findAnzhiThirdRecommandAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiThirdRecommandSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhithirdrecommand/addBatchAnzhiThirdRecommand")
	public String addBatchAnzhiThirdRecommand(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiThirdRecommand> list=new ArrayList<AnzhiThirdRecommand>();
		anzhithirdrecommandService.addBatchAnzhiThirdRecommand(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdrecommand/delAnzhiThirdRecommand")
	public void delAnzhiThirdRecommand(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiThirdRecommandSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiThirdRecommandSession","true");
				int id=request.getParameter("anzhithirdrecommandId")==null?0:Integer.parseInt(request.getParameter("anzhithirdrecommandId"));
				anzhithirdrecommandService.delAnzhiThirdRecommand(id);
				response.sendRedirect(request.getContextPath()+"/anzhithirdrecommand/findAnzhiThirdRecommandAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiThirdRecommandSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhithirdrecommand/delBatchAnzhiThirdRecommand")
	public String delBatchAnzhiThirdRecommand(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhithirdrecommandIds");
		anzhithirdrecommandService.delBatchAnzhiThirdRecommand(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdrecommand/updateAnzhiThirdRecommand")
	public String updateAnzhiThirdRecommand(HttpServletRequest request,HttpServletResponse response,AnzhiThirdRecommand anzhithirdrecommand){
		if(request.getSession().getAttribute("updateAnzhiThirdRecommandSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiThirdRecommandSession","true");
				anzhithirdrecommandService.updateAnzhiThirdRecommand(anzhithirdrecommand);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiThirdRecommandSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdrecommand/findAnzhiThirdRecommandAll")
	public String findAnzhiThirdRecommandAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=request.getParameter("pageNum")!=null&&request.getParameter("pageNum")!=""?Integer.parseInt(request.getParameter("pageNum")):0;
		String condition=this.getCondition(anzhithirdrecommandConditionArr, request, response);
		QueryList<AnzhiThirdRecommand> list = anzhithirdrecommandService.findAnzhiThirdRecommandAll(size, pageNum, condition);
		request.setAttribute("anzhithirdrecommandList", list);
		request.setAttribute("thirdRecommandTypeData", thirdRecommandTypeData);
		return this.getPageName(request, "admin/AnzhiThirdRecommandManager");
	}

	@RequestMapping(value="/anzhithirdrecommand/findAnzhiThirdRecommandById")
	public String findAnzhiThirdRecommandById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiThirdRecommand> list = anzhithirdrecommandService.findAnzhiThirdRecommandAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhithirdrecommandId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiThirdRecommandAction");
	}

	@RequestMapping(value="/anzhithirdrecommand/anzhithirdrecommandAction")
	public String anzhithirdrecommandAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiThirdRecommandAction");
	}


}