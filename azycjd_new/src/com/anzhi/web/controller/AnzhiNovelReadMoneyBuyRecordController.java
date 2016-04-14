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
import com.anzhi.web.pojo.AnzhiNovelReadMoneyBuyRecord;
import com.anzhi.web.service.IAnzhiNovelReadMoneyBuyRecordService;
import java.util.Date;
@Controller
public class AnzhiNovelReadMoneyBuyRecordController extends GetCondition {
	@Autowired
	private IAnzhiNovelReadMoneyBuyRecordService anzhinovelreadmoneybuyrecordService;
	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/addAnzhiNovelReadMoneyBuyRecord")
	public void addAnzhiNovelReadMoneyBuyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		if(request.getSession().getAttribute("addAnzhiNovelReadMoneyBuyRecordSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelReadMoneyBuyRecordSession","true");
				if(anzhinovelreadmoneybuyrecord.getId()==null||anzhinovelreadmoneybuyrecord.getId()==0){
					anzhinovelreadmoneybuyrecordService.addAnzhiNovelReadMoneyBuyRecord(anzhinovelreadmoneybuyrecord);
				}else{
					anzhinovelreadmoneybuyrecordService.updateAnzhiNovelReadMoneyBuyRecord(anzhinovelreadmoneybuyrecord);
				}
				response.sendRedirect(request.getContextPath()+"/anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelReadMoneyBuyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/addBatchAnzhiNovelReadMoneyBuyRecord")
	public String addBatchAnzhiNovelReadMoneyBuyRecord(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovelReadMoneyBuyRecord> list=new ArrayList<AnzhiNovelReadMoneyBuyRecord>();
		anzhinovelreadmoneybuyrecordService.addBatchAnzhiNovelReadMoneyBuyRecord(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/delAnzhiNovelReadMoneyBuyRecord")
	public void delAnzhiNovelReadMoneyBuyRecord(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelReadMoneyBuyRecordSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelReadMoneyBuyRecordSession","true");
				int id=request.getParameter("anzhinovelreadmoneybuyrecordId")==null?0:Integer.parseInt(request.getParameter("anzhinovelreadmoneybuyrecordId"));
				anzhinovelreadmoneybuyrecordService.delAnzhiNovelReadMoneyBuyRecord(id);
				response.sendRedirect(request.getContextPath()+"/anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelReadMoneyBuyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/delBatchAnzhiNovelReadMoneyBuyRecord")
	public String delBatchAnzhiNovelReadMoneyBuyRecord(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovelreadmoneybuyrecordIds");
		anzhinovelreadmoneybuyrecordService.delBatchAnzhiNovelReadMoneyBuyRecord(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/updateAnzhiNovelReadMoneyBuyRecord")
	public String updateAnzhiNovelReadMoneyBuyRecord(HttpServletRequest request,HttpServletResponse response,AnzhiNovelReadMoneyBuyRecord anzhinovelreadmoneybuyrecord){
		if(request.getSession().getAttribute("updateAnzhiNovelReadMoneyBuyRecordSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelReadMoneyBuyRecordSession","true");
				anzhinovelreadmoneybuyrecordService.updateAnzhiNovelReadMoneyBuyRecord(anzhinovelreadmoneybuyrecord);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelReadMoneyBuyRecordSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll")
	public String findAnzhiNovelReadMoneyBuyRecordAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelreadmoneybuyrecordConditionArr, request, response);
		QueryList<AnzhiNovelReadMoneyBuyRecord> list = anzhinovelreadmoneybuyrecordService.findAnzhiNovelReadMoneyBuyRecordAll(size, pageNum, condition);
		request.setAttribute("anzhinovelreadmoneybuyrecordList", list);
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyBuyRecordManager");
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordById")
	public String findAnzhiNovelReadMoneyBuyRecordById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovelReadMoneyBuyRecord> list = anzhinovelreadmoneybuyrecordService.findAnzhiNovelReadMoneyBuyRecordAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhinovelreadmoneybuyrecordId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyBuyRecordAction");
	}

	@RequestMapping(value="/anzhinovelreadmoneybuyrecord/anzhinovelreadmoneybuyrecordAction")
	public String anzhinovelreadmoneybuyrecordAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelReadMoneyBuyRecordAction");
	}


}