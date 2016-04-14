<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiTrendReply操作
		</div>
	</div>
	<form id="AnzhiTrendReplyFormAction" action="<%=request.getContextPath()%>/anzhitrendreply/addAnzhiTrendReply.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>广播id：</font><input type="text" class="txt" name="trendId" id="trendId" value="${pojo.trendId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写广播id</font></div>
			<div class="textItem"><font class='textTitleCss'>回复者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复者id</font></div>
			<div class="textItem"><font class='textTitleCss'>回复内容：</font><input type="text" class="txt" name="replyContent" id="replyContent" value="${pojo.replyContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复内容</font></div>
			<div class="textItem"><font class='textTitleCss'>父级回复(0-第一条评论)：</font><input type="text" class="txt" name="fatherId" id="fatherId" value="${pojo.fatherId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写父级回复(0-第一条评论)</font></div>
			<div class="textItem"><font class='textTitleCss'>回复时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复时间</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-启用 1-禁用)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-启用 1-禁用)</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiTrendReplyFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
