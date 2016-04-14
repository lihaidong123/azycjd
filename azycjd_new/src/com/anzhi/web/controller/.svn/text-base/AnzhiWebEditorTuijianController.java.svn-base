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
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorTuijian;
import com.anzhi.web.service.IAnzhiWebEditorTuijianService;
import java.util.Date;
@Controller
public class AnzhiWebEditorTuijianController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorTuijianService anzhiwebeditortuijianService;
	@RequestMapping(value="/anzhiwebeditortuijian/addAnzhiWebEditorTuijian")
	public void addAnzhiWebEditorTuijian(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorTuijian anzhiwebeditortuijian){
		if(request.getSession().getAttribute("addAnzhiWebEditorTuijianSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorTuijianSession","true");
				anzhiwebeditortuijian.setAddTime(getTimestamp());
				if(anzhiwebeditortuijian.getId()==null||anzhiwebeditortuijian.getId()==0){
					anzhiwebeditortuijian.setState(0);
					anzhiwebeditortuijian.setIsHot(0);
					anzhiwebeditortuijian.setIsJiajing(0);
					anzhiwebeditortuijianService.addAnzhiWebEditorTuijian(anzhiwebeditortuijian);
					if(this.getLoginWebEditor(request)!=null){
						 AnzhiWebEditor getLoginWebEditor=this.getLoginWebEditor(request);
						 getLoginWebEditor.setEditorScore(this.getDoubleBySql("select editor_score from anzhi_web_editor where id="+getLoginWebEditor.getId()));
					}
				}else{
					anzhiwebeditortuijianService.updateAnzhiWebEditorTuijian(anzhiwebeditortuijian);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorTuijianSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditortuijian/addBatchAnzhiWebEditorTuijian")
	public String addBatchAnzhiWebEditorTuijian(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorTuijian> list=new ArrayList<AnzhiWebEditorTuijian>();
		anzhiwebeditortuijianService.addBatchAnzhiWebEditorTuijian(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditortuijian/delAnzhiWebEditorTuijian")
	public void delAnzhiWebEditorTuijian(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorTuijianSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorTuijianSession","true");
				int id=request.getParameter("anzhiwebeditortuijianId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditortuijianId"));
				anzhiwebeditortuijianService.delAnzhiWebEditorTuijian(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorTuijianSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditortuijian/delBatchAnzhiWebEditorTuijian")
	public String delBatchAnzhiWebEditorTuijian(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditortuijianIds");
		anzhiwebeditortuijianService.delBatchAnzhiWebEditorTuijian(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditortuijian/updateAnzhiWebEditorTuijian")
	public String updateAnzhiWebEditorTuijian(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorTuijian anzhiwebeditortuijian){
		if(request.getSession().getAttribute("updateAnzhiWebEditorTuijianSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorTuijianSession","true");
				anzhiwebeditortuijianService.updateAnzhiWebEditorTuijian(anzhiwebeditortuijian);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorTuijianSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditortuijian/findAnzhiWebEditorTuijianAll")
	public String findAnzhiWebEditorTuijianAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditortuijianConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorTuijian> list = anzhiwebeditortuijianService.findAnzhiWebEditorTuijianAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditortuijianList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorTuijianManager");
	}

	@RequestMapping(value="/anzhiwebeditortuijian/findAnzhiWebEditorTuijianById")
	public String findAnzhiWebEditorTuijianById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorTuijian> list = anzhiwebeditortuijianService.findAnzhiWebEditorTuijianAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditortuijianId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorTuijianAction");
	}

	@RequestMapping(value="/anzhiwebeditortuijian/anzhiwebeditortuijianAction")
	public String anzhiwebeditortuijianAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorTuijianAction");
	}

	@RequestMapping(value="/anzhiwebeditortuijian/updateTuiJian")
	public void updateTuiJian(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.getInt(request, "types")==-1||this.getInt(request, "state")==-1||this.getInt(request, "id")==-1){
			response.getWriter().write("参数请求错误!");
			return;
		}
		response.getWriter().write(anzhiwebeditortuijianService.updateTuiJian(request));
	}

}