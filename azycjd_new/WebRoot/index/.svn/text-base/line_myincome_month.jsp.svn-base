<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("loginUsers")==null){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/index.html";
	</script>
	<%
	return;
}
int lineNumber=0;
if(request.getParameter("linenumber")!=null){
	try{
		lineNumber=Integer.parseInt(request.getParameter("linenumber").toString());
	}catch(Exception w){
	}
}else{
	if(session.getAttribute("linenumber")!=null){
		try{
			lineNumber=Integer.parseInt(session.getAttribute("linenumber").toString());
		}catch(Exception w){
		}
	}
}

session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    
    <title>安之原创|安之原创基地</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var lineNumber='<%=lineNumber%>';</script>
	<script language="javascript">var barIndex='${param.index}';</script>
	<script language="javascript">var chooseIndex='${param.chooseIndex}';</script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
	<script language="javascript" src="<%=path %>/index/js/My97DatePicker/WdatePicker.js"></script>
	
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	
	<%-- <link rel="stylesheet" type="text/css" href="<%=path %>/js/jbox-demo-depends/highlight/styles/magula.css" /> --%>
	
	
	<jsp:include page="../htmlEdit.jsp" flush="false" />
  </head>
  
  <body>
    <div class="divTableCss">
    	<div style="margin-bottom:10px;">《<a id="xiaoshuodename"></a>》的每月收入</div>
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>月份</td>
			<td>打赏收入</td>
			<td>VIP阅读等其他收入</td>
			<td>总收入</td>
		  </tr>
		  <c:forEach items="${anzhiconsumeList}" var="a" varStatus="ind">
		  	  <tr>
			  	<td>${ind.index+1 }</td>
				<td>${a.consumeTime }</td>
				<td>${a.daShang }</td>
				<td>${a.vipRead }</td>
				<td>${a.consumeMoney }</td>
			  </tr>
		  </c:forEach>
		</table>

	</div>
  </body>
</html>
