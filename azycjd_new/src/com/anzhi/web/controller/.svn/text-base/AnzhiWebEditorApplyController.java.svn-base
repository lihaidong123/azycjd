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
import com.anzhi.web.pojo.AnzhiWebEditorApply;
import com.anzhi.web.service.IAnzhiWebEditorApplyService;
import java.util.Date;
@Controller
public class AnzhiWebEditorApplyController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorApplyService anzhiwebeditorapplyService;
	@RequestMapping(value="/anzhiwebeditorapply/addAnzhiWebEditorApply")
	public void addAnzhiWebEditorApply(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorApply anzhiwebeditorapply){
		if(request.getSession().getAttribute("addAnzhiWebEditorApplySession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorApplySession","true");
				if(anzhiwebeditorapply.getId()==null||anzhiwebeditorapply.getId()==0){
					response.setCharacterEncoding("utf-8");
					QueryList<AnzhiWebEditorApply> ls=anzhiwebeditorapplyService.findAnzhiWebEditorApplyAll(1, 1, " and member_id="+anzhiwebeditorapply.getMemberId());
					if(ls.getList().size()!=0){
						response.getWriter().write("您已经申请过了！请等待审核！");
						return;
					}
					anzhiwebeditorapply.setBirthdays(this.getTimestamp(request, "birthdayss"));
					anzhiwebeditorapply.setAddTime(getTimestamp());
					anzhiwebeditorapply.setState(0);
					anzhiwebeditorapplyService.addAnzhiWebEditorApply(anzhiwebeditorapply);
					response.getWriter().write("申请成功");
				}else{
					anzhiwebeditorapplyService.updateAnzhiWebEditorApply(anzhiwebeditorapply);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorapply/addBatchAnzhiWebEditorApply")
	public String addBatchAnzhiWebEditorApply(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorApply> list=new ArrayList<AnzhiWebEditorApply>();
		anzhiwebeditorapplyService.addBatchAnzhiWebEditorApply(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorapply/delAnzhiWebEditorApply")
	public void delAnzhiWebEditorApply(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorApplySession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorApplySession","true");
				int id=request.getParameter("anzhiwebeditorapplyId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorapplyId"));
				anzhiwebeditorapplyService.delAnzhiWebEditorApply(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorapply/delBatchAnzhiWebEditorApply")
	public String delBatchAnzhiWebEditorApply(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorapplyIds");
		anzhiwebeditorapplyService.delBatchAnzhiWebEditorApply(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorapply/updateAnzhiWebEditorApply")
	public String updateAnzhiWebEditorApply(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorApply anzhiwebeditorapply){
		if(request.getSession().getAttribute("updateAnzhiWebEditorApplySession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorApplySession","true");
				anzhiwebeditorapplyService.updateAnzhiWebEditorApply(anzhiwebeditorapply);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorApplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorapply/findAnzhiWebEditorApplyAll")
	public String findAnzhiWebEditorApplyAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorapplyConditionArr, request, response);
		QueryList<AnzhiWebEditorApply> list = anzhiwebeditorapplyService.findAnzhiWebEditorApplyAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorapplyList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorApplyManager");
	}

	@RequestMapping(value="/anzhiwebeditorapply/findAnzhiWebEditorApplyById")
	public String findAnzhiWebEditorApplyById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorApply> list = anzhiwebeditorapplyService.findAnzhiWebEditorApplyAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorapplyId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorApplyAction");
	}

	@RequestMapping(value="/anzhiwebeditorapply/anzhiwebeditorapplyAction")
	public String anzhiwebeditorapplyAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorApplyAction");
	}

	@RequestMapping(value="/anzhiwebeditorapply/updateApplyState")
	public void updateApplyState(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.getInt(request, "id")!=-1){
			response.getWriter().write(anzhiwebeditorapplyService.updateApply(request));
		}else{
			response.getWriter().write("参数请求错误");
		}
	}
}