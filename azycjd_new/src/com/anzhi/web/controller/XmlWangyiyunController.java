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
public class XmlWangyiyunController extends XmlController{
	private String xmlfileName="wangyiyun";
	
	/**
	 * azForwangyiyun/azwangyiyunNovelList.do  wangyiyun   作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/wangyiyun_novelByBookId.do?pid=1012&&apikey=a96e776d95f29f7dfd13e86d44d9eee6&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/wangyiyun_novelByBookId")
	public void wangyiyun_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			
			Element document=this.addElement("document", null);
			document.add(this.addElement("webName", "安之原创基地"));
			document.add(this.addElement("webSite","www.azycjd.com"));
			Element item=this.addElement("item", null);
			if(novel!=null){
				item.add(this.addElement("bookid", novel.getId()));
				item.add(this.addElement("Original_URL", "http://www.azycjd.com/novel/"+novel.getId()+".jsp"));
				item.add(this.addElement("title", novel.getNovelTitle()));
				item.add(this.addElement("author", novel.getAuthorWriterName()));
				item.add(this.addElement("size", novel.getTotalCharNum()));
				item.add(this.addElement("tag", novel.getNovelLabel()));
				item.add(this.addElement("fullflag", novel.getState().equals(3)?1:0));
				
				item.add(this.addElement("isvip", this.novelFree(novel.getId()),false));
				double d=getAnZhiBi(novel.getTotalCharNum())/100;
				item.add(this.addElement("price", d));
				
				item.add(this.addElement("comment", novel.getVote()));
				item.add(this.addElement("imgageLink", "http://www.azycjd.com/"+novel.getNovelImg()));
				item.add(this.addElement("url", "http://www.azycjd.com/anzhisystem/wangyiyun_chapterList.do?pid=1015&&apikey=a96e776d95f29f7dfd13e86d44d9eee6&&bookid="+novel.getId()));
				document.add(item);
			}
			this.createXml(request, response, document);
		}
	}
	
	/**
	 * azForwangyiyun/azwangyiyunNovelList.do  wangyiyun   作品章节列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/wangyiyun_chapterList.do?pid=1012&&apikey=a96e776d95f29f7dfd13e86d44d9eee6&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/wangyiyun_chapterList")
	public void wangyiyun_chapterList(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element items=this.addElement("items", null);
			data.add(items);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element item=this.addElement("item", null);
						item.add(this.addElement("cid", ac.getId()));
						item.add(this.addElement("isvip", ac.getReadType()));
						item.add(this.addElement("name", ac.getChapterTitle()+"/"+fen.getJuanName()));
						item.add(this.addElement("chaptertype", 0));
						item.add(this.addElement("content", "http://www.azycjd.com/anzhisystem/wangyiyun_chapterById.do?pid=1015&&apikey=a96e776d95f29f7dfd13e86d44d9eee6&&bookid="+this.getInt(request, "bookid")+"&&chapterid="+ac.getId()+""));
						items.add(item);
					}
				}
			}
			this.createXml(request, response, data);
		}
	}
	
	/**
	 * azycjd/wangyiyun_chapterById  wangyiyun 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/wangyiyun_chapterById.do?pid=1012&&apikey=a96e776d95f29f7dfd13e86d44d9eee6&&bookid=17662&&chapterid=395973
	 */
	@RequestMapping(value="/anzhisystem/wangyiyun_chapterById")
	public void wangyiyun_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			Element data=this.addElement("data", null);
			Element info=this.addElement("info", null);
			data.add(info);
			info.add(this.addElement("name", this.getInt(request, "chapterid")));
			info.add(this.addElement("content", ac.getChapterContent()));
			this.createXml(request, response, data);
		}
	}
}
