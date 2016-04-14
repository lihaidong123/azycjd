<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiConsume操作
		</div>
	</div>
	<form id="AnzhiConsumeFormAction" action="<%=request.getContextPath()%>/anzhiconsume/addAnzhiConsume.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>消费安之币金额：</font><input type="text" class="txt" name="consumeAnzhiMoney" id="consumeAnzhiMoney" value="${pojo.consumeAnzhiMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写消费安之币金额</font></div>
			<div class="textItem"><font class='textTitleCss'>表格id：</font><input type="text" class="txt" name="tableId" id="tableId" value="${pojo.tableId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写表格id</font></div>
			<div class="textItem"><font class='textTitleCss'>表格类型(0-小说 1-章节)：</font><input type="text" class="txt" name="tableType" id="tableType" value="${pojo.tableType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写表格类型(0-小说 1-章节)</font></div>
			<div class="textItem"><font class='textTitleCss'>消费类型(0-打赏 1-购买)：</font><input type="text" class="txt" name="consumeType" id="consumeType" value="${pojo.consumeType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写消费类型(0-打赏 1-购买)</font></div>
			<div class="textItem"><font class='textTitleCss'>消费时间：</font><input type="text" class="txt" name="consumeTime" id="consumeTime" value="${pojo.consumeTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写消费时间</font></div>
			<div class="textItem"><font class='textTitleCss'>之前余额：</font><input type="text" class="txt" name="consumeBeforeMoney" id="consumeBeforeMoney" value="${pojo.consumeBeforeMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写之前余额</font></div>
			<div class="textItem"><font class='textTitleCss'>之后余额：</font><input type="text" class="txt" name="consumeAfterMoney" id="consumeAfterMoney" value="${pojo.consumeAfterMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写之后余额</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiConsumeFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
