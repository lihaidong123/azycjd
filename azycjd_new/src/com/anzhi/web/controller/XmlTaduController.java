package com.anzhi.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.util.QueryList;
@Controller
public class XmlTaduController extends XmlController{
	private String xmlfileName="tadu";
	/**
	 * azFortadu/tadu_addnovel.do  tadu 添加作品接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/tadu_addnovel.do?pid=1011&&apikey=20d5b3652764bf7c3cc0255c23d884ce&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/tadu_addnovel")
	public void tadu_addnovel(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			JSONObject jsondata=new JSONObject();
			jsondata.put("key", "");
			jsondata.put("cpid", novel.getId());
			jsondata.put("copyrightid", "");
			jsondata.put("coverimage", "http://www.azycjd.com"+novel.getNovelImg());
			jsondata.put("bookname", novel.getNovelTitle());
			jsondata.put("authorname",novel.getAuthorWriterName());
			jsondata.put("intro",novel.getVote());
			jsondata.put("classid", novel.getNovelType());
			jsondata.put("serial", novel.getState()==3?0:1);
			jsondata.put("isvip", this.novelFree(novel.getId()));
			jsondata.put("url", "http://www.azycjd.com");
			System.out.println(jsondata);
		}
	}
	
	/**
	 * azFortadu/tadu_addnovel.do  tadu 添加作品接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/tadu_addchapter?pid=1011&&apikey=20d5b3652764bf7c3cc0255c23d884ce&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/tadu_addchapter")
	public void tadu_addchapter(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")&&this.checkParam(request, "chapterid")){
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			AnzhiChapter ac = getChapterById(" and id="+this.getInt(request, "chapterid"));
			JSONObject jsondata=new JSONObject();
			jsondata.put("key", "");
			jsondata.put("bookid", novel.getId());
			jsondata.put("copyrightid", "");
			jsondata.put("title",ac.getChapterTitle());
			jsondata.put("content", ac.getChapterContent());
			jsondata.put("chapternum","");
			jsondata.put("isvip", ac.getReadType());
			jsondata.put("chapterid",ac.getId());
			jsondata.put("updatemode", 1);
			System.out.println(jsondata);
		}
	}
	
}
