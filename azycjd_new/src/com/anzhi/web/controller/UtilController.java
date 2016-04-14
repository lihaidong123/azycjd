package com.anzhi.web.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiMessageService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.service.ImportDataServie;
import com.anzhi.web.util.GetCondition;

@Controller
public class UtilController  extends GetCondition{
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiMessageService anzhimessageService;
	@Autowired
	private ImportDataServie importDataServie;
	@RequestMapping(value="/util/updateMessageState",method=RequestMethod.POST)
	public void updateMessageState(HttpServletRequest request,HttpServletResponse response){
		if(this.checkParam(request, "id")){
			this.updateTableField("anzhi_message", this.getInt(request, "id"), "message_read", 1+"");
			anzhimessageService.loadNoReadMessage(request, this.getLoginMember(request));
		}
	}
	
	@RequestMapping(value="/util/createData",method=RequestMethod.POST)
	public void createData(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		AnzhiMember am=this.getLoginMember(request);
		try {
			if(am.getMemberType().equals(2)){
				int createType=this.getInt(request, "createType");
				if(createType!=-1){
					response.getWriter().write(utilService.createDataService(request.getRealPath("//")));
				}else{
					response.getWriter().write("请求参数非法!");
				}
			}else{
				response.getWriter().write("非管理员请勿执行本操作!");
			}
		} catch (Exception e) {
			response.getWriter().write("非管理员请勿执行本操作!");
		}
	}
	
	
	@RequestMapping(value="/util/delRecord",method=RequestMethod.POST)
	public void delRecord(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(am==null){
			response.getWriter().write("您还没有登录呢");
			return;
		}
		if(this.getInt(request, "tableId")==-1||this.getInt(request, "tabNameIndex")==-1||this.getInt(request, "actionType")==-1||this.getInt(request, "stateValue")==-1){
			response.getWriter().write("参数请求错误");
			return;
		}
		response.getWriter().write(utilService.delRecord(this.getInt(request, "tableId"),this.getInt(request, "tabNameIndex"),am,this.getInt(request, "actionType"),this.getInt(request, "stateValue"),request.getParameter("vote")));
	}
	
	@RequestMapping(value="/util/updateRecord",method=RequestMethod.POST)
	public void updateRecord(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");
		AnzhiMember am=this.getLoginMember(request);
		if(this.getInt(request, "tableId")==-1||this.getInt(request, "types")==-1||this.getInt(request, "state")==-1){
			response.getWriter().write("参数请求错误");
			return;
		}
		if(this.getInt(request, "types")==0){
			this.updateTableField("anzhi_comment", this.getInt(request, "tableId"), "is_marrow", this.getInt(request, "state"));
			anzhinovelService.createNovel(request.getRealPath("//"), this.getInt(request, "novelId"));
		}else if(this.getInt(request, "types")==1){
			this.updateTableField("anzhi_comment", this.getInt(request, "tableId"), "is_top", this.getInt(request, "state"));
			anzhinovelService.createNovel(request.getRealPath("//"), this.getInt(request, "novelId"));
		}else if(this.getInt(request, "types")==2){
			this.updateTableField("anzhi_member", this.getInt(request, "tableId"), "is_add_comment", this.getInt(request, "state"));
		}else if(this.getInt(request, "types")==3){
			this.updateTableField("anzhi_member", this.getInt(request, "tableId"), "is_no_login", this.getInt(request, "state"));
		}
		response.getWriter().write("操作成功");
	}
	
	@RequestMapping(value="/util/important")
	public void important(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//importDataServie.importDataAll();
	}
	@RequestMapping(value="/util/updateNovelTotalNum")
	public void updateNovelTotalNum(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//utilService.updateNovelTotalNum();
	}
	@RequestMapping(value="/util/updateNovelImg")
	public void updateNovelImg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//utilService.updateNovelImg();
	}
}
