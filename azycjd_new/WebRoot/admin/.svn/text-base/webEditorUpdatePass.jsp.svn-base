<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			密码修改
		</div>
	</div>
	<form id="AnzhiWebEditorUpdatePass" action="<%=request.getContextPath()%>/anzhiwebeditor/updatePass.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss' style="padding-left:15px;">原密码：</font>
				<input type="password" class="txtCss" name="oldPass" id="oldPass" alt="\w{6,20};原密码只能使用数字或字母的6-20位的组合"/>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写原密码</font>
			</div>
			<div class="textItem"><font class='textTitleCss' style="padding-left:15px;">新密码：</font>
				<input type="password" class="txtCss" name="newPass" id="newPass" alt="\w{6,20};新密码只能使用数字或字母的6-20位的组合"/>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写新密码</font>
			</div>
			<div class="textItem"><font class='textTitleCss'>确认密码：</font>
				<input type="password" class="txtCss" name="newPass1" id="newPass1" alt="\w{6,20};密码确认只能使用数字或字母的6-20位的组合"/>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写确认密码</font>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorUpdatePass',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
