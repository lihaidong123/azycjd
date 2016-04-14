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
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelReward;
import com.anzhi.web.service.IAnzhiNovelRewardService;
import java.util.Date;
@Controller
public class AnzhiNovelRewardController extends GetCondition {
	@Autowired
	private IAnzhiNovelRewardService anzhinovelrewardService;
	@RequestMapping(value="/anzhinovelreward/addAnzhiNovelReward",method=RequestMethod.POST)
	public void addAnzhiNovelReward(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReward anzhinovelreward){
		if(request.getSession().getAttribute("addAnzhiNovelRewardSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelRewardSession","true");
				if(anzhinovelreward.getId()==null||anzhinovelreward.getId()==0){
					anzhinovelrewardService.addAnzhiNovelReward(anzhinovelreward);
				}else{
					anzhinovelrewardService.updateAnzhiNovelReward(anzhinovelreward);
				}
				response.sendRedirect(request.getContextPath()+"/anzhinovelreward/findAnzhiNovelRewardAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelRewardSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreward/addBatchAnzhiNovelReward",method=RequestMethod.POST)
	public String addBatchAnzhiNovelReward(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelReward> list=new ArrayList<AnzhiNovelReward>();
		anzhinovelrewardService.addBatchAnzhiNovelReward(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreward/delAnzhiNovelReward",method=RequestMethod.POST)
	public void delAnzhiNovelReward(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelRewardSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelRewardSession","true");
				int id=request.getParameter("anzhinovelrewardId")==null?0:Integer.parseInt(request.getParameter("anzhinovelrewardId"));
				anzhinovelrewardService.delAnzhiNovelReward(id);
				response.sendRedirect(request.getContextPath()+"/anzhinovelreward/findAnzhiNovelRewardAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelRewardSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreward/delBatchAnzhiNovelReward",method=RequestMethod.POST)
	public String delBatchAnzhiNovelReward(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovelrewardIds");
		anzhinovelrewardService.delBatchAnzhiNovelReward(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreward/updateAnzhiNovelReward",method=RequestMethod.POST)
	public String updateAnzhiNovelReward(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReward anzhinovelreward){
		if(request.getSession().getAttribute("updateAnzhiNovelRewardSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelRewardSession","true");
				anzhinovelrewardService.updateAnzhiNovelReward(anzhinovelreward);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelRewardSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreward/findAnzhiNovelRewardAll",method=RequestMethod.POST)
	public String findAnzhiNovelRewardAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelrewardConditionArr, request, response);
		QueryList<AnzhiNovelReward> list = anzhinovelrewardService.findAnzhiNovelRewardAll(size, pageNum, condition);
		request.setAttribute("anzhinovelrewardList", list);
		return this.getPageName(request, "admin/AnzhiNovelRewardManager");
	}

	@RequestMapping(value="/anzhinovelreward/findAnzhiNovelRewardById",method=RequestMethod.POST)
	public String findAnzhiNovelRewardById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelReward> list = anzhinovelrewardService.findAnzhiNovelRewardAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinovelrewardId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNovelRewardAction");
	}

	@RequestMapping(value="/anzhinovelreward/anzhinovelrewardAction",method=RequestMethod.POST)
	public String anzhinovelrewardAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelRewardAction");
	}

	@RequestMapping(value="/anzhinovelreward/daShangRecord",method=RequestMethod.POST)
	public void daShangRecord(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReward anzhiNovelReward){
		if(request.getSession().getAttribute("addAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelMultifunctionSession","true");
				AnzhiMember am=this.getLoginMember(request);
				response.setCharacterEncoding("utf-8");
				if(am==null||am.getId()==null){
					response.getWriter().write("您还没有登录呢");
				}else{
					anzhiNovelReward.setMemberId(am.getId());
					response.getWriter().write(anzhinovelrewardService.cashDaShang(request, am,anzhiNovelReward));
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelMultifunctionSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
}