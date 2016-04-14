<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="goodsDetail">
    	<table width="100%" border="0">
		  <tr>
			<td rowspan="2">
				<img src="${pojo.goodsImg }" width="" height=""/>
			</td>
			<td>
				${pojo.goodsName }
			</td>
		  </tr>
		  <tr>
			<td>
				兑换积分:${pojo.goodsScore }
			</td>
		  </tr>
		  <tr>
			<td colspan="2">
				<div class="goodsVote">
					${pojo.goodsVote }
				</div>
			</td>
		  </tr>
		</table>
    </div>
  </body>
</html>
