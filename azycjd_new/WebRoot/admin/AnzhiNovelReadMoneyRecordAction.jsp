<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			[${memberNick }]阅读币充值操作
		</div>
	</div>
	<form id="AnzhiNovelReadMoneyRecordFormAction" action="<%=request.getContextPath()%>/anzhinovelreadmoneyrecord/addAnzhiNovelReadMoneyRecord.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="memberId" id="memberId" value="${param.memberId}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="0" alt=""/>
			<div class="textItem"><font class='textTitleCss'>用户名称：</font><input type="text" class="txt" name="memberNick" id="memberNick" readonly="readonly" value="${memberNick }" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>充值阅读币：</font><input type="text" class="txt" name="readMoney" id="readMoney" onKeyUp="value=value.replace(/\D/g,'')" value="0" alt="\d{1,5};充值阅读币填写错误！"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写充值阅读币</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelReadMoneyRecordFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
