package com.anzhi.web.aop;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.framework.AdvisedSupport;
import org.springframework.aop.framework.AopProxy;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.service.IAnzhiMessageService;
import com.anzhi.web.service.ITimer;
import com.anzhi.web.serviceImpl.TimerImpl;
import com.anzhi.web.util.UtilData;

public class BeforeAop extends UtilData implements MethodBeforeAdvice{
	@Autowired
	private ITimer dataDao;
	@Autowired
	private IAnzhiMessageService anzhimessageService;
	public void before(Method method, Object[] objects, Object arg2)
			throws Throwable {
		HttpServletRequest request=(HttpServletRequest)objects[0];
		if(request.getSession().getAttribute("novelStateArr")==null){
			request.getSession().setAttribute("novelStateArr",novelStateArr);
		}
		if(request.getSession().getAttribute("actionBegTime")==null){
			request.getSession().setAttribute("actionBegTime",new Timestamp(new Date().getTime()));
		}
		
		if(request.getSession().getAttribute("loginUsers")!=null){
			AnzhiMember t= (AnzhiMember)request.getSession().getAttribute("loginUsers");
			if(guoLv(request.getRequestURI())&&!t.getMemberType().equals(2)){//管理员不需要接受短信
				//查找当前用户没有阅读的消息提示
				anzhimessageService.loadNoReadMessage(request, t);
			}
		}

		//开启异步计时器
		if(request.getSession().getServletContext().getAttribute("isload")==null){
			request.getSession().getServletContext().setAttribute("isload","yes");
			//获得代理bean
			Object obj=getTarget(dataDao);
			TimerImpl ti=((TimerImpl)obj);
			ti.setPath(request.getRealPath("\\"));
			//开启一个线程，随时去检查是否到期
			ti.start();
		}
	}

	public boolean guoLv(String info){
		String[] guoLv=new String[]{"anzhicooperation/findAnzhiCooperationAllQian","anzhichapter/loadBuyChapter","anzhinovelreward/daShangRecord","anzhinovel/loadDaShangJsp","anzhireport/addAnzhiReport","anzhinovel/search","anzhimessage/addAnzhiMessage","anzhifriend/addAnzhiFriend","anzhimember/memberInfo","anzhicomment/commentAction","anzhinovel/createHtml","anzhicomment/addAnzhiComment","anzhicomment/findMyAnzhiCommentAllIndex","anzhichapter/read","getDingYueChapter","adminOutSystem","loadNovelDeTail","morePahangbang","loadPicture","shuku","loadNovelInfo","anzhinews/news"};
		boolean con=true;
		for(String s:guoLv){
			if(info.indexOf(s)!=-1){
				con=false;
				break;
			}
		}
		return con;
	}
	
	public  Object getTarget(Object proxy) throws Exception {  
        if(!AopUtils.isAopProxy(proxy)) {  
            return proxy;//不是代理对象  
        }  
        if(AopUtils.isJdkDynamicProxy(proxy)) {  
            return getJdkDynamicProxyTargetObject(proxy);  
        } else { //cglib  
            return getCglibProxyTargetObject(proxy);  
        }    
    }  
  
    private  Object getCglibProxyTargetObject(Object proxy) throws Exception {  
        Field h = proxy.getClass().getDeclaredField("CGLIB$CALLBACK_0");  
        h.setAccessible(true);  
        Object dynamicAdvisedInterceptor = h.get(proxy);  
        Field advised = dynamicAdvisedInterceptor.getClass().getDeclaredField("advised");  
        advised.setAccessible(true);   
        Object target = ((AdvisedSupport)advised.get(dynamicAdvisedInterceptor)).getTargetSource().getTarget();   
        return target;  
    }  
  
    private  Object getJdkDynamicProxyTargetObject(Object proxy) throws Exception {  
        Field h = proxy.getClass().getSuperclass().getDeclaredField("h");  
        h.setAccessible(true);  
        AopProxy aopProxy = (AopProxy) h.get(proxy);   
        Field advised = aopProxy.getClass().getDeclaredField("advised");  
        advised.setAccessible(true);    
        Object target = ((AdvisedSupport)advised.get(aopProxy)).getTargetSource().getTarget();    
        return target;  
    }
}
