<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiFriend操作
		</div>
	</div>
	<form id="AnzhiFriendFormAction" action="<%=request.getContextPath()%>/anzhifriend/addAnzhiFriend.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>好友id：</font><input type="text" class="txt" name="friendMemberId" id="friendMemberId" value="${pojo.friendMemberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写好友id</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem"><font class='textTitleCss'>1-禁用  0-启用：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写1-禁用  0-启用</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiFriendFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
