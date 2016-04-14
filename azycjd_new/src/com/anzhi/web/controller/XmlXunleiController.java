package com.anzhi.web.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelPartInfo;
import com.anzhi.web.util.QueryList;
@Controller
public class XmlXunleiController extends XmlController{
	private String xmlfileName="xunlei";
	/**
	 * azForxunlei/azxunleiNovelList.do  xunlei 作品列表接口
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/xunlei_novelList.do?pid=1013&&apikey=2b646107e8e86edf2260b447d6ba7382
	 */
	@RequestMapping(value="/anzhisystem/xunlei_novelList")
	public void xunlei_novelList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		if(!checkXmlDataUrl(request)){
			this.redirect(request, response, false, xmlfileName);
			return;
		}
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		if(this.checkParam(request, "pn")){
			pageNum=this.getInt(request, "pn");
		}
		if(this.checkParam(request, "ps")){
			size=this.getInt(request, "ps");
		}
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,null,xmlfileName,false);
		List<AnzhiNovel> novelList=ls.getList();
		JSONObject jsonobj=new JSONObject();
		response.setContentType("application/json;charset=utf-8");
		jsonobj.put("result", 0);
		jsonobj.put("message", "ok");
		JSONArray arr=new JSONArray();
		if(ls.getList().size()!=0){
			for(int i=0;i<novelList.size();i++){
				JSONObject jsondata=new JSONObject();
				jsondata.put("book_id", novelList.get(i).getId());
				jsondata.put("cover_link", "http://www.azycjd.com/"+novelList.get(i).getNovelImg());
				jsondata.put("book_name", novelList.get(i).getNovelTitle());
				jsondata.put("type_id", getNovelClassId(novelList.get(i).getNovelType()));
				jsondata.put("author", novelList.get(i).getAuthorWriterName());
				jsondata.put("book_size", novelList.get(i).getTotalCharNum());
				jsondata.put("keywords", novelList.get(i).getNovelLabel());
				jsondata.put("description", novelList.get(i).getVote());
				jsondata.put("price_unit", "字数收费");
				jsondata.put("book_status", novelList.get(i).getState());
				jsondata.put("create_data", novelList.get(i).getAddTime().toString());
				jsondata.put("is_out", "");
				jsondata.put("pub_name", "");
				jsondata.put("isbn_id", "");
				arr.add(JSONObject.fromObject(jsondata));
			}
			jsonobj.put("data", arr);
		}
		PrintWriter out=response.getWriter();
		out.print(jsonobj);
	}

	public int getNovelClassId(String novelType){
		String tadutype="1,异界大陆;1,异界争霸;1,远古神话;1,东方玄幻;33,西方奇幻;33,领主贵族;33,魔法校园;33,异类兽族;2,古典武侠;2,现代武侠;2,异界武侠;34,古典仙侠;1073,现代修真;34,洪荒修神;1073,幻想修真;3,都市商战;3,都市生活;3,都市重生;22,官场沉浮;27,娱乐明星;15,乡土传记;3,恩怨情仇;3,现实百态;10,青春校园;3,异术超能;3,国术武技;3,合租情缘;11,外国历史;11,历史传记;11,架空历史;11,上古先秦;11,秦汉三国;11,两晋隋唐;11,五代十国;11,两宋元明;11,清史民国;12,战争幻想;12,谍战特工;12,军旅生涯;12,抗战烽火;12,军事战争;7,游戏生涯;8,电子竞技;7,虚拟网游;7,游戏异界;8,体育竞技;8,奕林春秋;8,篮球竞技;8,足球竞技;6,星际战争;6,机械时代;6,数字生命;6,时空穿梭;6,未来世界;6,古武机甲;6,超级科技;6,进化变异;6,末世危机;13,推理侦探;14,恐怖惊悚;13,悬疑探险;14,灵异奇谈;1071,豪门总裁;3,青春都市;1071,军婚高干;1071,商战职场;1071,婚恋情感;5,穿越架空;34,仙侠魔幻;4,女尊天下;4,宫斗宅斗;4,种田养成;4,民国旧影;4,江湖情仇;1,架空玄幻;33,异族恋情";
		String[] arr=tadutype.split(";");
		if(novelType==""){
			return 1;
		}
		String id=1+"";
		String[] nt=novelType.split("/");
		String[] nt3=null;
		if(nt.length!=0){
			String[] nt1=nt[0].split("@");
			if(nt1.length!=0){
				nt3=nt1[1].split(";");
			}
		}
		if(nt3!=null){
			for(int i=0;i<arr.length;i++){
				String[] tmp=arr[i].split(",");
				boolean con=true;
				for(int j=0;j<nt3.length;j++){
					if(nt3[j].equals(tmp[1])){
						id=tmp[0];
						con=false;
						break;
					}
				}
				if(!con){
					break;
				}
			}
		}
		
		return Integer.parseInt(id);
	}
	
	/**
	 * azForxunlei/azxunleiNovelList.do  xunlei 作品分卷信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/xunlei_fenjuan.do?pid=1013&&apikey=2b646107e8e86edf2260b447d6ba7382&&bookid=17662
	 */
	@RequestMapping(value="/anzhisystem/xunlei_fenjuan")
	public void xunlei_fenjuan(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			JSONObject jsonobj=new JSONObject();
			response.setContentType("application/json;charset=utf-8");
			jsonobj.put("result", 0);
			jsonobj.put("message", "ok");
			JSONArray arr=new JSONArray();
			for(int i=0;i<list.getList().size();i++){
				AnzhiFenJuan fen=list.getList().get(i);
				if(fen.getLs()!=null){
					for(int j=0;j<fen.getLs().size();j++){
						AnzhiChapter ac=fen.getLs().get(j);
						JSONObject jsondata=new JSONObject();
						jsondata.put("chapter_id", ac.getId());
						jsondata.put("chapter_name", ac.getChapterTitle());
						jsondata.put("is_vip", ac.getReadType()==0?false:true);
						arr.add(JSONObject.fromObject(jsondata));
					}
				}
				jsonobj.put("data", arr);
			}
			PrintWriter out=response.getWriter();
			out.print(jsonobj);
		}
	}
	
	/**
	 * azycjd/changdu_chapterById  changdu 章节信息
	 * @param request
	 * @param response
	 * @throws Exception
	 * http://localhost:8080/azycjd_new/azycjd/xunlei_chapterById.do?pid=1013&&apikey=2b646107e8e86edf2260b447d6ba7382&&bookid=17662&&chapterid=395970
	 */
	@RequestMapping(value="/anzhisystem/xunlei_chapterById")
	public void xunlei_chapterById(HttpServletRequest request,HttpServletResponse response) throws Exception{
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
			JSONObject jsonobj=new JSONObject();
			response.setContentType("application/json;charset=utf-8");
			jsonobj.put("result", 0);
			jsonobj.put("message", "ok");
			
			JSONObject jsondata=new JSONObject();
			jsondata.put("chapter_id", ac.getId());
			jsondata.put("book_id", this.getInt(request, "bookid"));
			jsondata.put("content", ac.getChapterContent());
			
			jsonobj.put("data",jsondata);
			PrintWriter out=response.getWriter();
			out.print(jsonobj);
		}
	}
}
