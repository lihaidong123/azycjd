<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="commentreplyform" action="anzhicomment/findMyAnzhiCommentreplyAll.do?pageName=index/my_comment_reply&&linenumber=4&&index=3&&chooseIndex=1" method="post">
		<div class="divTableCss">
			 <table class="tableCss" width="100%" >
				<tr class="tableTitleCss">
				    <td>序号</td>
					<td>书名</td>
					<td>书评标题</td>
					<td>发布者</td>
					<td>回复内容</td>
					<td>回复时间</td>
				</tr>
				<c:forEach items="${anzhicommentreplyList.list}" var="a" varStatus="ind">
					<tr>
					    <td>${ind.index+1  }</td>
						<td><a href="<%=request.getContextPath() %>/novel/${a.tableId }.jsp" target="_blank"  style="color: blue">${a.commentName }</a></td>
						<td>${a.commentfathertitle }</td>
						<td>${a.commentfathername}</td>
						<td>${a.commentContent }</td>
						<td>
							<fmt:formatDate value="${a.addTime }" pattern="yyyy-MM-dd  HH:mm"/>
						</td>
					</tr>
				</c:forEach>
			 </table>
	 		<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhicomment/findMyAnzhiCommentreplyAll.do?pageName=index/my_comment_reply&&linenumber=4&&index=3&&chooseIndex=1" name="url"/>
				<jsp:param value="${anzhicommentreplyList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhicommentreplyList.num }" name="num"/>
				<jsp:param value="commentreplyform" name="formId"/>
				<jsp:param value="${anzhicommentreplyList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		 </div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
