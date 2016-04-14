package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.service.IAnzhiBookmarkService;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiNovelMultifunctionService;
@Controller
public class AnzhiNovelMultifunctionController extends GetCondition {
	@Autowired
	private IAnzhiNovelMultifunctionService anzhinovelmultifunctionService;
	@Autowired
	private IAnzhiBookmarkService anzhibookmarkService;
	@RequestMapping(value="/anzhinovelmultifunction/addAnzhiNovelMultifunction",method=RequestMethod.POST)
	public String addAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response,AnzhiNovelMultifunction anzhinovelmultifunction){
		if(request.getSession().getAttribute("addAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelMultifunctionSession","true");
				if(anzhinovelmultifunction.getId()==null||anzhinovelmultifunction.getId()==0){
					if(anzhinovelmultifunction.getActionType().equals(3)){
						anzhinovelmultifunction.setAddTime(this.getTimestamp());
						anzhinovelmultifunction.setState(0);
						anzhinovelmultifunction.setMemberId(this.getLoginMemberId(request));
					}
					anzhinovelmultifunctionService.addAnzhiNovelMultifunction(anzhinovelmultifunction);
				}else{
					anzhinovelmultifunctionService.updateAnzhiNovelMultifunction(anzhinovelmultifunction);
				}
				if(anzhinovelmultifunction.getActionType().equals(3)){
					request.setAttribute("pageDirecNum", "10");
					return "pageDirec";
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelMultifunctionSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}
	
	@RequestMapping(value="/anzhinovelmultifunction/saveAnzhiNovelMultifunction",method=RequestMethod.POST)
	public void saveAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response,AnzhiNovelMultifunction anzhinovelmultifunction){
		if(request.getSession().getAttribute("addAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelMultifunctionSession","true");
				AnzhiMember am=this.getLoginMember(request);
				response.setCharacterEncoding("utf-8");
				if(am==null||am.getId()==null){
					response.getWriter().write("您还没有登录呢");
				}else{
					anzhinovelmultifunction.setMemberId(am.getId());
					anzhinovelmultifunctionService.saveAnzhiNovelMultifunction(anzhinovelmultifunction);
					response.getWriter().write("yes");
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelMultifunctionSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelmultifunction/addBatchAnzhiNovelMultifunction",method=RequestMethod.POST)
	public String addBatchAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelMultifunction> list=new ArrayList<AnzhiNovelMultifunction>();
		anzhinovelmultifunctionService.addBatchAnzhiNovelMultifunction(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelmultifunction/delAnzhiNovelMultifunction",method=RequestMethod.POST)
	public String delAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelMultifunctionSession","true");
				int id=request.getParameter("anzhinovelmultifunctionId")==null?0:Integer.parseInt(request.getParameter("anzhinovelmultifunctionId"));
				anzhinovelmultifunctionService.delAnzhiNovelMultifunction(id);
				//response.sendRedirect(request.getContextPath()+"/anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelMultifunctionSession");
			}
		}
		request.setAttribute("pageDirecNum", "13");
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhinovelmultifunction/delAnzhiNovelMultifunctionTuijian",method=RequestMethod.POST)
	public String delAnzhiNovelMultifunctionTuijian(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelMultifunctionSession","true");
				int id=request.getParameter("anzhinovelmultifunctionId")==null?0:Integer.parseInt(request.getParameter("anzhinovelmultifunctionId"));
				anzhinovelmultifunctionService.delAnzhiNovelMultifunction(id);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelMultifunctionSession");
			}
		}
		request.setAttribute("pageDirecNum", "14");
		return "pageDirec";
	}

	@RequestMapping(value="/anzhinovelmultifunction/delBatchAnzhiNovelMultifunction",method=RequestMethod.POST)
	public String delBatchAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovelmultifunctionIds");
		anzhinovelmultifunctionService.delBatchAnzhiNovelMultifunction(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelmultifunction/updateAnzhiNovelMultifunction",method=RequestMethod.POST)
	public String updateAnzhiNovelMultifunction(HttpServletRequest request,HttpServletResponse response,AnzhiNovelMultifunction anzhinovelmultifunction){
		if(request.getSession().getAttribute("updateAnzhiNovelMultifunctionSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelMultifunctionSession","true");
				anzhinovelmultifunctionService.updateAnzhiNovelMultifunction(anzhinovelmultifunction);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelMultifunctionSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelmultifunction/findAnzhiNovelMultifunctionAll",method=RequestMethod.POST)
	public String findAnzhiNovelMultifunctionAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelmultifunctionConditionArr, request, response);
		QueryList<AnzhiNovelMultifunction> list = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(size, pageNum, condition);
		request.setAttribute("anzhinovelmultifunctionList", list);
		return this.getPageName(request, "admin/AnzhiNovelMultifunctionManager");
	}

	@RequestMapping(value="/anzhinovelmultifunction/findAnzhiNovelMultifunctionById",method=RequestMethod.POST)
	public String findAnzhiNovelMultifunctionById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelMultifunction> list = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinovelmultifunctionId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNovelMultifunctionAction");
	}

	@RequestMapping(value="/anzhinovelmultifunction/anzhinovelmultifunctionAction",method=RequestMethod.POST)
	public String anzhinovelmultifunctionAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelMultifunctionAction");
	}
	/*
	 * 查询我推荐的小说
	 */
	@RequestMapping(value="/anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian",method=RequestMethod.POST)
	public String findAnzhiNovelMultifunctionMyTuijian(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelmultifunctionConditionArr, request, response);
		int loginid=this.getLoginMemberId(request);
		QueryList<AnzhiNovelMultifunction> list = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(size, pageNum,condition,3,loginid);
		request.setAttribute("anzhinovelmultifunctionList", list);
		return this.getPageName(request, "index/writer_info_tui_jian");
	}
	/*
	 * 查询我收藏的小说
	 */
	@RequestMapping(value="/anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang",method=RequestMethod.POST)
	public String findAnzhiNovelMultifunctionMyShoucang(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		AnzhiMember am=this.getLoginMember(request);
		if(am==null||am.getId()==null){
			return "author_login";
		}
		String condition=this.getCondition(anzhinovelmultifunctionConditionArr, request, response);
		int loginid=this.getLoginMemberId(request);
		QueryList<AnzhiNovelMultifunction> list = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(size, pageNum, condition,1,loginid);
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovelMultifunction anm=list.getList().get(i);
			anm.setAnzhiBookmarkLs(anzhibookmarkService.findAnzhiBookmarkAll(5000, 1, " and member_id="+am.getId()+" and bookmark_type=0 and novel_id="+anm.getNovelId()).getList());
		}
		request.setAttribute("anzhinovelmultifunctionList", list);
		return this.getPageName(request, "index/line_cave_collection");
	}
	/*
	 * 查询我点赞的小说
	 */
	@RequestMapping(value="/anzhinovelmultifunction/findAnzhiNovelMultifunctionMydianbook",method=RequestMethod.POST)
	public String findAnzhiNovelMultifunctionMydianbook(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelmultifunctionConditionArr, request, response);
		int loginid=this.getLoginMemberId(request);
		QueryList<AnzhiNovelMultifunction> list = anzhinovelmultifunctionService.findAnzhiNovelMultifunctionAll(size, pageNum, condition,4,loginid);
		request.setAttribute("anzhinovelmultifunctionList", list);
		return this.getPageName(request, "index/my_comment_prise");
	}
	
	
}