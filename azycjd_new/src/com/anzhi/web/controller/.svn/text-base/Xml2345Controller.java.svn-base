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
public class Xml2345Controller extends XmlController{
private String xmlfileName="ersansiwu";

	/**
	 * azForersansiwu/azersansiwuNovelList.do  ersansiwu 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/ersansiwu_novelList")
	public void ersansiwu_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		this.createXml(request, response, xmlService.ersansiwu_novelList(request));
	}
	
	/**
	 * azForersansiwu/azersansiwuNovelList.do  ersansiwu 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/ersansiwu_fenjuan")
	public void ersansiwu_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "book_id")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
			int pageNum=this.getPageNum(request);
			String condition=" and novel_id="+this.getInt(request, "book_id");
			//获得分卷
			QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
			Element novel=this.addElement("novel", null);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				Element volume=this.addElement("volume", null);
				volume.addAttribute("name", fen.getJuanName());
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chapter", null);
						chapter.add(this.addElement("chapter_id", ac.getId(),false));
						chapter.add(this.addElement("isvip", ac.getReadType(),false));
						chapter.add(this.addElement("chapter_date", getShiJianCuo(ac.getLastUpdateTime()),false));
						chapter.add(this.addElement("chapter_title", ac.getChapterTitle()));
						chapter.add(this.addElement("chapter_url", "http://www.azycjd.com/anzhichapter/read.do?chapterId="+ac.getId(),false));
						chapter.add(this.addElement("m_chapter_url", "http://www.azycjd.com/mobile/readChapter.do?chapterId="+ac.getId()+"&&novelId="+this.getInt(request, "book_id"),false));
						chapter.add(this.addElement("words", ac.getChapterCharNum(),false));
						chapter.add(this.addElement("priceunit", 4,false));
						chapter.add(this.addElement("price", getAnZhiBi(ac.getChapterCharNum()),false));
						volume.add(chapter);
					}
				}
				novel.add(volume);
			}
			this.createXml(request, response, novel);
		}
	}
	
	
	/**
	 * azForchangdu/azchangduNovelList.do  章节 内容 接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/ersansiwu_chapterList")
	public void ersansiwu_chapterList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "book_id")&&this.checkParam(request, "chapter_id")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
			int pageNum=this.getPageNum(request);
			String condition=" and id="+this.getInt(request, "chapterid");
			//获得分卷
			Element chapterlist=this.addElement("chapterlist", null);
			QueryList<AnzhiChapter> ls=null;
			if(this.checkParam(request, "limit")){
				size=this.getInt(request, "limit");
				ls=this.getChapterList(" and novel_id="+this.getInt(request, "book_id"), size, pageNum);
			}else{
				ls=this.getChapterList(" and id="+this.getInt(request, "chapter_id"), size, pageNum);
			}
			if(ls.getList()!=null){
				for(int i=0;i<ls.getList().size();i++){
					AnzhiChapter ac=ls.getList().get(i);
					Element chapter=this.addElement("chapter", null);
					chapter.add(this.addElement("book_id", ac.getNovelId()));
					chapter.add(this.addElement("chapter_id", ac.getId()));
					chapter.add(this.addElement("content", ac.getChapterContent()));
					chapterlist.add(chapter);
				}
			}
			this.createXml(request, response, chapterlist);
		}
	}
}
