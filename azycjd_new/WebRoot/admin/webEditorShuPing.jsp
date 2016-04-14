<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			小说评论管理
		</div>
	</div>
	<form id="AnzhiChapterForm" action="anzhinovel/webEditorShuPing.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovel/webEditorShuPing.do','AnzhiChapterForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>小说作者</td>
					<td>状态</td>
					<td>最新更新</td>
					<td>授权级别</td>
					<td>点击数</td>
					<td>阅读数</td>
					<td>是否签约</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.id }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.authorWriterName }</td>
						<td>${novelStateArr[s.state]}</td>
						<td>${s.updateTime }</td>
						<td>${s.authorizationLevel eq 0?'原创':'转载'}</td>
						<td>${s.clickNum }</td>
						<td>${s.readNum }</td>
						<td>${s.isSigned eq 0?'未签约':'已签约'}</td>
						<td>
							<a href="javascript:;" onclick="loadUpdatePageData('anzhicomment/anzhiCommentAllManageAdmin.do?tableId=${s.id}')">[评论管理]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovel/webEditorShuPing.do" name="url"/>
				<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelList.num }" name="num"/>
				<jsp:param value="AnzhiChapterForm" name="formId"/>
				<jsp:param value="${anzhinovelList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
