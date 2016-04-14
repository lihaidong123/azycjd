<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="updpassform" method="post" action="<%=request.getContextPath() %>/anzhi/updatePass.do">
		<div>
			<div class="divItemsCss">原来密码：
				<input type="password" class="txtCss" name="oldPass" id="oldPass" alt="\w{6,20};原密码只能使用数字或字母的6-20位的组合"/>
			</div>
			<div class="divItemsCss">新的密码：
				<input type="password" class="txtCss" name="newPass" id="newPass" alt="\w{6,20};新密码只能使用数字或字母的6-20位的组合"/>
			</div>
			<div class="divItemsCss">密码确认：
				<input type="password" class="txtCss" name="newPass1" id="newPass1" alt="\w{6,20};密码确认只能使用数字或字母的6-20位的组合"/>
			</div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxSubmit('updpassform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>