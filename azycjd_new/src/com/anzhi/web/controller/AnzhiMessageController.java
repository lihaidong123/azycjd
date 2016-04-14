package com.anzhi.web.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiMessage;
import com.anzhi.web.service.IAnzhiMemberService;
import com.anzhi.web.service.IAnzhiMessageService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiMessageController extends GetCondition {
	@Autowired
	private IAnzhiMessageService anzhimessageService;
	@Autowired
	private IAnzhiMemberService anzhimemberService;
	@RequestMapping(value="/anzhimessage/addAnzhiMessage",method=RequestMethod.POST)
	public void addAnzhiMessage(HttpServletRequest request,HttpServletResponse response,AnzhiMessage anzhimessage){
		if(request.getSession().getAttribute("addAnzhiMessageSession")==null){
			try{
				response.setContentType("text/html;charset=utf-8");
				request.getSession().setAttribute("addAnzhiMessageSession","true");
				if(anzhimessage.getId()==null||anzhimessage.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					String type=request.getParameter("messageType");
					String answer="";
					if(type.equals("3")){
						answer="yes";
					}else{
						answer=this.randCodeCheck(request,am);
					}
					
					if(am==null||am.getId()==null){
						response.getWriter().write("您还有登录呢");
						return;
					}
					response.getWriter().write(anzhimessageService.addAnzhiMessage(anzhimessage, request, am,answer));
				}else{
					anzhimessageService.updateAnzhiMessage(anzhimessage);
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhimessage/addAnzhiMessageAdmin",method=RequestMethod.POST)
	public void addAnzhiMessageAdmin(HttpServletRequest request,HttpServletResponse response,AnzhiMessage anzhimessage){
		if(request.getSession().getAttribute("addAnzhiMessageSession")==null){
			try{
				response.setContentType("text/html;charset=utf-8");
				request.getSession().setAttribute("addAnzhiMessageSession","true");
				if(anzhimessage.getId()==null||anzhimessage.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					String type=request.getParameter("messageType");
					String answer="";
					if(type.equals("3")){
						answer="yes";
					}else{
						answer=this.randCodeCheck(request,am);
					}
					
					if(am==null||am.getId()==null){
						response.getWriter().write("您还有登录呢");
					}
					String answerDb=anzhimessageService.addAnzhiMessage(anzhimessage, request, am,answer);
					if(answerDb.equals("yes")){
						response.sendRedirect(request.getContextPath()+"/anzhimessage/findAnzhiMessageAll.do");
					}else{
						response.getWriter().write(answerDb);
					}
				}else{
					anzhimessageService.updateAnzhiMessage(anzhimessage);
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhimessage/addBatchAnzhiMessage",method=RequestMethod.POST)
	public String addBatchAnzhiMessage(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiMessage> list=new ArrayList<AnzhiMessage>();
		anzhimessageService.addBatchAnzhiMessage(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimessage/delAnzhiMessage",method=RequestMethod.POST)
	public void delAnzhiMessage(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiMessageSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiMessageSession","true");
				int id=request.getParameter("anzhimessageId")==null?0:Integer.parseInt(request.getParameter("anzhimessageId"));
				anzhimessageService.delAnzhiMessage(id);
				response.sendRedirect(request.getContextPath()+"/anzhimessage/findAnzhiMessageAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhimessage/delBatchAnzhiMessage",method=RequestMethod.POST)
	public String delBatchAnzhiMessage(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhimessageIds");
		anzhimessageService.delBatchAnzhiMessage(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimessage/updateAnzhiMessage",method=RequestMethod.POST)
	public String updateAnzhiMessage(HttpServletRequest request,HttpServletResponse response,AnzhiMessage anzhimessage){
		if(request.getSession().getAttribute("updateAnzhiMessageSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiMessageSession","true");
				anzhimessageService.updateAnzhiMessage(anzhimessage);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiMessageSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimessage/findAnzhiMessageAll")
	public String findAnzhiMessageAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhimessageConditionArr, request, response);
		String pn=this.getPageName(request, "admin/AnzhiMessageManager");
		if(pn.equals("index/author_mail_send_all")||pn.equals("index/my_news_send_all")){
			condition+=" and member_id_send="+this.getLoginMemberId(request);
		}else if(pn.equals("index/my_news_receive")||pn.equals("index/author_mail_receive")){
			condition+=" and member_id_receive="+this.getLoginMemberId(request);
		}
		QueryList<AnzhiMessage> list = anzhimessageService.findAnzhiMessageAll(size, pageNum, condition);
		request.setAttribute("anzhimessageList", list);
		return pn;
	}

	@RequestMapping(value="/anzhimessage/findAnzhiMessageById",method=RequestMethod.POST)
	public String findAnzhiMessageById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiMessage> list = anzhimessageService.findAnzhiMessageAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhimessageId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiMessageAction");
	}

	@RequestMapping(value="/anzhimessage/anzhimessageAction",method=RequestMethod.POST)
	public String anzhimessageAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiMessageAction");
	}


}