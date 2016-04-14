<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			违法关键字操作
		</div>
	</div>
	<form id="AnzhiIllegalCharFormAction" action="<%=request.getContextPath()%>/anzhiillegalchar/addAnzhiIllegalChar.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="0" alt=""/>
			<input type="hidden" class="txt" name="addMemberId" id="addMemberId" value="${loginUsers.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>关键字符：</font><input type="text" class="txt" name="charName" id="charName" value="${pojo.charName}" alt="\S{1,30};请填写关键字符"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写关键字符</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="charVote" id="charVote" value="${pojo.charVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiIllegalCharFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
