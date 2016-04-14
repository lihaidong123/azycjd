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
public class XmlShuXiangController extends XmlController {
	private String xmlfileName="shuxiang";

	/**
	 * azForshuxiang/azshuxiangNovelList.do  shuxiang 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/shuxiang_novelList")
	public void shuxiang_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element books=this.addElement("books", null);
		for(int i=0;i<novelList.size();i++){
			Element book=this.addElement("book", null);
			book.add(this.addElement("id", novelList.get(i).getId()));
			book.add(this.addElement("booktitle", novelList.get(i).getNovelTitle()));
			books.add(book);
		}
		this.createXml(request, response, books);
	}
	
	/**
	 * azForshuxiang/azshuxiangNovelList.do  shuxiang 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/shuxiang_novelByBookId")
	public void shuxiang_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element book=this.addElement("book", null);
			if(novel!=null){
				book.add(this.addElement("id", novel.getId()));
				book.add(this.addElement("category", novel.getNovelType()));
				book.add(this.addElement("title", novel.getNovelTitle()));
				book.add(this.addElement("author", novel.getAuthorWriterName()));
				book.add(this.addElement("isFull", novel.getState().equals(3)?1:0));
				book.add(this.addElement("cover","http://www.azycjd.com/"+novel.getNovelImg()));
				book.add(this.addElement("summary", novel.getVote()));
			}
			this.createXml(request, response, book);
		}
	}
	
	/**
	 * azForshuxiang/azshuxiangNovelList.do  shuxiang 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/shuxiang_fenjuan")
	public void shuxiang_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element chapters=this.addElement("chapters", null);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chapter", null);
						chapter.add(this.addElement("id", ac.getId()));
						chapter.add(this.addElement("title", ac.getChapterTitle()));
						chapter.add(this.addElement("volume", fen.getJuanName()));
						chapters.add(chapter);
					}
				}
			}
			this.createXml(request, response, chapters);
		}
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/shuxiang_chapterById")
	public void shuxiang_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
