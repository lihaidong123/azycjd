package com.anzhi.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.anzhi.web.util.ActionDb;

public class XmlParent extends ActionDb{
	String[] novelType=new String[]{"玄幻奇幻","武侠仙侠","都市异能","历史军事","游戏竞技","科幻灵异","现代言情","古代言情"};
	public int pub_size=50000;
	//合作方的列表
	String[] opertion=new String[]{"uc","changdu","sanliuling","ersansiwu","aishuke","aiyuedu","dangdang","douding","shuxing","zhangyue","suning","tadu","wangyi","xunlei","yueduxing","zuidie"};
	
	/**
	 * addElement(String name,Object obj,boolean isCadta) 方法的重写
	 * @param name
	 * @param obj
	 * @return
	 */
	public Element addElement(String name,Object obj){
		return this.addElement(name, obj, true);
	}
	
	/**
	 * 创建一个节点
	 * @param name 节点名称
	 * @param obj 节点的object值
	 * @param isCadta 是否是cdata
	 * @return
	 */
	public Element addElement(String name,Object obj,boolean isCadta){
		Element e=DocumentHelper.createElement(name);
		if(obj!=null){
			if(isCadta){
				e.addCDATA(obj.toString());
			}else{
				e.setText(obj.toString());
			}
		}
		return e;
	}
	/**
	 * 页面跳转
	 * @param request
	 * @param response
	 * @param con 是否生成xml成功 
	 * @param fileName 生成的xml文件名
	 */
	public void redirect(HttpServletRequest request,HttpServletResponse response,boolean con,String fileName){
		if(con){
			try {
				response.sendRedirect(request.getContextPath()+"/xml/"+fileName+".xml");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				response.sendRedirect(request.getContextPath()+"/xmlError.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * 生成一个xml文件
	 * @param request
	 * @param fileName 生成的xml文件名
	 * @param root 根节点
	 * @return
	 */
	public boolean createXml(HttpServletRequest request,HttpServletResponse response,Element root){
		Document document=DocumentHelper.createDocument();
		document.add(root);
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        response.setContentType("text/xml; charset=UTF-8"); 
        try {
			response.getWriter().write(document.asXML());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return true;
	}
	
	/**
	 * 获得小说当前是否收费
	 * @param novelId
	 * @return
	 */
	public int novelFree(int novelId){
		//先看有没有签约
		int n=this.getIntBySqlDb("select is_signed from anzhi_novel where id="+novelId);
		if(n==0){
			//说明没有签约 查询是否网站上架    或   平台上架
			n+=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novelId+" and (action_type=17 or action_type=16)");
		}
		return n==0?0:1;
	}
	/**
	 * 获得时间戳
	 * @param t
	 * @return
	 */
	public long getShiJianCuo(Timestamp t){
		if(t!=null){
			return t.getTime();
		}
		return new Date().getTime();
	}
	public String novelTypeChange(String novelType,String xmlfileName){
		return novelType;
	}
}
