<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			未通过章节审核管理
		</div>
	</div>
	<form id="AnzhiChapterForm" action="anzhichapter/findAnzhiChapterAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				章节标题：<input class="inputTextCss" type="text" id="chapterTitle" name="chapterTitle" class="txt" value="${param.chapterTitle}"/>
			</div>
			<div class='searchDivItemText'>
				章节内容：<input class="inputTextCss" type="text" id="chapterContent" name="chapterContent" class="txt" value="${param.chapterContent}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhichapter/nopassCheck.do','AnzhiChapterForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>章节标题</td>
					<td>作者</td>
					<td>字数</td>
					<td>发布时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhichapterList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.chapterReportNovelId }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.chapterTitle }</td>
						<td>${s.authorWriterName }</td>
						<td>${s.chapterCharNum }</td>
						<td>${s.lastUpdateTime }</td>
						<td>
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhichapter${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhichapter/findAnzhiChapterById.do?anzhichapterId=${s.novelId}&&tableId=${s.id }&&pageName=admin/nopassCheckAction',this,'updateanzhichapter')">[查看]</a>
							</c:if>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="7" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="1" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhichapter/nopassCheck.do" name="url"/>
				<jsp:param value="${anzhichapterList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhichapterList.num }" name="num"/>
				<jsp:param value="AnzhiChapterForm" name="formId"/>
				<jsp:param value="${anzhichapterList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
