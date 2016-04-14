package com.anzhi.web.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ynzc.wuyuehu.ExcelExport;

import com.anzhi.web.pojo.AnzhiBenefit;
import com.anzhi.web.pojo.AnzhiDiscounted;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiNovelPartInfo;
import com.anzhi.web.pojo.AnzhiOtherContent;
import com.anzhi.web.pojo.AnzhiPicture;
import com.anzhi.web.pojo.NovelFansList;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiDiscountedService;
import com.anzhi.web.service.IAnzhiNovelMultifunctionService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IAnzhiOtherContentService;
import com.anzhi.web.service.IAnzhiPictureService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
@Controller
public class AnzhiNovelController extends GetCondition {
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiDiscountedService anzhidiscountedService;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiChapterService anzhichapterService;
	@Autowired
	private IAnzhiNovelMultifunctionService anzhinovelmultifunctionService;
	@Autowired
	private IAnzhiPictureService anzhipictureService;
	@Autowired
	private IAnzhiOtherContentService anzhiothercontentService;
	@RequestMapping(value="/anzhinovel/addAnzhiNovelNew",method=RequestMethod.POST)
	public String addAnzhiNovelNew(HttpServletRequest request,HttpServletResponse response,AnzhiNovel anzhinovel){
		if(request.getSession().getAttribute("addAnzhiNovelSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelSession","true");
				if(anzhinovel.getId()==null||anzhinovel.getId()==0){
					if(this.checkParam(request, "step")&&request.getParameter("step").equals("one")){
						anzhinovel.setAuthorId(this.getLoginMemberId(request));
						anzhinovel.setUpdateTime(getTimestamp());
						anzhinovel.setHtmlState(0);
						anzhinovel.setClickNum(0);
						anzhinovel.setAuthorizationLevel(0);
						anzhinovel.setEnName("");
						anzhinovel.setReadNum(0);
						anzhinovel.setIsJinbi(0);
						anzhinovel.setIsSigned(0);
						anzhinovel.setIsWangwen(0);
						anzhinovel.setTotalCharNum(0);
						anzhinovel.setTotalRecommand(0);
						anzhinovel.setTotalSaveNum(0);
						anzhinovel.setTotalDingyueNum(0);  
						anzhinovel.setTotalShangNum(0);
						anzhinovel.setTotalCommentNum(0);
						request.getSession().removeAttribute("firstStepNovel");
						request.getSession().setAttribute("firstStepNovel", anzhinovel);
						return "index/line_newproject_chapter";
					}else if(this.checkParam(request, "step")&&request.getParameter("step").equals("two")){
						if(request.getSession().getAttribute("firstStepNovel")==null){
							return "index/line_newproject.jsp";
						}
						AnzhiNovel an=(AnzhiNovel)request.getSession().getAttribute("firstStepNovel");
						int id=anzhinovelService.addAnzhiNovel(request,an);
						request.setAttribute("addnovelId", id);
					}
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelSession");
			}
		}
		request.setAttribute("pageDirecNum", "12");
		return "pageDirec";
	}
	
	@RequestMapping(value="/anzhinovel/addAnzhiNovel",method=RequestMethod.POST)
	public void addAnzhiNovel(HttpServletRequest request,HttpServletResponse response,AnzhiNovel anzhinovel){
		if(request.getSession().getAttribute("addAnzhiNovelSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelSession","true");
				if(anzhinovel.getId()==null||anzhinovel.getId()==0){
					
				}else{
					QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(10, 1, " and id="+anzhinovel.getId(),"id");
					if(list.getList().size()!=0){
						AnzhiNovel a=list.getList().get(0);
						boolean con=false;
						a.setAuthorizationLevel(anzhinovel.getAuthorizationLevel());
						a.setNovelImg(anzhinovel.getNovelImg());
						a.setNovelLabel(anzhinovel.getNovelLabel());
						a.setNovelSummary(anzhinovel.getNovelSummary());
						//如果是已经签约并且修改了作品名称，需要审核
						if(a.getIsSigned().equals(1)&&!a.getNovelTitle().equals(anzhinovel.getNovelTitle())){
							con=true;//需要审核
						}else{
							a.setNovelTitle(anzhinovel.getNovelTitle());
						}
						a.setNovelType(anzhinovel.getNovelType());
						a.setCategories(anzhinovel.getCategories());
						a.setMyEditor(anzhinovel.getMyEditor());
						a.setState(anzhinovel.getState());
						a.setLeadingRole(anzhinovel.getLeadingRole());
						a.setSupportingRole(anzhinovel.getSupportingRole());
						a.setVote(anzhinovel.getVote());
						anzhinovelService.updateAnzhiNovel(request,a,con,anzhinovel.getNovelTitle());
						anzhinovelService.createNovel(request.getRealPath("//"), a.getId());
						response.sendRedirect(request.getContextPath()+"/anzhinovel/findAnzhiNovelManage.do");
					}
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhinovel/findAnzhiNovelManage")
	public String findAnzhiNovelManage(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		AnzhiMember am=this.getLoginMember(request);
		if(am!=null){
			if(am.getMemberType().equals(0)){//说明是读者，非法请求
				condition+=" and 1=3";
			}else /*if(this.getLoginMember(request).getMemberType().equals(1))*/{//说明是作家，则只加载自己的作品
				condition+=" and author_id="+this.getLoginMemberId(request);
			}
			anzhinovelService.findAnzhiNovelManage(request, size, pageNum, condition, "id");
		}
		request.getSession().setAttribute("linenumber", 11);
		return this.getPageName(request, "index/line_projectManage");          
	}

	@RequestMapping(value="/anzhinovel/addBatchAnzhiNovel",method=RequestMethod.POST)
	public String addBatchAnzhiNovel(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiNovel> list=new ArrayList<AnzhiNovel>();
		anzhinovelService.addBatchAnzhiNovel(list);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovel/delAnzhiNovel",method=RequestMethod.POST)
	public void delAnzhiNovel(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiNovelSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiNovelSession","true");
				int id=request.getParameter("anzhinovelId")==null?0:Integer.parseInt(request.getParameter("anzhinovelId"));
				anzhinovelService.delAnzhiNovel(id);
				response.sendRedirect(request.getContextPath()+"/anzhinovel/findAnzhiNovelAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiNovelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhinovel/delBatchAnzhiNovel",method=RequestMethod.POST)
	public String delBatchAnzhiNovel(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhinovelIds");
		anzhinovelService.delBatchAnzhiNovel(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovel/updateAnzhiNovel",method=RequestMethod.POST)
	public String updateAnzhiNovel(HttpServletRequest request,HttpServletResponse response,AnzhiNovel anzhinovel){
		if(request.getSession().getAttribute("updateAnzhiNovelSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiNovelSession","true");
				anzhinovelService.updateAnzhiNovel(request,anzhinovel,false,"");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiNovelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhinovel/findAnzhiNovelAll")
	public String findAnzhiNovelAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		condition+=" and state>1";
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(size, pageNum, condition,"id");
		request.setAttribute("anzhinovelList", list);
		return this.getPageName(request, "admin/AnzhiNovelManager");
	}

	@RequestMapping(value="/anzhinovel/findAnzhiNovelById")
	public String findAnzhiNovelById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(10, 1, " and id="+Integer.parseInt(request.getParameter("novelId")),"id");
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		anzhinovelService.lineNewproject(request);
		request.getSession().setAttribute("novelAction", "novelAction");
		return this.getPageName(request, "admin/index");
	}

	@RequestMapping(value="/anzhinovel/anzhinovelAction",method=RequestMethod.POST)
	public String anzhinovelAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiNovelAction");
	}
	
	@RequestMapping(value="/anzhinovel/loadDaShangJsp")
	public String loadDaShangJsp(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "novelId")!=-1){
			AnzhiMember am=this.getLoginMember(request);
			if(am==null||am.getId()==null){
				return this.getPageName(request, "500");
			}else{
				anzhinovelService.loadDaShangJsp(request, am);
				return this.getPageName(request, "da_shang_novlel");
			}
		}else{
			return this.getPageName(request, "500");
		}
	}
	
	/**
	 * 添加推荐时查找推荐的小说
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/findAnzhiNovelByIdTuijian",method=RequestMethod.POST)
	public void findAnzhiNovelByIdTuijian(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String id=request.getParameter("novelId");
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(10, 1, " and id="+Integer.parseInt(request.getParameter("novelId")),"id");
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		QueryList<AnzhiDiscounted> ls=anzhidiscountedService.findAnzhiDiscountedAll(10, 1, " and novel_id="+id);
		String type=request.getParameter("type");
		String info="";
		if(type!=null&&type.equals("1")){
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				info="1";
				request.setAttribute("anzhiNovel", list.getList().get(0));
				//String aa=(String) this.getObjectByField("anzhi_author", list.getList().get(0).getAuthorId(), "author_writer_name");
				response.getWriter().write(info+";"+list.getList().get(0).getNovelTitle()+";"+list.getList().get(0).getAuthorWriterName()+";");
			}
		}else if(type!=null&&type.equals("2")){
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else{
				if(ls.getList().size()==0){
					info="1";
					request.setAttribute("anzhiNovel", list.getList().get(0));
					//String aa=(String) this.getObjectByField("anzhi_author", list.getList().get(0).getAuthorId(), "author_writer_name");
					response.getWriter().write(info+";"+list.getList().get(0).getNovelTitle()+";"+list.getList().get(0).getAuthorWriterName()+";");
				}else{
					info="2";
					response.getWriter().write(info);
				}
				
			}
		}
		
	}

	/**
	 * 书库操作
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/shuku",method=RequestMethod.POST)
	public String shuku(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		String orderField="id";
		if(this.checkParam(request, "bigType")){
			if(this.checkParam(request, "smallType")){
				String[] arr=request.getParameter("smallType").split(",");
				String smallTypeChar="";
				for(String s:arr){
					smallTypeChar+="'"+s+"',";
				}
				smallTypeChar=smallTypeChar.equals("")?"":smallTypeChar.substring(0, smallTypeChar.length()-1);
				condition+=" and id in(select novel_id from anzhi_novel_type where big_type='"+request.getParameter("bigType")+"' and small_type in("+smallTypeChar+") group by novel_id)";
			}else{
				condition+=" and id in(select novel_id from anzhi_novel_type where big_type='"+request.getParameter("bigType")+"' group by novel_id)";
			}
		}
		if(this.checkParam(request, "zishu")){
			if(request.getParameter("zishu").equals("100万字以上")){
				condition+=" and total_char_num>=1000000";
			}else if(request.getParameter("zishu").equals("50万-100万字")){
				condition+=" and total_char_num>=500000 and total_char_num<1000000";
			}else if(request.getParameter("zishu").equals("30万-50万字")){
				condition+=" and total_char_num>=300000 and total_char_num<500000";
			}else if(request.getParameter("zishu").equals("10万-30万字")){
				condition+=" and total_char_num>=100000 and total_char_num<300000";
			}else if(request.getParameter("zishu").equals("10万字")){
				condition+=" and total_char_num>100000";
			}
		}
		if(this.checkParam(request, "xiezuo")){
			if(request.getParameter("xiezuo").equals("连载")){
				condition+=" and state=2";
			}else if(request.getParameter("xiezuo").equals("全本")){
				condition+=" and state=3";
			}
		}
		if(this.checkParam(request, "paixu")){
			if(request.getParameter("paixu").equals("最新更新")){
				orderField="update_time";
			}else if(request.getParameter("paixu").equals("点击最高")){
				orderField="click_num";
			}else if(request.getParameter("paixu").equals("收藏最多")){
				orderField="total_save_num";
			}else if(request.getParameter("paixu").equals("打赏最多")){
				orderField="total_shang_num";
			}else if(request.getParameter("paixu").equals("评论最多")){
				orderField="total_comment_num";
			}else if(request.getParameter("paixu").equals("订阅最多")){
				orderField="total_dingyue_num";
			}else if(request.getParameter("paixu").equals("人气最高")){ 
				orderField="click_num";
			}
		}
		if(this.checkParam(request, "shijian")){
			int days=request.getParameter("shijian").equals("一周之内")?7:30;
			condition+=" and add_time between '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"' and '"+getDateStr(new Timestamp(new Date().getTime()),days,true)+"'";
		}
		condition+=" and state>1 ";
		if(size<0){
			size=0;
		}
		QueryList<AnzhiNovel> list = anzhinovelService.shuku(size, pageNum, condition,orderField);
		request.setAttribute("anzhinovelList", novelTypeChange(list));
		return this.getPageName(request, "article_list");
	}

	/**
	 * 异步加载小说详细数据、小说的粉丝、打赏记录、评论记录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/loadNovelDeTail",method=RequestMethod.POST)
	public void loadNovelDeTail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int novelId=this.getInt(request, "novelId");
		if(novelId!=-1){
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(anzhinovelService.getNovelMoreData(request,novelId,this.getLoginMemberId(request)));
		}
	}

	/**
	 * 异步加载同类型小说
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/loadSameTypeNovel",method=RequestMethod.POST)
	public String loadSameTypeNovel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int novelId=this.getInt(request, "novelId");
		if(novelId!=-1){
			anzhinovelService.loadSameTypeNovel(request,novelId);
		}
		return "article_list";
	}
	
	/**
	 * 书籍类型操作
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/recommand",method=RequestMethod.POST)
	public String recommand(HttpServletRequest request,HttpServletResponse response){
		
		/*int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		condition+=" and state>1";
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(size, pageNum, condition,"id");
		request.setAttribute("anzhinovelList", list);*/
		return anzhinovelService.recommand(request);
	}
	
	/**
	 * 排行榜
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/leaderboard")
	public String leaderboard(HttpServletRequest request,HttpServletResponse response) throws IOException{
		if(this.checkParam(request, "loadData")&&request.getParameter("loadData").equals("yes")){
			if(request.getSession().getAttribute("sessionShouyetoubu")==null){
				QueryList<AnzhiPicture> list = anzhipictureService.findAnzhiPictureAll(500, 1, " and state=1");
				String[] pictureTypeSesion=new String[]{"sessionShouyetoubu","sessionPaihangbang","sessionZuojiafuli","sessionDashentuijian","sessionHezuoqudaotoubu","sessionBianjizhuanqutoubu","sessionBanquanweihutoubu","sessionHuodongzhuanqu","sessionYonghuzhinantoubu","sessionZuozhetougaotoubu","sessionChenpinyingcaitoubu","sessionLianxiwomentoubu","sessionGonggao","sessionZaixianchongzhi","sessionZuojiafulitoubu"};
				for(AnzhiPicture ap:list.getList()){
					request.getSession().setAttribute(pictureTypeSesion[ap.getPictureType()], ap.getPictureUrl());
				}
				request.getSession().setAttribute("isLoadPicData","yes");
				QueryList<AnzhiOtherContent> ot=anzhiothercontentService.findAnzhiOtherContentAll(1, 1, null);
				if(ot.getList().size()!=0){
					request.getSession().setAttribute("otherContent",ot.getList().get(0));
				}
			}
			anzhinovelService.leaderboard(request);
			return "novel_list";
		}
		return "paihangbang";
	}
	
	/**
	 * 排行榜
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/createHtml")
	public void createHtml(HttpServletRequest request,HttpServletResponse response) throws IOException{
		anzhinovelService.createPaiHangBangJsp(request.getRealPath("//"), request);
		
	}
	
	/**
	 * 排行榜具体类型更多数据
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/morePahangbang")
	public String morePahangbang(HttpServletRequest request,HttpServletResponse response) throws IOException{
		anzhinovelService.morePahangbang(request);
		request.setAttribute("ds", paihangbang);
		return "detail_list";
	}
	
	/**
	 * 优惠书坊
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/youhuishufang")
	public String youhuishufang(HttpServletRequest request,HttpServletResponse response) throws IOException{
		anzhinovelService.youhuishufang(request);
		return "discount";
	}
	
	/**
	 * 管理员对删文审核
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/delNovelCheck")
	public String delNovelCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinNovel> ls=anzhinovelService.findAnzhiNovelMultiJoinNovelAll(size, pageNum, " and action_type=6", "id");
		request.setAttribute("anzhinovelList", ls);
		return "admin/delNovelCheck";
	}
	
	/**
	 * 申请签约
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/signedCheck")
	public String signedCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinNovel> ls=anzhinovelService.findAnzhiNovelMultiJoinNovelAll(size, pageNum, " and action_type=11", "id");
		request.setAttribute("anzhinovelList", ls);
		return "admin/dSignedCheck";
	}
	
	/**
	 * 签约书籍管理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/signedManage")
	public String signedManage(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		condition+=" and is_signed=1 and (state=2 or state=3)";
		QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(size, pageNum, condition, "id");
		request.setAttribute("anzhinovelList", ls);
		request.setAttribute("novelStateArr", novelStateArr);
		return "admin/signedManage";
	}
	
	/**
	 * 自主下架
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/novelDownCheck")
	public String novelDownCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinNovel> ls=anzhinovelService.findAnzhiNovelMultiJoinNovelAll(size, pageNum, " and action_type=8", "id");
		request.setAttribute("anzhinovelList", ls);
		return "admin/dNovelDownCheck";
	}
	
	/**
	 * 自主上架
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/novelUpCheck")
	public String novelUpCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinNovel> ls=anzhinovelService.findAnzhiNovelMultiJoinNovelAll(size, pageNum, " and action_type=7", "id");
		request.setAttribute("anzhinovelList", ls);
		return "admin/dNovelUpCheck";
	}
	
	/**
	 * 作家修改作品名称审核
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/novelTitleUpdateCheck")
	public String novelTitleUpdateCheck(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovelMultiJoinNovel> ls=anzhinovelService.findAnzhiNovelMultiJoinNovelAll(size, pageNum, " and action_type=13", "id");
		request.setAttribute("anzhinovelList", ls);
		return "admin/novelTitleUpdateCheck";
	}
	
	/**
	 * 解约
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/noSigned",method=RequestMethod.POST)
	public void noSigned(HttpServletRequest request,HttpServletResponse response){
		if(this.getInt(request, "novelId")!=-1){
			this.updateTableField("anzhi_novel", this.getInt(request, "novelId"), "is_signed", 0);
		}
	}
	
	/**
	 * 添加推荐时查找推荐的小说
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/findAnzhiNovelByName",method=RequestMethod.POST)
	public void findAnzhiNovelByName(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		String novelTitle=request.getParameter("novelTitle").trim();
		//String ntitle=new String(novelTitle.getBytes("ISO-8859-1"),"UTF-8");
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(10, 1, " and novel_title='"+novelTitle+"'","id");
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		String type=request.getParameter("type");
		String info="";
		if(type!=null&&type.equals("1")){
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else if(list.getList().size()>1){
				info="3";
				response.getWriter().write(info);
			}else{
				info="1";
				request.setAttribute("anzhiNovel", list.getList().get(0));
				//String aa=(String) this.getObjectByField("anzhi_author", list.getList().get(0).getAuthorId(), "author_writer_name");
				response.getWriter().write(info+";"+list.getList().get(0).getId()+";"+list.getList().get(0).getAuthorWriterName()+";");
			}
		}else if(type!=null&&type.equals("2")){
			if(list.getList().size()==0){
				info="0";
				response.getWriter().write(info);
			}else if(list.getList().size()>1){
				info="3";
				response.getWriter().write(info);
	    	}else if(list.getList().size()==1){
				QueryList<AnzhiDiscounted> ls=anzhidiscountedService.findAnzhiDiscountedAll(10, 1, " and novel_id="+list.getList().get(0).getId());
				if(ls.getList().size()==0){
					info="1";
					request.setAttribute("anzhiNovel", list.getList().get(0));
					//String aa=(String) this.getObjectByField("anzhi_author", list.getList().get(0).getAuthorId(), "author_writer_name");
					response.getWriter().write(info+";"+list.getList().get(0).getId()+";"+list.getList().get(0).getAuthorWriterName()+";");
				}else{
					info="2";
					response.getWriter().write(info);
				}
				
			}
		}
		
	}
	
	/*
	 * 换一批
	 */
	@RequestMapping(value="/anzhinovel/findAnzhiNovelchangeyipi",method=RequestMethod.POST)
	public String findAnzhiNovelchangeyipi(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):2;
		int pageNum=this.getPageNum(request);
		String type=request.getParameter("menutype");
		QueryList<AnzhiNovel> morelist = anzhinovelService.findAnzhiNovelAll(size, pageNum, "", "recommand_time", type);
		if(pageNum>morelist.getTotalNum()){
			try {
				pageNum=pageNum%morelist.getTotalNum();
			} catch (Exception e) {
				pageNum=1;
			}
			morelist = anzhinovelService.findAnzhiNovelAll(size, pageNum, "", "recommand_time", type);
		}
		request.setAttribute("morelist", morelist);
		return "huanyipi";
	}
	
	/**
	 * 搜书
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/search",method=RequestMethod.POST)
	public String search(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		condition+=" and state>1";
		if(this.checkParam(request, "novelTitles")){
			condition+=" and (novel_label like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%' or author_writer_name like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%' or novel_title like '%"+StringEscapeUtils.escapeSql(request.getParameter("novelTitles").trim())+"%')";
		}else{
			condition+=" and 1=2";
		}
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(size, pageNum, condition,"id");
		request.setAttribute("anzhinovelList", list);
		return this.getPageName(request, "search");
	}
	
	/**
	 * 作者查找自己的小说
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="/anzhinovel/findAnzhiNovelByMyziji",method=RequestMethod.POST)
	public String findAnzhiNovelByMyziji(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id=this.getLoginMemberId(request);
		if(id==-1){
			response.sendRedirect(request.getContextPath()+"/index.html");
		}
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(1000, 1, " and author_id="+id+" and is_signed=1","id");
		request.setAttribute("AnzhiNovelList", list);
		request.setAttribute("AnzhiNovelListsize", list.getList().size());
		return this.getPageName(request, "index/line_apply_benefit");   
	}
	
	/**
	 * 首页类型操作
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/anzhinovel/index",method=RequestMethod.POST)
	public String index(HttpServletRequest request,HttpServletResponse response){
		return anzhinovelService.index(request);
	}
	
	@RequestMapping(value="/anzhinovel/getNovelInfo",method=RequestMethod.POST)
	public void getNovelInfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		QueryList<AnzhiNovel> ls=null;
		if(this.checkParam(request, "novelId")){
			ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and id="+Integer.parseInt(request.getParameter("novelId")),"id");
		}else if(this.checkParam(request, "novelTitle")){
			ls=anzhinovelService.findAnzhiNovelAll(1, 1, " and novel_title='"+request.getParameter("novelTitle")+"'","id");
		}
		if(ls==null||ls.getList().size()==0){
			response.getWriter().write("{success:'no'}");
		}else{
			AnzhiNovel an=ls.getList().get(0);
			response.getWriter().write("{success:'yes',novelNo:'"+an.getId()+"',authorName:'"+an.getAuthorWriterName()+"',novelId:'"+an.getId()+"',novelTitle:'"+an.getNovelTitle()+"'}");
		}
	}
	
	@RequestMapping(value="/anzhinovel/adminUpdateAnzhiNovel",method=RequestMethod.POST)
	public void adminUpdateAnzhiNovel(HttpServletRequest request,HttpServletResponse response,AnzhiNovel anzhinovel){
		if(request.getSession().getAttribute("addAnzhiNovelSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiNovelSession","true");
				if(anzhinovel.getId()==null||anzhinovel.getId()==0){
					
				}else{
					QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(10, 1, " and id="+anzhinovel.getId(),"id");
					if(list.getList().size()!=0){
						AnzhiNovel a=list.getList().get(0);
						
						a.setNovelImg(anzhinovel.getNovelImg());
						a.setNovelLabel(anzhinovel.getNovelLabel());
						a.setNovelSummary(anzhinovel.getNovelSummary());
						a.setNovelTitle(anzhinovel.getNovelTitle());
						a.setNovelType(anzhinovel.getNovelType());
						a.setCategories(anzhinovel.getCategories());
						a.setMyEditor(anzhinovel.getMyEditor());
						a.setVote(anzhinovel.getVote());
						a.setPostedWay(anzhinovel.getPostedWay());
						a.setIsJinbi(anzhinovel.getIsJinbi());
						a.setIsSigned(anzhinovel.getIsSigned());
						a.setIsWangwen(anzhinovel.getIsWangwen());
						anzhinovelService.updateAnzhiNovel(request,a,false,"");
						//重新生成小说
						anzhinovelService.createNovel(request.getRealPath("//"), a.getId());
						response.sendRedirect(request.getContextPath()+"/anzhinovel/findAnzhiNovelAll.do");
						
					}
				}
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiNovelSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}
	
	@RequestMapping(value="/anzhinovel/searchNovelData",method=RequestMethod.POST)
	public String searchNovelData(HttpServletRequest request,HttpServletResponse response){
		String condition=this.getCondition(anzhinovelConditionArr, request, response);
		if(this.checkParam(request, "includeAuthor")&&request.getParameter("includeAuthor").equals("yes")){
			condition+=" or author_writer_name='"+request.getParameter("novelTitle")+"'";
		}
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(100, 1, condition,"id");
		request.setAttribute("anzhinovelList", list);
		return "admin/searchNovelTable";
	}
	
	@RequestMapping(value="/anzhinovel/webEditorShuPing")
	public String webEditorShuPing(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(size, pageNum,null, "id");
		request.setAttribute("anzhinovelList", ls);
		request.setAttribute("novelStateArr", novelStateArr);
		return "admin/webEditorShuPing";
	}
	
	@RequestMapping(value="/anzhinovel/lineNewproject")
	public String lineNewproject(HttpServletRequest request,HttpServletResponse response){
		anzhinovelService.lineNewproject(request);
		return "index/line_newproject";
	}
	
	@RequestMapping(value="/anzhinovel/loadNeedDoTaskNum")
	public void loadNeedDoTaskNum(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(anzhinovelService.loadNeedDoTaskNum(request));
	}
	
	@RequestMapping(value="/anzhinovel/wangzhanhtmlstate")
	public void wangzhanhtmlstate(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		if(this.checkParam(request, "tableId")&&this.checkParam(request, "state")){
			int state=this.getInt(request, "state");
			if(state==0 ||state==1){
				if(state==1){//网站上架
					int n=this.getIntBySql("select count(*) from anzhi_novel_multifunction where novel_id="+this.getInt(request, "tableId")+" and action_type=16");
					if(n!=0){
						response.getWriter().write("该小说已经网站上架了！");
					}else{
						//添加一条网站上架 记录
						AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
						anm.setActionType(16);
						anm.setAddTime(getTimestamp());
						anm.setMemberId(0);
						anm.setNovelId(this.getInt(request, "tableId"));
						anm.setState(0);
						anm.setVote("网站上架记录");
						anzhinovelmultifunctionService.addAnzhiNovelMultifunction(anm);
						anzhinovelService.createNovel(request.getRealPath("//"), this.getInt(request, "tableId"));
						response.getWriter().write("网站上架成功！");
					}
				}else if(state==0){
					anzhinovelmultifunctionService.delAnzhiNovelMultifunction(this.getInt(request, "tableId"), 0, 16);
					anzhinovelService.createNovel(request.getRealPath("//"), this.getInt(request, "tableId"));
					response.getWriter().write("网站下架成功！");
				}
			}
		}
	}
	
	@RequestMapping(value="/anzhinovel/loadNovelInfo")
	public void loadNovelInfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		JSONObject jsonBack=new JSONObject();
		JSONArray arr=new JSONArray();
		if(this.checkParam(request, "novelId")){
			QueryList<AnzhiNovel> ls=anzhinovelService.findAnzhiNovelAll(10, 1, " and id="+this.getInt(request, "novelId"), "id");
			if(ls.getList().size()!=0){
				AnzhiNovel an=ls.getList().get(0);
				AnzhiNovelPartInfo p=new AnzhiNovelPartInfo();
				p.setAuthorWriter(an.getAuthorWriterName());
				p.setClickNum(an.getClickNum()+"");
				p.setNovelId(this.getInt(request, "novelId"));
				p.setNovelImg(an.getNovelImg());
				p.setNovelTitle(an.getNovelTitle());
				p.setNovelVote(an.getVote());
				p.setReadNum(an.getReadNum()+"");
				arr.add(JSONObject.fromObject(p));
			}
		}
		jsonBack.put("data", arr);
		out.print(jsonBack);
	}
	
	//生成txt
	@RequestMapping(value="/anzhinovel/txt")
	public void downExcel(HttpServletRequest request,HttpServletResponse response) throws IOException{	
		response.setContentType("text/html;charset=utf-8");
		if(request.getSession().getAttribute("loginUsers")!=null&&this.getInt(request, "novelId")!=-1){
			
			ynzc.wuyuehu.ExcelExport ee=new ExcelExport();
			File fff=anzhichapterService.novelTxt(request.getRealPath("//"),this.getInt(request, "novelId"));
			FileInputStream fins=new FileInputStream(fff);
	        OutputStream outputs=response.getOutputStream();
	        byte[] bufs=new byte[fins.available()];
	        int rs=0;
			FileInputStream fss = null;
			try {
				fss = new FileInputStream(new File(fff.toString()));
			}catch(FileNotFoundException e) {
				e.printStackTrace();
			}

			String filename=fff.getName();
			//设置响应头和保存文件名 
			
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") >0){
				filename = new String(filename.getBytes("UTF-8"), "ISO8859-1");//firefox浏览器
			}else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") >0){
				filename = URLEncoder.encode(filename, "UTF-8");//IE浏览器
			}
			response.reset();//
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
			response.setHeader("Connection", "close");
			
			//写出流信息
			int bs = 0;
			try {
				while((rs=fins.read(bufs,0,bufs.length))!=-1)
		        {
		            outputs.write(bufs,0,rs);//response.getOutputStream()
		        }
		        fins.close();
		        outputs.close();
		       
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("下载文件失败!");
			}
		}
	}
	
	//查询更多粉丝
	@RequestMapping(value="/anzhinovel/moreFenSi")
	public String moreFenSi(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String novelId=request.getParameter("novelId");
		if(Integer.parseInt(novelId)>0){
			List<NovelFansList> fansiList=anzhinovelService.findmoreFanSi(Integer.parseInt(novelId));
			QueryList<AnzhiNovel> xiaoshuo=anzhinovelService.findAnzhiNovelAll(1, 1, " and id ="+novelId, "id");
			request.setAttribute("xiaoshuo", xiaoshuo.getList().get(0));
			for(NovelFansList p:fansiList){
				//设置粉丝等级
				String[] arr=fensijifen;	
				for(int i=arr.length-1;i>=0;i--){
					if(!arr[i].equals(",")){
						String[] tmps=arr[i].split(",");
							p.setLevelName(tmps[1]);
						if(p.getTotalMoney()>=Integer.parseInt(tmps[0])){
							break;
						}
					}
				}
			}
			request.setAttribute("fansiList", fansiList);
		}
		return "fansi_list";
		
	}
	
	@RequestMapping(value="/anzhinovel/loadSameNovel")
	public String loadSameNovel(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiNovel> sameTypeNovelList=anzhinovelService.findAnzhiNovelAll(5, 1, " and id in (select novel_id from anzhi_novel_type where big_type='"+request.getParameter("novelType")+"' group by novel_id)", "id");
		request.setAttribute("anzhinovelList", sameTypeNovelList);
		return "article_list";
	}
}

