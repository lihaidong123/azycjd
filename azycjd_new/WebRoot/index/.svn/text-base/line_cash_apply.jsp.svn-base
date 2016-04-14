<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="cashapplyform" action="<%=request.getContextPath() %>/anzhicash/addAnzhiCash.do">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">提现管理</div>
	</div>
	<div class="second_title_css" >
		<div style="margin-left:10px;float:left;">我的安之币：${loginUsers.memberMoney }</div>
	</div>
	<div class="divTableCss" id="incomegaikuang">
		<div class="divItemsCss">提现安之币:
			<input type="text" class="txtCss" id="anzhiMoneyCash" name="anzhiMoneyCash" alt="[0-9]{1,30};提现金额输入错误" onkeyup="changecashmoney(this,${loginUsers.memberMoney })">
		</div>
		<div class="divItemsCss">提现人民币:
			<input type="text" class="txtCss" style="width:320px;" id="cashMoney" name="cashMoney" readonly="readonly">
		</div>
		<div class="divItemsCss">
			<input type="button" value="确定" class="saveBtnCss" onclick="ajaxSubmit('cashapplyform',this)">
			<input type="reset" value="重置" class="resetBtnCss">
		</div>
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
