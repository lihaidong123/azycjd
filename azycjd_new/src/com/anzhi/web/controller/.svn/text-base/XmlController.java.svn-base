package com.anzhi.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiFenJuanService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IXmlService;
import com.anzhi.web.util.GetCondition;
import com.anzhi.web.util.QueryList;
//http://localhost:8080/azycjd_new/azycjd/sanliuling_novelList.do?pid=1002&&apikey=ab4a8d32b574a28313bf2a94ee28abb8
@Controller
public class XmlController extends XmlParent{
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiFenJuanService anzhifenjuanService;
	@Autowired
	private IAnzhiChapterService anzhichapterService;
	@Autowired
	IXmlService xmlService;

	
	/**
	 * 查询小说
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiNovel> getNovelList(int size,int pageNum,String condition,String fileName,boolean isChangeNovelType){
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelThirdRecommand(size, pageNum, " and third_type="+getRecommandType(fileName));
		if(isChangeNovelType){
			list=this.novelTypeChange(list);
		}
		return list;
	}
	
	public QueryList<AnzhiNovel> getNovelList(int size,int pageNum,String condition,String fileName){
		return this.getNovelList(size, pageNum, condition, fileName, true);
	}
	
	public int getRecommandType(String fileName){
		int recommandType=-1;
		for(int i=0;i<opertion.length;i++){
			if(fileName.equals(opertion[i])){
				recommandType=i;
				break;
			}
		}
		return recommandType;
	}
	
	/**
	 * 查询单个小说
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public AnzhiNovel getNovelById(String condition){
		QueryList<AnzhiNovel> list = anzhinovelService.findAnzhiNovelAll(1, 1, condition,"id");
		list=this.novelTypeChange(list);
		return list.getList().size()==0?null:list.getList().get(0);
	}
	
	/**
	 * 查询分卷
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiFenJuan> getFenJUan(HttpServletRequest request,int size,int pageNum,String condition){
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(size, pageNum, condition,request);
		return list;
	}
	
	/**
	 * 查询具体章节内容
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public AnzhiChapter getChapterById(String condition){
		QueryList<AnzhiChapter> ls=anzhichapterService.findAnzhiChapterAll(1, 1, condition);
		return ls.getList().size()==0?null:ls.getList().get(0);
	}
	
	/**
	 * 查询章节列表
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiChapter> getChapterList(String condition,int size,int pageNum){
		QueryList<AnzhiChapter> ls=anzhichapterService.findAnzhiChapterAll(size, pageNum, condition);
		return ls;
	}
	
	public boolean checkXmlDataUrl(HttpServletRequest request){
		if(this.checkParam(request, "pid")&&this.checkParam(request, "apikey")){
			//请求的apikey
			String apikey=request.getParameter("apikey").trim();
			String opertionName="";
			try {
				opertionName=opertion[this.getInt(request, "pid")-1000];
			} catch (Exception e) {
			}
			//生成的apikey
			String cn=this.getMD5Str("az_@_2016_"+opertionName);
			if(apikey.equals(cn)){
				return true;
			}else{
				request.getSession().setAttribute("errorInfo", "请求参数pn或apikey错误！");
				return false;
			}
		}else{
			request.getSession().setAttribute("errorInfo", "请求参数错误！");
			return false;
		}
	}
	
	//加密
		public  String getMD5Str(String str) {
			MessageDigest messageDigest = null;
			try {
				messageDigest = MessageDigest.getInstance("MD5");
				messageDigest.reset();
				messageDigest.update(str.getBytes("UTF-8"));
			} catch (NoSuchAlgorithmException e) {
				System.out.println("NoSuchAlgorithmException caught!");
				System.exit(-1);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			byte[] byteArray = messageDigest.digest();
			StringBuffer md5StrBuff = new StringBuffer();
			for (int i = 0; i < byteArray.length; i++) {
				if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
					md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
				else
					md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
			}
			return md5StrBuff.toString();
		}
}
