package com.anzhi.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.util.QueryList;
@Controller
public class XmlAiYueDuController  extends XmlController{
private String xmlfileName="aiyuedu";
	
	
	/**
	 * azForaiyuedu/azaiyueduNovelList.do  aiyuedu 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/aiyuedu_novelList")
	public void aiyuedu_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element Products=this.addElement("Products", null);
		for(int i=0;i<novelList.size();i++){
			Element Product=this.addElement("Product", null);
			Product.add(this.addElement("ProductID", novelList.get(i).getId()));
			Products.add(Product);
		}
		this.createXml(request, response, Products);
	}
	
	/**
	 * azForaiyuedu/azaiyueduNovelList.do  aiyuedu 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/aiyuedu_novelByBookId")
	public void aiyuedu_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "ProductID")){
			//获得一部小说
			this.createXml(request, response, xmlService.aiyuedu_novelByBookId(request));
		}
	}
	
	/**
	 * azForaiyuedu/azaiyueduNovelList.do  aiyuedu 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/aiyuedu_fenjuan")
	public void aiyuedu_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "ProductID")){
			this.createXml(request, response, xmlService.aiyuedu_fenjuan(request));
		}
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/aiyuedu_chapterById")
	public void aiyuedu_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "ProductID")&&this.checkParam(request, "ChapterID")){
			this.createXml(request, response, xmlService.aiyuedu_chapterById(request));
		}
	}
}
