<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			互动专区操作
		</div>
	</div>
	<form id="AnzhiInteractiveFormAction" action="<%=request.getContextPath()%>/anzhiinteractive/addAnzhiInteractives.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>
			<input type="hidden" class="txt" name="interactiveTitle" id="interactiveTitle" value="${pojo.interactiveTitle}" alt=""/>
			<input type="hidden" class="txt" name="interactiveContent" id="interactiveContent" value="${pojo.interactiveContent}" alt=""/>
			<input type="hidden" class="txt" name="interactiveType" id="interactiveType" value="${pojo.interactiveType}" alt=""/>
			<input type="hidden" class="txt" name="replyContent" id="replyContent" value="${pojo.replyContent}" alt=""/>
			<input type="hidden" class="txt" name="replyTitle" id="replyTitle" value="${pojo.replyTitle}" alt=""/>
			<input type="hidden" class="txt" name="replyMemberId" id="replyMemberId" value="${pojo.replyMemberId}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			<!-- <div class="textItem"><font class='textTitleCss'>用户id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户id</font></div>
			<div class="textItem"><font class='textTitleCss'>主题：</font><input type="text" class="txt" name="interactiveTitle" id="interactiveTitle" value="${pojo.interactiveTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写主题</font></div>
			<div class="textItem"><font class='textTitleCss'>内容：</font><input type="text" class="txt" name="interactiveContent" id="interactiveContent" value="${pojo.interactiveContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写内容</font></div>
			<div class="textItem"><font class='textTitleCss'>类型(0-编辑区 1-公告 2-版权维护)：</font><input type="text" class="txt" name="interactiveType" id="interactiveType" value="${pojo.interactiveType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写类型(0-编辑区 1-公告 2-版权维护)</font></div>
			<div class="textItem"><font class='textTitleCss'>回复内容：</font><input type="text" class="txt" name="replyContent" id="replyContent" value="${pojo.replyContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复内容</font></div>
			<div class="textItem"><font class='textTitleCss'>回复主题：</font><input type="text" class="txt" name="replyTitle" id="replyTitle" value="${pojo.replyTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复主题</font></div>
			<div class="textItem"><font class='textTitleCss'>回复者id：</font><input type="text" class="txt" name="replyMemberId" id="replyMemberId" value="${pojo.replyMemberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复者id</font></div>
			<div class="textItem"><font class='textTitleCss'>回复时间：</font><input type="text" class="txt" name="replyTime" id="replyTime" value="${pojo.replyTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复时间</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-未回复 1-已回复)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-未回复 1-已回复)</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiInteractiveFormAction',this)"/>
			</div> -->
			<div class="textItem"><font class='textTitleCss'>用户名称：</font>${pojo.memberNick}</div>
			<div class="textItem"><font class='textTitleCss'>主题：</font>${pojo.interactiveTitle}</div>
			<div class="textItem"><font class='textTitleCss'>内容：</font>${pojo.interactiveContent}
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="返回" onClick="ajaxSubmit('AnzhiInteractiveFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
