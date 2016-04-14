package com.anzhi.web.controller;

import java.text.SimpleDateFormat;
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
public class Xml360Controller  extends XmlController{
	private String xmlfileName="sanliuling";

	/**
	 * azForsanliuling/azsanliulingNovelList.do  sanliuling 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/sanliuling_novelList")
	public void sanliuling_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}*/
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		String conditon="";
		if(this.checkParam(request, "begin_time")&&this.checkParam(request, "end_time")){
			String beg="";
			try {
				beg=new SimpleDateFormat("yyyy-MM-dd HH:00:00").format(new SimpleDateFormat("yyyyMMddHH").parse(request.getParameter("begin_time")));
			} catch (Exception e) {
			}
			String end="";
			try {
				end=new SimpleDateFormat("yyyy-MM-dd HH:00:00").format(new SimpleDateFormat("yyyyMMddHH").parse(request.getParameter("end_time")));
			} catch (Exception e) {
			}
			if(beg.equals("")&&!end.equals("")){
				conditon+=" and update_time between '"+beg+"' and '"+end+"'";
			}
			if(this.checkParam(request, "page")){
				pageNum=this.getInt(request, "page");
			}
		}
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,conditon,xmlfileName);
		List<AnzhiNovel> novelList=ls.getList();
		Element document=this.addElement("document", null);
		document.add(this.addElement("webName", "安之原创基地"));
		document.add(this.addElement("pubDate", this.getNow()));
		Element books=this.addElement("books", null);
		for(int i=0;i<novelList.size();i++){
			Element book=this.addElement("book", null);
			book.add(this.addElement("id", novelList.get(i).getId()));
			book.add(this.addElement("name", novelList.get(i).getNovelTitle()));
			books.add(book);
		}
		document.add(books);
		this.createXml(request, response, document);
	}
	
	/**
	 * azForsanliuling/azsanliulingNovelList.do  sanliuling 作品信息接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/sanliuling_novelByBookId")
	public void sanliuling_novelByBookId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}*/
		if(this.checkParam(request, "bookid")){
			//获得一部小说
			AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
			Element bookinfo=this.addElement("book", null);
			if(novel!=null){
				bookinfo.add(this.addElement("id", novel.getId()));
				bookinfo.add(this.addElement("name", novel.getNovelTitle()));
				bookinfo.add(this.addElement("class", novelTypeChange(novel.getNovelType(),xmlfileName)));
				bookinfo.add(this.addElement("autor", novel.getAuthorWriterName()));
				bookinfo.add(this.addElement("bookintr", novel.getVote()));
				bookinfo.add(this.addElement("smallimg", "http://www.azycjd.com/"+novel.getNovelImg()));
				bookinfo.add(this.addElement("bigimg", "http://www.azycjd.com/"+novel.getNovelImg()));
				bookinfo.add(this.addElement("words", novel.getTotalCharNum()));
				String tag=novel.getNovelLabel();
				while(tag.indexOf(",")!=-1){
					tag=tag.replace(",", "|");
				}
				bookinfo.add(this.addElement("tag", tag));
				bookinfo.add(this.addElement("free", novelFree(novel.getId())==0?1:0));
				bookinfo.add(this.addElement("status", novel.getState().equals(3)?2:1));
				bookinfo.add(this.addElement("updatetime", getShiJianCuo(novel.getUpdateTime())));
			}
			this.createXml(request, response, bookinfo);
		}
	}
	
	/**
	 * azForsanliuling/azsanliulingNovelList.do  sanliuling 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/sanliuling_fenjuan")
	public void sanliuling_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}*/
		if(this.checkParam(request, "bookid")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):1000;
			int pageNum=this.getPageNum(request);
			String condition=" and novel_id="+this.getInt(request, "bookid");
			//获得分卷
			QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
			Element chaplist=this.addElement("chaplist", null);
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				Element volume=this.addElement("volume", null);
				volume.add(this.addElement("volumeid", fen.getId()));
				volume.add(this.addElement("volumename", fen.getJuanName()));
				Element chapters=this.addElement("chapters", null);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						Element chapter=this.addElement("chap", null);
						chapter.add(this.addElement("id", ac.getId()));
						chapter.add(this.addElement("title", ac.getChapterTitle()));
						chapters.add(chapter);
					}
				}
				volume.add(chapters);
				chaplist.add(volume);
			}
			this.createXml(request, response, chaplist);
		}
	}
	
	/**
	 * azForchangdu/azchangduNovelList.do  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * 
	 */
	@RequestMapping(value="/anzhisystem/sanliuling_chapterById")
	public void sanliuling_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}*/
		if(this.checkParam(request, "bookid")&&this.checkParam(request, "chapid")){
			int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):1000;
			int pageNum=this.getPageNum(request);
			String condition=" and id="+this.getInt(request, "chapid");
			//获得分卷
			AnzhiChapter ac = getChapterById(condition);
			Element chapter=this.addElement("chapter", null);
			chapter.add(this.addElement("id", ac.getId()));
			chapter.add(this.addElement("title", ac.getChapterTitle()));
			chapter.add(this.addElement("updatetime", getShiJianCuo(ac.getLastUpdateTime())));
			chapter.add(this.addElement("words", ac.getChapterCharNum()));
			chapter.add(this.addElement("priceunit", 4));
			chapter.add(this.addElement("price", getAnZhiBi(ac.getChapterCharNum())));
			chapter.add(this.addElement("vip", ac.getReadType()));
			chapter.add(this.addElement("content", ac.getChapterContent()));
			this.createXml(request, response, chapter);
		}
	}
}
