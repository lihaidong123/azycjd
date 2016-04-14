package com.anzhi.web.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IAnzhiCommentService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiCommentController extends GetCondition {
	@Autowired
	private IAnzhiCommentService anzhicommentService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@RequestMapping(value="/anzhicomment/addAnzhiComment",method=RequestMethod.POST)
	public void addAnzhiComment(HttpServletRequest request,HttpServletResponse response,AnzhiComment anzhicomment){
		if(request.getSession().getAttribute("addAnzhiCommentSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiCommentSession","true");
				if(anzhicomment.getId()==null||anzhicomment.getId()==0){
					response.setCharacterEncoding("utf-8");
					AnzhiMember am=this.getLoginMember(request);
					String answer="yes";
					if(anzhicomment.getCommentFatherid().equals(0)){
						answer=this.randCodeCheck(request,am);
					}
					if(this.checkParam(request, "mobileModel")&&request.getParameter("mobileModel").equals("yes")){
						//手机端不需要验证码
						answer="yes";
					}
					if(answer.equals("yes")){
						int isAddComment=this.getIntBySql("select is_add_comment from anzhi_member where id="+am.getId());
						if(isAddComment==1){
							response.getWriter().write("您已经被禁言了！");
						}else{
							anzhicomment.setAddTime(getTimestamp());
							anzhicomment.setIsMarrow(0);
							anzhicomment.setIsTop(0);
							if(anzhicomment.getState()==null){
								anzhicomment.setState(0);
							}
							anzhicomment.setVote("");
							anzhicomment.setMemberId(am.getId());
							anzhicommentService.addAnzhiComment(request,anzhicomment,am);
							response.getWriter().write(answer);
						}
					}else{
						response.getWriter().write(answer);
					}
				}else{
					anzhicommentService.updateAnzhiComment(anzhicomment);
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiCommentSession");
			}
		}
	}

	@RequestMapping(value="/anzhicomment/addBatchAnzhiComment",method=RequestMethod.POST)
	public String addBatchAnzhiComment(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiComment> list=new ArrayList<AnzhiComment>();
		anzhicommentService.addBatchAnzhiComment(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicomment/delAnzhiComment",method=RequestMethod.POST)
	public String delAnzhiComment(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiCommentSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCommentSession","true");
				int id=request.getParameter("anzhicommentId")==null?0:Integer.parseInt(request.getParameter("anzhicommentId"));
				anzhicommentService.delAnzhiComment(id);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCommentSession");
			}
		}
		request.setAttribute("pageDirecNum", "15");
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhicomment/delAnzhiCommentAdmin",method=RequestMethod.POST)
	public String delAnzhiCommentAdmin(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiCommentSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCommentSession","true");
				int id=request.getParameter("anzhicommentId")==null?0:Integer.parseInt(request.getParameter("anzhicommentId"));
				//anzhicommentService.delAnzhiComment(id);
				System.out.println(this.getInt(request, "types"));
				System.out.println(this.getInt(request, "tableId"));
				anzhicommentService.delAnzhiCommentAdmin(id, this.getInt(request, "tableId"), request.getRealPath("//"), this.getInt(request, "types"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCommentSession");
			}
		}
		if(this.checkParam(request, "delReply")){
			return this.commentActionAdmin(request, response);
		}
		return this.pinglunguanli(request, response);
	}
	
	@RequestMapping(value="/anzhicomment/delAnzhiCommentAdminByIndex",method=RequestMethod.POST)
	public void delAnzhiCommentAdminByIndex(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		if(request.getSession().getAttribute("delAnzhiCommentSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiCommentSession","true");
				AnzhiMember am=this.getLoginMember(request);
				if(am==null){
					response.getWriter().write("您还没有登录呢！");
					return;
				}
				if(!am.getMemberType().equals(2)||!am.getMemberNo().equals("admin")){
					response.getWriter().write("非管理员请勿执行本操作！");
					return;
				}
				int id=request.getParameter("anzhicommentId")==null?0:Integer.parseInt(request.getParameter("anzhicommentId"));
				anzhicommentService.delAnzhiCommentAdmin(id, this.getInt(request, "tableId"), request.getRealPath("//"), 0);
				response.getWriter().write("yes");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiCommentSession");
			}
		}
	}

	@RequestMapping(value="/anzhicomment/delBatchAnzhiComment",method=RequestMethod.POST)
	public String delBatchAnzhiComment(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhicommentIds");
		anzhicommentService.delBatchAnzhiComment(ids);
		request.getSession().setAttribute("directPageName", "");
		return this.anzhiCommentAllManage(request, response);
	}

	@RequestMapping(value="/anzhicomment/updateAnzhiComment",method=RequestMethod.POST)
	public String updateAnzhiComment(HttpServletRequest request,HttpServletResponse response,AnzhiComment anzhicomment){
		if(request.getSession().getAttribute("updateAnzhiCommentSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiCommentSession","true");
				anzhicommentService.updateAnzhiComment(anzhicomment);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiCommentSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhicomment/findAnzhiCommentAll",method=RequestMethod.POST)
	public String findAnzhiCommentAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum, condition);
		request.setAttribute("anzhicommentList", list);
		return this.getPageName(request, "admin/AnzhiCommentManager");
	}
	
	@RequestMapping(value="/anzhicomment/anzhiCommentAllManage",method=RequestMethod.POST)
	public String anzhiCommentAllManage(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		condition+=" and comment_fatherid=0";
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum, condition);
		for(AnzhiComment p:list.getList()){
			p.setReplyNum(this.getIntBySql("select count(*) from anzhi_comment where comment_fatherid="+p.getId()));
			p.setDianZanNum(this.getIntBySql("select count(*) from anzhi_comment_praise where comment_id="+p.getId()));
		}
		request.setAttribute("anzhicommentList", list);
		request.setAttribute("novelTitle", this.getStringBySql("select novel_title from anzhi_novel where id="+this.getInt(request, "tableId")));
		return this.getPageName(request, "index/line_book_discuss");
	}
	
	@RequestMapping(value="/anzhicomment/anzhiCommentAllManageAdmin",method=RequestMethod.POST)
	public String anzhiCommentAllManageAdmin(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		condition+=" and comment_fatherid=0";
		if(this.checkParam(request, "begTime")&&this.checkParam(request, "endTime")){
			condition+=" and add_time between '"+request.getParameter("begTime")+"' and '"+request.getParameter("endTime")+"'";
		}
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum, condition);
		for(AnzhiComment p:list.getList()){
			p.setReplyNum(this.getIntBySql("select count(*) from anzhi_comment where state!=2 and comment_fatherid="+p.getId()));
			p.setDianZanNum(this.getIntBySql("select count(*) from anzhi_comment_praise where comment_id="+p.getId()));
		}
		request.setAttribute("anzhicommentList", list);
		request.setAttribute("novelTitle", this.getStringBySql("select novel_title from anzhi_novel where id="+this.getInt(request, "tableId")));
		return this.getPageName(request, "admin/line_book_discuss");
	}

	@RequestMapping(value="/anzhicomment/findAnzhiCommentById",method=RequestMethod.POST)
	public String findAnzhiCommentById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhicommentId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiCommentAction");
	}

	@RequestMapping(value="/anzhicomment/anzhicommentAction",method=RequestMethod.POST)
	public String anzhicommentAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiCommentAction");
	}
	
	@RequestMapping(value="/anzhicomment/findMyAnzhiCommentAll",method=RequestMethod.POST)
	public String findMyAnzhiCommentAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		int loginid=this.getLoginMemberId(request);
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum,condition,loginid);
		request.setAttribute("anzhicommentList", list);
		return this.getPageName(request, "index/my_comment_person");
	}
	

	/**
	 * 前端某部小说的全部评论
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhicomment/findMyAnzhiCommentAllIndex")
	public String findMyAnzhiCommentAllIndex(HttpServletRequest request,HttpServletResponse response){
		anzhicommentService.findAnzhiCommentAllIndex(request);
		return this.getPageName(request, "replyAllComment");
	}
	
	//评论回复跳转
	@RequestMapping(value="/anzhicomment/commentAction",method=RequestMethod.POST)
	public String commentAction(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		if(this.checkParam(request, "commentId")&&this.checkParam(request, "novelId")){
			//先查询小说
			QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
			novelTypeChange(ls);
			if(ls.getList().size()!=0){
				request.setAttribute("pojo", ls.getList().get(0));
				
				//查询评论基本信息
				QueryList<AnzhiComment> commlist = anzhicommentService.findAnzhiCommentAll(1, 1, " and id="+this.getInt(request, "commentId"));
				if(commlist.getList().size()!=0){
					request.setAttribute("commentPojo", commlist.getList().get(0));
					
					QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum, " and state!=2 and comment_type=0 and comment_fatherid="+this.getInt(request, "commentId"));
					request.setAttribute("anzhicommentList", list);
				}
			}
		}
		return this.getPageName(request, "replyComment");
	}
	
	//评论回复跳转
	@RequestMapping(value="/anzhicomment/commentActionAdmin",method=RequestMethod.POST)
	public String commentActionAdmin(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		if(this.checkParam(request, "commentId")&&this.checkParam(request, "novelId")){
			//先查询小说
			QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
			novelTypeChange(ls);
			if(ls.getList().size()!=0){
				request.setAttribute("pojo", ls.getList().get(0));
				
				//查询评论基本信息
				QueryList<AnzhiComment> commlist = anzhicommentService.findAnzhiCommentAll(1, 1, " and id="+this.getInt(request, "commentId"));
				if(commlist.getList().size()!=0){
					request.setAttribute("commentPojo", commlist.getList().get(0));
					String condition=this.getCondition(anzhicommentConditionArr, request, response);
					condition+=" and state!=2 and comment_fatherid="+this.getInt(request, "commentId");
					if(this.checkParam(request, "begTime")&&this.checkParam(request, "endTime")){
						condition+=" and add_time between '"+request.getParameter("begTime")+"' and '"+request.getParameter("endTime")+"'";
					}
					QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentAll(size, pageNum, condition);
					request.setAttribute("anzhicommentList", list);
				}
			}
		}
		return this.getPageName(request, "admin/replyComment");
	}
	
	@RequestMapping(value="/anzhicomment/findMyAnzhiCommentreplyAll",method=RequestMethod.POST)
	public String findMyAnzhiCommentreplyAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		int loginid=this.getLoginMemberId(request);
		QueryList<AnzhiComment> list = anzhicommentService.findAnzhiCommentreplyAll(size, pageNum,condition,loginid);
		request.setAttribute("anzhicommentreplyList", list);
		return this.getPageName(request, "index/my_comment_reply");
	}

	
	@RequestMapping(value="/anzhicomment/pinglunguanli")
	public String pinglunguanli(HttpServletRequest request,HttpServletResponse response){
		String condition=this.getCondition(anzhicommentConditionArr, request, response);
		anzhicommentService.pinglunguanli(request,condition);
		return this.getPageName(request, "admin/pinglunguanli");
	}
}