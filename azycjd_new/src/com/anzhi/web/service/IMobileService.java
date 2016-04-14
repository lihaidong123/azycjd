package com.anzhi.web.service;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.util.QueryList;

public interface IMobileService {
	public String mIndex(HttpServletRequest request);
	public String mBangDan(HttpServletRequest request);
	public String mShuku(HttpServletRequest request);
	public QueryList<AnzhiNovel> getBanDanData(HttpServletRequest request,int types);
	public QueryList<AnzhiNovel> getShukuData(HttpServletRequest request,int types);
	public String mChapterMenu(HttpServletRequest request);
	public String cashRead(HttpServletRequest request, AnzhiMember am);
	public String msearch(HttpServletRequest request);
	public String mbookcase(HttpServletRequest request);
	public String mpinglun(HttpServletRequest request);
	public String myBookMark(HttpServletRequest request);
	public String moreDiscount(HttpServletRequest request);
}
