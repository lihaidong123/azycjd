<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="incomegaikuangform" method="post" action="anzhiconsume/findAnzhiConsumeMyCome.do?linenumber=14&&index=7&&chooseIndex=0">
	<div class="divTableCss" id="incomegaikuang">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>作品名称</td>
			<td>收入金额</td>
			<td>按月查看</td>
		  </tr>
		  <c:forEach items="${anzhiconsumeList.list}" var="a" varStatus="ind">
		  	 <tr>
			  	<td>${ind.index+1 }</td>
				<td>${a.novelTitle }</td>
				<td>${a.novelMoney }</td>
				<td><div class="incomecheckmonth" style="cursor:pointer;">点击查看</div>
					<input type="hidden" value="${a.tableId }" class="xiaoshuodeid"/>
					<input type="hidden" value="${a.novelTitle }" name="xiaoshuodename" class="xiaoshuodename"/>
				</td>
			 </tr>
		  </c:forEach>
		 </table>
		 <jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhiconsume/findAnzhiConsumeMyCome.do?linenumber=14&&index=7&&chooseIndex=0" name="url"/>
			<jsp:param value="${anzhiconsumeList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhiconsumeList.num }" name="num"/>
			<jsp:param value="incomegaikuangform" name="formId"/>
			<jsp:param value="${anzhiconsumeList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
