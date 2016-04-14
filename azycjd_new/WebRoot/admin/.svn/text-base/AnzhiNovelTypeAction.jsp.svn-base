<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelType操作
		</div>
	</div>
	<form id="AnzhiNovelTypeFormAction" action="<%=request.getContextPath()%>/anzhinoveltype/addAnzhiNovelType.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说id：</font><input type="text" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说id</font></div>
			<div class="textItem"><font class='textTitleCss'>大的类型：</font><input type="text" class="txt" name="bigType" id="bigType" value="${pojo.bigType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写大的类型</font></div>
			<div class="textItem"><font class='textTitleCss'>小的类型：</font><input type="text" class="txt" name="smallType" id="smallType" value="${pojo.smallType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小的类型</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelTypeFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
