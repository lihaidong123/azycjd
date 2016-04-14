<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.shang_css{ padding-left:75px; margin-top:50px;}
		.shang_css div{ width:120px; cursor:pointer; text-align:center; font-weight:bold; background-position:45px 15px; padding-top:80px; height:35px; float:left; margin-left:15px; background-repeat:no-repeat;}
		.shang_css div:hover{ background-color:#f6eae0;}
		.btn_css{ margin-left:390px;clear:both; }
		.btn_css div{ float:left; cursor:pointer; width:85px; border-radius:4px; height:35px; line-height:35px; text-align:center;}
		.shang_ok{ background-color:#eb6b1d;color:#FFFFFF; font-weight:bold; }
		.shang_ok:hover{ background-color:#f37d35;}
		a{ text-decoration:none;}
	</style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript">
		$(function(){
			$(".shang_css div").click(function(){
				$(".shang_css div").each(function(){
					$(this).css("background-color","#eeeeee");
				});
				$(this).css("background-color","#e7dcd3");
			});
		});
	</script>
  </head>
  
  <body>
   	<div style="width:1022px; border:#ffffff 1px solid; font-size:14px; height:479px; margin:0 auto; font-family:'黑体'; background-image:url(images/shang_bg.png);">
		<div style="color:#FFFFFF; margin-top:70px; margin-left:75px; font-size:16px;">
			打赏<span style="font-weight:bold;">《国安七号》</span>第三十六章 有困难找女警察  
		</div>
		<div style="margin-left:75px; margin-top:45px; color:#666666; ">
			您的账号余额：<span style="color:#FF6600;">5891</span>安之币
			<span style="margin-left:30px;"><a href="">>>去充值</a></span>
		</div>
		<div class="shang_css">
			<div style="background-image:url(images/shang_1.png);">10安之币</div>
			<div style="background-image:url(images/shang_2.png);">50安之币</div>
			<div style="background-image:url(images/shang_3.png);">100安之币</div>
			<div style="background-image:url(images/shang_4.png);">200安之币</div>
			<div style="background-image:url(images/shang_1.png);">500安之币</div>
			<div style="background-image:url(images/shang_2.png);">1000安之币</div>
		</div>
		<div style="clear:both; height:50px;"></div>
		<div class="btn_css">
			<div class="shang_ok">确定打赏</div>
			<div style=" margin-left:10px; border:#999999 1px solid;">取消</div>
		</div>
	</div>
  </body>
</html>
