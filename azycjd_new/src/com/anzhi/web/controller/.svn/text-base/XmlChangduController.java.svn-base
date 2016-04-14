package com.anzhi.web.controller;

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
public class XmlChangduController extends XmlController{
	private String xmlfileName="changdu";
	
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/changdu_noveltype")
	public void changdu_noveltype(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		Element result=this.addElement("result", null);
		result.addAttribute("language", "zh_CN");
		result.addAttribute("version", "1.1");
		Element status=this.addElement("status", null);
		status.add(this.addElement("code", 0));
		status.add(this.addElement("msg", "成功"));
		result.add(status);
		result.add(this.addElement("total", novelType.length,false));
		result.add(this.addElement("start", 0,false));
		result.add(this.addElement("count", novelType.length,false));
		Element data=this.addElement("data", null);
		for(int i=0;i<novelType.length;i++){
			Element category=this.addElement("category", null);
			category.add(this.addElement("cate_id", i+1));
			category.add(this.addElement("cate_name", novelType[i]));
			data.add(category);
		}
		result.add(data);
		this.createXml(request, response, result);
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/changdu_novelList")
	public void changdu_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element datas=this.addElement("datas", null);
		for(int i=0;i<novelList.size();i++){
			Element item=this.addElement("item", null);
			item.add(this.addElement("id", novelList.get(i).getId()));
			item.add(this.addElement("bookname", novelList.get(i).getNovelTitle()));
			datas.add(item);
		}
		this.createXml(request, response, datas);
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/changdu_novelByBookId")
	public void changdu_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			this.createXml(request, response,  xmlService.changdu_novelByBookId(request,xmlfileName));
		}
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/changdu_fenjuan")
	public void changdu_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
			int pageNum=this.getPageNum(request);
			String condition=" and novel_id="+this.getInt(request, "bookid");
			//获得分卷
			QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
			Element data=this.addElement("data", null);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				Element volume=this.addElement("vol", null);
				volume.add(this.addElement("volumename", fen.getJuanName()));
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapteritem=this.addElement("chapteritem", null);
						chapteritem.add(this.addElement("url", "http://www.azycjd.com/anzhisystem/changdu_chapterById.do?pid=1001&&apikey=0a9656068a2d5cc68474096db6adcc10&&bookid="+ac.getNovelId()));
						chapteritem.add(this.addElement("chaptername", ac.getChapterTitle()));
						chapteritem.add(this.addElement("chapterid", ac.getId()));
						chapteritem.add(this.addElement("license", ac.getReadType()));
						chapteritem.add(this.addElement("updatetime", ac.getLastUpdateTime()));
						volume.add(chapteritem);
					}
				}
				data.add(volume);
			}
			this.createXml(request, response, data);
		}
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/changdu_chapterById")
	public void changdu_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")&&this.checkParam(request, "chapterid")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
			int pageNum=this.getPageNum(request);
			String condition=" and id="+this.getInt(request, "chapterid");
			//获得分卷
			AnzhiChapter ac = getChapterById(condition);
			this.createXml(request, response, this.addElement("content", ac.getChapterContent()));
		}
	}
}
