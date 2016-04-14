<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			充值操作
		</div>
	</div>
	<form id="AnzhiRechargeFormAction" action="<%=request.getContextPath()%>/anzhirecharge/addAnzhiRecharge.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>充值金额：</font><input type="text" class="txt" name="rechargeMoney" id="rechargeMoney" value="${pojo.rechargeMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值金额</font></div>
			<div class="textItem"><font class='textTitleCss'>充值安之币：</font><input type="text" class="txt" name="rechargeAnzhiMoney" id="rechargeAnzhiMoney" value="${pojo.rechargeAnzhiMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>之前安之币：</font><input type="text" class="txt" name="beforeBalance" id="beforeBalance" value="${pojo.beforeBalance}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写之前安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>之后安之币：</font><input type="text" class="txt" name="afterBalance" id="afterBalance" value="${pojo.afterBalance}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写之后安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>充值时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值时间</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiRechargeFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
