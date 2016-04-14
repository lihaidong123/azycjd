package com.anzhi.web.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinAuthor;
import com.anzhi.web.service.IAnzhiAuthorService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiAuthorController extends GetCondition {
	@Autowired
	private IAnzhiAuthorService anzhiauthorService;
	@RequestMapping(value="/anzhiauthor/addAnzhiAuthor",method=RequestMethod.POST)
	public String addAnzhiAuthor(HttpServletRequest request,HttpServletResponse response,AnzhiAuthor anzhiauthor){
		if(request.getSession().getAttribute("addAnzhiAuthorSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiAuthorSession","true");
				this.getLoginMember(request);
				AnzhiMember am=this.getLoginMember(request);
				if(am!=null&&am.getMemberType().equals(0)){
					if(anzhiauthor.getId()==null||anzhiauthor.getId()==0){
						int memberType=this.getIntBySql("select member_type from anzhi_member where id="+am.getId());
						if(memberType==0){
							anzhiauthor.setMemberId(this.getLoginMemberId(request));
							anzhiauthor.setAuthorState(0);
							am.setMemberType(1);
							anzhiauthorService.addAnzhiAuthor(anzhiauthor,this.getLoginMember(request));
							request.getSession().setAttribute("loginAuthors", anzhiauthor);
						}
					}else{
						anzhiauthorService.updateAnzhiAuthor(anzhiauthor);
					}
					if(anzhiauthor.getId()==null||anzhiauthor.getId()==0){
						request.setAttribute("pageDirecNum", "7");
					    return "pageDirec";
					}else{
						response.sendRedirect(request.getContextPath()+"/anzhiauthor/findAnzhiAuthorAll.do");
						return null;
					}
				}
				
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiauthor/addBatchAnzhiAuthor",method=RequestMethod.POST)
	public String addBatchAnzhiAuthor(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiAuthor> list=new ArrayList<AnzhiAuthor>();
		anzhiauthorService.addBatchAnzhiAuthor(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiauthor/delAnzhiAuthor",method=RequestMethod.POST)
	public void delAnzhiAuthor(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiAuthorSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiAuthorSession","true");
				int id=request.getParameter("anzhiauthorId")==null?0:Integer.parseInt(request.getParameter("anzhiauthorId"));
				anzhiauthorService.delAnzhiAuthor(id);
				response.sendRedirect(request.getContextPath()+"/anzhiauthor/findAnzhiAuthorAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiauthor/delBatchAnzhiAuthor",method=RequestMethod.POST)
	public String delBatchAnzhiAuthor(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiauthorIds");
		anzhiauthorService.delBatchAnzhiAuthor(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiauthor/updateAnzhiAuthor",method=RequestMethod.POST)
	public String updateAnzhiAuthor(HttpServletRequest request,HttpServletResponse response,AnzhiAuthor anzhiauthor){
		if(request.getSession().getAttribute("updateAnzhiAuthorSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiAuthorSession","true");
				anzhiauthorService.updateAnzhiAuthor(anzhiauthor);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiAuthorSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiauthor/findAnzhiAuthorAll")
	public String findAnzhiAuthorAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiauthorConditionArr, request, response);
		QueryList<AnzhiAuthor> list = anzhiauthorService.findAnzhiAuthorAll(size, pageNum, condition);
		request.setAttribute("anzhiauthorList", list);
		return this.getPageName(request, "admin/AnzhiAuthorManager");
	}

	@RequestMapping(value="/anzhiauthor/findAnzhiAuthorById",method=RequestMethod.POST)
	public String findAnzhiAuthorById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiAuthor> list = anzhiauthorService.findAnzhiAuthorAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiauthorId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiAuthorAction");
	}

	@RequestMapping(value="/anzhiauthor/anzhiauthorAction",method=RequestMethod.POST)
	public String anzhiauthorAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiAuthorAction");
	}
	
	@RequestMapping(value="/anzhiauthor/updateAnzhiAuthorSelf",method=RequestMethod.POST)
	public String updateAnzhiAuthorSelf(HttpServletRequest request,HttpServletResponse response,AnzhiAuthor anzhiauthor){
		if(request.getSession().getAttribute("updateAnzhiAuthorSession")==null){
			try{
				AnzhiAuthor at=this.getLoginAuthor(request);
				at.setAuthorTel(anzhiauthor.getAuthorTel());
				at.setAuthorQq(anzhiauthor.getAuthorQq());
				at.setAuthorImageNew(anzhiauthor.getAuthorImage());
				//at.setAuthorRealname(anzhiauthor.getAuthorRealname());
				at.setAuthorAddress(anzhiauthor.getAuthorAddress());
				at.setAuthorPost(anzhiauthor.getAuthorPost());
				at.setAuthorEmail(anzhiauthor.getAuthorEmail());
				at.setAuthorMsn(anzhiauthor.getAuthorMsn());
				at.setAuthorCredenttype(anzhiauthor.getAuthorCredenttype());
				//at.setAuthorCredentcode(anzhiauthor.getAuthorCredentcode());
				at.setAuthorInfo(anzhiauthor.getAuthorInfo());
				at.setId(this.getLoginAuthor(request).getId());
				request.getSession().setAttribute("updateAnzhiAuthorSession","true");
				anzhiauthorService.updateAnzhiAuthor(at);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiAuthorSession");
			}
		}
		request.setAttribute("pageDirecNum", "8");
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhiauthor/findAnzhiAuthorByName",method=RequestMethod.POST)
	public void findAnzhiAuthorByName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("name");
		String info="";
		if(name==null||name.equals("")){
			info="2";
			response.getWriter().write(info);
		}else{
			QueryList<AnzhiAuthor> list = anzhiauthorService.findAnzhiAuthorAll(10, 1, " and author_writer_name='"+name.trim()+"'");
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				response.getWriter().write(info);
			}
		}
		
	}

	/**
	 * 作者申请签约管理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhiauthor/signedCheck")
	public String signedCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinAuthor> ls=anzhiauthorService.findAnzhiNovelMultiJoinAuthor(size, pageNum, " and action_type=12");
		request.setAttribute("anzhiauthorList", ls);
		return "admin/dAuthorSignedCheck";
	}
	
	@RequestMapping(value="/anzhiauthor/findAnzhiAuthorByDetail")
	public String findAnzhiAuthorByDetail(HttpServletRequest request,HttpServletResponse response){
		anzhiauthorService.findAnzhiAuthorByDetail(request);
		return this.getPageName(request, "author_info");
	}
	
	@RequestMapping(value="/anzhiauthor/fuliShenQin")
	public String fuliShenQin(HttpServletRequest request,HttpServletResponse response){
		AnzhiMember am=this.getLoginMember(request);
		if(am!=null&&!am.getMemberType().equals(0)){
			anzhiauthorService.fuliShenQin(request,am);
		}
		return "index/fulishenqing";
	}
}