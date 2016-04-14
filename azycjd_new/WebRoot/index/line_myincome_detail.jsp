<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<style>
		.selectDivCss{margin-left:54px !important;}
	</style>

<form class="formCss" id="incomedetailform" action="anzhiconsume/findAnzhiConsumeMyDetail.do?pageName=index/line_myincome_detail&&linenumber=14&&index=7&&chooseIndex=1" method="post">
	<div class="divTableCss">
		<table class="tableCss" width="100%" border="0">
		  <tr height="70">
			<td>查询时间:
				<input type="text" style="background-color: #fff;" class="txtCss" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="" name="">
			</td>
			<td>查询条件:
				<input type="text" style="width:240px;background-color: #fff;" class="selectTxtCss" id="incomedetailtype" name="incomedetailtype" value="全部">
			</td>
		  </tr>
		</table>
		
		<table class="tableCss" width="100%" border="0" style="margin-top:10px;">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>收入类型</td>
			<td>说明</td>
			<td>金额</td>
			<td>收入时间</td>
		  </tr>
		  <c:forEach items="${anzhiconsumeList.list}" var="a" varStatus="ind">
		  	 <tr>
			  	<td>${ind.index+1 }</td>
				<td>
					<c:if test="${a.consumeType == 0}">
						打赏
					</c:if>
					<c:if test="${a.consumeType == 1}">
						VIP阅读
					</c:if>
				</td>
				<td>${a.consumeName }</td>
				<td>${a.consumeAnzhiMoney }</td>
				<td>
					<fmt:formatDate value="${a.consumeTime }" pattern="yyyy-MM-dd HH:mm"/>
				</td>
			  </tr>
		  </c:forEach>
		</table>
		 <jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhiconsume/findAnzhiConsumeMyDetail.do?pageName=index/line_myincome_detail&&linenumber=14&&index=7&&chooseIndex=1" name="url"/>
			<jsp:param value="${anzhiconsumeList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhiconsumeList.num }" name="num"/>
			<jsp:param value="incomedetailform" name="formId"/>
			<jsp:param value="${anzhiconsumeList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
