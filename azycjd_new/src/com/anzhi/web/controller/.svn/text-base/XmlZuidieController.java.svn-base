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
public class XmlZuidieController extends XmlController{
	private String xmlfileName="zuidie";
	
	/**
	 * azForzuidie/azzuidieNovelList.do  zuidie   作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zuidie_novelList.do?pid=1015&&apikey=bc750a81e53cc9c1c88a992a95e53c2d
	 */
	@RequestMapping(value="/anzhisystem/zuidie_novelList")
	public void zuidie_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element document=this.addElement("document", null);
		document.add(this.addElement("webName", "安之原创基地"));
		document.add(this.addElement("pubDate", this.getNow()));
		Element books=this.addElement("books", null);
		document.add(books);
		for(int i=0;i<novelList.size();i++){
			Element book=this.addElement("book", null);
			books.add(book);
			book.add(this.addElement("id", novelList.get(i).getId()));
			book.add(this.addElement("name", novelList.get(i).getNovelTitle()));
		}
		this.createXml(request, response, document);
	}
	/**
	 * azForzuidie/azzuidieNovelList.do  zuidie   作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zuidie_novelByBookId.do?pid=1015&&apikey=bc750a81e53cc9c1c88a992a95e53c2d&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/zuidie_novelByBookId")
	public void zuidie_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
				book.add(this.addElement("name", novel.getNovelTitle()));
				book.add(this.addElement("class", novelTypeChange(novel.getNovelType(),xmlfileName)));
				book.add(this.addElement("author", novel.getAuthorWriterName()));
				book.add(this.addElement("bookintr", novel.getVote()));
				book.add(this.addElement("smallimg", "http://www.azycjd.com"+novel.getmNovelImg()));
				book.add(this.addElement("bigimg", "http://www.azycjd.com"+novel.getmNovelImg()));
				book.add(this.addElement("words", novel.getTotalCharNum()));
				book.add(this.addElement("tag", novel.getNovelLabel()));
				book.add(this.addElement("free", this.novelFree(novel.getId())==0?1:0));
				book.add(this.addElement("status", novel.getState().equals(3)?2:1));
				book.add(this.addElement("updatetime", novel.getUpdateTime()));
			}
			this.createXml(request, response, book);
		}
	}
	
	/**
	 * azForzuidie/azzuidieNovelList.do  zuidie   作品章节列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zuidie_chapterList.do?pid=1015&&apikey=bc750a81e53cc9c1c88a992a95e53c2d&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/zuidie_chapterList")
	public void zuidie_chapterList(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element chaplist=this.addElement("chaplist", null);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				Element volume=this.addElement("volume", null);
				chaplist.add(volume);
				volume.add(this.addElement("volumeid", fen.getId()));
				volume.add(this.addElement("volumename", fen.getJuanName()));
				Element chapters=this.addElement("chapters", null);
				volume.add(chapters);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chap=this.addElement("chap", null);
						chap.add(this.addElement("id", ac.getId()));
						chap.add(this.addElement("title", ac.getChapterTitle()));
						chap.add(this.addElement("updatetime", ac.getLastUpdateTime()));
						chap.add(this.addElement("words", ac.getChapterCharNum()));
						chap.add(this.addElement("priceunit", 4));
						double d=getAnZhiBi(ac.getChapterCharNum())/100;
						chap.add(this.addElement("price", d));
						chap.add(this.addElement("vip", ac.getReadType()));
						chapters.add(chap);
					}
				}
			}
			this.createXml(request, response, chaplist);
		}
	}
	
	/**
	 * azycjd/zuidie_chapterById  zuidie 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/zuidie_chapterById.do?pid=1015&&apikey=bc750a81e53cc9c1c88a992a95e53c2d&&bookid=17662&&chapterid=395973
	 */
	@RequestMapping(value="/anzhisystem/zuidie_chapterById")
	public void zuidie_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element chapter=this.addElement("chapter", null);
			chapter.add(this.addElement("id", this.getInt(request, "chapterid")));
			chapter.add(this.addElement("content", ac.getChapterContent()));
			this.createXml(request, response, chapter);
		}
	}
}
