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
public class XmlAiShuKeController  extends XmlController{
	private String xmlfileName="anshuke";
	
	/**
	 * azForanshuke/azanshukeNovelList.do  anshuke 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/anshuke_novelList")
	public void anshuke_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element booklist=this.addElement("booklist", null);
		for(int i=0;i<novelList.size();i++){
			Element books=this.addElement("books", null);
			books.add(this.addElement("bookid", novelList.get(i).getId()));
			books.add(this.addElement("bookname", novelList.get(i).getNovelTitle()));
			booklist.add(books);
		}
		this.createXml(request, response, booklist);
	}
	
	/**
	 * azForanshuke/azanshukeNovelList.do  anshuke 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/anshuke_novelByBookId")
	public void anshuke_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element bookinfo=this.addElement("data", null);
			if(novel!=null){
				bookinfo.add(this.addElement("cname", this.novelTypeChange(novel.getNovelType(), xmlfileName)));
				bookinfo.add(this.addElement("bookname", novel.getNovelTitle()));
				bookinfo.add(this.addElement("bookid", novel.getId()));
				bookinfo.add(this.addElement("bookpic", "http://www.azycjd.com/"+novel.getNovelImg()));
				bookinfo.add(this.addElement("intro", novel.getVote()));
				bookinfo.add(this.addElement("authorname", novel.getAuthorWriterName()));
				bookinfo.add(this.addElement("createtime", novel.getAddTime()));
				bookinfo.add(this.addElement("allsize",novel.getTotalCharNum()));
				bookinfo.add(this.addElement("fullflag", novel.getState().equals(3)?1:0));
				bookinfo.add(this.addElement("sortid", 0));//没有类别id
			}
			this.createXml(request, response, bookinfo);
		}
	}
	
	/**
	 * azForanshuke/azanshukeNovelList.do  anshuke 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/anshuke_fenjuan")
	public void anshuke_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
				Element vol=this.addElement("vol", null);
				vol.add(this.addElement("volumename", fen.getJuanName()));
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chapter", null);
						chapter.add(this.addElement("order", (j+1)));
						chapter.add(this.addElement("url", "http://www.azycjd.com/anzhisystem/anshuke_chapterById.do?pid=1004&&apikey=fafe63cc1f54df9ddba7bf60e2d28ee7&&bookid"+this.getInt(request, "bookid")+"=&&chapterid="+ac.getId()));
						chapter.add(this.addElement("chaptername", ac.getChapterTitle()));
						chapter.add(this.addElement("chapterid", ac.getId()));
						vol.add(chapter);
					}
				}
				data.add(vol);
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
	@RequestMapping(value="/anzhisystem/anshuke_chapterById")
	public void anshuke_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
