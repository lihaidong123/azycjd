package com.anzhi.web.controller;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.pojo.AnzhiWebEditorGoods;
import com.anzhi.web.service.IAnzhiWebEditorGoodsService;
import java.util.Date;
@Controller
public class AnzhiWebEditorGoodsController extends GetCondition {
	@Autowired
	private IAnzhiWebEditorGoodsService anzhiwebeditorgoodsService;
	@RequestMapping(value="/anzhiwebeditorgoods/addAnzhiWebEditorGoods")
	public void addAnzhiWebEditorGoods(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorGoods anzhiwebeditorgoods){
		if(request.getSession().getAttribute("addAnzhiWebEditorGoodsSession")==null){
			try{
				request.getSession().setAttribute("addAnzhiWebEditorGoodsSession","true");
				anzhiwebeditorgoods.setAddTime(getTimestamp());
				if(anzhiwebeditorgoods.getId()==null||anzhiwebeditorgoods.getId()==0){
					anzhiwebeditorgoodsService.addAnzhiWebEditorGoods(anzhiwebeditorgoods);
				}else{
					anzhiwebeditorgoodsService.updateAnzhiWebEditorGoods(anzhiwebeditorgoods);
				}
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do");
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("addAnzhiWebEditorGoodsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorgoods/addBatchAnzhiWebEditorGoods")
	public String addBatchAnzhiWebEditorGoods(HttpServletRequest request,HttpServletResponse response){
		List<AnzhiWebEditorGoods> list=new ArrayList<AnzhiWebEditorGoods>();
		anzhiwebeditorgoodsService.addBatchAnzhiWebEditorGoods(list);
		request.getSession().setAttribute("directPageName", "");
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoods/delAnzhiWebEditorGoods")
	public void delAnzhiWebEditorGoods(HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("delAnzhiWebEditorGoodsSession")==null){
			try{
				request.getSession().setAttribute("delAnzhiWebEditorGoodsSession","true");
				int id=request.getParameter("anzhiwebeditorgoodsId")==null?0:Integer.parseInt(request.getParameter("anzhiwebeditorgoodsId"));
				anzhiwebeditorgoodsService.delAnzhiWebEditorGoods(id);
				response.sendRedirect(request.getContextPath()+"/anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do?pageNum="+request.getParameter("pageNum"));
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("delAnzhiWebEditorGoodsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
	}

	@RequestMapping(value="/anzhiwebeditorgoods/delBatchAnzhiWebEditorGoods")
	public String delBatchAnzhiWebEditorGoods(HttpServletRequest request,HttpServletResponse response){
		String ids=request.getParameter("anzhiwebeditorgoodsIds");
		anzhiwebeditorgoodsService.delBatchAnzhiWebEditorGoods(ids);
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoods/updateAnzhiWebEditorGoods")
	public String updateAnzhiWebEditorGoods(HttpServletRequest request,HttpServletResponse response,AnzhiWebEditorGoods anzhiwebeditorgoods){
		if(request.getSession().getAttribute("updateAnzhiWebEditorGoodsSession")==null){
			try{
				request.getSession().setAttribute("updateAnzhiWebEditorGoodsSession","true");
				anzhiwebeditorgoodsService.updateAnzhiWebEditorGoods(anzhiwebeditorgoods);
			}catch (Exception e) {
			}finally{
				request.getSession().removeAttribute("updateAnzhiWebEditorGoodsSession");
			}
		}
		request.getSession().setAttribute("directPageName", "");
		return "redirect:";
	}

	@RequestMapping(value="/anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll")
	public String findAnzhiWebEditorGoodsAll(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorgoodsConditionArr, request, response);
		QueryList<AnzhiWebEditorGoods> list = anzhiwebeditorgoodsService.findAnzhiWebEditorGoodsAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorgoodsList", list);
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsManager");
	}
	
	@RequestMapping(value="/anzhiwebeditorgoods/goodsChange")
	public String goodsChange(HttpServletRequest request,HttpServletResponse response){
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		String condition=this.getCondition(anzhiwebeditorgoodsConditionArr, request, response);
		condition+=" and state=1";
		QueryList<AnzhiWebEditorGoods> list = anzhiwebeditorgoodsService.findAnzhiWebEditorGoodsAll(size, pageNum, condition);
		request.setAttribute("anzhiwebeditorgoodsList", list);
		return this.getPageName(request, "admin/goodsChange");
	}

	@RequestMapping(value="/anzhiwebeditorgoods/findAnzhiWebEditorGoodsById")
	public String findAnzhiWebEditorGoodsById(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorGoods> list = anzhiwebeditorgoodsService.findAnzhiWebEditorGoodsAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorgoodsId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsAction");
	}

	@RequestMapping(value="/anzhiwebeditorgoods/anzhiwebeditorgoodsAction")
	public String anzhiwebeditorgoodsAction(HttpServletRequest request,HttpServletResponse response){
		return this.getPageName(request, "admin/AnzhiWebEditorGoodsAction");
	}

	@RequestMapping(value="/anzhiwebeditorgoods/goodsDetail")
	public String goodsDetail(HttpServletRequest request,HttpServletResponse response){
		QueryList<AnzhiWebEditorGoods> list = anzhiwebeditorgoodsService.findAnzhiWebEditorGoodsAll(10, 1, " and id="+Integer.parseInt(request.getParameter("anzhiwebeditorgoodsId")));
		request.setAttribute("pojo", list.getList().size()!=1?null:list.getList().get(0));
		return this.getPageName(request, "admin/goodsDetail");
	}

}