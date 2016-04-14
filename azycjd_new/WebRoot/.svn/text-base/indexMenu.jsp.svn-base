<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.anzhi.web.pojo.AnzhiMember"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("indexMenu", request.getParameter("indexMenuType"));
if(session.getAttribute("loginUsers")==null){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/index.html";
	</script>
	<%
	return;
}
AnzhiMember am=(AnzhiMember)session.getAttribute("loginUsers");
if(am.getMemberType().equals(0)&&request.getParameter("indexMenuType")!=null&&request.getParameter("indexMenuType").equals("zuozhe")){
	%>
	<script type="text/javascript">
		window.location.href="<%=request.getContextPath() %>/author_apply.jsp";
	</script>
	<%
	return;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript">var path='<%=path %>';</script>
	<script language="javascript" src="<%=path %>/js/jquery.js"></script>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
		
	<script language="javascript">
		getJspDataByUrl("anzhitrend/findAnzhiTrendMySelf.do#linenumber=0#index=2#clickIndex=0");
	</script>
 </head>
 <body>
    
  </body>
</html>