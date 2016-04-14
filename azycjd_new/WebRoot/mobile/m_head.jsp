<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>安之原创基地</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/mobile/css/m_azycjd.css">
	<script type="text/javascript">var path='<%=request.getContextPath() %>';</script>
	<script type="text/javascript">var menuType='${param.menu_type}';</script>
	<script type="text/javascript">var memberId='${loginUsers.id}';</script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/mobile/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/mobile/js/m_azycjd.js"></script></head>
  <body style=" background-color:#e8e8e8; padding:0px; margin:0px;">
  	<div style="max-width:700px; margin:0 auto;" id="main_contnt_div">
		<div id="head_logo_div" style="height:55px; text-align:center; background-color:#000000; padding-top:15px;">
			<table width="100%" border="0">
			  <tr>
				<td width="80" align="center" style="cursor: pointer;" onClick="window.history.go(-1);">
					<div id="back_head_div" style="color:#ffffff; font-size:14px;"><&nbsp;返回</div>
				</td>
				<td align="center"><img src="<%=request.getContextPath() %>/mobile/images/logo.png" width="160"/></td>
				<td width="40" align="center" style="cursor: pointer;" onClick="window.location.href='<%=request.getContextPath() %>/mobile/m_search.jsp'">
					<img id="search_head_top" src="<%=request.getContextPath() %>/mobile/images/fangdajing.png" width="26" />
				</td>
			  </tr>
			</table>
		</div>
		<div class="menu_css" id="menu_div_head">
			<table width="100%" border="0">
			  <tr>
				<td>
					<div onClick="window.location.href='<%=request.getContextPath() %>/mobile/m_index.do?menu_type=0'">首页</div>
				</td>
				<td>
					<div onClick="window.location.href='<%=request.getContextPath() %>/mobile_shuku.html'">书库</div>
				</td>
				<td>
					<div onClick="window.location.href='<%=request.getContextPath() %>/mobile_bangdan.html'">榜单</div>
				</td>
				<td style=" background:none;">
					<div onClick="window.location.href='<%=request.getContextPath() %>/mobile/m_paycharge.jsp'">充值</div>
				</td>
			  </tr>
			</table>
		</div>
		<div style="padding:5px;">