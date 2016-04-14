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
import com.anzhi.web.pojo.AnzhiNovelLabel;
import com.anzhi.web.service.IAnzhiNovelLabelService;
import java.util.Date;
@Controller
public class AnzhiNovelLabelController extends GetCondition {
	@Autowired
	private IAnzhiNovelLabelService anzhinovellabelService;
	@RequestMapping(value="/anzhinovellabel/addAnzhiNovelLabel")
	public void addAnzhiNovelLabel(HttpServletRequest request,HttpServletResponse response,AnzhiNovelLabel anzhinovellabel){
		if(request.getSession().getAttribute("addAnzhiNovelLabelSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelLabelSession","true");
				anzhinovellabel.setAddTime(this.getTimestamp());
				if(anzhinovellabel.getId()==null||anzhinovellabel.getId()==0){
					anzhinovellabelService.addAnzhiNovelLabel(anzhinovellabel);
				}else{
					anzhinovellabelService.updateAnzhiNovelLabel(anzhinovellabel);
				}
				response.sendRedirect(request.getContextPath()+"/anzhinovellabel/findAnzhiNovelLabelAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelLabelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovellabel/addBatchAnzhiNovelLabel")
	public String addBatchAnzhiNovelLabel(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelLabel> list=new ArrayList<AnzhiNovelLabel>();
		anzhinovellabelService.addBatchAnzhiNovelLabel(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovellabel/delAnzhiNovelLabel")
	public void delAnzhiNovelLabel(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelLabelSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelLabelSession","true");
				int id=request.getParameter("anzhinovellabelId")==null?0:Integer.parseInt(request.getParameter("anzhinovellabelId"));
				anzhinovellabelService.delAnzhiNovelLabel(id);
				response.sendRedirect(request.getContextPath()+"/anzhinovellabel/findAnzhiNovelLabelAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelLabelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovellabel/delBatchAnzhiNovelLabel")
	public String delBatchAnzhiNovelLabel(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovellabelIds");
		anzhinovellabelService.delBatchAnzhiNovelLabel(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovellabel/updateAnzhiNovelLabel")
	public String updateAnzhiNovelLabel(HttpServletRequest request,HttpServletResponse response,AnzhiNovelLabel anzhinovellabel){
		if(request.getSession().getAttribute("updateAnzhiNovelLabelSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelLabelSession","true");
				anzhinovellabelService.updateAnzhiNovelLabel(anzhinovellabel);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelLabelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovellabel/findAnzhiNovelLabelAll")
	public String findAnzhiNovelLabelAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovellabelConditionArr, request, response);
		QueryList<AnzhiNovelLabel> list = anzhinovellabelService.findAnzhiNovelLabelAll(size, pageNum, condition);
		request.setAttribute("anzhinovellabelList", list);
		return this.getPageName(request, "admin/AnzhiNovelLabelManager");
	}

	@RequestMapping(value="/anzhinovellabel/findAnzhiNovelLabelById")
	public String findAnzhiNovelLabelById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelLabel> list = anzhinovellabelService.findAnzhiNovelLabelAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinovellabelId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		QueryList<AnzhiNovelLabel> listss = anzhinovellabelService.findAnzhiNovelLabelAll(10000, 1, " and father_id=0");
		request.setAttribute("anzhinovellabelList", listss);
		return this.getPageName(request, "admin/AnzhiNovelLabelAction");
	}

	@RequestMapping(value="/anzhinovellabel/anzhinovellabelAction")
	public String anzhinovellabelAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelLabelAction");
	}
	
	@RequestMapping(value="/anzhinovellabel/anzhinovellabelfindAction")
	public String anzhinovellabelfindAction(HttpServletRequest request,HttpServletResponse response){
		String condition=this.getCondition(anzhinovellabelConditionArr, request, response);
		QueryList<AnzhiNovelLabel> list = anzhinovellabelService.findAnzhiNovelLabelAll(10000, 1, " and father_id=0");
		request.setAttribute("anzhinovellabelList", list);
		return this.getPageName(request, "admin/AnzhiNovelLabelAction");
	}


}