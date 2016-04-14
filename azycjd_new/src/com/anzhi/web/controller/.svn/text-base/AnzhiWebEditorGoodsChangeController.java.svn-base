package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiWebEditorGoodsChange;
import com.anzhi.web.service.IAnzhiWebEditorGoodsChangeService;
import java.util.Date;
@Controller
public class AnzhiWebEditorGoodsChangeController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorGoodsChangeService anzhiwebeditorgoodschangeService;
	@RequestMapping(value="/anzhiwebeditorgoodschange/addAnzhiWebEditorGoodsChange")
	public void addAnzhiWebEditorGoodsChange(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		if(request.getSession().getAttribute("addAnzhiWebEditorGoodsChangeSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorGoodsChangeSession","true");
				anzhiwebeditorgoodschange.setAddTime(getTimestamp());
				if(anzhiwebeditorgoodschange.getId()==null||anzhiwebeditorgoodschange.getId()==0){
					anzhiwebeditorgoodschangeService.addAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange);
				}else{
					anzhiwebeditorgoodschangeService.updateAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorGoodsChangeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/addBatchAnzhiWebEditorGoodsChange")
	public String addBatchAnzhiWebEditorGoodsChange(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorGoodsChange> list=new ArrayList<AnzhiWebEditorGoodsChange>();
		anzhiwebeditorgoodschangeService.addBatchAnzhiWebEditorGoodsChange(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/delAnzhiWebEditorGoodsChange")
	public void delAnzhiWebEditorGoodsChange(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorGoodsChangeSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorGoodsChangeSession","true");
				int id=request.getParameter("anzhiwebeditorgoodschangeId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorgoodschangeId"));
				anzhiwebeditorgoodschangeService.delAnzhiWebEditorGoodsChange(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorGoodsChangeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/delBatchAnzhiWebEditorGoodsChange")
	public String delBatchAnzhiWebEditorGoodsChange(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorgoodschangeIds");
		anzhiwebeditorgoodschangeService.delBatchAnzhiWebEditorGoodsChange(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/updateAnzhiWebEditorGoodsChange")
	public String updateAnzhiWebEditorGoodsChange(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		if(request.getSession().getAttribute("updateAnzhiWebEditorGoodsChangeSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorGoodsChangeSession","true");
				anzhiwebeditorgoodschangeService.updateAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorGoodsChangeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll")
	public String findAnzhiWebEditorGoodsChangeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorgoodschangeConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorGoodsChange> list = anzhiwebeditorgoodschangeService.findAnzhiWebEditorGoodsChangeAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorgoodschangeList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsChangeManager");
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeById")
	public String findAnzhiWebEditorGoodsChangeById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorGoodsChange> list = anzhiwebeditorgoodschangeService.findAnzhiWebEditorGoodsChangeAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorgoodschangeId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsChangeAction");
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/anzhiwebeditorgoodschangeAction")
	public String anzhiwebeditorgoodschangeAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsChangeAction");
	}

	@RequestMapping(value="/anzhiwebeditorgoodschange/goodsChange")
	public void goodsChange(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(anzhiwebeditorgoodschangeService.goodsChange(request));
	}

}