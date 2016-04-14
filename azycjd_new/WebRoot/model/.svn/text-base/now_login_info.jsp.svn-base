<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <div title="首页" style="background:url(images/home.png) 1px 3px no-repeat;width:40px;" onclick="window.location.href='index.jsp'">首页</div> -->
<script language="javascript">var loginSession='${loginUsers.id}';</script>
<c:if test="${empty loginUsers }">
	<div title="用户登录" style=" background:url(images/userIcon.png) 1px 3px no-repeat;width:140px;" id="showLoginDiv"><a href="javascript:;" onclick="showLoginWin()">登录</a>&nbsp;|&nbsp;<a href="register.jsp">注册</a>|&nbsp;<a href="register.jsp?wantToWriter=yes" class="wantToWriter">成为作者</a></div>
</c:if>
<c:if test="${not empty loginUsers }">
	<div style="background:url(images/star.png) 1px 3px no-repeat;width:200px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath() %>/indexMenu.jsp?indexMenuType=duzhe'">${loginUsers.memberNick }</a><span class="outSystemcss"><a href="javascript:outAnZhiSystem()">[退出]</a></span></div>
</c:if>
<div>
	<a class="search_a_css" href="<%=request.getContextPath()%>/search.jsp">搜索书籍</a>
</div>