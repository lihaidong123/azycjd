package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiInteractive;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.service.IAnzhiInteractiveService;
import com.anzhi.web.service.IAnzhiNewsService;
import java.util.Date;
@Controller
public class AnzhiNewsController extends GetCondition {
	@Autowired
	private IAnzhiNewsService anzhinewsService;
	@Autowired
	private IAnzhiInteractiveService anzhiinteractiveService;
	@RequestMapping(value="/anzhinews/addAnzhiNews",method=RequestMethod.POST)
	public void addAnzhiNews(HttpServletRequest request,HttpServletResponse response,AnzhiNews anzhinews){
		if(request.getSession().getAttribute("addAnzhiNewsSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNewsSession","true");
				if(anzhinews.getId()==null||anzhinews.getId()==0){
					anzhinews.setAddTime(this.getTimestamp());
					anzhinews.setVote("");
					anzhinewsService.addAnzhiNews(anzhinews);
				}else{
					anzhinewsService.updateAnzhiNews(anzhinews);
				}
				response.sendRedirect(request.getContextPath()+"/anzhinews/findAnzhiNewsAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNewsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinews/addBatchAnzhiNews",method=RequestMethod.POST)
	public String addBatchAnzhiNews(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNews> list=new ArrayList<AnzhiNews>();
		anzhinewsService.addBatchAnzhiNews(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinews/delAnzhiNews",method=RequestMethod.POST)
	public void delAnzhiNews(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNewsSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNewsSession","true");
				int id=request.getParameter("anzhinewsId")==null?0:Integer.parseInt(request.getParameter("anzhinewsId"));
				anzhinewsService.delAnzhiNews(id);
				response.sendRedirect(request.getContextPath()+"/anzhinews/findAnzhiNewsAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNewsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinews/delBatchAnzhiNews",method=RequestMethod.POST)
	public String delBatchAnzhiNews(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinewsIds");
		anzhinewsService.delBatchAnzhiNews(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinews/updateAnzhiNews")
	public String updateAnzhiNews(HttpServletRequest request,HttpServletResponse response,AnzhiNews anzhinews){
		if(request.getSession().getAttribute("updateAnzhiNewsSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNewsSession","true");
				anzhinewsService.updateAnzhiNews(anzhinews);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNewsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinews/findAnzhiNewsAll")
	public String findAnzhiNewsAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinewsConditionArr, request, response);
		QueryList<AnzhiNews> list = anzhinewsService.findAnzhiNewsAll(size, pageNum, condition);
		request.setAttribute("anzhinewsList", list);
		return this.getPageName(request, "admin/AnzhiNewsManager");
	}
	
	@RequestMapping(value="/anzhinews/news")
	public String news(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinewsConditionArr, request, response);
		QueryList<AnzhiNews> list = anzhinewsService.findAnzhiNewsAll(size, pageNum, condition);
		request.setAttribute("anzhinewsList", list);
		QueryList<AnzhiInteractive> listint = anzhiinteractiveService.findAnzhiInteractiveAll(size, pageNum, " and interactive_type=1");
		request.setAttribute("anzhiinteractiveList", listint);
		return this.getPageName(request, "news");
	}

	@RequestMapping(value="/anzhinews/findAnzhiNewsById",method=RequestMethod.POST)
	public String findAnzhiNewsById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNews> list = anzhinewsService.findAnzhiNewsAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinewsId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNewsAction");
	}

	@RequestMapping(value="/anzhinews/anzhinewsAction",method=RequestMethod.POST)
	public String anzhinewsAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNewsAction");
	}

	@RequestMapping(value="/anzhinews/crateNewsHtml",method=RequestMethod.POST)
	public void crateNewsHtml(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		try {
			if(am.getMemberType().equals(2)){
				anzhinewsService.addCreateNewsHtml(request.getRealPath("//"));
				response.getWriter().write("生成成功！");
			}else{
				response.getWriter().write("非管理员请勿执行本操作!");
			}
		} catch (Exception e) {
			response.getWriter().write("操作错误!");
		}
	}

}