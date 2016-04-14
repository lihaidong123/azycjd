<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			站内信操作
		</div>
	</div>
	<form id="AnzhiMessageFormActionAdmin" action="<%=request.getContextPath()%>/anzhimessage/addAnzhiMessageAdmin.do?messageType=3&&isAdmin=yes" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss' style="padding-left:13px;">接受者：</font><input type="text" class="txt" name="jieshouren" id="jieshouren" value="${pojo.memberIdReceive}" alt='.+;请输入正确的用户信息'/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写接受者</font></div>
			<div class="textItem"><font class='textTitleCss'>消息标题：</font><input type="text" class="txt" name="messageTitle" id="messageTitle" value="${pojo.messageTitle}" alt='.+;请输入正确的标题'/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写消息标题</font></div>
			<div class="divItemsCss">
				<p>消息内容：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="messageContent" name="messageContent"></textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiMessageFormActionAdmin',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
