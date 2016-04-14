package com.anzhi.web.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ynzc.wuyuehu.ExcelExport;

import com.anzhi.web.pojo.AnzhiBenefit;
import com.anzhi.web.service.IAnzhiBenefitService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiBenefitController extends GetCondition {
	@Autowired
	private IAnzhiBenefitService anzhibenefitService;
	@RequestMapping(value="/anzhibenefit/addAnzhiBenefit",method=RequestMethod.POST)
	public void addAnzhiBenefit(HttpServletRequest request,HttpServletResponse response,AnzhiBenefit anzhibenefit){
		if(request.getSession().getAttribute("addAnzhiBenefitSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiBenefitSession","true");
				anzhibenefit.setAddTime(this.getTimestamp());
				if(anzhibenefit.getId()==null||anzhibenefit.getId()==0){
					anzhibenefitService.addAnzhiBenefit(anzhibenefit);
				}else{
					anzhibenefitService.updateAnzhiBenefit(anzhibenefit);
				}
				response.sendRedirect(request.getContextPath()+"/anzhibenefit/findAnzhiBenefitAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiBenefitSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibenefit/addBatchAnzhiBenefit",method=RequestMethod.POST)
	public String addBatchAnzhiBenefit(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiBenefit> list=new ArrayList<AnzhiBenefit>();
		anzhibenefitService.addBatchAnzhiBenefit(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibenefit/delAnzhiBenefit",method=RequestMethod.POST)
	public void delAnzhiBenefit(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiBenefitSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiBenefitSession","true");
				int id=request.getParameter("anzhibenefitId")==null?0:Integer.parseInt(request.getParameter("anzhibenefitId"));
				anzhibenefitService.delAnzhiBenefit(id);
				response.sendRedirect(request.getContextPath()+"/anzhibenefit/findAnzhiBenefitAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiBenefitSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhibenefit/delBatchAnzhiBenefit",method=RequestMethod.POST)
	public String delBatchAnzhiBenefit(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhibenefitIds");
		anzhibenefitService.delBatchAnzhiBenefit(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibenefit/updateAnzhiBenefit",method=RequestMethod.POST)
	public String updateAnzhiBenefit(HttpServletRequest request,HttpServletResponse response,AnzhiBenefit anzhibenefit){
		if(request.getSession().getAttribute("updateAnzhiBenefitSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiBenefitSession","true");
				anzhibenefitService.updateAnzhiBenefit(anzhibenefit);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiBenefitSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhibenefit/findAnzhiBenefitAll")
	public String findAnzhiBenefitAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhibenefitConditionArr, request, response);
		QueryList<AnzhiBenefit> list = anzhibenefitService.findAnzhiBenefitAll(size, pageNum, condition);
		request.setAttribute("anzhibenefitList", list);
		request.setAttribute("benefitTypeTypeData",benefitTypeTypeData);
		return this.getPageName(request, "admin/AnzhiBenefitManager");
	}

	@RequestMapping(value="/anzhibenefit/findAnzhiBenefitById",method=RequestMethod.POST)
	public String findAnzhiBenefitById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiBenefit> list = anzhibenefitService.findAnzhiBenefitAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhibenefitId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		request.setAttribute("benefitTypeTypeData",benefitTypeTypeData);
		return this.getPageName(request, "admin/AnzhiBenefitAction");
	}

	@RequestMapping(value="/anzhibenefit/anzhibenefitAction",method=RequestMethod.POST)
	public String anzhibenefitAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiBenefitAction");
	}

	@RequestMapping(value="/anzhibenefit/applyAnzhiBenefit")
	public void applyAnzhiBenefit(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("addAnzhiBenefitSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiBenefitSession","true");
				AnzhiBenefit anzhibenefit=new AnzhiBenefit();
				String a=request.getParameter("applReason");
				String b=request.getParameter("benefitType");
				String c=request.getParameter("novelId");
				anzhibenefit.setApplyReason(a);
				anzhibenefit.setBenefitType(b);
				anzhibenefit.setNovelId(Integer.parseInt(c));
				anzhibenefit.setAddTime(this.getTimestamp());
				anzhibenefit.setBenefitState(0);
				anzhibenefit.setVote("");
				if(anzhibenefit.getId()==null||anzhibenefit.getId()==0){
					anzhibenefitService.addAnzhiBenefit(anzhibenefit);
				}else{
					anzhibenefitService.updateAnzhiBenefit(anzhibenefit);
				}
				response.sendRedirect(request.getContextPath()+"/anzhibenefit/findAnzhiBenefitAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiBenefitSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhibenefit/downExcel")
	public void downExcel(HttpServletRequest request,HttpServletResponse response) throws IOException{	
		response.setContentType("text/html;charset=utf-8");
		if(request.getSession().getAttribute("loginUsers")!=null){
			String condition="";
			QueryList<AnzhiBenefit> list = anzhibenefitService.findAnzhiBenefitAll(100000, 1, null);
			ynzc.wuyuehu.ExcelExport ee=new ExcelExport();
			File fff=ee.exportExcel("福利申请明细", list.getList(), AnzhiBenefit.class,"");
			
			FileInputStream fins=new FileInputStream(fff);
	        OutputStream outputs=response.getOutputStream();
	        byte[] bufs=new byte[fins.available()];
	        int rs=0;
			FileInputStream fss = null;
			try {
				fss = new FileInputStream(new File(fff.toString()));
			}catch(FileNotFoundException e) {
				e.printStackTrace();
			}

			String filename=fff.getName();
			//设置响应头和保存文件名 
			
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") >0){
				filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
			}else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") >0){
				filename = URLEncoder.encode(filename, "UTF-8");//IE浏览器
			}
			response.reset();//
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
			response.setHeader("Connection", "close");
			
			//写出流信息
			int bs = 0;
			try {
				while((rs=fins.read(bufs,0,bufs.length))!=-1)
		        {
		            outputs.write(bufs,0,rs);//response.getOutputStream()
		        }
		        fins.close();
		        outputs.close();
		       
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("下载文件失败!");
			}
		}
	}
}