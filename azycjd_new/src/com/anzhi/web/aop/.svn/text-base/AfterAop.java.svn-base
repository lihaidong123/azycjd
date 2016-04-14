package com.anzhi.web.aop;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.aop.AfterReturningAdvice;


public class AfterAop implements AfterReturningAdvice{
	public void afterReturning(Object object, Method method, Object[] objects,
			Object object2) throws Throwable {
		HttpServletRequest request=(HttpServletRequest)objects[0];
		if(request.getSession().getAttribute("actionBegTime")!=null){
			Timestamp actionBegTime=(Timestamp)request.getSession().getAttribute("actionBegTime");
			long actionTime=new Date().getTime()-actionBegTime.getTime();
			System.out.println(method.getName()+"方法执行了："+actionTime+"毫秒");
			request.getSession().removeAttribute("actionBegTime");
		}
	}
}
