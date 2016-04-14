package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorAuthor;
import com.anzhi.web.service.IAnzhiWebEditorAuthorService;
import java.util.Date;
@Controller
public class AnzhiWebEditorAuthorController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorAuthorService anzhiwebeditorauthorService;
	@RequestMapping(value="/anzhiwebeditorauthor/addAnzhiWebEditorAuthor")
	public void addAnzhiWebEditorAuthor(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("addAnzhiWebEditorAuthorSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorAuthorSession","true");
				if(!this.checkParam(request, "id")){
					response.setCharacterEncoding("utf-8");
					response.getWriter().write(anzhiwebeditorauthorService.addAnzhiWebEditorAuthor(request,this.getLoginWebEditor(request)));
					if(this.getLoginWebEditor(request)!=null){
						 AnzhiWebEditor getLoginWebEditor=this.getLoginWebEditor(request);
						 getLoginWebEditor.setEditorScore(this.getDoubleBySql("select editor_score from anzhi_web_editor where id="+getLoginWebEditor.getId()));
					}
				}else{
					//anzhiwebeditorauthorService.updateAnzhiWebEditorAuthor(request);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorauthor/addBatchAnzhiWebEditorAuthor")
	public String addBatchAnzhiWebEditorAuthor(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorAuthor> list=new ArrayList<AnzhiWebEditorAuthor>();
		anzhiwebeditorauthorService.addBatchAnzhiWebEditorAuthor(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorauthor/delAnzhiWebEditorAuthor")
	public void delAnzhiWebEditorAuthor(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorAuthorSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorAuthorSession","true");
				int id=request.getParameter("anzhiwebeditorauthorId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorauthorId"));
				anzhiwebeditorauthorService.delAnzhiWebEditorAuthor(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorauthor/delBatchAnzhiWebEditorAuthor")
	public String delBatchAnzhiWebEditorAuthor(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorauthorIds");
		anzhiwebeditorauthorService.delBatchAnzhiWebEditorAuthor(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorauthor/updateAnzhiWebEditorAuthor")
	public String updateAnzhiWebEditorAuthor(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorAuthor anzhiwebeditorauthor){
		if(request.getSession().getAttribute("updateAnzhiWebEditorAuthorSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorAuthorSession","true");
				anzhiwebeditorauthorService.updateAnzhiWebEditorAuthor(anzhiwebeditorauthor);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll")
	public String findAnzhiWebEditorAuthorAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorauthorConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorAuthor> list = anzhiwebeditorauthorService.findAnzhiWebEditorAuthorAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorauthorList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorAuthorManager");
	}

	@RequestMapping(value="/anzhiwebeditorauthor/cuigeng")
	public String cuigeng(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorauthorConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		condition+=" and DATEDIFF(day,update_time,getdate())>=2";
		QueryList<AnzhiWebEditorAuthor> list = anzhiwebeditorauthorService.findAnzhiWebEditorAuthorAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorauthorList", list);
		return this.getPageName(request, "admin/cuigeng");
	}
	
	@RequestMapping(value="/anzhiwebeditorauthor/findAnzhiWebEditorAuthorById")
	public String findAnzhiWebEditorAuthorById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorAuthor> list = anzhiwebeditorauthorService.findAnzhiWebEditorAuthorAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorauthorId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorAuthorAction");
	}

	@RequestMapping(value="/anzhiwebeditorauthor/anzhiwebeditorauthorAction")
	public String anzhiwebeditorauthorAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorAuthorAction");
	}


}