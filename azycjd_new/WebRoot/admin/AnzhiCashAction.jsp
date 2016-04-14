<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			提现操作
		</div>
	</div>
	<form id="AnzhiCashFormAction" action="<%=request.getContextPath()%>/anzhicash/addAnzhiCash.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>作家id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作家id</font></div>
			<div class="textItem"><font class='textTitleCss'>当前安之币：</font><input type="text" class="txt" name="anzhiMoneyRemaining" id="anzhiMoneyRemaining" value="${pojo.anzhiMoneyRemaining}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写当前安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>提现安之币：</font><input type="text" class="txt" name="anzhiMoneyCash" id="anzhiMoneyCash" value="${pojo.anzhiMoneyCash}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写提现安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>提现金额(人民币)：</font><input type="text" class="txt" name="cashMoney" id="cashMoney" value="${pojo.cashMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写提现金额(人民币)</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-未处理 1-已处理)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-未处理 1-已处理)</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiCashFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
