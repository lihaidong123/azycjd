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
import com.anzhi.web.pojo.AnzhiHeadImgUseRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiHeadImgUseRecordService;
import java.util.Date;
@Controller
public class AnzhiHeadImgUseRecordController extends GetCondition {
	@Autowired
	private IAnzhiHeadImgUseRecordService anzhiheadimguserecordService;
	@RequestMapping(value="/anzhiheadimguserecord/addAnzhiHeadImgUseRecord",method=RequestMethod.POST)
	public void addAnzhiHeadImgUseRecord(HttpServletRequest request,HttpServletResponse response,AnzhiHeadImgUseRecord anzhiheadimguserecord){
		if(request.getSession().getAttribute("addAnzhiHeadImgUseRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiHeadImgUseRecordSession","true");
				if(anzhiheadimguserecord.getId()==null||anzhiheadimguserecord.getId()==0){
					anzhiheadimguserecordService.addAnzhiHeadImgUseRecord(anzhiheadimguserecord);
				}else{
					anzhiheadimguserecordService.updateAnzhiHeadImgUseRecord(anzhiheadimguserecord);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiHeadImgUseRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiheadimguserecord/addBatchAnzhiHeadImgUseRecord",method=RequestMethod.POST)
	public String addBatchAnzhiHeadImgUseRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiHeadImgUseRecord> list=new ArrayList<AnzhiHeadImgUseRecord>();
		anzhiheadimguserecordService.addBatchAnzhiHeadImgUseRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiheadimguserecord/delAnzhiHeadImgUseRecord",method=RequestMethod.POST)
	public void delAnzhiHeadImgUseRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiHeadImgUseRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiHeadImgUseRecordSession","true");
				int id=request.getParameter("anzhiheadimguserecordId")==null?0:Integer.parseInt(request.getParameter("anzhiheadimguserecordId"));
				anzhiheadimguserecordService.delAnzhiHeadImgUseRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiHeadImgUseRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiheadimguserecord/delBatchAnzhiHeadImgUseRecord",method=RequestMethod.POST)
	public String delBatchAnzhiHeadImgUseRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiheadimguserecordIds");
		anzhiheadimguserecordService.delBatchAnzhiHeadImgUseRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiheadimguserecord/updateAnzhiHeadImgUseRecord",method=RequestMethod.POST)
	public String updateAnzhiHeadImgUseRecord(HttpServletRequest request,HttpServletResponse response,AnzhiHeadImgUseRecord anzhiheadimguserecord){
		if(request.getSession().getAttribute("updateAnzhiHeadImgUseRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiHeadImgUseRecordSession","true");
				anzhiheadimguserecordService.updateAnzhiHeadImgUseRecord(anzhiheadimguserecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiHeadImgUseRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll",method=RequestMethod.POST)
	public String findAnzhiHeadImgUseRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiheadimguserecordConditionArr, request, response);
		QueryList<AnzhiHeadImgUseRecord> list = anzhiheadimguserecordService.findAnzhiHeadImgUseRecordAll(size, pageNum, condition);
		request.setAttribute("anzhiheadimguserecordList", list);
		return this.getPageName(request, "admin/AnzhiHeadImgUseRecordManager");
	}

	@RequestMapping(value="/anzhiheadimguserecord/findAnzhiHeadImgUseRecordById",method=RequestMethod.POST)
	public String findAnzhiHeadImgUseRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiHeadImgUseRecord> list = anzhiheadimguserecordService.findAnzhiHeadImgUseRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiheadimguserecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiHeadImgUseRecordAction");
	}

	@RequestMapping(value="/anzhiheadimguserecord/anzhiheadimguserecordAction",method=RequestMethod.POST)
	public String anzhiheadimguserecordAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiHeadImgUseRecordAction");
	}
	
	@RequestMapping(value="/anzhiheadimguserecord/findAnzhiHeadImgUseRecordMySelf",method=RequestMethod.POST)
	public String findAnzhiHeadImgUseRecordMySelf(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiheadimguserecordConditionArr, request, response);
		QueryList<AnzhiHeadImgUseRecord> list = anzhiheadimguserecordService.findAnzhiHeadImgUseRecordAll(size, pageNum, " and member_id="+this.getLoginMemberId(request));
		request.setAttribute("anzhiheadimguserecordList", list);
		return "index/my_infomation_head_img";
	}


}