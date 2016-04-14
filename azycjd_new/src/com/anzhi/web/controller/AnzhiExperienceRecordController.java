package com.anzhi.web.controller;
import java.text.SimpleDateFormat;
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
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiExperienceRecordService;
import java.util.Date;
@Controller
public class AnzhiExperienceRecordController extends GetCondition {
	@Autowired
	private IAnzhiExperienceRecordService anzhiexperiencerecordService;
	@RequestMapping(value="/anzhiexperiencerecord/addAnzhiExperienceRecord",method=RequestMethod.POST)
	public void addAnzhiExperienceRecord(HttpServletRequest request,HttpServletResponse response,AnzhiExperienceRecord anzhiexperiencerecord){
		if(request.getSession().getAttribute("addAnzhiExperienceRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiExperienceRecordSession","true");
				if(anzhiexperiencerecord.getId()==null||anzhiexperiencerecord.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					response.setCharacterEncoding("utf-8");
					if(am==null||am.getId()==null){
						response.getWriter().write("您还没有登录呢");
					}else{
						if(anzhiexperiencerecord.getExperienceType()==0){
							anzhiexperiencerecord.setAddTime(getTimestamp());
							anzhiexperiencerecord.setMemberId(am.getId());
							anzhiexperiencerecord.setState(0);
							anzhiexperiencerecord.setExperienceType(0);
							anzhiexperiencerecord.setExperienceNum(5);
							anzhiexperiencerecord.setVote("当日签到成功奖励5点经验");
							anzhiexperiencerecordService.addAnzhiExperienceRecord(anzhiexperiencerecord,request,am);
							
							int qiandaonum=this.getIntBySql("select count(*) from anzhi_experience_record where experience_type= 0 and member_id="+am.getId());
							request.getSession().setAttribute("qiandaonum", qiandaonum);
							request.getSession().setAttribute("qiandao", "yes");
							String ts=this.getStringBySql("select top 1 add_time from anzhi_experience_record where experience_type= 0 and member_id="+am.getId()+" order by id desc");
							request.getSession().setAttribute("lastSignTime", new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ts)));
							response.getWriter().write("yes");
						}
					}
				}else{
					anzhiexperiencerecordService.updateAnzhiExperienceRecord(anzhiexperiencerecord);
				}
				//response.sendRedirect(request.getContextPath()+"/anzhiexperiencerecord/findAnzhiExperienceRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiExperienceRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiexperiencerecord/addBatchAnzhiExperienceRecord",method=RequestMethod.POST)
	public String addBatchAnzhiExperienceRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiExperienceRecord> list=new ArrayList<AnzhiExperienceRecord>();
		anzhiexperiencerecordService.addBatchAnzhiExperienceRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiexperiencerecord/delAnzhiExperienceRecord",method=RequestMethod.POST)
	public void delAnzhiExperienceRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiExperienceRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiExperienceRecordSession","true");
				int id=request.getParameter("anzhiexperiencerecordId")==null?0:Integer.parseInt(request.getParameter("anzhiexperiencerecordId"));
				anzhiexperiencerecordService.delAnzhiExperienceRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhiexperiencerecord/findAnzhiExperienceRecordAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiExperienceRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiexperiencerecord/delBatchAnzhiExperienceRecord",method=RequestMethod.POST)
	public String delBatchAnzhiExperienceRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiexperiencerecordIds");
		anzhiexperiencerecordService.delBatchAnzhiExperienceRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiexperiencerecord/updateAnzhiExperienceRecord",method=RequestMethod.POST)
	public String updateAnzhiExperienceRecord(HttpServletRequest request,HttpServletResponse response,AnzhiExperienceRecord anzhiexperiencerecord){
		if(request.getSession().getAttribute("updateAnzhiExperienceRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiExperienceRecordSession","true");
				anzhiexperiencerecordService.updateAnzhiExperienceRecord(anzhiexperiencerecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiExperienceRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiexperiencerecord/findAnzhiExperienceRecordAll")
	public String findAnzhiExperienceRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiexperiencerecordConditionArr, request, response);
		QueryList<AnzhiExperienceRecord> list = anzhiexperiencerecordService.findAnzhiExperienceRecordAll(size, pageNum, condition);
		request.setAttribute("anzhiexperiencerecordList", list);
		request.setAttribute("experienceTypeArr", experienceTypeArr);
		return this.getPageName(request, "admin/AnzhiExperienceRecordManager");
	}

	@RequestMapping(value="/anzhiexperiencerecord/findAnzhiExperienceRecordById",method=RequestMethod.POST)
	public String findAnzhiExperienceRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiExperienceRecord> list = anzhiexperiencerecordService.findAnzhiExperienceRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiexperiencerecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiExperienceRecordAction");
	}

	@RequestMapping(value="/anzhiexperiencerecord/anzhiexperiencerecordAction",method=RequestMethod.POST)
	public String anzhiexperiencerecordAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiExperienceRecordAction");
	}


}