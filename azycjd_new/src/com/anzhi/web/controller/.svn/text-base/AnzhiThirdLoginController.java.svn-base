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
import com.anzhi.web.pojo.AnzhiThirdLogin;
import com.anzhi.web.service.IAnzhiThirdLoginService;
import java.util.Date;
@Controller
public class AnzhiThirdLoginController extends GetCondition {
	@Autowired
	private IAnzhiThirdLoginService anzhithirdloginService;
	@RequestMapping(value="/anzhithirdlogin/addAnzhiThirdLogin")
	public void addAnzhiThirdLogin(HttpServletRequest request,HttpServletResponse response,AnzhiThirdLogin anzhithirdlogin){
		if(request.getSession().getAttribute("addAnzhiThirdLoginSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiThirdLoginSession","true");
				if(anzhithirdlogin.getId()==null||anzhithirdlogin.getId()==0){
					anzhithirdloginService.addAnzhiThirdLogin(anzhithirdlogin);
				}else{
					anzhithirdloginService.updateAnzhiThirdLogin(anzhithirdlogin);
				}
				response.sendRedirect(request.getContextPath()+"/anzhithirdlogin/findAnzhiThirdLoginAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiThirdLoginSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhithirdlogin/addBatchAnzhiThirdLogin")
	public String addBatchAnzhiThirdLogin(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiThirdLogin> list=new ArrayList<AnzhiThirdLogin>();
		anzhithirdloginService.addBatchAnzhiThirdLogin(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdlogin/delAnzhiThirdLogin")
	public void delAnzhiThirdLogin(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiThirdLoginSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiThirdLoginSession","true");
				int id=request.getParameter("anzhithirdloginId")==null?0:Integer.parseInt(request.getParameter("anzhithirdloginId"));
				anzhithirdloginService.delAnzhiThirdLogin(id);
				response.sendRedirect(request.getContextPath()+"/anzhithirdlogin/findAnzhiThirdLoginAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiThirdLoginSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhithirdlogin/delBatchAnzhiThirdLogin")
	public String delBatchAnzhiThirdLogin(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhithirdloginIds");
		anzhithirdloginService.delBatchAnzhiThirdLogin(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdlogin/updateAnzhiThirdLogin")
	public String updateAnzhiThirdLogin(HttpServletRequest request,HttpServletResponse response,AnzhiThirdLogin anzhithirdlogin){
		if(request.getSession().getAttribute("updateAnzhiThirdLoginSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiThirdLoginSession","true");
				anzhithirdloginService.updateAnzhiThirdLogin(anzhithirdlogin);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiThirdLoginSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhithirdlogin/findAnzhiThirdLoginAll")
	public String findAnzhiThirdLoginAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=request.getParameter("pageNum")!=null&&request.getParameter("pageNum")!=""?Integer.parseInt(request.getParameter("pageNum")):0;
		String condition=this.getCondition(anzhithirdloginConditionArr, request, response);
		QueryList<AnzhiThirdLogin> list = anzhithirdloginService.findAnzhiThirdLoginAll(size, pageNum, condition);
		request.setAttribute("anzhithirdloginList", list);
		return this.getPageName(request, "admin/AnzhiThirdLoginManager");
	}

	@RequestMapping(value="/anzhithirdlogin/findAnzhiThirdLoginById")
	public String findAnzhiThirdLoginById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiThirdLogin> list = anzhithirdloginService.findAnzhiThirdLoginAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhithirdloginId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiThirdLoginAction");
	}

	@RequestMapping(value="/anzhithirdlogin/anzhithirdloginAction")
	public String anzhithirdloginAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiThirdLoginAction");
	}


}