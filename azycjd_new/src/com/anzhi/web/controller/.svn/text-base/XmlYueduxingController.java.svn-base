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
public class XmlYueduxingController extends XmlController{
	private String xmlfileName="yueduxing";
	
	/**
	 * azForyueduxing/azyueduxingNovelList.do  yueduxing   作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/yueduxing_novelList.do?pid=1014&&apikey=c449b6e93152d7eb701ab9ead67801fe
	 */
	@RequestMapping(value="/anzhisystem/yueduxing_novelList")
	public void yueduxing_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element result=this.addElement("result", null);
		result.addAttribute("language", "zh_CN");
		result.addAttribute("version", "1.1");
		for(int i=0;i<novelList.size();i++){
			Element item=this.addElement("item", null);
			result.add(item);
			item.add(this.addElement("id", novelList.get(i).getId()));
			item.add(this.addElement("bookname", novelList.get(i).getNovelTitle()));
		}
		this.createXml(request, response, result);
	}
	/**
	 * azForyueduxing/azyueduxingNovelList.do  yueduxing   作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/yueduxing_novelByBookId.do?pid=1014&&apikey=c449b6e93152d7eb701ab9ead67801fe&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/yueduxing_novelByBookId")
	public void yueduxing_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element result=this.addElement("result", null);
			result.addAttribute("language", "zh_CN");
			result.addAttribute("version", "1.1");
			if(novel!=null){
				result.add(this.addElement("bookname", novel.getNovelTitle()));
				result.add(this.addElement("bookid", novel.getId()));
				result.add(this.addElement("category", novelTypeChange(novel.getNovelType(),xmlfileName)));
				result.add(this.addElement("author", novel.getAuthorWriterName()));
				result.add(this.addElement("smallcover", "http://www.azycjd.com"+novel.getmNovelImg()));
				result.add(this.addElement("bigcover", "http://www.azycjd.com"+novel.getmNovelImg()));
				result.add(this.addElement("webcover", "http://www.azycjd.com"+novel.getmNovelImg()));
				result.add(this.addElement("desc", novel.getVote()));
				result.add(this.addElement("status", novel.getState().equals(3)?1:0));
				
				String condition=" and novel_id="+this.getInt(request, "bookid");
				int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
				int pageNum=this.getPageNum(request);
				QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
				int zhangjieshu=0;
				for(int i=0;i<list.getList().size();i++){
					AnzhiFenJuan fen=list.getList().get(i);
					if(fen.getLs()!=null){
						zhangjieshu+=fen.getLs().size();
					}
				}
				result.add(this.addElement("chaptercount", zhangjieshu));
				result.add(this.addElement("wordcount", novel.getTotalCharNum()));
				result.add(this.addElement("tags", novel.getNovelLabel()));
				result.add(this.addElement("clickcount", novel.getClickNum()));
				result.add(this.addElement("createdate", novel.getAddTime()));
				result.add(this.addElement("updatedate", novel.getUpdateTime()));
			}
			this.createXml(request, response, result);
		}
	}
	
	/**
	 * azForyueduxing/azyueduxingNovelList.do  yueduxing   作品章节列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/yueduxing_chapterList.do?pid=1014&&apikey=c449b6e93152d7eb701ab9ead67801fe&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/yueduxing_chapterList")
	public void yueduxing_chapterList(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element result=this.addElement("result", null);
			result.addAttribute("language", "zh_CN");
			result.addAttribute("version", "1.1");
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element item=this.addElement("item", null);
						item.add(this.addElement("chaptername", ac.getChapterTitle()));
						item.add(this.addElement("chapterid", ac.getId()));
						item.add(this.addElement("vip", ac.getReadType()));
						result.add(item);
					}
				}
			}
			this.createXml(request, response, result);
		}
	}
	
	/**
	 * azycjd/yueduxing_chapterById  yueduxing 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/yueduxing_chapterById.do?pid=1014&&apikey=c449b6e93152d7eb701ab9ead67801fe&&bookid=17662&&chapterid=395973
	 */
	@RequestMapping(value="/anzhisystem/yueduxing_chapterById")
	public void yueduxing_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element result=this.addElement("result", null);
			result.addAttribute("language", "zh_CN");
			result.addAttribute("version", "1.1");
			result.add(this.addElement("content", ac.getChapterContent()));
			this.createXml(request, response, result);
		}
	}
}
