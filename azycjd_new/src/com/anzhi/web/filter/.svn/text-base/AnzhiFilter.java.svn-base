package com.anzhi.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnzhiFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		String nowReadNovelJsp="";
		if(request.getSession().getAttribute("nowReadNovelJsp")!=null){
			nowReadNovelJsp=request.getSession().getAttribute("nowReadNovelJsp").toString();
		}

		System.out.println(request.getRequestURL());
		
		if(nowReadNovelJsp.equals(request.getRequestURI())&&request.getRequestURI().indexOf("/novel/")!=-1){
			request.getSession().setAttribute("updateNovelClickNum","no");
		}else if(request.getRequestURI().indexOf("/novel/")!=-1){
			request.getSession().setAttribute("updateNovelClickNum","yes");
			nowReadNovelJsp=request.getRequestURI();
		}
		request.getSession().setAttribute("nowReadNovelJsp",nowReadNovelJsp);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
