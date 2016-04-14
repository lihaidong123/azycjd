<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiMoneyApplyRecord操作
		</div>
	</div>
	<form id="AnzhiMoneyApplyRecordFormAction" action="<%=request.getContextPath()%>/anzhimoneyapplyrecord/addAnzhiMoneyApplyRecord.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>用户id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户id</font></div>
			<div class="textItem"><font class='textTitleCss'>充值金额：</font><input type="text" class="txt" name="chongMoney" id="chongMoney" value="${pojo.chongMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值金额</font></div>
			<div class="textItem"><font class='textTitleCss'>商品订单号：</font><input type="text" class="txt" name="orderNo" id="orderNo" value="${pojo.orderNo}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写商品订单号</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-未充值 1-已充值)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-未充值 1-已充值)</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiMoneyApplyRecordFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
