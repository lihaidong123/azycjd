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
import com.anzhi.web.pojo.AnzhiWebEditorWork;
import com.anzhi.web.service.IAnzhiWebEditorWorkService;
import java.util.Date;
@Controller
public class AnzhiWebEditorWorkController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorWorkService anzhiwebeditorworkService;
	@RequestMapping(value="/anzhiwebeditorwork/addAnzhiWebEditorWork")
	public void addAnzhiWebEditorWork(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorWork anzhiwebeditorwork){
		if(request.getSession().getAttribute("addAnzhiWebEditorWorkSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorWorkSession","true");
				anzhiwebeditorwork.setAddTime(getTimestamp());
				if(anzhiwebeditorwork.getId()==null||anzhiwebeditorwork.getId()==0){
					anzhiwebeditorworkService.addAnzhiWebEditorWork(anzhiwebeditorwork);
				}else{
					anzhiwebeditorworkService.updateAnzhiWebEditorWork(anzhiwebeditorwork);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorWorkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorwork/addBatchAnzhiWebEditorWork")
	public String addBatchAnzhiWebEditorWork(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorWork> list=new ArrayList<AnzhiWebEditorWork>();
		anzhiwebeditorworkService.addBatchAnzhiWebEditorWork(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorwork/delAnzhiWebEditorWork")
	public void delAnzhiWebEditorWork(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorWorkSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorWorkSession","true");
				int id=request.getParameter("anzhiwebeditorworkId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorworkId"));
				anzhiwebeditorworkService.delAnzhiWebEditorWork(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorWorkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorwork/delBatchAnzhiWebEditorWork")
	public String delBatchAnzhiWebEditorWork(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorworkIds");
		anzhiwebeditorworkService.delBatchAnzhiWebEditorWork(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorwork/updateAnzhiWebEditorWork")
	public String updateAnzhiWebEditorWork(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorWork anzhiwebeditorwork){
		if(request.getSession().getAttribute("updateAnzhiWebEditorWorkSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorWorkSession","true");
				anzhiwebeditorworkService.updateAnzhiWebEditorWork(anzhiwebeditorwork);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorWorkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorwork/findAnzhiWebEditorWorkAll")
	public String findAnzhiWebEditorWorkAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorworkConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorWork> list = anzhiwebeditorworkService.findAnzhiWebEditorWorkAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorworkList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorWorkManager");
	}

	@RequestMapping(value="/anzhiwebeditorwork/findAnzhiWebEditorWorkById")
	public String findAnzhiWebEditorWorkById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorWork> list = anzhiwebeditorworkService.findAnzhiWebEditorWorkAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorworkId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorWorkAction");
	}

	@RequestMapping(value="/anzhiwebeditorwork/anzhiwebeditorworkAction")
	public String anzhiwebeditorworkAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorWorkAction");
	}


}