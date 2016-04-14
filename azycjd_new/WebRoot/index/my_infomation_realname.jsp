<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="realnameform" method="post" action="<%=request.getContextPath() %>/anzhimember/updateAnzhiMemberMySelf.do?type=2">
		<div style="font-size: 13px;font-family: serif; color: #646668; padding-bottom: 10px;">
			<p>依照相关部门要求，安之原创基地作者需要进行实名认证，完成实名认证后方可申请作者。</p>
			<p>请在下方的输入框内输入对应的真实信息。</p>
		</div>
		<div>
			<div class="divItemsCss">真实姓名：<input type="text" style="width:200px;" class="txtCss" id="memberRealName" name="memberRealName" value="${loginUsers.memberRealName }"></div>
			<div class="divItemsCss">身份证号：<input type="text" style="width:260px;" class="txtCss" id="memberCode" name="memberCode" value="${loginUsers.memberCode }"></div>
			<div class="divItemsCss">手机号码：<input type="text" style="width:160px;" class="txtCss" id="memberTel" name="memberTel" value="${loginUsers.memberTel }"></div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('realnameform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>