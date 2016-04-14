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
import com.anzhi.web.pojo.AnzhiTrend;
import com.anzhi.web.pojo.AnzhiTrendReply;
import com.anzhi.web.service.IAnzhiTrendReplyService;
import com.anzhi.web.service.IAnzhiTrendService;
import java.util.Date;
@Controller
public class AnzhiTrendController extends GetCondition {
	@Autowired
	private IAnzhiTrendService anzhitrendService;
	@Autowired
	private IAnzhiTrendReplyService anzhitrendreplyService;
	@RequestMapping(value="/anzhitrend/addAnzhiTrend",method=RequestMethod.POST)
	public void addAnzhiTrend(HttpServletRequest request,HttpServletResponse response,AnzhiTrend anzhitrend){
		if(request.getSession().getAttribute("addAnzhiTrendSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiTrendSession","true");
				if(anzhitrend.getId()==null||anzhitrend.getId()==0){
					AnzhiMember am=this.getLoginMember(request);
					String answer=this.randCodeCheck(request,am);
					answer="yes";
					if(answer.equals("yes")){
						anzhitrend.setAddTime(this.getTimestamp());
						anzhitrend.setMemberId(this.getLoginMemberId(request));
						anzhitrend.setState(0);
						anzhitrendService.addAnzhiTrend(anzhitrend,request,am);
						response.sendRedirect(request.getContextPath()+"/anzhitrend/findAnzhiTrendMySelf.do");
					}else{
						response.getWriter().write(answer);
					}
				}else{
					anzhitrendService.updateAnzhiTrend(anzhitrend);
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiTrendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		
	}

	@RequestMapping(value="/anzhitrend/addBatchAnzhiTrend",method=RequestMethod.POST)
	public String addBatchAnzhiTrend(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiTrend> list=new ArrayList<AnzhiTrend>();
		anzhitrendService.addBatchAnzhiTrend(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrend/delAnzhiTrend",method=RequestMethod.POST)
	public void delAnzhiTrend(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiTrendSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiTrendSession","true");
				int id=request.getParameter("anzhitrendId")==null?0:Integer.parseInt(request.getParameter("anzhitrendId"));
				anzhitrendService.delAnzhiTrend(id);
				response.sendRedirect(request.getContextPath()+"/anzhitrend/findAnzhiTrendAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiTrendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhitrend/delBatchAnzhiTrend",method=RequestMethod.POST)
	public String delBatchAnzhiTrend(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhitrendIds");
		anzhitrendService.delBatchAnzhiTrend(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrend/updateAnzhiTrend",method=RequestMethod.POST)
	public String updateAnzhiTrend(HttpServletRequest request,HttpServletResponse response,AnzhiTrend anzhitrend){
		if(request.getSession().getAttribute("updateAnzhiTrendSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiTrendSession","true");
				anzhitrendService.updateAnzhiTrend(anzhitrend);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiTrendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhitrend/findAnzhiTrendAll",method=RequestMethod.POST)
	public String findAnzhiTrendAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhitrendConditionArr, request, response);
		QueryList<AnzhiTrend> list = anzhitrendService.findAnzhiTrendAll(size, pageNum, condition);
		request.setAttribute("anzhitrendList", list);
		return this.getPageName(request, "admin/AnzhiTrendManager");
	}

	@RequestMapping(value="/anzhitrend/findAnzhiTrendById",method=RequestMethod.POST)
	public String findAnzhiTrendById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiTrend> list = anzhitrendService.findAnzhiTrendAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhitrendId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiTrendAction");
	}

	@RequestMapping(value="/anzhitrend/anzhitrendAction",method=RequestMethod.POST)
	public String anzhitrendAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiTrendAction");
	}
	
	@RequestMapping(value="/anzhitrend/findAnzhiTrendMySelf")
	public String findAnzhiTrendMySelf(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhitrendConditionArr, request, response);
		//String pagename=this.getPageName(request, "index/home_page_my_activity");
		String pagename=this.getPageName(request, "pageDirec");
		condition+=pagename.equals("index/home_page_friend_activity")? " and member_id in (select friend_member_id from anzhi_friend where member_id="+this.getLoginMemberId(request)+")":" and member_id="+this.getLoginMemberId(request);
		QueryList<AnzhiTrend> list =anzhitrendService.findAnzhiTrendAll(size, pageNum,condition);
		request.getSession().setAttribute("anzhitrendList", list);
		request.setAttribute("pageDirecNum", "16");
		return pagename;
	}
	


}