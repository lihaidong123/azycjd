<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.introduce_css{ padding:25px; line-height:27px; color:#333333; font-size:14px; text-indent:20px;}
		.introduce_css div{ line-height:30px; font-family:"黑体"; font-size:14px; color:#666666;}
		.introduce_css table{ border-collapse:collapse;}
		.introduce_css tr{ line-height:35px;}
		.introduce_css td{ border:#666666 1px solid; padding-left:10px; font-size:14px;}
	</style>
  </head>
  
  <body>
   
