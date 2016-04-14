package com.anzhi.web.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinChapter;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiChapterController extends GetCondition {
	@Autowired
	private IAnzhiChapterService anzhichapterService;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@RequestMapping(value="/anzhichapter/addAnzhiChapter",method=RequestMethod.POST)
	public String addAnzhiChapter(HttpServletRequest request,HttpServletResponse response,AnzhiChapter anzhichapter){
		if(request.getSession().getAttribute("addAnzhiChapterSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiChapterSession","true");
				String eda=new SimpleDateFormat("yyyy").format(new Date())+"-"+request.getParameter("yue")+"-"+request.getParameter("tian")+" "+request.getParameter("dian")+":"+request.getParameter("fen")+":00";
				if(anzhichapter.getId()==null||anzhichapter.getId()==0){
					anzhichapter.setAddTime(this.getTimestampFull(eda,anzhichapter));
					anzhichapter.setChapterVote("");
					anzhichapter.setLastUpdateTime(this.getTimestamp());
					anzhichapter.setReadType(0);
					anzhichapter.setVote("");
					anzhichapterService.addAnzhiChapter(request.getRealPath("//"),anzhichapter);
				}else{
					QueryList<AnzhiChapter> ls=anzhichapterService.findAnzhiChapterAll(10, 1, " and id="+anzhichapter.getId());
					if(ls.getList().size()!=0){
						AnzhiChapter a=ls.getList().get(0);
						a.setAddTime(this.getTimestampFull(eda,anzhichapter));
						int updateNum=anzhichapter.getChapterCharNum()-a.getChapterCharNum();
						a.setLastUpdateTime(this.getTimestamp());
						a.setChapterCharNum(anzhichapter.getChapterCharNum());
						a.setChapterContent(anzhichapter.getChapterContent());
						a.setChapterTitle(anzhichapter.getChapterTitle());
						a.setFenJuanId(anzhichapter.getFenJuanId());
						a.setState(anzhichapter.getState());
						if(anzhichapterService.updateAnzhiChapter(request.getRealPath("//"),a,updateNum)){
							int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+a.getId());
							updateNovelMenu(request.getRealPath("//"),novelId);
						}
					}
				}
				request.setAttribute("pageDirecNum", "5");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiChapterSession");
			}
		}
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhichapter/addBatchAnzhiChapter",method=RequestMethod.POST)
	public String addBatchAnzhiChapter(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiChapter> list=new ArrayList<AnzhiChapter>();
		anzhichapterService.addBatchAnzhiChapter(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapter/delAnzhiChapter",method=RequestMethod.POST)
	public void delAnzhiChapter(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiChapterSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiChapterSession","true");
				response.setCharacterEncoding("utf-8");
				if(this.getInt(request, "anzhichapterId")==-1){
					response.getWriter().write("参数请求错误");
					return;
				}
				int id=request.getParameter("anzhichapterId")==null?0:Integer.parseInt(request.getParameter("anzhichapterId"));
				int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+this.getInt(request, "anzhichapterId"));
				anzhichapterService.delAnzhiChapter(id);
				QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
				if(ls.getList().size()!=0){
					utilService.createNovelChapter(ls.getList().get(0),  request.getRealPath("//"));
				}
				
				response.getWriter().write("yes");;
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiChapterSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhichapter/delAnzhiChapterByAdmin",method=RequestMethod.POST)
	public void delAnzhiChapterByAdmin(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiChapterSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiChapterSession","true");
				response.setCharacterEncoding("utf-8");
				if(this.getInt(request, "anzhichapterId")==-1){
					response.getWriter().write("参数请求错误");
					return;
				}
				int id=request.getParameter("anzhichapterId")==null?0:Integer.parseInt(request.getParameter("anzhichapterId"));
				int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+this.getInt(request, "anzhichapterId"));
				anzhichapterService.delAnzhiChapter(id);
				QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
				if(ls.getList().size()!=0){
					utilService.createNovelChapter(ls.getList().get(0), request.getRealPath("//"));
				}
				
				response.sendRedirect(request.getContextPath()+"/anzhifenjuan/findAnzhiFenJuanManage.do?novelId="+request.getParameter("novelId"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiChapterSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhichapter/delBatchAnzhiChapter",method=RequestMethod.POST)
	public String delBatchAnzhiChapter(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhichapterIds");
		anzhichapterService.delBatchAnzhiChapter(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapter/updateAnzhiChapter",method=RequestMethod.POST)
	public String updateAnzhiChapter(HttpServletRequest request,HttpServletResponse response,AnzhiChapter anzhichapter){
		if(request.getSession().getAttribute("updateAnzhiChapterSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiChapterSession","true");
				anzhichapterService.updateAnzhiChapter(request.getRealPath("//"),anzhichapter,0);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiChapterSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhichapter/findAnzhiChapterAll",method=RequestMethod.POST)
	public String findAnzhiChapterAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhichapterConditionArr, request, response);
		QueryList<AnzhiChapter> list = anzhichapterService.findAnzhiChapterAll(size, pageNum, condition);
		request.setAttribute("anzhichapterList", list);
		return this.getPageName(request, "admin/AnzhiChapterManager");
	}

	@RequestMapping(value="/anzhichapter/findAnzhiChapterById",method=RequestMethod.POST)
	public String findAnzhiChapterById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiChapter> list = anzhichapterService.findAnzhiChapterAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhichapterId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "index/line_newchapter");
	}

	@RequestMapping(value="/anzhichapter/anzhichapterAction",method=RequestMethod.POST)
	public String anzhichapterAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiChapterAction");
	}

	@RequestMapping(value="/anzhichapter/dingyuechaxu",method=RequestMethod.POST)
	public String dingyuechaxu(HttpServletRequest request,HttpServletResponse response){
		anzhichapterService.dingyuechaxu(request);
		return this.getPageName(request, "index/line_bookmanage_ding");
	}
	
	@RequestMapping(value="/anzhichapter/findAnzhiChapterNewOne",method=RequestMethod.POST)
	public String findAnzhiChapterNewOne(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhichapterConditionArr, request, response);
		QueryList<AnzhiChapter> list = anzhichapterService.findAnzhiChapterAll(size, pageNum,  " ","last_update_time");
		request.setAttribute("anzhichapterList", list);
		return this.getPageName(request, "admin/AnzhiChapterManager");
	}
	
	@RequestMapping(value="/anzhichapter/read")
	public String read(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "chapterId")==-1){
			return "500";
		}
		AnzhiMember am=this.getLoginMember(request);
		return anzhichapterService.cashRead(request,this.getInt(request, "chapterId"),am);
	}
	
	@RequestMapping(value="/anzhichapter/loadBuyChapter")
	public String loadBuyChapter(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "chapterId")==-1){
			return "500";
		}
		AnzhiMember am=this.getLoginMember(request);
		return anzhichapterService.loadBuyChapter(request,this.getInt(request, "chapterId"),am);
	}
	
	@RequestMapping(value="/anzhichapter/upAndNext")
	public void upAndNext(HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(this.getInt(request, "chapterId")!=-1&&this.getInt(request, "novelId")!=-1&&this.checkParam(request, "looktype")){
			int chapterId=0;
			if(request.getParameter("looktype").equals("up")){
				chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" and id<"+this.getInt(request, "chapterId")+" order by id desc");
				if(chapterId==0){
					chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" order by id desc");
				}
			}else if(request.getParameter("looktype").equals("next")){
				chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" and id>"+this.getInt(request, "chapterId")+" order by id asc");
				if(chapterId==0){
					chapterId=this.getIntBySql("select top 1 id from anzhi_chapter_report where state=1 and novel_id="+this.getInt(request, "novelId")+" order by id asc");
				}
			}
			
			response.sendRedirect(request.getContextPath()+"/anzhichapter/read.do?chapterId="+chapterId);
		}else{
			response.sendRedirect(request.getContextPath()+"/404.jsp");
		}
	}

	@RequestMapping(value="/anzhichapter/nopassCheck")
	public String nopassCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinChapter> ls=anzhichapterService.findAnzhiNovelMultiJoinChapterAll(size, pageNum, " and action_type=10", "id");
		request.setAttribute("anzhichapterList", ls);
		return "admin/nopassCheck";
	}
	
	/**
	 * 管理员对删章节审核
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhichapter/delChapterCheck")
	public String delChapterCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinChapter> ls=anzhichapterService.findAnzhiNovelMultiJoinChapterAll(size, pageNum, " and action_type=9", "id");
		request.setAttribute("anzhichapterList", ls);
		return "admin/delChapterCheck";
	}

	
	/**
	 * 手动加V
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/anzhichapter/setChapterVip")
	public void setChapterVip(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(!this.checkParam(request, "ids")){
			response.getWriter().write("参数请求错误!");
			return;
		}
		response.getWriter().write(anzhichapterService.addSetChaptetVip(request));
		QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
		if(ls.getList().size()!=0){
			utilService.createNovelChapter(ls.getList().get(0), request.getRealPath("\\"));
		}
	}
	
	/**
	 * 作者后台预览
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhichapter/indexLook")
	public String indexLook(HttpServletRequest request,HttpServletResponse response){
		try {
			QueryList<AnzhiChapter> list = anzhichapterService.findAnzhiChapterAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhichapterId")));
			QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+(this.getIntBySql("select novel_id from anzhi_chapter_report where id="+list.getList().get(0).getId())), "id");
			request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
			request.setAttribute("novelpojo", ls.getList().size()!=1?null:ls.getList().get(0));
		} catch (Exception e) {
			
		}
		return this.getPageName(request, "index/novel_read_model_index");
	}
	
	@RequestMapping(value="/anzhichapter/updateChapterReadType",method=RequestMethod.POST)
	public void updateChapterReadType(HttpServletRequest request,HttpServletResponse response){
		if(this.checkParam(request, "chapterId")){
			this.updateTableField("anzhi_chapter", this.getInt(request, "chapterId"), "read_type", 0);
			int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+this.getInt(request, "chapterId"));
			QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
			if(ls.getList().size()!=0){
				utilService.createNovelChapter(ls.getList().get(0), request.getRealPath("\\"));
			}
		}
	}
	@RequestMapping(value="/anzhichapter/updateChapterFenJuan",method=RequestMethod.POST)
	public void updateChapterFenJuan(HttpServletRequest request,HttpServletResponse response){
		AnzhiMember am=this.getLoginMember(request);
		if(am!=null){
			if(this.checkParam(request, "chapterId")&&this.checkParam(request, "fenjuanId")){
				int authorId=this.getIntBySql("select author_id from anzhi_chapter_report where id="+this.getInt(request, "chapterId"));
				if(am.getId().equals(authorId)){//保证必须是本人操作
					this.updateTableField("anzhi_chapter", this.getInt(request, "chapterId"), "fen_juan_id", this.getInt(request, "fenjuanId"));
					int novelId=this.getIntBySql("select novel_id from anzhi_chapter_report where id="+this.getInt(request, "chapterId"));
					QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+novelId, "id");
					if(ls.getList().size()!=0){
						utilService.createNovelChapter(ls.getList().get(0), request.getRealPath("\\"));
					}
				}
			}
		}
		
	}
}