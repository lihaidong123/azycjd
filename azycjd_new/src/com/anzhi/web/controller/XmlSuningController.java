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
public class XmlSuningController extends XmlController{
	private String xmlfileName="suning";
	
	/**
	 * azForsuning/azsuningNovelList.do  suning   作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/suning_novelList.do?pid=1010&&apikey=a26c0b18353d36731f2b174c21808c51
	 */
	@RequestMapping(value="/anzhisystem/suning_novelList")
	public void suning_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element Resource=this.addElement("Resource", null);
		for(int i=0;i<novelList.size();i++){
			Element Book=this.addElement("Book", null);
			Resource.add(Book);
			Book.add(this.addElement("bookId", novelList.get(i).getId(),false));
			Book.add(this.addElement("bookName", novelList.get(i).getNovelTitle(),false));
			Book.add(this.addElement("author", novelList.get(i).getAuthorWriterName(),false));
			Book.add(this.addElement("bookState", novelList.get(i).getAuthorizationLevel()==0?2:1,false));
			Book.add(this.addElement("description", novelList.get(i).getVote(),false));
			Book.add(this.addElement("coverUrl", "http://www.azycjd.com/"+novelList.get(i).getNovelImg(),false));
			
			Book.add(this.addElement("supplyId", "",false));
			Book.add(this.addElement("categ", "",false));
			Book.add(this.addElement("newCateg", "",false));
			
			Book.add(this.addElement("local", 1,false));
			Book.add(this.addElement("pricingMode", 1,false));
			
			Book.add(this.addElement("freeChapter", "",false));
			
			double d=getAnZhiBi(novelList.get(i).getTotalCharNum())/100;
			Book.add(this.addElement("paperPrice", d,false));
			
			Book.add(this.addElement("deadline", "",false));
			
			Book.add(this.addElement("authorSummary", novelList.get(i).getAuthorWriterName(),false));
			Book.add(this.addElement("mediaComment", "",false));
			Book.add(this.addElement("digitalSignature", "",false));
			
		}
		this.createXml(request, response, Resource);
	}
	/**
	 * azForsuning/azsuningNovelList.do  suning   作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/suning_novelByBookId.do?pid=1010&&apikey=a26c0b18353d36731f2b174c21808c51&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/suning_novelByBookId")
	public void suning_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element Resource=this.addElement("Resource", null);
			Element Book=this.addElement("Book", null);
			Resource.add(Book);
			if(novel!=null){
				Book.add(this.addElement("bookId", novel.getId(),false));
				Book.add(this.addElement("bookName", novel.getNovelTitle(),false));
				Book.add(this.addElement("author", novel.getAuthorWriterName(),false));
				Book.add(this.addElement("bookState", novel.getAuthorizationLevel()==0?2:1,false));
				Book.add(this.addElement("description", novel.getVote(),false));
				Book.add(this.addElement("coverUrl", "http://www.azycjd.com/"+novel.getNovelImg(),false));
				
				Book.add(this.addElement("supplyId", "",false));
				Book.add(this.addElement("categ", "",false));
				Book.add(this.addElement("newCateg", "",false));
				
				Book.add(this.addElement("local", 1,false));
				Book.add(this.addElement("pricingMode", 1,false));
				
				Book.add(this.addElement("freeChapter", "",false));
				
				double d=getAnZhiBi(novel.getTotalCharNum())/100;
				Book.add(this.addElement("paperPrice", d,false));
				
				Book.add(this.addElement("deadline", "",false));
				
				Book.add(this.addElement("authorSummary", novel.getAuthorWriterName(),false));
				Book.add(this.addElement("mediaComment", "",false));
				Book.add(this.addElement("digitalSignature", "",false));
			}
			this.createXml(request, response, Resource);
		}
	}
	
	/**
	 * azForsuning/azsuningNovelList.do  suning   作品章节列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/suning_chapterList.do?pid=1010&&apikey=a26c0b18353d36731f2b174c21808c51&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/suning_chapterList")
	public void suning_chapterList(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element Resource=this.addElement("Resource", null);
			
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element Book=this.addElement("Book", null);
						
						Book.add(this.addElement("bookId", this.getInt(request, "bookid"),false));
						Book.add(this.addElement("supplyId", "",false));
						Book.add(this.addElement("chapterNo", ac.getId(),false));
						Book.add(this.addElement("chapterName", ac.getChapterTitle(),false));
						Book.add(this.addElement("content", ac.getChapterContent()));
						Book.add(this.addElement("digitalSignature", "",false));
						Resource.add(Book);
					}
				}
			}
			this.createXml(request, response, Resource);
		}
	}
	
	/**
	 * azycjd/suning_chapterById  suning 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/suning_chapterById.do?pid=1010&&apikey=a26c0b18353d36731f2b174c21808c51&&bookid=17662&&chapterid=395973
	 */
	@RequestMapping(value="/anzhisystem/suning_chapterById")
	public void suning_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element Resource=this.addElement("Resource", null);
			Element Book=this.addElement("Book", null);
			Resource.add(Book);
			Book.add(this.addElement("bookId", this.getInt(request, "bookid"),false));
			Book.add(this.addElement("supplyId", "",false));
			QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
			int zhangjieshu=0;
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					zhangjieshu+=fen.getLs().size();
				}
			}
			Book.add(this.addElement("chapterNums",zhangjieshu,false));
			Book.add(this.addElement("digitalSignature", "",false));
			this.createXml(request, response, Resource);
		}
	}
	
	/**
	 * azycjd/suning_chapterById  suning 书籍封面信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/suning_BookImg.do?pid=1010&&apikey=a26c0b18353d36731f2b174c21808c51&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/suning_BookImg")
	public void suning_BookImg(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得章节
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));;
			Element Resource=this.addElement("Resource", null);
			Element Book=this.addElement("Book", null);
			Resource.add(Book);
			Book.add(this.addElement("bookId", this.getInt(request, "bookid"),false));
			Book.add(this.addElement("supplyId", "",false));
			Book.add(this.addElement("imgContent", "http://www.azycjd.com"+novel.getmNovelImg(),false));
			Book.add(this.addElement("digitalSignature", "",false));
			this.createXml(request, response, Resource);
		}
	}
}
