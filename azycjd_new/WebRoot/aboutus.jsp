<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />

		<title>安之原创|安之原创基地</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="css/azycjs.css" />
	</head>

	<body style="padding: 0px; margin: 0px;">
		<div class="aboutus_bigpic">
			<div class="aboutus_top">
			</div>
			<div class="aboutus_main">
				<div class="aboutus_main_one">
					<div>
						<img src="images/10_p_1.png"></img>
					</div>
					<div>
						<img src="images/11_p_5.png"></img>
					</div>
				</div>
				<div class="aboutus_main_two">
					<img src="images/11_p_4.png"></img>
				</div>
				<div class="about_content">
					<div>
						${fn:substring(otherContent.abotus,0,290)}
					</div>
					<div class="self_btn" style="width:116px;height:34px;margin-top:520px;margin-left:140px;" onclick="window.location.href='chengpinyingcai.jsp'">对外招聘公告</div>
					<div style="margin-left:98px;">
						${fn:substring(otherContent.abotus,290,600 )}
					</div>
				</div>
			</div>
			<div class="aboutus_foot">
				<div style="height:170px;"></div>
				<div class="about_0_css">
						<table width="60%" style="margin:0 auto;padding-left:30px;">
						  <tr>
							<td width="50%" valign="top">
								<div>电话：0871-67375096</div>
								<div>邮箱：1577415284@qq.com</div>
								<div>邮编：650200</div>
							</td>
							<td width="50%" valign="top">
								<div>版权合作事宜联系方式：</div>
								<div>邮箱：安之·迷糊 1810154217@qq.com</div>
							</td>
						  </tr>
						</table>
				</div>
			</div>
			<div class="about_bottom">
		    	<div>Copyright© 2006-2012 www.azycjd.com  All Rights Reserved 版权所有 云南安柔科技有限公司</div>
				<div>滇ICP备12006807号-1 滇网文许字【2014】1100-002号</div>
			</div>
		</div>
	</body>
</html>
