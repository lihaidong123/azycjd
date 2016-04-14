package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiWebEditorSign;
import com.anzhi.web.service.IAnzhiWebEditorSignService;
import java.util.Date;
@Controller
public class AnzhiWebEditorSignController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorSignService anzhiwebeditorsignService;
	@RequestMapping(value="/anzhiwebeditorsign/addAnzhiWebEditorSign")
	public void addAnzhiWebEditorSign(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorSign anzhiwebeditorsign){
		if(request.getSession().getAttribute("addAnzhiWebEditorSignSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorSignSession","true");
				anzhiwebeditorsign.setAddTime(getTimestamp());
				if(anzhiwebeditorsign.getId()==null||anzhiwebeditorsign.getId()==0){
					anzhiwebeditorsignService.addAnzhiWebEditorSign(anzhiwebeditorsign);
				}else{
					anzhiwebeditorsignService.updateAnzhiWebEditorSign(anzhiwebeditorsign);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorsign/findAnzhiWebEditorSignAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorSignSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorsign/addBatchAnzhiWebEditorSign")
	public String addBatchAnzhiWebEditorSign(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorSign> list=new ArrayList<AnzhiWebEditorSign>();
		anzhiwebeditorsignService.addBatchAnzhiWebEditorSign(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorsign/delAnzhiWebEditorSign")
	public void delAnzhiWebEditorSign(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorSignSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorSignSession","true");
				int id=request.getParameter("anzhiwebeditorsignId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorsignId"));
				anzhiwebeditorsignService.delAnzhiWebEditorSign(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorsign/findAnzhiWebEditorSignAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorSignSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorsign/delBatchAnzhiWebEditorSign")
	public String delBatchAnzhiWebEditorSign(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorsignIds");
		anzhiwebeditorsignService.delBatchAnzhiWebEditorSign(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorsign/updateAnzhiWebEditorSign")
	public String updateAnzhiWebEditorSign(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorSign anzhiwebeditorsign){
		if(request.getSession().getAttribute("updateAnzhiWebEditorSignSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorSignSession","true");
				anzhiwebeditorsignService.updateAnzhiWebEditorSign(anzhiwebeditorsign);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorSignSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorsign/findAnzhiWebEditorSignAll")
	public String findAnzhiWebEditorSignAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorsignConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorSign> list = anzhiwebeditorsignService.findAnzhiWebEditorSignAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorsignList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorSignManager");
	}

	@RequestMapping(value="/anzhiwebeditorsign/findAnzhiWebEditorSignById")
	public String findAnzhiWebEditorSignById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorSign> list = anzhiwebeditorsignService.findAnzhiWebEditorSignAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorsignId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorSignAction");
	}

	@RequestMapping(value="/anzhiwebeditorsign/anzhiwebeditorsignAction")
	public String anzhiwebeditorsignAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorSignAction");
	}

	@RequestMapping(value="/anzhiwebeditorsign/qiandao",method=RequestMethod.POST)
	public void qiandao(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(anzhiwebeditorsignService.qiandao(this.getLoginWebEditor(request), request));
	}
}