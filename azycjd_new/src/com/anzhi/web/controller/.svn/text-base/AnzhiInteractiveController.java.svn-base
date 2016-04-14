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
import com.anzhi.web.pojo.AnzhiInteractive;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiInteractiveService;
import java.util.Date;
@Controller
public class AnzhiInteractiveController extends GetCondition {
	@Autowired
	private IAnzhiInteractiveService anzhiinteractiveService;
	@RequestMapping(value="/anzhiinteractive/addAnzhiInteractive")
	public void addAnzhiInteractive(HttpServletRequest request,HttpServletResponse response,AnzhiInteractive anzhiinteractive){
		if(request.getSession().getAttribute("addAnzhiInteractiveSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiInteractiveSession","true");
				anzhiinteractive.setAddTime(this.getTimestamp());
				AnzhiMember us=this.getLoginMember(request);
				if(us==null){
					response.sendRedirect(request.getContextPath()+"/index.jsp");
				}else{
					if(anzhiinteractive.getId()==null||anzhiinteractive.getId()==0){
						anzhiinteractive.setState(0);
						anzhiinteractive.setMemberId(this.getLoginMemberId(request));
						anzhiinteractiveService.addAnzhiInteractive(anzhiinteractive);
					}else{
						anzhiinteractiveService.updateAnzhiInteractive(anzhiinteractive);
					}
				}
				if(anzhiinteractive.getInteractiveType()==1){
					response.sendRedirect(request.getContextPath()+"/anzhinews/news.do");
				}else{
					response.sendRedirect(request.getContextPath()+"/anzhiinteractive/findAnzhiInteractiveAllByType.do?interactiveType="+anzhiinteractive.getInteractiveType());
				}
				}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiInteractiveSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiinteractive/addAnzhiInteractives")
	public void addAnzhiInteractives(HttpServletRequest request,HttpServletResponse response,AnzhiInteractive anzhiinteractive){
		if(request.getSession().getAttribute("addAnzhiInteractiveSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiInteractiveSession","true");
				anzhiinteractive.setAddTime(this.getTimestamp());
				AnzhiMember us=this.getLoginMember(request);
				if(us==null){
					response.sendRedirect(request.getContextPath()+"/index.jsp");
				}else{
					if(anzhiinteractive.getId()==null||anzhiinteractive.getId()==0){
						anzhiinteractive.setState(0);
						anzhiinteractive.setMemberId(this.getLoginMemberId(request));
						anzhiinteractiveService.addAnzhiInteractive(anzhiinteractive);
					}else{
						anzhiinteractiveService.updateAnzhiInteractive(anzhiinteractive);
					}
				}
					response.sendRedirect(request.getContextPath()+"/anzhiinteractive/findAnzhiInteractiveAll.do");
				}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiInteractiveSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	@RequestMapping(value="/anzhiinteractive/addBatchAnzhiInteractive")
	public String addBatchAnzhiInteractive(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiInteractive> list=new ArrayList<AnzhiInteractive>();
		anzhiinteractiveService.addBatchAnzhiInteractive(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiinteractive/delAnzhiInteractive")
	public void delAnzhiInteractive(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiInteractiveSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiInteractiveSession","true");
				int id=request.getParameter("anzhiinteractiveId")==null?0:Integer.parseInt(request.getParameter("anzhiinteractiveId"));
				anzhiinteractiveService.delAnzhiInteractive(id);
				response.sendRedirect(request.getContextPath()+"/anzhiinteractive/findAnzhiInteractiveAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiInteractiveSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiinteractive/delBatchAnzhiInteractive")
	public String delBatchAnzhiInteractive(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiinteractiveIds");
		anzhiinteractiveService.delBatchAnzhiInteractive(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiinteractive/updateAnzhiInteractive")
	public String updateAnzhiInteractive(HttpServletRequest request,HttpServletResponse response,AnzhiInteractive anzhiinteractive){
		if(request.getSession().getAttribute("updateAnzhiInteractiveSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiInteractiveSession","true");
				anzhiinteractiveService.updateAnzhiInteractive(anzhiinteractive);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiInteractiveSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return this.getPageName(request, "admin/AnzhiInteractiveManager");
	}

	@RequestMapping(value="/anzhiinteractive/findAnzhiInteractiveAll")
	public String findAnzhiInteractiveAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=request.getParameter("pageNum")!=null&&request.getParameter("pageNum")!=""?Integer.parseInt(request.getParameter("pageNum")):0;
		String condition=this.getCondition(anzhiinteractiveConditionArr, request, response);
		QueryList<AnzhiInteractive> list = anzhiinteractiveService.findAnzhiInteractiveAll(size, pageNum, condition);
		request.setAttribute("anzhiinteractiveList", list);
		return this.getPageName(request, "admin/AnzhiInteractiveManager");
	}

	@RequestMapping(value="/anzhiinteractive/findAnzhiInteractiveById")
	public String findAnzhiInteractiveById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiInteractive> list = anzhiinteractiveService.findAnzhiInteractiveAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiinteractiveId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiInteractiveAction");
	}

	@RequestMapping(value="/anzhiinteractive/anzhiinteractiveAction")
	public String anzhiinteractiveAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiInteractiveAction");
	}

	@RequestMapping(value="/anzhiinteractive/findAnzhiInteractiveAllByType")
	public String findAnzhiInteractiveAllByType(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=request.getParameter("pageNum")!=null&&request.getParameter("pageNum")!=""?Integer.parseInt(request.getParameter("pageNum")):0;
		String condition=this.getCondition(anzhiinteractiveConditionArr, request, response);
		String interactiveType=request.getParameter("interactiveType");
		QueryList<AnzhiInteractive> list = anzhiinteractiveService.findAnzhiInteractiveAll(size, pageNum, " and interactive_type="+interactiveType);
		request.setAttribute("anzhiinteractiveList", list);
		if(interactiveType.equals("0")){
			return this.getPageName(request, "bianjizhuanqu");
		}else if(interactiveType.equals("1")){
			return this.getPageName(request, "news");
		}else if(interactiveType.equals("2")){
			return this.getPageName(request, "banquanweihu");
		}else{
			return this.getPageName(request, "index");
		}
		
	}
}