package com.anzhi.web.service;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Element;

public interface IXmlService {
	public Element ersansiwu_novelList(HttpServletRequest request);
	public Element changdu_novelByBookId(HttpServletRequest request,String xmlfileName);
	public Element aiyuedu_novelByBookId(HttpServletRequest request);
	public Element aiyuedu_fenjuan(HttpServletRequest request);
	public Element aiyuedu_chapterById(HttpServletRequest request);
}
