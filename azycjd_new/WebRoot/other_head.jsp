<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--jbox-->
<link id="skin" rel="stylesheet" href="<%=request.getContextPath() %>/js/jBox/Skins/Blue/jbox.css" />
<script language="javascript">var loginSession='${loginUsers.id}';</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript">
	$(function(){
		$("#top_banner").css("background-color","#ffffff");
	});
</script>
<style>
	
</style>
<div style="width:16px; height:153px; background:url(images/activities.png); position:fixed; left:50px; top:45%; z-index: 100;" onclick="window.open('<%=request.getContextPath()%>/activity.jsp')"></div>
	<div id="abousus_div" style="width:16px; height:153px; background:url(images/emagazine.png); position:fixed; right:50px; top:45%;z-index: 100;"  onclick="window.location.href='aboutus.jsp'"></div>
	<div class="login_div_css" id="login_div_css">
		<div class="top_1">
			<!-- <div title="首页" style="background:url(images/home.png) 1px 3px no-repeat;width:40px;" onclick="window.location.href='index.html'">首页</div> -->
			<c:if test="${empty loginUsers }">
				<div title="用户登录" style=" background:url(images/userIcon.png) 1px 3px no-repeat;width:140px;" id="showLoginDiv"><a href="javascript:;" onclick="showLoginWin()">登录</a>&nbsp;|&nbsp;<a href="register.jsp">注册</a>|&nbsp;<a href="register.jsp?wantToWriter=yes" class="wantToWriter">成为作者</a></div>
			</c:if>
			<c:if test="${not empty loginUsers }">
				<div style="background:url(images/star.png) 1px 3px no-repeat;width:150px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath() %>/indexMenu.jsp?indexMenuType=duzhe'">${loginUsers.memberNick }</a><span class="outSystemcss"><a href="javascript:outAnZhiSystem()">[退出]</a></span></div>
			</c:if>
			<div>
				<a class="search_a_css" href="<%=request.getContextPath()%>/search.jsp">搜索书籍</a>
			</div>
		</div>
		<div class="login_css" id="login_css">
			<div class="login_close_css" title="关闭" onclick="$('#login_css').css('display','none')">X</div>
			
			<table width="100%" border="0">
			   <tr>
				<td colspan="2" style="font-weight: bold; text-align: center; font-size: 16px;">用户登录</td>
			  </tr>
			  <tr>
				<td width="29%"><div align="right" style="padding-right: 10px;">用户名</div></td>
				<td width="71%"><input type="text" id="uname" name="uname" placeholder="用户名/手机/邮箱/昵称" class="login_txt_css" /></td>
			  </tr>
			  <tr>
				<td><div align="right" style="padding-right: 10px;">密&nbsp;&nbsp;&nbsp;码</div></td>
				<td><input type="password" id="upass" name="upass" class="login_txt_css" /></td>
			  </tr>
			  <tr>
				<td></td>
				<td>
					<div class="top_2">
						<div class="login_btn" onclick="memberLogin(this)">登录</div>
						<div><a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/findPassword.jsp">忘记密码?</a></div>
					</div>				
				</td>
			  </tr>
			  <tr>
				<td></td>
				<td>
					<div class="other_css">
						<jsp:include page="loginType.jsp" flush="false"/>					
					</div>				
				</td>
			  </tr>
			</table>
		</div>
	</div>
	<div class="main_css">
		<div style="background:url(images/title.png) bottom no-repeat; margin-top:370px; font-weight:bold; text-align:center;height:45px; margin-bottom: 70px;">
			<ul class="menuPage">
				<li id="<%=request.getContextPath() %>/index.html">首页</li>
				<li id="<%=request.getContextPath() %>/all_type_list.jsp">书库</li>
				<li id="<%=request.getContextPath() %>/paihangbang.html">排行榜</li>
				<li id="<%=request.getContextPath() %>/yhsf.html">优惠书坊</li>
				<li id="<%=request.getContextPath() %>/zuojiafuli.jsp">作家福利</li>
				<li id="<%=request.getContextPath() %>/anzhinews/news.do">安之公告</li>
				<li id="<%=request.getContextPath() %>/chongzhi.jsp">充值</li>
				<li id="<%=request.getContextPath() %>/index.html" style="border: none;">论坛</li>
			</ul>
		</div>
