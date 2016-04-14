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
import com.anzhi.web.pojo.AnzhiWebEditorChapterCheck;
import com.anzhi.web.service.IAnzhiWebEditorChapterCheckService;
import java.util.Date;
@Controller
public class AnzhiWebEditorChapterCheckController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorChapterCheckService anzhiwebeditorchaptercheckService;
	@RequestMapping(value="/anzhiwebeditorchaptercheck/addAnzhiWebEditorChapterCheck")
	public void addAnzhiWebEditorChapterCheck(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		if(request.getSession().getAttribute("addAnzhiWebEditorChapterCheckSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorChapterCheckSession","true");
				anzhiwebeditorchaptercheck.setAddTime(getTimestamp());
				if(anzhiwebeditorchaptercheck.getId()==null||anzhiwebeditorchaptercheck.getId()==0){
					anzhiwebeditorchaptercheckService.addAnzhiWebEditorChapterCheck(anzhiwebeditorchaptercheck);
				}else{
					anzhiwebeditorchaptercheckService.updateAnzhiWebEditorChapterCheck(anzhiwebeditorchaptercheck);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorChapterCheckSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/addBatchAnzhiWebEditorChapterCheck")
	public String addBatchAnzhiWebEditorChapterCheck(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorChapterCheck> list=new ArrayList<AnzhiWebEditorChapterCheck>();
		anzhiwebeditorchaptercheckService.addBatchAnzhiWebEditorChapterCheck(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/delAnzhiWebEditorChapterCheck")
	public void delAnzhiWebEditorChapterCheck(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorChapterCheckSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorChapterCheckSession","true");
				int id=request.getParameter("anzhiwebeditorchaptercheckId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorchaptercheckId"));
				anzhiwebeditorchaptercheckService.delAnzhiWebEditorChapterCheck(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorChapterCheckSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/delBatchAnzhiWebEditorChapterCheck")
	public String delBatchAnzhiWebEditorChapterCheck(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorchaptercheckIds");
		anzhiwebeditorchaptercheckService.delBatchAnzhiWebEditorChapterCheck(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/updateAnzhiWebEditorChapterCheck")
	public String updateAnzhiWebEditorChapterCheck(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorChapterCheck anzhiwebeditorchaptercheck){
		if(request.getSession().getAttribute("updateAnzhiWebEditorChapterCheckSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorChapterCheckSession","true");
				anzhiwebeditorchaptercheckService.updateAnzhiWebEditorChapterCheck(anzhiwebeditorchaptercheck);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorChapterCheckSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll")
	public String findAnzhiWebEditorChapterCheckAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorchaptercheckConditionArr, request, response);
		condition=this.getWebEditorCondition(request, condition);
		QueryList<AnzhiWebEditorChapterCheck> list = anzhiwebeditorchaptercheckService.findAnzhiWebEditorChapterCheckAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorchaptercheckList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorChapterCheckManager");
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckById")
	public String findAnzhiWebEditorChapterCheckById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorChapterCheck> list = anzhiwebeditorchaptercheckService.findAnzhiWebEditorChapterCheckAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorchaptercheckId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorChapterCheckAction");
	}

	@RequestMapping(value="/anzhiwebeditorchaptercheck/anzhiwebeditorchaptercheckAction")
	public String anzhiwebeditorchaptercheckAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorChapterCheckAction");
	}


}