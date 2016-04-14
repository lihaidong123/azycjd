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
public class XmlDouDingController extends XmlController {
private String xmlfileName="douding";
	
	
	/**
	 * azFordouding/azdoudingNovelList.do  douding 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/douding_noveltype")
	public void douding_noveltype(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		Element result=this.addElement("result", null);
		result.addAttribute("language", "zh_CN");
		result.addAttribute("version", "1.1");
		Element status=this.addElement("status", null);
		status.add(this.addElement("code", 0));
		status.add(this.addElement("msg", "成功"));
		result.add(status);
		Element data=this.addElement("data", null);
		for(int i=0;i<novelType.length;i++){
			Element category=this.addElement("category", null);
			category.add(this.addElement("cate_id", i+1));
			category.add(this.addElement("cate_name", novelType[i]));
			data.add(category);
		}
		result.add(data);
		this.createXml(request, response, result);
	}
	
	/**
	 * azFordouding/azdoudingNovelList.do  douding 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/douding_novelList")
	public void douding_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element datas=this.addElement("datas", null);
		for(int i=0;i<novelList.size();i++){
			Element item=this.addElement("item", null);
			item.add(this.addElement("id", novelList.get(i).getId()));
			item.add(this.addElement("bookname", novelList.get(i).getNovelTitle()));
			datas.add(item);
		}
		this.createXml(request, response, datas);
	}
	
	/**
	 * azFordouding/azdoudingNovelList.do  douding 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/douding_novelByBookId")
	public void douding_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element data=this.addElement("data", null);
			if(novel!=null){
				data.add(this.addElement("cname", novelTypeChange(novel.getNovelType(), xmlfileName)));
				data.add(this.addElement("bookname", novel.getNovelTitle()));
				data.add(this.addElement("bookid", novel.getId()));
				data.add(this.addElement("bookpic","http://www.azycjd.com/"+novel.getNovelImg()));
				data.add(this.addElement("zzjs", novel.getVote()));
				data.add(this.addElement("authorname", novel.getAuthorWriterName()));
				data.add(this.addElement("createtime", novel.getAddTime()));
				data.add(this.addElement("bksize", novel.getTotalCharNum()));
				data.add(this.addElement("allvisit", novel.getClickNum()));
				data.add(this.addElement("writestatus", novel.getState().equals(3)?"是":"否"));
				data.add(this.addElement("license", novel.getIsSigned().equals(1)?"是":"否"));
			}
			this.createXml(request, response, data);
		}
	}
	
	/**
	 * azFordouding/azdoudingNovelList.do  douding 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/douding_fenjuan")
	public void douding_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
				vol.add(this.addElement("volumeid", fen.getId()));
				vol.add(this.addElement("volname", fen.getJuanName()));
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chapter", null);
						chapter.add(this.addElement("chapterid", ac.getId(),false));
						chapter.add(this.addElement("chaptername", ac.getChapterTitle()));
						chapter.add(this.addElement("url", "http://www.azycjd.com/anzhisystem/douding_chapterById.do?pid=1007&&apikey=18f2a638cb82b301d8cdc984140898f4&&bookid="+this.getInt(request, "bookid")+"&&chapterid="+ac.getId()));
						chapter.add(this.addElement("license", ac.getReadType(),false));
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
	@RequestMapping(value="/anzhisystem/douding_chapterById")
	public void douding_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
