package com.anzhi.web.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiChapterSubscribe;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.ChapterDingYue;
import com.anzhi.web.service.IAnzhiChapterSubscribeService;
import com.anzhi.web.service.IAnzhiNovelMultifunctionService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiChapterSubscribeController extends GetCondition {
	@Autowired
	private IAnzhiChapterSubscribeService anzhichaptersubscribeService;
	@Autowired
	private IAnzhiNovelMultifunctionService anzhinovelmultifunctionService;
	
	@RequestMapping(value="/anzhichaptersubscribe/addAnzhiChapterSubscribe",method=RequestMethod.POST)
	public void addAnzhiChapterSubscribe(HttpServletRequest request,HttpServletResponse response,AnzhiChapterSubscribe anzhichaptersubscribe){
		if(request.getSession().getAttribute("addAnzhiChapterSubscribeSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiChapterSubscribeSession","true");
				if(anzhichaptersubscribe.getId()==null||anzhichaptersubscribe.getId()==0){
					anzhichaptersubscribeService.addAnzhiChapterSubscribe(anzhichaptersubscribe);
				}else{
					anzhichaptersubscribeService.updateAnzhiChapterSubscribe(anzhichaptersubscribe);
				}
				response.sendRedirect(request.getContextPath()+"/anzhichaptersubscribe/findAnzhiChapterSubscribeAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiChapterSubscribeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhichaptersubscribe/addBatchAnzhiChapterSubscribe",method=RequestMethod.POST)
	public String addBatchAnzhiChapterSubscribe(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiChapterSubscribe> list=new ArrayList<AnzhiChapterSubscribe>();
		anzhichaptersubscribeService.addBatchAnzhiChapterSubscribe(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichaptersubscribe/delAnzhiChapterSubscribe",method=RequestMethod.POST)
	public void delAnzhiChapterSubscribe(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiChapterSubscribeSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiChapterSubscribeSession","true");
				int id=request.getParameter("anzhichaptersubscribeId")==null?0:Integer.parseInt(request.getParameter("anzhichaptersubscribeId"));
				anzhichaptersubscribeService.delAnzhiChapterSubscribe(id);
				response.sendRedirect(request.getContextPath()+"/anzhichaptersubscribe/findAnzhiChapterSubscribeAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiChapterSubscribeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhichaptersubscribe/delBatchAnzhiChapterSubscribe",method=RequestMethod.POST)
	public String delBatchAnzhiChapterSubscribe(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhichaptersubscribeIds");
		anzhichaptersubscribeService.delBatchAnzhiChapterSubscribe(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichaptersubscribe/updateAnzhiChapterSubscribe",method=RequestMethod.POST)
	public String updateAnzhiChapterSubscribe(HttpServletRequest request,HttpServletResponse response,AnzhiChapterSubscribe anzhichaptersubscribe){
		if(request.getSession().getAttribute("updateAnzhiChapterSubscribeSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiChapterSubscribeSession","true");
				anzhichaptersubscribeService.updateAnzhiChapterSubscribe(anzhichaptersubscribe);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiChapterSubscribeSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichaptersubscribe/findAnzhiChapterSubscribeAll",method=RequestMethod.POST)
	public String findAnzhiChapterSubscribeAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhichaptersubscribeConditionArr, request, response);
		QueryList<AnzhiChapterSubscribe> list = anzhichaptersubscribeService.findAnzhiChapterSubscribeAll(size, pageNum, condition);
		request.setAttribute("anzhichaptersubscribeList", list);
		return this.getPageName(request, "admin/AnzhiChapterSubscribeManager");
	}

	@RequestMapping(value="/anzhichaptersubscribe/findAnzhiChapterSubscribeById",method=RequestMethod.POST)
	public String findAnzhiChapterSubscribeById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiChapterSubscribe> list = anzhichaptersubscribeService.findAnzhiChapterSubscribeAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhichaptersubscribeId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiChapterSubscribeAction");
	}

	@RequestMapping(value="/anzhichaptersubscribe/anzhichaptersubscribeAction",method=RequestMethod.POST)
	public String anzhichaptersubscribeAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiChapterSubscribeAction");
	}

	/**
	 * 分卷订阅
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhichaptersubscribe/fenJuanDingYue",method=RequestMethod.POST)
	public void fenJuanDingYue(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(am==null||am.getId()==null){
			response.getWriter().write("您还没有登录呢");
			return;
		}
		if(this.getInt(request, "fenJuanId")==-1){
			response.getWriter().write("参数请求错误");
			return;
		}
		response.getWriter().write(anzhichaptersubscribeService.cashAnzhiChapterSubscribe(this.getInt(request, "fenJuanId"), request, am));
	}
	
	/**
	 * 单章节购买、整书购买、自动订阅
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhichaptersubscribe/buySignChapter",method=RequestMethod.POST)
	public void buySignChapter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(am==null||am.getId()==null){
			response.getWriter().write("您还没有登录呢");
			return;
		}
		if(this.getInt(request, "tableId")==-1||this.getInt(request, "types")==-1||this.getInt(request, "types")>2){
			response.getWriter().write("参数请求错误");
			return;
		}
		response.getWriter().write(anzhichaptersubscribeService.cashAnzhiChapterSubscribe(this.getInt(request, "tableId"),this.getInt(request, "types"), request, am));
	}
	
	/**
	 * 获得登录用户已经订阅的章节，用以显示“购买”图标
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhichaptersubscribe/getDingYueChapter",method=RequestMethod.POST)
	public void getDingYueChapter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(this.getInt(request, "novelId")==-1){
			response.getWriter().write("参数请求错误");
			return;
		}
		anzhichaptersubscribeService.getDingYueChapter(request, response,am);
	}
	
	/**
	 * 取消自动订阅
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhichaptersubscribe/delautoBuy",method=RequestMethod.POST)
	public void delautoBuy(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(am==null||am.getId()==null){
			response.getWriter().write("您还没有登录呢");
			return;
		}
		if(this.getInt(request, "novelId")==-1){
			response.getWriter().write("参数请求错误");
			return;
		}
		if(anzhinovelmultifunctionService.delAnzhiNovelMultifunction(this.getInt(request, "novelId"), am.getId(), 5)){
			response.getWriter().write("yes");
		}
	}

	/**
	 * 作家收益
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhichaptersubscribe/income",method=RequestMethod.POST)
	public String income(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(am!=null&&am.getMemberType().equals(2)){
			anzhichaptersubscribeService.income(request);
		}
		return "admin/income";
	}
}