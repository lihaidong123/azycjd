<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="commentpriseform" action="anzhinovelmultifunction/findAnzhiNovelMultifunctionMydianbook.do?pageName=index/my_comment_prise&&linenumber=3&&&&index=3&&chooseIndex=2" method="post">
		  <div class="divTableCss">
			 <table class="tableCss" width="100%" >
				<tr class="tableTitleCss">
				    <td>序号</td>
					<td>书名</td>
					<td>作者</td>
					<td>点赞时间</td>
				</tr>
				<c:forEach items="${anzhinovelmultifunctionList.list}" var="a" varStatus="ind">
					<tr>
					    <td>${ind.index+1}</td>
						<td><a href="<%=request.getContextPath() %>/novel/${a.tableId }.jsp" target="_blank"  style="color: blue">${a.novelTitle }</a></td>
						<td>${a.authorWriterName }</td>
						<td>
							<fmt:formatDate value="${a.addTime }" pattern="yyyy-MM-dd  HH:mm"/>
						</td>
					</tr>
				</c:forEach>
				
			 </table>
	    </div>
	   	<jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhinovelmultifunction/findAnzhiNovelMultifunctionMydianbook.do?pageName=index/my_comment_prise&&linenumber=3&&&&index=3&&chooseIndex=2" name="url"/>
			<jsp:param value="${anzhinovelmultifunctionList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhinovelmultifunctionList.num }" name="num"/>
			<jsp:param value="commentpriseform" name="formId"/>
			<jsp:param value="${anzhinovelmultifunctionList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>