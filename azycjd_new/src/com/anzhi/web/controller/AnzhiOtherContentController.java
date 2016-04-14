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
import com.anzhi.web.pojo.AnzhiOtherContent;
import com.anzhi.web.service.IAnzhiOtherContentService;
import java.util.Date;
@Controller
public class AnzhiOtherContentController extends GetCondition {
	@Autowired
	private IAnzhiOtherContentService anzhiothercontentService;
	@RequestMapping(value="/anzhiothercontent/addAnzhiOtherContent")
	public void addAnzhiOtherContent(HttpServletRequest request,HttpServletResponse response,AnzhiOtherContent anzhiothercontent){
		if(request.getSession().getAttribute("addAnzhiOtherContentSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiOtherContentSession","true");
				if(anzhiothercontent.getId()==null||anzhiothercontent.getId()==0){
					anzhiothercontentService.addAnzhiOtherContent(anzhiothercontent);
				}else{
					anzhiothercontentService.updateAnzhiOtherContent(anzhiothercontent);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiothercontent/findAnzhiOtherContentAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiOtherContentSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiothercontent/addBatchAnzhiOtherContent")
	public String addBatchAnzhiOtherContent(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiOtherContent> list=new ArrayList<AnzhiOtherContent>();
		anzhiothercontentService.addBatchAnzhiOtherContent(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiothercontent/delAnzhiOtherContent")
	public void delAnzhiOtherContent(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiOtherContentSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiOtherContentSession","true");
				int id=request.getParameter("anzhiothercontentId")==null?0:Integer.parseInt(request.getParameter("anzhiothercontentId"));
				anzhiothercontentService.delAnzhiOtherContent(id);
				response.sendRedirect(request.getContextPath()+"/anzhiothercontent/findAnzhiOtherContentAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiOtherContentSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiothercontent/delBatchAnzhiOtherContent")
	public String delBatchAnzhiOtherContent(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiothercontentIds");
		anzhiothercontentService.delBatchAnzhiOtherContent(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiothercontent/updateAnzhiOtherContent")
	public String updateAnzhiOtherContent(HttpServletRequest request,HttpServletResponse response,AnzhiOtherContent anzhiothercontent){
		if(request.getSession().getAttribute("updateAnzhiOtherContentSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiOtherContentSession","true");
				anzhiothercontentService.updateAnzhiOtherContent(anzhiothercontent);
				request.getSession().setAttribute("otherContent",anzhiothercontent);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiOtherContentSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiothercontent/findAnzhiOtherContentAll")
	public String findAnzhiOtherContentAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiothercontentConditionArr, request, response);
		QueryList<AnzhiOtherContent> list = anzhiothercontentService.findAnzhiOtherContentAll(size, pageNum, condition);
		request.setAttribute("anzhiothercontentList", list);
		return this.getPageName(request, "admin/AnzhiOtherContentManager");
	}

	@RequestMapping(value="/anzhiothercontent/findAnzhiOtherContentById")
	public String findAnzhiOtherContentById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiOtherContent> list = anzhiothercontentService.findAnzhiOtherContentAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiothercontentId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiOtherContentAction");
	}

	@RequestMapping(value="/anzhiothercontent/anzhiothercontentAction")
	public String anzhiothercontentAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiOtherContentAction");
	}
	
	@RequestMapping(value="/anzhiothercontent/findAnzhiOtherContentByDetail")
	public String findAnzhiOtherContentByDetail(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiOtherContent> list = anzhiothercontentService.findAnzhiOtherContentAll(10, 1, " and id = 1");
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		String pageName=request.getParameter("pagename");
		return this.getPageName(request, pageName);
	}


}