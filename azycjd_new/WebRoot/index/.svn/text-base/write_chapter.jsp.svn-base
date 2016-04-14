<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'write_chapter.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script language="javascript">var defaultVlaue="1";</script>
	<jsp:include page="htmlEditChapter.jsp" flush="false"/>
	
	<script type="text/javascript">
		$(function(){
			defaultVlaue=parent.document.getElementById("chapterContent").value;
		});
	</script>
  </head>
  
  <body style="padding: 0px;margin: 0px;">
    <div id="testDiv" style="text-align: center;width:840px;margin: 0 auto;">
    	<textarea class='htmlEditCss' id='chapterContentS' name='chapterContentS'></textarea>
    </div>
  </body>
</html>
