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
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AuthorNovelConsume;
import com.anzhi.web.service.IAnzhiConsumeService;
import java.util.Date;
@Controller
public class AnzhiConsumeController extends GetCondition {
	@Autowired
	private IAnzhiConsumeService anzhiconsumeService;
	@RequestMapping(value="/anzhiconsume/addAnzhiConsume",method=RequestMethod.POST)
	public void addAnzhiConsume(HttpServletRequest request,HttpServletResponse response,AnzhiConsume anzhiconsume){
		if(request.getSession().getAttribute("addAnzhiConsumeSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiConsumeSession","true");
				if(anzhiconsume.getId()==null||anzhiconsume.getId()==0){
					anzhiconsumeService.addAnzhiConsume(anzhiconsume);
				}else{
					anzhiconsumeService.updateAnzhiConsume(anzhiconsume);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiconsume/findAnzhiConsumeAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiConsumeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiconsume/addBatchAnzhiConsume",method=RequestMethod.POST)
	public String addBatchAnzhiConsume(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiConsume> list=new ArrayList<AnzhiConsume>();
		anzhiconsumeService.addBatchAnzhiConsume(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiconsume/delAnzhiConsume",method=RequestMethod.POST)
	public void delAnzhiConsume(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiConsumeSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiConsumeSession","true");
				int id=request.getParameter("anzhiconsumeId")==null?0:Integer.parseInt(request.getParameter("anzhiconsumeId"));
				anzhiconsumeService.delAnzhiConsume(id);
				response.sendRedirect(request.getContextPath()+"/anzhiconsume/findAnzhiConsumeAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiConsumeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiconsume/delBatchAnzhiConsume",method=RequestMethod.POST)
	public String delBatchAnzhiConsume(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiconsumeIds");
		anzhiconsumeService.delBatchAnzhiConsume(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiconsume/updateAnzhiConsume",method=RequestMethod.POST)
	public String updateAnzhiConsume(HttpServletRequest request,HttpServletResponse response,AnzhiConsume anzhiconsume){
		if(request.getSession().getAttribute("updateAnzhiConsumeSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiConsumeSession","true");
				anzhiconsumeService.updateAnzhiConsume(anzhiconsume);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiConsumeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeAll",method=RequestMethod.POST)
	public String findAnzhiConsumeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiconsumeConditionArr, request, response);
		QueryList<AnzhiConsume> list = anzhiconsumeService.findAnzhiConsumeAll(size, pageNum, condition);
		request.setAttribute("anzhiconsumeList", list);
		return this.getPageName(request, "admin/AnzhiConsumeManager");
	}

	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeById",method=RequestMethod.POST)
	public String findAnzhiConsumeById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiConsume> list = anzhiconsumeService.findAnzhiConsumeAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiconsumeId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiConsumeAction");
	}

	@RequestMapping(value="/anzhiconsume/anzhiconsumeAction",method=RequestMethod.POST)
	public String anzhiconsumeAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiConsumeAction");
	}
	
	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeMySelf",method=RequestMethod.POST)
	public String findAnzhiConsumeMySelf(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiconsumeConditionArr, request, response);
		int memberid=this.getLoginMemberId(request);
		if(memberid == -1){
			return this.getPageName(request, "index");
		}
		QueryList<AnzhiConsume> list = anzhiconsumeService.findAnzhiConsumeAll(size, pageNum, condition,memberid);
		request.setAttribute("anzhiconsumeList", list);
		return this.getPageName(request, "index/information_account_consume");
	}
	
	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeMyCome",method=RequestMethod.POST)
	public String findAnzhiConsumeMyCome(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiconsumeConditionArr, request, response);
		int memberid=this.getLoginMemberId(request);
		if(memberid == -1){
			return this.getPageName(request, "index");
		}
		QueryList<AnzhiConsume> list = anzhiconsumeService.findAnzhiConsumeMyCome(size, pageNum, condition,memberid);
		request.setAttribute("anzhiconsumeList", list);
		return this.getPageName(request, "index/line_myincome");
	}
	
	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeMyComeByMonth",method=RequestMethod.POST)
	public String findAnzhiConsumeMyComeByMonth(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiconsumeConditionArr, request, response);
		int memberid=this.getLoginMemberId(request);
		if(memberid == -1){
			return this.getPageName(request, "index");
		}
		String novelid=request.getParameter("id");
		List<AuthorNovelConsume> list = anzhiconsumeService.findAnzhiConsumeMyComeByMonth(size, pageNum, "", memberid, Integer.parseInt(novelid));
		request.setAttribute("anzhiconsumeList", list);
		return this.getPageName(request, "index/line_myincome_month");

	}
	
	@RequestMapping(value="/anzhiconsume/findAnzhiConsumeMyDetail",method=RequestMethod.POST)
	public String findAnzhiConsumeMyDetail(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiconsumeConditionArr, request, response);
		int memberid=this.getLoginMemberId(request);
		if(memberid == -1){
			return this.getPageName(request, "index");
		}
		QueryList<AnzhiConsume> list = anzhiconsumeService.findAnzhiConsumeAll(size, pageNum, " and member_id="+memberid);
		request.setAttribute("anzhiconsumeList", list);
		return this.getPageName(request, "index/line_myincome_detail");

	}


}