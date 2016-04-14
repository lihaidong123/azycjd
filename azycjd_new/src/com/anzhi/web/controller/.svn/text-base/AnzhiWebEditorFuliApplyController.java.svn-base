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
import com.anzhi.web.pojo.AnzhiWebEditorFuliApply;
import com.anzhi.web.service.IAnzhiWebEditorFuliApplyService;
import java.util.Date;
@Controller
public class AnzhiWebEditorFuliApplyController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorFuliApplyService anzhiwebeditorfuliapplyService;
	@RequestMapping(value="/anzhiwebeditorfuliapply/addAnzhiWebEditorFuliApply")
	public void addAnzhiWebEditorFuliApply(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		if(request.getSession().getAttribute("addAnzhiWebEditorFuliApplySession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorFuliApplySession","true");
				anzhiwebeditorfuliapply.setAddTime(getTimestamp());
				if(anzhiwebeditorfuliapply.getId()==null||anzhiwebeditorfuliapply.getId()==0){
					anzhiwebeditorfuliapplyService.addAnzhiWebEditorFuliApply(anzhiwebeditorfuliapply);
				}else{
					anzhiwebeditorfuliapplyService.updateAnzhiWebEditorFuliApply(anzhiwebeditorfuliapply);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorFuliApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/addBatchAnzhiWebEditorFuliApply")
	public String addBatchAnzhiWebEditorFuliApply(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorFuliApply> list=new ArrayList<AnzhiWebEditorFuliApply>();
		anzhiwebeditorfuliapplyService.addBatchAnzhiWebEditorFuliApply(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/delAnzhiWebEditorFuliApply")
	public void delAnzhiWebEditorFuliApply(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorFuliApplySession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorFuliApplySession","true");
				int id=request.getParameter("anzhiwebeditorfuliapplyId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorfuliapplyId"));
				anzhiwebeditorfuliapplyService.delAnzhiWebEditorFuliApply(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorFuliApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/delBatchAnzhiWebEditorFuliApply")
	public String delBatchAnzhiWebEditorFuliApply(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorfuliapplyIds");
		anzhiwebeditorfuliapplyService.delBatchAnzhiWebEditorFuliApply(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/updateAnzhiWebEditorFuliApply")
	public String updateAnzhiWebEditorFuliApply(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorFuliApply anzhiwebeditorfuliapply){
		if(request.getSession().getAttribute("updateAnzhiWebEditorFuliApplySession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorFuliApplySession","true");
				anzhiwebeditorfuliapplyService.updateAnzhiWebEditorFuliApply(anzhiwebeditorfuliapply);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorFuliApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll")
	public String findAnzhiWebEditorFuliApplyAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorfuliapplyConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorFuliApply> list = anzhiwebeditorfuliapplyService.findAnzhiWebEditorFuliApplyAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorfuliapplyList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorFuliApplyManager");
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyById")
	public String findAnzhiWebEditorFuliApplyById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorFuliApply> list = anzhiwebeditorfuliapplyService.findAnzhiWebEditorFuliApplyAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorfuliapplyId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorFuliApplyAction");
	}

	@RequestMapping(value="/anzhiwebeditorfuliapply/anzhiwebeditorfuliapplyAction")
	public String anzhiwebeditorfuliapplyAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorFuliApplyAction");
	}


}