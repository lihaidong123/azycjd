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
import com.anzhi.web.pojo.AnzhiRecommend;
import com.anzhi.web.service.IAnzhiRecommendService;
import java.util.Date;
@Controller
public class AnzhiRecommendController extends GetCondition {
	@Autowired
	private IAnzhiRecommendService anzhirecommendService;
	@RequestMapping(value="/anzhirecommend/addAnzhiRecommend",method=RequestMethod.POST)
	public void addAnzhiRecommend(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("addAnzhiRecommendSession")==null){
			try{
				AnzhiRecommend anzhirecommend=new AnzhiRecommend();
				String id=request.getParameter("id");
				request.getSession().setAttribute("addAnzhiRecommendSession","true");
				if(id==null||id.equals("")){
					String recommendPost=request.getParameter("recommendPost");
					String recommendPosition=request.getParameter("recommendPosition");
					String vote=request.getParameter("vote");
					String a=request.getParameter("novelId");
					String[] b=a.split(","); 
					int memberId=this.getLoginMemberId(request);
					response.setCharacterEncoding("utf-8");
					if(memberId==-1){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
						anzhirecommendService.addAnzhiRecommend(anzhirecommend,recommendPost,recommendPosition,vote,b,memberId);
						response.getWriter().write("yes");
					}
				}else{
					String recommendPost=request.getParameter("recommendPost");
					String recommendPosition=request.getParameter("recommendPosition");
					String vote=request.getParameter("vote");
					String a=request.getParameter("novelId");
					String[] b=a.split(","); 
					int memberId=this.getLoginMemberId(request);
					response.setCharacterEncoding("utf-8");
					if(memberId==-1){
						response.getWriter().write("您还没有登录呢!");
						return;
					}else{
						anzhirecommendService.updateAnzhiRecommend(anzhirecommend,recommendPost,recommendPosition,vote,b,memberId,Integer.parseInt(id));
						response.getWriter().write("yes");
					}
					response.sendRedirect(request.getContextPath()+"/anzhirecommend/findAnzhiRecommendAll.do");
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiRecommendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhirecommend/addBatchAnzhiRecommend",method=RequestMethod.POST)
	public String addBatchAnzhiRecommend(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiRecommend> list=new ArrayList<AnzhiRecommend>();
		anzhirecommendService.addBatchAnzhiRecommend(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecommend/delAnzhiRecommend",method=RequestMethod.POST)
	public void delAnzhiRecommend(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiRecommendSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiRecommendSession","true");
				int id=request.getParameter("anzhirecommendId")==null?0:Integer.parseInt(request.getParameter("anzhirecommendId"));
				anzhirecommendService.delAnzhiRecommend(id);
				response.sendRedirect(request.getContextPath()+"/anzhirecommend/findAnzhiRecommendAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiRecommendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhirecommend/delBatchAnzhiRecommend",method=RequestMethod.POST)
	public String delBatchAnzhiRecommend(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhirecommendIds");
		anzhirecommendService.delBatchAnzhiRecommend(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecommend/updateAnzhiRecommend",method=RequestMethod.POST)
	public String updateAnzhiRecommend(HttpServletRequest request,HttpServletResponse response,AnzhiRecommend anzhirecommend){
		if(request.getSession().getAttribute("updateAnzhiRecommendSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiRecommendSession","true");
				anzhirecommendService.updateAnzhiRecommend(anzhirecommend);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiRecommendSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhirecommend/findAnzhiRecommendAll")
	public String findAnzhiRecommendAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhirecommendConditionArr, request, response);
		if(this.checkParam(request, "recommendPositions")){
			condition+=" and recommend_position='"+request.getParameter("recommendPositions")+"'";
		}
		QueryList<AnzhiRecommend> list = anzhirecommendService.findAnzhiRecommendAll(size, pageNum, condition);
		for(int i=0;i<list.getList().size();i++){
			AnzhiRecommend ar=list.getList().get(i);
			for(String s:recommendPositionTypeData){
				String[] tmp=s.split(",");
				if(tmp[0].equals(ar.getRecommendPosition())){
					ar.setRecommendPosition(tmp[1]);
				}
			}
		}
		request.setAttribute("anzhirecommendList", list);
		return this.getPageName(request, "admin/AnzhiRecommendManager");
	}

	@RequestMapping(value="/anzhirecommend/findAnzhiRecommendById",method=RequestMethod.POST)
	public String findAnzhiRecommendById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiRecommend> list = anzhirecommendService.findAnzhiRecommendAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhirecommendId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiRecommendAction");
	}

	@RequestMapping(value="/anzhirecommend/anzhirecommendAction",method=RequestMethod.POST)
	public String anzhirecommendAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiRecommendAction");
	}


}