<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			举报处理操作
		</div>
	</div>
	<form id="AnzhiReportFormAction" action="<%=request.getContextPath()%>/anzhireport/addAnzhiReport.do" method="post">
		<div class="inputItemsCssss" id="needDisableDiv">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说名称：</font><input type="text" class="txt" class="disable_css" name="tableId" id="tableId" style="width:500px;" value="${chapterpojo.novelTitle}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>章节名称：</font><input type="text" class="txt" class="disable_css" name="chapterTitle" id="chapterTitle" style="width:500px;" value="${chapterpojo.chapterTitle}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>举报原因：</font><input type="text" class="txt" name="reportReason" id="reportReason" style="width:700px;" value="${pojo.reportReason}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>处理状态：</font><input type="text" class="txt" class="disable_css" name="state" id="state" value="${pojo.state}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>举报时间：</font><input type="text" class="txt" class="disable_css" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>举报人员：</font><input type="text" class="txt" class="disable_css" name="addMemberId" id="addMemberId" value="${pojo.addMemberId}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>举报说明：</font><br/>
				<div style="padding: 10px; color: red;">${pojo.reportVote}</div>
			</div>
		</div>
	</form>
	<jsp:include page="AnzhiHandleAction.jsp" flush="false">
		<jsp:param value="${pojo.id }" name="tableId"/>
		<jsp:param value="0" name="handleType"/>
		<jsp:param value="anzhireport/findAnzhiReportAll.do" name="actionUrl"/>
	</jsp:include>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
