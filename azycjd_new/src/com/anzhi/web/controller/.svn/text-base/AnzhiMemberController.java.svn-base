package com.anzhi.web.controller;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ynzc.wuyuehu.email.EmailUtil;

import com.alipay.util.AlipayNotify;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiAuthorService;
import com.anzhi.web.service.IAnzhiExperienceRecordService;
import com.anzhi.web.service.IAnzhiMemberService;
import com.anzhi.web.service.IAnzhiMessageService;
import com.anzhi.web.service.IAnzhiThirdLoginService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.SendMessage;
import com.anzhi.web.util.UtilData;


@Controller
public class AnzhiMemberController extends GetCondition {
	@Autowired
	private IAnzhiMemberService anzhimemberService;
	@Autowired
	private IAnzhiAuthorService anzhiauthorService;
	@Autowired
	private IAnzhiExperienceRecordService anzhiexperiencerecordService;
	@RequestMapping(value="/anzhimember/addAnzhiMember",method=RequestMethod.POST)
	public void addAnzhiMember(HttpServletRequest request,HttpServletResponse response,AnzhiMember anzhimember){
		if(request.getSession().getAttribute("addAnzhiMemberSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiMemberSession","true");
				anzhimember.setAddTime(getTimestamp());
				if(anzhimember.getId()==null||anzhimember.getId()==0){
					String memberNotwo=request.getParameter("memberNotwo");
					if(memberNotwo!=null&&!memberNotwo.equals("")){
						anzhimember.setMemberNo(memberNotwo);
						anzhimember.setMemberNick(request.getParameter("memberNicktwo"));
						anzhimember.setMenberPassword(this.getMD5Str(request.getParameter("menberPasswords")));
					}else{
						anzhimember.setMenberPassword(this.getMD5Str(anzhimember.getMenberPassword()));
					}
					anzhimember.setState(0);
					anzhimember.setIsAccptMessage(1);
					anzhimember.setBookshelfPublic(0);
					anzhimember.setMemberType(0);
					anzhimember.setMemberExperience(0);
					anzhimember.setMemberMoney(0);
					anzhimember.setIsAddComment(0);
					anzhimember.setIsNoLogin(0);
					anzhimember.setReadMoney(0);
					anzhimemberService.addAnzhiMember(anzhimember);
					
					QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and member_no='"+anzhimember.getMemberNo()+"'");
					if(list.getList().size()==0){
						response.getWriter().write("用户名不存在!");
						response.sendRedirect(request.getContextPath()+"/author_login.jsp");
					}else{
						AnzhiMember t=list.getList().get(0);
						if(t.getMenberPassword().trim().equals(anzhimember.getMenberPassword())){
							this.remove(request, response);
							t.setUseAnzhiMonay(this.getIntBySql("select sum(consume_anzhi_money) from anzhi_consume where member_id="+t.getId()));
							request.getSession().setAttribute("loginUsers", t);
							request.getSession().setAttribute("logintime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
							QueryList<AnzhiAuthor> listau=anzhiauthorService.findAnzhiAuthorAll(10, 1, " and member_id="+t.getId());
							request.getSession().setAttribute("loginAuthors",listau.getList().size()==1? listau.getList().get(0):null);
							
							
							//获得是否签到
							QueryList<AnzhiExperienceRecord> qdlist=anzhiexperiencerecordService.findAnzhiExperienceRecordAll(100000, 1, " and experience_type= 0 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
							if(qdlist.getList().size()==0){
								request.getSession().setAttribute("qiandao", "no");
							}else{
								request.getSession().setAttribute("qiandao", "yes");
								int qiandaonum=this.getIntBySql("select count(*) from anzhi_experience_record where  experience_type= 0 and member_id="+t.getId());
								request.getSession().setAttribute("qiandaonum", qiandaonum);
								String ts=this.getStringBySql("select top 1 add_time from anzhi_experience_record where  experience_type= 0 and member_id="+t.getId()+" order by id desc");
								try {
									request.getSession().setAttribute("lastSignTime", new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ts)));
								} catch (ParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
							
							if(request.getParameter("wantToWriter")!=null&&request.getParameter("wantToWriter").equals("yes")){
								response.sendRedirect(request.getContextPath()+"/author_apply.jsp");
								return;
							}
							
							response.sendRedirect(request.getContextPath()+"/index.html");
						}else{
							response.getWriter().write("密码错误!");
							response.sendRedirect(request.getContextPath()+"/author_login.jsp");
						}
					}
					
				}else{
					anzhimemberService.updateAnzhiMember(anzhimember,0);
				}
				/*if(anzhimember.getId()==null||anzhimember.getId()==0){
					response.sendRedirect(request.getContextPath()+"/author_login.jsp");
				}else{
					response.sendRedirect(request.getContextPath()+"/anzhimember/findAnzhiMemberAll.do");
				}*/
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiMemberSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		
	}
	
	@RequestMapping(value="/anzhimember/checkYanzhengCode",method=RequestMethod.POST)
	public void checkYanzhengCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String privateKey = "bac890c0989b2e9bd28cccee89be9b65";
        GeetestLib geetest = new GeetestLib(privateKey);
        boolean gtResult = false;

        if (geetest.resquestIsLegal(request)) {
            gtResult = geetest.validateRequest(request);
        } else {
            // TODO use you own system
            gtResult = false;

        }
        
        if(gtResult){
        	response.getWriter().write("yes");
        }else{
        	response.getWriter().write("no");
        }
        
	}

	@RequestMapping(value="/anzhimember/addBatchAnzhiMember",method=RequestMethod.POST)
	public String addBatchAnzhiMember(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiMember> list=new ArrayList<AnzhiMember>();
		anzhimemberService.addBatchAnzhiMember(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimember/delAnzhiMember",method=RequestMethod.POST)
	public void delAnzhiMember(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiMemberSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiMemberSession","true");
				int id=request.getParameter("anzhimemberId")==null?0:Integer.parseInt(request.getParameter("anzhimemberId"));
				anzhimemberService.delAnzhiMember(id);
				response.sendRedirect(request.getContextPath()+"/anzhimember/findAnzhiMemberAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiMemberSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhimember/delBatchAnzhiMember",method=RequestMethod.POST)
	public String delBatchAnzhiMember(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhimemberIds");
		anzhimemberService.delBatchAnzhiMember(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimember/updateAnzhiMember",method=RequestMethod.POST)
	public String updateAnzhiMember(HttpServletRequest request,HttpServletResponse response,AnzhiMember anzhimember){
		if(request.getSession().getAttribute("updateAnzhiMemberSession")==null){
			try{
				String id=request.getParameter("id");
				
				request.getSession().setAttribute("updateAnzhiMemberSession","true");
				anzhimemberService.updateAnzhiMember(anzhimember,0);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiMemberSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhimember/findAnzhiMemberAll")
	public String findAnzhiMemberAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhimemberConditionArr, request, response);
		QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(size, pageNum, condition);
		request.setAttribute("anzhimemberList", list);
		return this.getPageName(request, "admin/AnzhiMemberManager");
	}

	@RequestMapping(value="/anzhimember/findAnzhiMemberById",method=RequestMethod.POST)
	public String findAnzhiMemberById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhimemberId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiMemberAction");
	}

	@RequestMapping(value="/anzhimember/anzhimemberAction",method=RequestMethod.POST)
	public String anzhimemberAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiMemberAction");
	}
	
	@RequestMapping(value="/anzhimember/updateAnzhiMemberMySelf",method=RequestMethod.POST)
	public String updateAnzhiMemberMySelf(HttpServletRequest request,HttpServletResponse response,AnzhiMember anzhimember){
		String type=request.getParameter("type");
		if(request.getSession().getAttribute("updateAnzhiMemberSession")==null){
			try{
				AnzhiMember  a=this.getLoginMember(request);
				int types=0;
				if(type.equals("0")){
					a.setMemberQq(anzhimember.getMemberQq());
					//说明用户重新上传过头像
					/*if(!a.getMemberHeadImg().equals(anzhimember.getMemberHeadImg())){
						types=1;
					}
					a.setMemberHeadImg(anzhimember.getMemberHeadImg());*/
					a.setMemberSex(anzhimember.getMemberSex());
					a.setMemberAddress(anzhimember.getMemberAddress());
					a.setMemberBirthday(this.getTimestamp(request, "memberBirthdays"));
					a.setMemberEmail(anzhimember.getMemberEmail());
					a.setMemberTel(anzhimember.getMemberTel());
					a.setVote(anzhimember.getVote());
					a.setId(this.getLoginMemberId(request));
				}else if(type.equals("1")){
					a.setIsAccptMessage(anzhimember.getIsAccptMessage());
					a.setBookshelfPublic(anzhimember.getBookshelfPublic());
				}else if(type.equals("2")){
					a.setMemberRealName(anzhimember.getMemberRealName());
					a.setMemberCode(anzhimember.getMemberCode());
					a.setMemberTel(anzhimember.getMemberTel());
				}else if(type.equals("3")){
					a.setMenberPassword(anzhimember.getMenberPassword());
				}
				request.getSession().setAttribute("updateAnzhiMemberSession","true");
				anzhimemberService.updateAnzhiMember(a,types);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiMemberSession");
			}
		}
		if(type.equals("0")){
			request.setAttribute("pageDirecNum", "1");
		}else if(type.equals("1")){
			request.setAttribute("pageDirecNum", "2");
		}else if(type.equals("2")){
			request.setAttribute("pageDirecNum", "3");
		}else if(type.equals("3")){
			request.setAttribute("pageDirecNum", "4");
		}
		return "pageDirec";
	}

	@RequestMapping(value="/anzhimember/login",method=RequestMethod.POST)
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String uname=request.getParameter("username");
		String upass=request.getParameter("userpass");

		QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and (member_no='"+uname.trim()+"' or member_nick='"+uname.trim()+"' or member_tel='"+uname.trim()+"' or member_email='"+uname.trim()+"' )");
		if(list.getList().size()==0){
			response.getWriter().write("用户名不存在!");
		}else{
			AnzhiMember t=list.getList().get(0);
			if(t.getIsNoLogin()==1){
				response.getWriter().write("您已经被封号!");
				return;
			}
			if(t.getMenberPassword().trim().equals(this.getMD5Str(upass.trim()))){
				loginAfter(request, response, t);
				response.getWriter().write("登录成功!");
			}else{
				response.getWriter().write("密码错误!");
			}
		}
		
	}

	private void loginAfter(HttpServletRequest request,
			HttpServletResponse response, AnzhiMember t) {
		this.remove(request, response);
		t.setUseAnzhiMonay(this.getIntBySql("select sum(consume_anzhi_money) from anzhi_consume where member_id="+t.getId()));
		request.getSession().setAttribute("loginUsers", t);
		request.getSession().setAttribute("logintime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		QueryList<AnzhiAuthor> listau=anzhiauthorService.findAnzhiAuthorAll(10, 1, " and member_id="+t.getId());
		request.getSession().setAttribute("loginAuthors",listau.getList().size()==1? listau.getList().get(0):null);
		request.getSession().setAttribute("dengjiNum",getDuzhejingyanLevel(t.getMemberExperience()));

		//获得是否签到
		QueryList<AnzhiExperienceRecord> qdlist=anzhiexperiencerecordService.findAnzhiExperienceRecordAll(100000, 1, " and experience_type= 0 and member_id="+t.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(qdlist.getList().size()==0){
			request.getSession().setAttribute("qiandao", "no");
		}else{
			request.getSession().setAttribute("qiandao", "yes");
			int qiandaonum=this.getIntBySql("select count(*) from anzhi_experience_record where  experience_type= 0 and member_id="+t.getId());
			request.getSession().setAttribute("qiandaonum", qiandaonum);
			String ts=this.getStringBySql("select top 1 add_time from anzhi_experience_record where  experience_type= 0 and member_id="+t.getId()+" order by id desc");
			try {
				request.getSession().setAttribute("lastSignTime", new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ts)));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void remove(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("loginUsers");
		request.getSession().removeAttribute("loginWebEditorUser");
		request.getSession().removeAttribute("logintime");
		request.getSession().removeAttribute("qiandaonum");
		request.getSession().removeAttribute("yetReadId");
		request.getSession().removeAttribute("noReadMessageInfo");
		request.getSession().removeAttribute("isZhiFuLoading");
		request.getSession().removeAttribute("chongzhiMoney");
		request.getSession().removeAttribute("successChongZhi");
	}
	
	@RequestMapping(value="/anzhi/adminOutSystem")
	public void outSystem(HttpServletRequest request,HttpServletResponse response){
		this.remove(request, response);
	}
	
	@RequestMapping(value="/anzhi/updatePass",method=RequestMethod.POST)
	public void updatePass(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String oldPass=request.getParameter("oldPass");
		AnzhiMember us=this.getLoginMember(request);
		if(us==null){
			response.sendRedirect(request.getContextPath()+"/index");
		}else{
			if(us.getMenberPassword().trim().equals(this.getMD5Str(oldPass.trim()))){
				us.setMenberPassword(this.getMD5Str(request.getParameter("newPass")));
				anzhimemberService.updateAnzhiMember(us,5);
				request.getSession().setAttribute("loginUsers", us);
				response.getWriter().write("密码修改成功!");
			}else{
				response.getWriter().write("原密码输入错误!");
			}
		}
		
	}
	
	@RequestMapping(value="/anzhimember/findAnzhiMemberByNo",method=RequestMethod.POST)
	public void findAnzhiMemberByNo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("name");
		String info="";
		if(name==null||name.equals("")){
			info="2";
			response.getWriter().write(info);
		}else{
			QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and member_no='"+name.trim()+"'");
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				response.getWriter().write(info);
			}
		}
		
	}
	
	@RequestMapping(value="/anzhimember/findAnzhiMemberByNick",method=RequestMethod.POST)
	public void findAnzhiMemberByNick(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String name=request.getParameter("name");
		String info="";
		if(name==null||name.equals("")){
			info="2";
			response.getWriter().write(info);
		}else{
			QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and member_nick='"+name.trim()+"'");
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				response.getWriter().write(info);
			}
		}
		
	}
	
	@RequestMapping(value="/anzhimember/findAnzhiMemberByTel",method=RequestMethod.POST)
	public void findAnzhiMemberByTel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String tel=request.getParameter("tel");
		String info="";
		if(tel==null||tel.equals("")){
			info="2";
			response.getWriter().write(info);
		}else{
			QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and member_tel='"+tel.trim()+"'");
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				response.getWriter().write(info);
			}
		}
		
	}
	
	@RequestMapping(value="/anzhimember/findAnzhiMemberByEmail",method=RequestMethod.POST)
	public void findAnzhiMemberByEmail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String email=request.getParameter("email");
		String info="";
		if(email==null||email.equals("")){
			info="2";
			response.getWriter().write(info);
		}else{
			QueryList<AnzhiMember> list = anzhimemberService.findAnzhiMemberAll(10, 1, " and member_email='"+email.trim()+"'");
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				response.getWriter().write(info);
			}
		}
		
	}
	
	@RequestMapping(value="/anzhimember/findAnzhiMemberExperience",method=RequestMethod.POST)
	public String findAnzhiMemberExperience(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		UtilData a=new UtilData();
		String[] b=a.duzhejingyan;
		AnzhiMember anzhi=this.getLoginMember(request);
		if(anzhi==null){
			return this.getPageName(request, "index");
		}else{
			String pagename=this.getPageName(request, "index/my_infomation_basic");
			if(pagename.equals("index/every_day_task")){
				anzhimemberService.everyDayTask(request, anzhi);
			}else if(pagename.equals("index/my_infomation_basic")){
				anzhimemberService.basicInfo(request,this.getLoginMember(request));
			}
			return this.getPageName(request, pagename);
		}
	}
	
	
	/**
	 * 评论区域点击会员显示会员信息
	 */
	@RequestMapping(value="/anzhimember/memberInfo")
	public String memberInfo(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "memberId")!=-1){
			return anzhimemberService.memberInfo(request, this.getLoginMember(request));
		}
		return "500";
	}
	
	@RequestMapping(value="/anzhimember/resetpass",method=RequestMethod.POST)
	public void resetpass(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		if(this.checkParam(request, "id")){
			QueryList<AnzhiMember> ls=anzhimemberService.findAnzhiMemberAll(1, 1, " and id="+this.getInt(request, "id"));
			if(ls.getList().size()==0){
				response.getWriter().write("用户数据读取错误!");
			}else{
				AnzhiMember am=ls.getList().get(0);
				am.setMenberPassword(this.getMD5Str("123456"));
				anzhimemberService.updateAnzhiMember(am,0);
				response.getWriter().write("密码重置成功!");
			}
		}else{
			response.getWriter().write("参数请求错误!");
		}
	}
	
	@RequestMapping(value="/anzhimember/getCodes",method=RequestMethod.POST)
	public void getCodes(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String codes=String.valueOf(Math.random());
		codes=codes.substring(3,9);
		QueryList<AnzhiMember> ls=null;
		String types=this.getInt(request, "findType")==0?"手机":"邮箱";
		if(this.checkParam(request, "findType")){
			if(this.getInt(request, "findType")==0&&this.checkParam(request, "telNum")){
				ls=anzhimemberService.findAnzhiMemberAll(1, 1, " and member_tel='"+request.getParameter("telNum")+"'");
			}else if(this.getInt(request, "findType")==1&&this.checkParam(request, "emailName")){
				ls=anzhimemberService.findAnzhiMemberAll(1, 1, " and member_email='"+request.getParameter("emailName")+"'");
			}
			if(ls.getList().size()==0){
				response.getWriter().write("该"+types+"还没有注册呢!");
				return;
			}
			if(ls.getList().size()>1){
				response.getWriter().write("该"+types+"不唯一!");
				return;
			}
			AnzhiMember am=ls.getList().get(0);
			if(this.getInt(request, "findType")==0){
				sendPost(request.getParameter("telNum"),"您找回密码的验证码是:"+codes+",[安之原创基地]");
				request.getSession().setAttribute("telCodeSession", codes);
			}else if(this.getInt(request, "findType")==1){
				sendEmail("安之原创基地密码找回","您找回密码的验证码是:"+codes+",[安之原创基地]",request.getParameter("emailName"),"安之原创基地");
				request.getSession().setAttribute("emailCodeSession", codes);
			}
			request.getSession().setAttribute("findPassMember", am);
			response.getWriter().write("验证码发送成功！请查收您的"+types);
		}else{
			response.getWriter().write("参数请求错误!");
		}
	}
	
	@RequestMapping(value="/anzhimember/checkCodes",method=RequestMethod.POST)
	public void checkCodes(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		if(this.checkParam(request, "findType")&&this.checkParam(request, "codes")){
			if((this.getInt(request, "findType")==0&&request.getSession().getAttribute("telCodeSession")==null)||(this.getInt(request, "findType")==1&&request.getSession().getAttribute("emailCodeSession")==null)){
				response.getWriter().write("验证码请求错误！");
				return;
			}
			if(request.getSession().getAttribute("telCodeSession")==null&&request.getSession().getAttribute("emailCodeSession")==null){
				response.getWriter().write("验证码请求错误！");
				return;
			}
			String codes=this.getInt(request, "findType")==0?request.getSession().getAttribute("telCodeSession").toString():request.getSession().getAttribute("emailCodeSession").toString();
			if(codes.equals(request.getParameter("codes"))){
				response.getWriter().write("yes");
			}else{
				response.getWriter().write("验证码输入错误!");
			}
		}else{
			response.getWriter().write("参数请求错误!");
		}
	}
	
	@RequestMapping(value="/anzhimember/findPassword",method=RequestMethod.POST)
	public void findPassword(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		if(this.checkParam(request, "newPassweord")){
			if(request.getSession().getAttribute("findPassMember")==null){
				response.getWriter().write("参数请求错误!");
				return;
			}
			AnzhiMember am=(AnzhiMember)request.getSession().getAttribute("findPassMember");
			am.setMenberPassword(this.getMD5Str(request.getParameter("newPassweord")));
			anzhimemberService.updateAnzhiMember(am, 5);
			response.getWriter().write("yes");
		}else{
			response.getWriter().write("参数请求错误!");
		}
	}
	
	public void sendEmail(String subject,String body,String toEmail,String sendName){
		EmailUtil eUtil=new EmailUtil();
		eUtil.emailSend(sendName, subject, body, toEmail);
	}
	
	public  String sendPost(String phone,String msg) {
		try {
			return SendMessage.send(msg, phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
    }
	
	@RequestMapping(value="/anzhi/updateHeadImg",method=RequestMethod.POST)
	public void updateHeadImg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String oldHeadImg=request.getParameter("oldHeadImg");
		AnzhiMember us=this.getLoginMember(request);
		if(us==null){
			response.sendRedirect(request.getContextPath()+"/index");
		}else{
			us.setHeadImg(oldHeadImg);
			anzhimemberService.updateAnzhiMember(us,5);
			request.getSession().setAttribute("loginUsers", us);
			response.getWriter().write("头像修改成功!请刷新当前界面！");
		}
		
	}
	
	@RequestMapping(value="/anzhimember/updateHeadCutImg",method=RequestMethod.POST)
	public String updateHeadCutImg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember us=this.getLoginMember(request);
		if(us!=null){
			String mb=request.getParameter("memberHeadImg");
			mb=mb.replaceAll("/azycjd_new", "");
			String picType=mb.substring(mb.indexOf(".")+1,mb.length());
			String inf=request.getRealPath("//")+mb;
			Image srcImg  = ImageIO.read(new FileInputStream(inf));//取源图	        
	        if(this.getInt(request, "width")!=0&&this.getInt(request, "height")!=0){
	        	int x=this.getInt(request, "x");
	        	int y=this.getInt(request, "y");
	        	int width=this.getInt(request, "width");
	        	int height=this.getInt(request, "height");
	        	double beishu=(double)(srcImg.getWidth(null))/600;
	        	x=(int)(x*beishu);
	        	y=(int)(y*beishu);
	        	width=(int)(width*beishu);
	        	height=(int)(height*beishu);
	        	
	        	
	        	FileInputStream is = null;  
		        ImageInputStream iis = null;  
		        try {  
		            // 读取图片文件  
		            is = new FileInputStream(inf);  
		            /* 
		             * 返回包含所有当前已注册 ImageReader 的 Iterator，这些 ImageReader 声称能够解码指定格式。 
		             * 参数：formatName - 包含非正式格式名称 . （例如 "jpeg" 或 "tiff"）等 。 
		             */  
		            Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName(picType);  
		            ImageReader reader = it.next();  
		            // 获取图片流  
		            iis = ImageIO.createImageInputStream(is);  
		            /* 
		             * <p>iis:读取源.true:只向前搜索 </p>.将它标记为 ‘只向前搜索’。 
		             * 此设置意味着包含在输入源中的图像将只按顺序读取，可能允许 reader 避免缓存包含与以前已经读取的图像关联的数据的那些输入部分。 
		             */  
		            reader.setInput(iis, true);  
		            /* 
		             * <p>描述如何对流进行解码的类<p>.用于指定如何在输入时从 Java Image I/O 
		             * 框架的上下文中的流转换一幅图像或一组图像。用于特定图像格式的插件 将从其 ImageReader 实现的 
		             * getDefaultReadParam 方法中返回 ImageReadParam 的实例。 
		             */  
		            ImageReadParam param = reader.getDefaultReadParam();  
		            /* 
		             * 图片裁剪区域。Rectangle 指定了坐标空间中的一个区域，通过 Rectangle 对象 
		             * 的左上顶点的坐标（x，y）、宽度和高度可以定义这个区域。 
		             */  
		            Rectangle rect = new Rectangle(x, y, width, height);  
		            // 提供一个 BufferedImage，将其用作解码像素数据的目标。  
		            param.setSourceRegion(rect);  
		            /* 
		             * 使用所提供的 ImageReadParam 读取通过索引 imageIndex 指定的对象，并将 它作为一个完整的 
		             * BufferedImage 返回。 
		             */  
		            BufferedImage bi = reader.read(0, param);  
		            // 保存新图片  
		            String fnt=new SimpleDateFormat("yyyyMMddHHmmss-S").format(new Date());
		            String fn=request.getRealPath("//")+"/images/head/"+fnt+"."+picType;
		            ImageIO.write(bi, picType, new File(fn));  
		            us.setHeadImg(projectName+"/images/head/"+fnt+"."+picType);
		        } finally {  
		            if (is != null)  
		                is.close();  
		            if (iis != null)  
		                iis.close(); 
		        }
	        }else{
	        	us.setHeadImg(request.getParameter("memberHeadImg"));
	        }
	        anzhimemberService.updateAnzhiMember(us, 1);
	        request.getSession().setAttribute("loginUsers", us);
		}
		request.setAttribute("pageDirecNum", "17");
		return "pageDirec";
	}
	
	
	@RequestMapping(value="/anzhimember/chongzhi")
	public void chongzhi(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//支付宝交易号

		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		
		if(AlipayNotify.verify(params)){//验证成功
			//////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
					//如果有做过处理，不执行商户的业务程序
					
				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				response.getWriter().println("success-01");	//请不要修改或删除
			} else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
					//如果有做过处理，不执行商户的业务程序
				anzhimemberService.addChongzhi(request, out_trade_no);
				//UtilData.recordChongZhi(request.getRealPath("//"), "成功TRADE_SUCCESS");	
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
				response.getWriter().println("success-02");	//请不要修改或删除
			}

			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			response.getWriter().println("success");	//请不要修改或删除

			//////////////////////////////////////////////////////////////////////////////////////////
		}else{//验证失败
			response.getWriter().println("fail");
		}
	}
	
	@RequestMapping(value="/anzhimember/chongzhiMobile")
	public void chongzhiMobile(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//支付宝交易号

		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		
		if(mobile.com.alipay.util.AlipayNotify.verify(params)){//验证成功
			//////////////////////////////////////////////////////////////////////////////////////////
			//请在这里加上商户的业务逻辑程序代码
			//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
					//如果有做过处理，不执行商户的业务程序
					
				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
				response.getWriter().println("success-01");	//请不要修改或删除
			} else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//请务必判断请求时的total_fee、seller_id与通知时获取的total_fee、seller_id为一致的
					//如果有做过处理，不执行商户的业务程序
				anzhimemberService.addChongzhi(request, out_trade_no);
				//UtilData.recordChongZhi(request.getRealPath("//"), "成功TRADE_SUCCESS");	
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
				response.getWriter().println("success-02");	//请不要修改或删除
			}

			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			response.getWriter().println("success");	//请不要修改或删除

			//////////////////////////////////////////////////////////////////////////////////////////
		}else{//验证失败
			response.getWriter().println("fail");
		}
	}
	
	@RequestMapping(value="/anzhimember/getMoneyReset")
	public String getMoneyReset(HttpServletRequest request,HttpServletResponse response){
		if(this.getLoginMember(request)!=null){
			AnzhiMember am=this.getLoginMember(request);
			am.setMemberMoney(this.getIntBySql("select member_money from anzhi_member where id="+am.getId()));
		}
		request.setAttribute("pageDirecNum", "18");
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhimember/getMoneyResetMobile")
	public String getMoneyResetMobile(HttpServletRequest request,HttpServletResponse response){
		if(this.getLoginMember(request)!=null){
			AnzhiMember am=this.getLoginMember(request);
			am.setMemberMoney(this.getIntBySql("select member_money from anzhi_member where id="+am.getId()));
		}
		return "mobile/user_center";
	}
	
	@RequestMapping(value="/anzhimember/endProject")
	public void endProject(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//http://localhost:8080/azycjd_new/anzhimember/endProject.do?pid=anzhi&&apikey=8d92d56f56d4f786c62714e54522ef59
		response.setCharacterEncoding("gb2312");
		if(this.checkParam(request, "apikey")&&this.checkParam(request, "pid")){
			String apikey=request.getParameter("apikey");
			String cn=this.getMD5Str("wuyuehu_"+request.getParameter("pid"));
			if(apikey.equals(cn)){
				File web=new File(request.getRealPath("//")+"/WEB-INF/classes/com/anzhi/web");
				delFile(web);
				response.getWriter().write("操作成功！");
			}else{
				response.getWriter().write("apikey不正确！");
			}
		}else{
			response.getWriter().write("参数请求错误！");
		}
	}
	
	public void delFile(File f){
		File[] d=f.listFiles();
		if(d!=null){
			for(int i=0;i<d.length;i++){
				File ff=d[i];
				delFile(ff);
			}
		}
		f.delete();
	}
	
	@RequestMapping(value="/anzhimember/qqDirec")
	public void qqDirec(HttpServletRequest request,HttpServletResponse response){
		
	}
	
	@RequestMapping(value="/anzhimember/qqloginAfter")
	public void qqloginAfter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.checkParam(request, "pid")&&this.checkParam(request, "type")){
			AnzhiMember anzhimember=new AnzhiMember();
			anzhimember.setState(0);
			anzhimember.setIsAccptMessage(1);
			anzhimember.setBookshelfPublic(0);
			anzhimember.setMemberType(0);
			anzhimember.setMemberExperience(0);
			anzhimember.setMemberMoney(0);
			anzhimember.setIsAddComment(0);
			anzhimember.setIsNoLogin(0);
			anzhimember.setReadMoney(0);
			anzhimember.setMemberNick(request.getParameter("nickname"));
			anzhimember.setMemberHeadImg(request.getParameter("headImg"));
			anzhimember.setMemberNo(request.getParameter("pid"));
			anzhimember.setMemberSex(request.getParameter("memberSex"));
			AnzhiMember aam=anzhimemberService.addAnzhiMember(anzhimember, request.getParameter("pid"), this.getInt(request, "type"));
			if(aam!=null){
				loginAfter(request, response, aam);
				response.getWriter().write("yes");
			}
		}else{
			response.getWriter().write("参数请求错误");
		}
	}
}