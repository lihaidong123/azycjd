package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiCooperation;
import com.anzhi.web.pojo.AnzhiOtherContent;
import com.anzhi.web.pojo.AnzhiPicture;
import com.anzhi.web.service.IAnzhiCooperationService;
import com.anzhi.web.service.IAnzhiOtherContentService;
import com.anzhi.web.service.IAnzhiPictureService;
import java.util.Date;
@Controller
public class AnzhiPictureController extends GetCondition {
	@Autowired
	private IAnzhiPictureService anzhipictureService;
	@Autowired
	private IAnzhiOtherContentService anzhiothercontentService;
	@Autowired
	private IAnzhiCooperationService anzhicooperationService;
	@RequestMapping(value="/anzhipicture/addAnzhiPicture")
	public void addAnzhiPicture(HttpServletRequest request,HttpServletResponse response,AnzhiPicture anzhipicture){
		if(request.getSession().getAttribute("addAnzhiPictureSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiPictureSession","true");
				anzhipicture.setAddTime(getTimestamp());
				if(anzhipicture.getId()==null||anzhipicture.getId()==0){
					anzhipictureService.addAnzhiPicture(anzhipicture);
				}else{
					anzhipictureService.updateAnzhiPicture(anzhipicture);
				}
				response.sendRedirect(request.getContextPath()+"/anzhipicture/findAnzhiPictureAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiPictureSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhipicture/addBatchAnzhiPicture")
	public String addBatchAnzhiPicture(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiPicture> list=new ArrayList<AnzhiPicture>();
		anzhipictureService.addBatchAnzhiPicture(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhipicture/delAnzhiPicture")
	public void delAnzhiPicture(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiPictureSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiPictureSession","true");
				int id=request.getParameter("anzhipictureId")==null?0:Integer.parseInt(request.getParameter("anzhipictureId"));
				anzhipictureService.delAnzhiPicture(id);
				response.sendRedirect(request.getContextPath()+"/anzhipicture/findAnzhiPictureAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiPictureSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhipicture/delBatchAnzhiPicture")
	public String delBatchAnzhiPicture(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhipictureIds");
		anzhipictureService.delBatchAnzhiPicture(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhipicture/updateAnzhiPicture")
	public String updateAnzhiPicture(HttpServletRequest request,HttpServletResponse response,AnzhiPicture anzhipicture){
		if(request.getSession().getAttribute("updateAnzhiPictureSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiPictureSession","true");
				anzhipictureService.updateAnzhiPicture(anzhipicture);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiPictureSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhipicture/findAnzhiPictureAll")
	public String findAnzhiPictureAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhipictureConditionArr, request, response);
		QueryList<AnzhiPicture> list = anzhipictureService.findAnzhiPictureAll(size, pageNum, condition);
		request.setAttribute("anzhipictureList", list);
		request.setAttribute("pictureType", pictureType);
		return this.getPageName(request, "admin/AnzhiPictureManager");
	}

	@RequestMapping(value="/anzhipicture/findAnzhiPictureById")
	public String findAnzhiPictureById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiPicture> list = anzhipictureService.findAnzhiPictureAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhipictureId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		request.getSession().setAttribute("pictureAction", "pictureAction");
		return this.getPageName(request, "admin/index");
	}

	@RequestMapping(value="/anzhipicture/anzhipictureAction")
	public String anzhipictureAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiPictureAction");
	}

	@RequestMapping(value="/anzhipicture/loadPicture")
	public void loadPicture(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		request.getSession().setAttribute("contentPath", request.getContextPath());
		if(request.getSession().getAttribute("isLoadPicData")==null){
			QueryList<AnzhiPicture> list = anzhipictureService.findAnzhiPictureAll(500, 1, " and state=1");
			String[] pictureTypeSesion=new String[]{"sessionShouyetoubu","sessionPaihangbang","sessionZuojiafuli","sessionDashentuijian","sessionHezuoqudaotoubu","sessionBianjizhuanqutoubu","sessionBanquanweihutoubu","sessionHuodongzhuanqu","sessionYonghuzhinantoubu","sessionZuozhetougaotoubu","sessionChenpinyingcaitoubu","sessionLianxiwomentoubu","sessionGonggao","sessionZaixianchongzhi","sessionZuojiafulitoubu"};
			for(AnzhiPicture ap:list.getList()){
				request.getSession().setAttribute(pictureTypeSesion[ap.getPictureType()], ap.getPictureUrl());
			}
			request.getSession().setAttribute("isLoadPicData","yes");
			QueryList<AnzhiOtherContent> ot=anzhiothercontentService.findAnzhiOtherContentAll(1, 1, null);
			if(ot.getList().size()!=0){
				request.getSession().setAttribute("otherContent",ot.getList().get(0));
			}
			response.getWriter().write("yes");
		}else{
			response.getWriter().write("no");
		}
		
	}
}