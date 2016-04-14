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
public class XmlUcController extends XmlController{
	private String xmlfileName="uc";
	/**
	 * azForUc/azUcNovelList.do  UC 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/uc_novelList")
	public void uc_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			booklist.add(this.addElement("bookid", novelList.get(i).getId()));
		}
		this.createXml(request, response, booklist);
	}
	
	/**
	 * azForUc/azUcNovelList.do  UC 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/uc_novelByBookId")
	public void uc_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element bookinfo=this.addElement("bookinfo", null);
			if(novel!=null){
				bookinfo.add(this.addElement("bookid", novel.getId()));
				bookinfo.add(this.addElement("bookname", novel.getNovelTitle()));
				bookinfo.add(this.addElement("authorname", novel.getAuthorWriterName()));
				bookinfo.add(this.addElement("intro", novel.getVote()));
				bookinfo.add(this.addElement("genre", novelTypeChange(novel.getNovelType(),xmlfileName)));
				bookinfo.add(this.addElement("bookstatus", novel.getState().equals(3)?1:0));
				bookinfo.add(this.addElement("keywords", novel.getNovelLabel()));
				bookinfo.add(this.addElement("coverpath","http://www.azycjd.com/"+novel.getNovelImg()));
			}
			this.createXml(request, response, bookinfo);
		}
	}
	
	/**
	 * azForUc/azUcNovelList.do  UC 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/uc_fenjuan")
	public void uc_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element chapterinfo=this.addElement("chapterinfo", null);
			chapterinfo.add(this.addElement("bookid", this.getInt(request, "bookid")));
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				Element volume=this.addElement("volume", null);
				volume.add(this.addElement("volumeid", fen.getId()));
				volume.add(this.addElement("volname", fen.getJuanName()));
				Element chapters=this.addElement("chapters", null);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chapter", null);
						chapter.add(this.addElement("chapterid", ac.getId()));
						chapter.add(this.addElement("chaptername", ac.getChapterTitle()));
						chapters.add(chapter);
					}
				}
				volume.add(chapters);
				chapterinfo.add(volume);
			}
			this.createXml(request, response, chapterinfo);
		}
	}
	
	/**
	 * azycjd/changdu_chapterById  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/uc_chapterById")
	public void uc_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element contentinfo=this.addElement("contentinfo", null);
			contentinfo.add(this.addElement("bookid", this.getInt(request, "bookid")));
			contentinfo.add(this.addElement("chapterid", this.getInt(request, "chapterid")));
			contentinfo.add(this.addElement("content", ac.getChapterContent()));
			this.createXml(request, response, contentinfo);
		}
	}
}
