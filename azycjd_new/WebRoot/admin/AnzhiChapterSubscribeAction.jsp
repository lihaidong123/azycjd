<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapterSubscribe操作
		</div>
	</div>
	<form id="AnzhiChapterSubscribeFormAction" action="<%=request.getContextPath()%>/anzhichaptersubscribe/addAnzhiChapterSubscribe.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>章节id：</font><input type="text" class="txt" name="chapterId" id="chapterId" value="${pojo.chapterId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节id</font></div>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>订阅时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写订阅时间</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-编写中 1-已完成)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-编写中 1-已完成)</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiChapterSubscribeFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
