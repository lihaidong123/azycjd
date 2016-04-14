<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	
	<form class="formCss" id="update_pass_form">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">修改密码</div>
		</div>
		<div>
			<div class="divItemsCss">原来密码：<input type="password" class="pwTxtCss" id="oldPass" name="oldPass"></div>
			<div class="divItemsCss">新的密码：<input type="password" class="pwTxtCss" id="newPass" name="newPass"></div>
			<div class="divItemsCss">密码确认：<input type="password" class="pwTxtCss" id="passOk" name="passOk"></div>
			<div class="divItemsCss">
				<input type="button" value="修改" class="saveBtnCss">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>