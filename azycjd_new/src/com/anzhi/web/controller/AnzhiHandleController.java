package com.anzhi.web.controller;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiHandle;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.service.IAnzhiHandleService;
import com.anzhi.web.service.IAnzhiNovelService;

import java.util.Date;
@Controller
public class AnzhiHandleController extends GetCondition {
	@Autowired
	private IAnzhiHandleService anzhihandleService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@RequestMapping(value="/anzhihandle/addAnzhiHandle",method=RequestMethod.POST)
	public void addAnzhiHandle(HttpServletRequest request,HttpServletResponse response,AnzhiHandle anzhihandle){
		if(request.getSession().getAttribute("addAnzhiHandleSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiHandleSession","true");
				if(anzhihandle.getId()==null||anzhihandle.getId()==0){
					anzhihandle.setAddTime(getTimestamp());
					anzhihandleService.addAnzhiHandle(anzhihandle,this.getLoginWebEditor(request),request);
					//平台上架、下架、作品名称修改审核通过需要重新生成小说
					if(anzhihandle.getHandleResult().equals(1)&&(anzhihandle.getHandleType().equals(13)||anzhihandle.getHandleType().equals(6)||anzhihandle.getHandleType().equals(7))){
						int novelId=this.getIntBySql("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
						anzhinovelService.createNovel(request.getRealPath("//"), novelId);
					}
					if(anzhihandle.getHandleResult().equals(1)&&anzhihandle.getHandleType().equals(1)){
						int chapterId=this.getIntBySql("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
						int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+chapterId);
						updateNovelMenu(request.getRealPath("//"),novelId);
					}
				}else{
					anzhihandleService.updateAnzhiHandle(anzhihandle);
				}
				response.sendRedirect(request.getContextPath()+"/"+request.getParameter("actionUrl"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiHandleSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhihandle/addBatchAnzhiHandle",method=RequestMethod.POST)
	public String addBatchAnzhiHandle(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiHandle> list=new ArrayList<AnzhiHandle>();
		anzhihandleService.addBatchAnzhiHandle(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhihandle/delAnzhiHandle",method=RequestMethod.POST)
	public void delAnzhiHandle(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiHandleSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiHandleSession","true");
				int id=request.getParameter("anzhihandleId")==null?0:Integer.parseInt(request.getParameter("anzhihandleId"));
				anzhihandleService.delAnzhiHandle(id);
				response.sendRedirect(request.getContextPath()+"/anzhihandle/findAnzhiHandleAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiHandleSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhihandle/delBatchAnzhiHandle",method=RequestMethod.POST)
	public String delBatchAnzhiHandle(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhihandleIds");
		anzhihandleService.delBatchAnzhiHandle(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhihandle/updateAnzhiHandle",method=RequestMethod.POST)
	public String updateAnzhiHandle(HttpServletRequest request,HttpServletResponse response,AnzhiHandle anzhihandle){
		if(request.getSession().getAttribute("updateAnzhiHandleSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiHandleSession","true");
				anzhihandleService.updateAnzhiHandle(anzhihandle);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiHandleSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhihandle/findAnzhiHandleAll",method=RequestMethod.POST)
	public String findAnzhiHandleAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhihandleConditionArr, request, response);
		QueryList<AnzhiHandle> list = anzhihandleService.findAnzhiHandleAll(size, pageNum, condition);
		request.setAttribute("anzhihandleList", list);
		return this.getPageName(request, "admin/AnzhiHandleManager");
	}

	@RequestMapping(value="/anzhihandle/findAnzhiHandleById",method=RequestMethod.POST)
	public String findAnzhiHandleById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiHandle> list = anzhihandleService.findAnzhiHandleAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhihandleId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiHandleAction");
	}

	@RequestMapping(value="/anzhihandle/anzhihandleAction",method=RequestMethod.POST)
	public String anzhihandleAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiHandleAction");
	}

	@RequestMapping(value="/anzhihandle/getHandleResult",method=RequestMethod.POST)
	public void getHandleResult(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		JSONObject jsonBack=new JSONObject();
		if(this.checkParam(request, "tableId")&&this.getInt(request, "handleResultType")!=-1){
			QueryList<AnzhiHandle> list=null;
			if(this.getInt(request, "handleResultType")==15){//如果是网编推文的
				list=anzhihandleService.findAnzhiHandleAll(500, 1, " and (handle_type=15 or handle_type=16) and table_id in ("+request.getParameter("tableId")+")");
			}else{
				list=anzhihandleService.findAnzhiHandleAll(500, 1, " and handle_type="+Integer.parseInt(request.getParameter("handleResultType"))+" and table_id in ("+request.getParameter("tableId")+")");
			}
			JSONArray arr=new JSONArray();
			for(AnzhiHandle acp:list.getList()){
				arr.add(JSONObject.fromObject(acp));
			}
			jsonBack.put("datahand", arr);
		}
		out.print(jsonBack);
	}
	
	
	@RequestMapping(value="/anzhihandle/AnzhiHandleManager",method=RequestMethod.POST)
	public String chapterEnd(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhihandleConditionArr, request, response);
		int handlTyps=this.getInt(request, "handleType")==10?2:3;
		QueryList<AnzhiHandle> list = anzhihandleService.findAnzhiHandleAll(size, pageNum, " and state=2 and handle_type="+this.getInt(request, "handleType"));
		for(AnzhiHandle ah:list.getList()){
			ah.setLs(anzhihandleService.findAnzhiHandleAll(500, 1, " and handle_type="+handlTyps+" and table_id="+ah.getTableId()).getList());
		}
		request.setAttribute("anzhihandleList", list);
		return this.getPageName(request, "admin/AnzhiHandleManager");
	}
	
	@RequestMapping(value="/anzhihandle/adminCheck",method=RequestMethod.POST)
	public void adminCheck(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.getLoginMember(request)==null){
			response.getWriter().write("您还没有登录呢!");
			return;
		}
		response.getWriter().write(anzhihandleService.adminCheck(request,this.getLoginMember(request)));
	}
}