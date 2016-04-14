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
import com.anzhi.web.pojo.AnzhiBookmark;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiBookmarkService;
import java.util.Date;
@Controller
public class AnzhiBookmarkController extends GetCondition {
	@Autowired
	private IAnzhiBookmarkService anzhibookmarkService;
	@RequestMapping(value="/anzhibookmark/addAnzhiBookmark",method=RequestMethod.POST)
	public void addAnzhiBookmark(HttpServletRequest request,HttpServletResponse response,AnzhiBookmark anzhibookmark){
		if(request.getSession().getAttribute("addAnzhiBookmarkSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiBookmarkSession","true");
				if(anzhibookmark.getId()==null||anzhibookmark.getId()==0){
					response.setContentType("text/html;charset=utf-8");
					AnzhiMember am=this.getLoginMember(request);
					if(am==null||am.getId()==null){
						response.getWriter().write("您还没有登录呢");
						return;
					}
					response.getWriter().write(anzhibookmarkService.addAnzhiBookmark(anzhibookmark,request,am));
				}else{
					anzhibookmarkService.updateAnzhiBookmark(anzhibookmark);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhibookmark/findAnzhiBookmarkAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiBookmarkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibookmark/addBatchAnzhiBookmark",method=RequestMethod.POST)
	public String addBatchAnzhiBookmark(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiBookmark> list=new ArrayList<AnzhiBookmark>();
		anzhibookmarkService.addBatchAnzhiBookmark(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookmark/delAnzhiBookmark",method=RequestMethod.POST)
	public void delAnzhiBookmark(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiBookmarkSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiBookmarkSession","true");
				int id=request.getParameter("anzhibookmarkId")==null?0:Integer.parseInt(request.getParameter("anzhibookmarkId"));
				anzhibookmarkService.delAnzhiBookmark(id);
				response.sendRedirect(request.getContextPath()+"/anzhibookmark/findAnzhiBookmarkAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiBookmarkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibookmark/delBatchAnzhiBookmark",method=RequestMethod.POST)
	public String delBatchAnzhiBookmark(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhibookmarkIds");
		anzhibookmarkService.delBatchAnzhiBookmark(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookmark/updateAnzhiBookmark",method=RequestMethod.POST)
	public String updateAnzhiBookmark(HttpServletRequest request,HttpServletResponse response,AnzhiBookmark anzhibookmark){
		if(request.getSession().getAttribute("updateAnzhiBookmarkSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiBookmarkSession","true");
				anzhibookmarkService.updateAnzhiBookmark(anzhibookmark);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiBookmarkSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibookmark/findAnzhiBookmarkAll",method=RequestMethod.POST)
	public String findAnzhiBookmarkAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhibookmarkConditionArr, request, response);
		QueryList<AnzhiBookmark> list = anzhibookmarkService.findAnzhiBookmarkAll(size, pageNum, condition);
		request.setAttribute("anzhibookmarkList", list);
		return this.getPageName(request, "admin/AnzhiBookmarkManager");
	}

	@RequestMapping(value="/anzhibookmark/findAnzhiBookmarkById",method=RequestMethod.POST)
	public String findAnzhiBookmarkById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiBookmark> list = anzhibookmarkService.findAnzhiBookmarkAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhibookmarkId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiBookmarkAction");
	}

	@RequestMapping(value="/anzhibookmark/anzhibookmarkAction",method=RequestMethod.POST)
	public String anzhibookmarkAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiBookmarkAction");
	}
	
	@RequestMapping(value="/anzhibookmark/findAnzhiBookmarkMySelf",method=RequestMethod.POST)
	public String findAnzhiBookmarkMySelf(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhibookmarkConditionArr, request, response);
		QueryList<AnzhiBookmark> list = anzhibookmarkService.findAnzhiBookmarkAll(size, pageNum, "  and bookmark_type=0 and member_id="+this.getLoginMemberId(request));
		request.setAttribute("anzhibookmarkList", list);
		return this.getPageName(request, "index/line_cave_bookmarks");
	}

}