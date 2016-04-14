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
import com.anzhi.web.pojo.AnzhiNovelReadMoneyRecord;
import com.anzhi.web.service.IAnzhiNovelReadMoneyRecordService;
import com.sun.org.apache.regexp.internal.REUtil;

import java.util.Date;
@Controller
public class AnzhiNovelReadMoneyRecordController extends GetCondition {
	@Autowired
	private IAnzhiNovelReadMoneyRecordService anzhinovelreadmoneyrecordService;
	@RequestMapping(value="/anzhinovelreadmoneyrecord/addAnzhiNovelReadMoneyRecord")
	public void addAnzhiNovelReadMoneyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		if(request.getSession().getAttribute("addAnzhiNovelReadMoneyRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelReadMoneyRecordSession","true");
				if(anzhinovelreadmoneyrecord.getId()==null||anzhinovelreadmoneyrecord.getId()==0){
					anzhinovelreadmoneyrecord.setAddTime(getTimestamp());
					anzhinovelreadmoneyrecordService.addAnzhiNovelReadMoneyRecord(anzhinovelreadmoneyrecord);
				}else{
					anzhinovelreadmoneyrecordService.updateAnzhiNovelReadMoneyRecord(anzhinovelreadmoneyrecord);
				}
				response.sendRedirect(request.getContextPath()+"/anzhimember/findAnzhiMemberAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelReadMoneyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhinovelreadmoneyrecord/addAnzhiNovelReadMoneyRecordMore")
	public void addAnzhiNovelReadMoneyRecordMore(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		if(request.getSession().getAttribute("addAnzhiNovelReadMoneyRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelReadMoneyRecordSession","true");
				if(this.checkParam(request, "memberArrId")&&this.checkParam(request, "readMoney")){
					anzhinovelreadmoneyrecordService.addAnzhiNovelReadMoneyRecordMore(request.getParameter("memberArrId"),request.getParameter("readMoney"));
				}
				response.sendRedirect(request.getContextPath()+"/anzhimember/findAnzhiMemberAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelReadMoneyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/addBatchAnzhiNovelReadMoneyRecord")
	public String addBatchAnzhiNovelReadMoneyRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelReadMoneyRecord> list=new ArrayList<AnzhiNovelReadMoneyRecord>();
		anzhinovelreadmoneyrecordService.addBatchAnzhiNovelReadMoneyRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/delAnzhiNovelReadMoneyRecord")
	public void delAnzhiNovelReadMoneyRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelReadMoneyRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelReadMoneyRecordSession","true");
				int id=request.getParameter("anzhinovelreadmoneyrecordId")==null?0:Integer.parseInt(request.getParameter("anzhinovelreadmoneyrecordId"));
				anzhinovelreadmoneyrecordService.delAnzhiNovelReadMoneyRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelReadMoneyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/delBatchAnzhiNovelReadMoneyRecord")
	public String delBatchAnzhiNovelReadMoneyRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovelreadmoneyrecordIds");
		anzhinovelreadmoneyrecordService.delBatchAnzhiNovelReadMoneyRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/updateAnzhiNovelReadMoneyRecord")
	public String updateAnzhiNovelReadMoneyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReadMoneyRecord anzhinovelreadmoneyrecord){
		if(request.getSession().getAttribute("updateAnzhiNovelReadMoneyRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelReadMoneyRecordSession","true");
				anzhinovelreadmoneyrecordService.updateAnzhiNovelReadMoneyRecord(anzhinovelreadmoneyrecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelReadMoneyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordAll")
	public String findAnzhiNovelReadMoneyRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelreadmoneyrecordConditionArr, request, response);
		QueryList<AnzhiNovelReadMoneyRecord> list = anzhinovelreadmoneyrecordService.findAnzhiNovelReadMoneyRecordAll(size, pageNum, condition);
		request.setAttribute("anzhinovelreadmoneyrecordList", list);
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyRecordManager");
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordById")
	public String findAnzhiNovelReadMoneyRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelReadMoneyRecord> list = anzhinovelreadmoneyrecordService.findAnzhiNovelReadMoneyRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinovelreadmoneyrecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyRecordAction");
	}

	@RequestMapping(value="/anzhinovelreadmoneyrecord/anzhinovelreadmoneyrecordAction")
	public String anzhinovelreadmoneyrecordAction(HttpServletRequest request,HttpServletResponse response){
		request.setAttribute("memberNick",this.getStringBySql("select member_nick from anzhi_member where id="+this.getInt(request, "memberId")));
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyRecordAction");
	}


}