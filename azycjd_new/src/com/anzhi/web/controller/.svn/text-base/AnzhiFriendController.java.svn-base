package com.anzhi.web.controller;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiFriend;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiFriendService;
import com.anzhi.web.service.IAnzhiMemberService;

import java.util.Date;
@Controller
public class AnzhiFriendController extends GetCondition {
	@Autowired
	private IAnzhiFriendService anzhifriendService;
	
	@Autowired
	private IAnzhiMemberService iAnzhiMemberService;
	
	@RequestMapping(value="/anzhifriend/addAnzhiFriend",method=RequestMethod.POST)
	public void addAnzhiFriend(HttpServletRequest request,HttpServletResponse response,AnzhiFriend anzhifriend){
		if(request.getSession().getAttribute("addAnzhiFriendSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiFriendSession","true");
				if(anzhifriend.getId()==null||anzhifriend.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					response.setCharacterEncoding("utf-8");
					if(am==null||am.getId()==null){
						response.getWriter().write("您还没有登录呢!");
						return;
					}
					int n=this.getIntBySql("select count(*) from anzhi_friend where member_id="+am.getId()+" and friend_member_id="+anzhifriend.getFriendMemberId());
					if(n!=0){
						response.getWriter().write("他已经是您的好友了,请勿重复添加!");
						return;
					}
					anzhifriend.setAddTime(getTimestamp());
					anzhifriend.setMemberId(am.getId());
					anzhifriend.setState(0);
					anzhifriendService.addAnzhiFriend(anzhifriend);
					response.getWriter().write("yes");
				}else{
					anzhifriendService.updateAnzhiFriend(anzhifriend);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhifriend/findAnzhiFriendAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiFriendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhifriend/addBatchAnzhiFriend",method=RequestMethod.POST)
	public String addBatchAnzhiFriend(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiFriend> list=new ArrayList<AnzhiFriend>();
		anzhifriendService.addBatchAnzhiFriend(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifriend/delAnzhiFriend",method=RequestMethod.POST)
	public void delAnzhiFriend(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiFriendSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiFriendSession","true");
				int id=request.getParameter("anzhifriendId")==null?0:Integer.parseInt(request.getParameter("anzhifriendId"));
				anzhifriendService.delAnzhiFriend(id);
				response.sendRedirect(request.getContextPath()+"/anzhifriend/findAnzhiFriendAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiFriendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhifriend/delBatchAnzhiFriend",method=RequestMethod.POST)
	public String delBatchAnzhiFriend(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhifriendIds");
		anzhifriendService.delBatchAnzhiFriend(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifriend/updateAnzhiFriend",method=RequestMethod.POST)
	public String updateAnzhiFriend(HttpServletRequest request,HttpServletResponse response,AnzhiFriend anzhifriend){
		if(request.getSession().getAttribute("updateAnzhiFriendSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiFriendSession","true");
				anzhifriendService.updateAnzhiFriend(anzhifriend);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiFriendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhifriend/findAnzhiFriendAll",method=RequestMethod.POST)
	public String findAnzhiFriendAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhifriendConditionArr, request, response);
		QueryList<AnzhiFriend> list = anzhifriendService.findAnzhiFriendAll(size, pageNum, condition);
		request.setAttribute("anzhifriendList", list);
		return this.getPageName(request, "admin/AnzhiFriendManager");
	}

	@RequestMapping(value="/anzhifriend/findAnzhiFriendById",method=RequestMethod.POST)
	public String findAnzhiFriendById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiFriend> list = anzhifriendService.findAnzhiFriendAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhifriendId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiFriendAction");
	}

	@RequestMapping(value="/anzhifriend/anzhifriendAction",method=RequestMethod.POST)
	public String anzhifriendAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiFriendAction");
	}
	/*
	 * 查询我的好友列表
	 */
	@RequestMapping(value="/anzhifriend/findMyFriendAll",method=RequestMethod.POST)
	public String findMyFriendAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiMember> memberlist =iAnzhiMemberService.findAnzhiMemberAll(size, pageNum, " and id in(select af.friend_member_id from anzhi_friend af where af.member_id='"+this.getLoginMemberId(request)+"')");
		request.setAttribute("memberlist", memberlist);
		return this.getPageName(request, "index/home_page_friend_manage");
		
	}
	
	@RequestMapping(value="/anzhifriend/delMyAnzhiFriend")
	public String delMyAnzhiFriend(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiFriendSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiFriendSession","true");
				int id=request.getParameter("anzhifriendId")==null?0:Integer.parseInt(request.getParameter("anzhifriendId"));
				anzhifriendService.delMyAnzhiFriend(this.getLoginMemberId(request), id);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiFriendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		request.setAttribute("pageDirecNum", "9");
		return "pageDirec";
	}
}