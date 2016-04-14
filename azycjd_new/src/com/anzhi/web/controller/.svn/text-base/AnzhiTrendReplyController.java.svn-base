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
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiTrendReply;
import com.anzhi.web.service.IAnzhiTrendReplyService;
import java.util.Date;
@Controller
public class AnzhiTrendReplyController extends GetCondition {
	@Autowired
	private IAnzhiTrendReplyService anzhitrendreplyService;
	@RequestMapping(value="/anzhitrendreply/addAnzhiTrendReply",method=RequestMethod.POST)
	public void addAnzhiTrendReply(HttpServletRequest request,HttpServletResponse response,AnzhiTrendReply anzhitrendreply){
		if(request.getSession().getAttribute("addAnzhiTrendReplySession")==null){
			try{
				request.getSession().setAttribute("addAnzhiTrendReplySession","true");
				if(anzhitrendreply.getId()==null||anzhitrendreply.getId()==0){
					anzhitrendreply.setMemberId(this.getLoginMemberId(request));
					String trendid=request.getParameter("trendid");
					anzhitrendreply.setTrendId(Integer.parseInt(trendid));
					anzhitrendreply.setAddTime(this.getTimestamp());
					anzhitrendreply.setState(0);
					String replyid=request.getParameter("replyid");
					if(replyid!=null&&!replyid.equals("")&&!replyid.equals("undefined")){
						anzhitrendreply.setFatherId(Integer.parseInt(request.getParameter("replyid")));
					}else{
						anzhitrendreply.setFatherId(0);
					}
					anzhitrendreply.setReplyContent(request.getParameter("replyContent"));
					anzhitrendreplyService.addAnzhiTrendReply(anzhitrendreply);
				}else{
					anzhitrendreplyService.updateAnzhiTrendReply(anzhitrendreply);
				}
				response.sendRedirect(request.getContextPath()+"/anzhitrendreply/findAnzhiTrendReplyAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiTrendReplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhitrendreply/addBatchAnzhiTrendReply",method=RequestMethod.POST)
	public String addBatchAnzhiTrendReply(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiTrendReply> list=new ArrayList<AnzhiTrendReply>();
		anzhitrendreplyService.addBatchAnzhiTrendReply(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrendreply/delAnzhiTrendReply",method=RequestMethod.POST)
	public void delAnzhiTrendReply(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiTrendReplySession")==null){
			try{
				request.getSession().setAttribute("delAnzhiTrendReplySession","true");
				int id=request.getParameter("anzhitrendreplyId")==null?0:Integer.parseInt(request.getParameter("anzhitrendreplyId"));
				anzhitrendreplyService.delAnzhiTrendReply(id);
				response.sendRedirect(request.getContextPath()+"/anzhitrendreply/findAnzhiTrendReplyAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiTrendReplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhitrendreply/delBatchAnzhiTrendReply",method=RequestMethod.POST)
	public String delBatchAnzhiTrendReply(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhitrendreplyIds");
		anzhitrendreplyService.delBatchAnzhiTrendReply(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrendreply/updateAnzhiTrendReply",method=RequestMethod.POST)
	public String updateAnzhiTrendReply(HttpServletRequest request,HttpServletResponse response,AnzhiTrendReply anzhitrendreply){
		if(request.getSession().getAttribute("updateAnzhiTrendReplySession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiTrendReplySession","true");
				anzhitrendreplyService.updateAnzhiTrendReply(anzhitrendreply);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiTrendReplySession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrendreply/findAnzhiTrendReplyAll",method=RequestMethod.POST)
	public String findAnzhiTrendReplyAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhitrendreplyConditionArr, request, response);
		QueryList<AnzhiTrendReply> list = anzhitrendreplyService.findAnzhiTrendReplyAll(size, pageNum, condition);
		request.setAttribute("anzhitrendreplyList", list);
		return this.getPageName(request, "admin/AnzhiTrendReplyManager");
	}

	@RequestMapping(value="/anzhitrendreply/findAnzhiTrendReplyById",method=RequestMethod.POST)
	public String findAnzhiTrendReplyById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiTrendReply> list = anzhitrendreplyService.findAnzhiTrendReplyAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhitrendreplyId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiTrendReplyAction");
	}

	@RequestMapping(value="/anzhitrendreply/anzhitrendreplyAction",method=RequestMethod.POST)
	public String anzhitrendreplyAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiTrendReplyAction");
	}


}