<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="mycommentform" action="anzhicomment/findMyAnzhiCommentAll.do?pageName=index/my_comment_person&&linenumber=4&&index=3&&chooseIndex=0" method="post">
	  <div class="divTableCss">
		 <table class="tableCss" width="100%" >
			<tr class="tableTitleCss">
			    <td>序号</td>
				<td>书名</td>
				<td>书评标题</td>
				<td>回复数</td>
				<td>最后回复时间</td>
			</tr>
			<c:forEach items="${anzhicommentList.list }" var="comment" varStatus="ind">
				<tr>
				    <td>${ind.index+1 }</td>
					<td><a href="<%=request.getContextPath() %>/novel/${comment.tableId }.jsp?scrollComentId=${comment.id}" target="_blank"  style="color: blue">${comment.commentName }</a></td>
					<td>${comment.commentTitle }</td>
					<td>${comment.commentNum }</td>
					<td>
						<fmt:formatDate value="${comment.addTime }" pattern="yyyy-MM-dd  HH:mm"/>
					</td>
				</tr>
			</c:forEach>
		 </table>
	  </div>
		<jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhicomment/findMyAnzhiCommentAll.do?pageName=index/my_comment_person&&linenumber=4&&index=3&&chooseIndex=0" name="url"/>
			<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhicommentList.num }" name="num"/>
			<jsp:param value="mycommentform" name="formId"/>
			<jsp:param value="${anzhicommentList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>