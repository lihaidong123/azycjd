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
public class XmlZhangyueController extends XmlController{
	private String xmlfileName="zhangyue";
	
	/**
	 * azForZhangyue/azZhangyueNovelList.do  掌阅   作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zhangyue_novelList.do?pid=1009&&apikey=6d63e63cca7821956432e684453529c5
	 */
	@RequestMapping(value="/anzhisystem/zhangyue_novelList")
	public void zhangyue_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element booklist=this.addElement("booklist", null);
		Element books=this.addElement("books", null);
		booklist.add(books);
		for(int i=0;i<novelList.size();i++){
			Element book=this.addElement("book", null);
			books.add(book);
			book.add(this.addElement("bookid", novelList.get(i).getId(),false));
		}
		this.createXml(request, response, booklist);
	}
	/**
	 * azForZhangyue/azZhangyueNovelList.do  掌阅   作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zhangyue_novelByBookId.do?pid=1009&&apikey=6d63e63cca7821956432e684453529c5&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/zhangyue_novelByBookId")
	public void zhangyue_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element book=this.addElement("book", null);
			Element bookinfo=this.addElement("bookinfo", null);
			book.add(bookinfo);
			if(novel!=null){
				bookinfo.add(this.addElement("BookName", novel.getNovelTitle(),false));
				bookinfo.add(this.addElement("BookCpid", novel.getId(),false));
				bookinfo.add(this.addElement("BookAuthor", novel.getAuthorWriterName(),false));
				bookinfo.add(this.addElement("BookCategory", novelTypeChange(novel.getNovelType(),xmlfileName),false));
				bookinfo.add(this.addElement("BookfinishState", novel.getState().equals(3)?1:0,false));
				bookinfo.add(this.addElement("BookisVip", this.novelFree(novel.getId()),false));
				bookinfo.add(this.addElement("BookDescription", novel.getVote(),false));
				bookinfo.add(this.addElement("BookCreatetime", novel.getAddTime(),false));
				bookinfo.add(this.addElement("BookWordsCount", novel.getTotalCharNum(),false));
				bookinfo.add(this.addElement("BookKey", novel.getCategories(),false));
				Element chapters=this.addElement("chapters", null);
				bookinfo.add(chapters);
				int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
				int pageNum=this.getPageNum(request);
				String condition=" and novel_id="+this.getInt(request, "bookid");
				QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
				for(int i=0;i<list.getList().size();i++){
					AnzhiFenJuan fen=list.getList().get(i);
					if(fen.getLs()!=null){
						for(int j=0;j<fen.getLs().size();j++){
							AnzhiChapter ac=fen.getLs().get(j);
							Element chapter=this.addElement("chapter", null);
							chapter.add(this.addElement("chapterid", ac.getId(),false));
							chapters.add(chapter);
						}
					}
				}
			}
			this.createXml(request, response, book);
		}
	}
	
	/**
	 * azycjd/zhangdu_chapterById  zhangdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zhangdu_chapterById.do?pid=1009&&apikey=6d63e63cca7821956432e684453529c5&&bookid=17662&&chapterid=395973
	 */
	@RequestMapping(value="/anzhisystem/zhangdu_chapterById")
	public void zhangdu_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")&&this.checkParam(request, "chapterid")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
			int pageNum=this.getPageNum(request);
			String condition=" and id="+this.getInt(request, "chapterid");
			//获得章节
			AnzhiChapter ac = getChapterById(condition);
			Element contentinfo=this.addElement("chapterinfo", null);
			Element chapter=this.addElement("chapter", null);
			contentinfo.add(chapter);
			chapter.add(this.addElement("BookChapterName", ac.getChapterTitle(),false));
			chapter.add(this.addElement("BookChapterid", this.getInt(request, "chapterid"),false));
			chapter.add(this.addElement("BookChapterisVip", ac.getReadType(),false));
			chapter.add(this.addElement("BookChapterTxt", ac.getChapterContent(),false));
			double d=getAnZhiBi(ac.getChapterCharNum())/100;
			chapter.add(this.addElement("BookChapterPrice", d,false));
			chapter.add(this.addElement("BookChapterDate", ac.getAddTime(),false));	
			this.createXml(request, response, contentinfo);
		}
	}
}
