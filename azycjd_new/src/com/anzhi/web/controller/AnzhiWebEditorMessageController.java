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
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
import com.anzhi.web.service.IAnzhiWebEditorMessageService;
import java.util.Date;
@Controller
public class AnzhiWebEditorMessageController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorMessageService anzhiwebeditormessageService;
	@RequestMapping(value="/anzhiwebeditormessage/addAnzhiWebEditorMessage")
	public void addAnzhiWebEditorMessage(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorMessage anzhiwebeditormessage){
		if(request.getSession().getAttribute("addAnzhiWebEditorMessageSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorMessageSession","true");
				if(anzhiwebeditormessage.getId()==null||anzhiwebeditormessage.getId()==0){
					anzhiwebeditormessage.setAddTime(getTimestamp());
					anzhiwebeditormessage.setState(0);
					anzhiwebeditormessageService.addAnzhiWebEditorMessage(anzhiwebeditormessage);
				}else{
					anzhiwebeditormessageService.updateAnzhiWebEditorMessage(anzhiwebeditormessage);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditormessage/addBatchAnzhiWebEditorMessage")
	public String addBatchAnzhiWebEditorMessage(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorMessage> list=new ArrayList<AnzhiWebEditorMessage>();
		anzhiwebeditormessageService.addBatchAnzhiWebEditorMessage(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditormessage/delAnzhiWebEditorMessage")
	public void delAnzhiWebEditorMessage(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorMessageSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorMessageSession","true");
				int id=request.getParameter("anzhiwebeditormessageId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditormessageId"));
				anzhiwebeditormessageService.delAnzhiWebEditorMessage(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditormessage/delBatchAnzhiWebEditorMessage")
	public String delBatchAnzhiWebEditorMessage(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditormessageIds");
		anzhiwebeditormessageService.delBatchAnzhiWebEditorMessage(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditormessage/updateAnzhiWebEditorMessage")
	public String updateAnzhiWebEditorMessage(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorMessage anzhiwebeditormessage){
		if(request.getSession().getAttribute("updateAnzhiWebEditorMessageSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorMessageSession","true");
				anzhiwebeditormessageService.updateAnzhiWebEditorMessage(anzhiwebeditormessage);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditormessage/findAnzhiWebEditorMessageAll")
	public String findAnzhiWebEditorMessageAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditormessageConditionArr, request, response);
		if(this.getLoginMember(request)!=null){
			condition+=" and editor_id=0";
		}else if(this.getLoginWebEditor(request)!=null){
			condition=this.getWebEditorCondition(request, condition);
		}
		QueryList<AnzhiWebEditorMessage> list = anzhiwebeditormessageService.findAnzhiWebEditorMessageAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditormessageList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorMessageManager");
	}

	@RequestMapping(value="/anzhiwebeditormessage/findAnzhiWebEditorMessageById")
	public String findAnzhiWebEditorMessageById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorMessage> list = anzhiwebeditormessageService.findAnzhiWebEditorMessageAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditormessageId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorMessageAction");
	}

	@RequestMapping(value="/anzhiwebeditormessage/anzhiwebeditormessageAction")
	public String anzhiwebeditormessageAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorMessageAction");
	}

	@RequestMapping(value="/anzhiwebeditormessage/setDefault")
	public void setDefault(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "editorId")!=-1||this.getInt(request, "id")!=-1){
			anzhiwebeditormessageService.setDefault(request);
		}
	}

	@RequestMapping(value="/anzhiwebeditormessage/cuigeng")
	public void cuigeng(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.getInt(request, "id")!=-1){
			response.getWriter().write(anzhiwebeditormessageService.cuigeng(request,this.getLoginWebEditor(request)));
		}else{
			response.getWriter().write("参数请求错误");
		}
	}
}