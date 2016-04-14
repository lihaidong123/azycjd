<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<form class="formCss" id="day_dingyue_form">
	<div class="divTableCss">
	<table class="tableCss" width="100%" border="0">
	  <tr class="tableTitleCss">
	  	<td width="40%">作品名称</td>
		<td width="10%" align="center">总订阅</td>
		<td width="16%" align="center">章节平均订阅</td>
		<td width="16%" align="center">单章最高订阅</td>
		<td width="16%" align="center">昨日新增订阅</td>
	  </tr>
	  <tr>
	  	<td align="left">${pojo.novelTitle }</td>
	  	<td align="center">${zongdingyue }</td>
	  	<td align="center">${pingjundingyue }</td>
		<td align="center">${zuigaodingyue }</td>
		<td align="center">${zuoridingyue }</td>
	  </tr>
	  </table>
	<table class="tableCss" width="100%" border="0" style="margin-top:30px;">
	  <tr class="tableTitleCss">
	  	<td width="60%">章节名</td>
		<td width="10%" align="center">字数</td>
		<td width="20%" align="center">上传时间</td>
		<td width="15%" align="center">订阅数</td>
	  </tr>
	  <c:forEach items="${chapterNumData.list }" var="s">
	  	<tr>
		  	<td align="left">
		  		<a target="_blank" href="<%=request.getContextPath() %>/anzhichapter/read.do?chapterId=${s.chapterId}">${s.chapterTitle }</a>
		  	</td>
		  	<td align="center">${s.contentNum }</td>
			<td align="center">${s.lastUpdateTime }</td>
			<td align="center">${s.nums }</td>
		  </tr>
	  </c:forEach>
	  </table>
	</div>
	<div style="padding: 15px;">
		<jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhichapter/dingyuechaxu.do?novelId=${param.novelId}&&linenumber=11&&index=8&&chooseIndex=2" name="url"/>
			<jsp:param value="${chapterNumData.totalNum }" name="totalNum"/>
			<jsp:param value="${chapterNumData.num }" name="num"/>
			<jsp:param value="day_dingyue_form" name="formId"/>
			<jsp:param value="${chapterNumData.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>