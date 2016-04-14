<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="cavebookmarksform" action="anzhibookmark/findAnzhiBookmarkMySelf.do?pageName=index/line_cave_bookmarks&&linenumber=3&&index=6&&chooseIndex=0" method="post">
	<div class="divTableCss">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>小说名称</td>
			<td>书签位置</td>
			<td>作者</td>
			<td>添加时间</td>
			<td>操作</td>
		  </tr>
		  <c:forEach items="${anzhibookmarkList.list}" var="a" varStatus="ind">
		  	 <tr>
			  	<td>${ind.index+1 }</td>
				<td>${a.novelTitle }</td>
				<td>${a.chapterTitle }</td>
				<td>${a.authorWriterName }</td>
				<td>
					<fmt:formatDate value="${a.addTime }" pattern="yyyy/MM/dd  HH:mm"/>
				</td>
				<td><a href="<%=request.getContextPath()%>/anzhichapter/read.do?chapterId=${a.chapterId}&&readAddress=${a.readAddress}" target="_blank">继续阅读</a></td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
	<jsp:include page="../next_page.jsp" flush="false">
		<jsp:param value="anzhibookmark/findAnzhiBookmarkMySelf.do?pageName=index/line_cave_bookmarks&&linenumber=3&&index=6&&chooseIndex=0" name="url"/>
		<jsp:param value="${anzhibookmarkList.totalNum }" name="totalNum"/>
		<jsp:param value="${anzhibookmarkList.num }" name="num"/>
		<jsp:param value="cavebookmarksform" name="formId"/>
		<jsp:param value="${anzhibookmarkList.total }" name="total"/>
		<jsp:param value="${param.size}" name="size"/>
	</jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
