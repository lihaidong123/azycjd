<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="cashmanageform" action="anzhicash/findAnzhiCashMySelf.do?pageName=index/line_cash_manage&&linenumber=15&&chooseIndex=0" method="post">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">提现管理</div>
	</div>
	<div class="second_title_css" >
		<div style="margin-left:10px;float:left;">我的安之币：${loginUsers.memberMoney }</div>
		<div><input class="addBtnCss" style="margin-left:120px;float:left;" type="button" value="我要提现" id="index/line_cash_apply.jsp#linenumber=15#chooseIndex=0" onclick="getJspData(this)" /></div>
	</div>
	<div class="divTableCss" id="incomegaikuang">
		<table class="tableCss" width="100%" border="0">
		  <tr class="tableTitleCss">
			<td>序号</td>
			<td>提现安之币</td>
			<td>提现金额</td>
			<td>提现时间</td>
			<td>提现状态</td>
		  </tr>
		  <c:forEach items="${anzhicashList.list}" var="a" varStatus="ind">
		  	 <tr>
			  	<td>${ind.index+1 }</td>
				<td>${a.anzhiMoneyCash }</td>
				<td>${a.cashMoney }</td>
				<td>
					<fmt:formatDate value="${a.addTime}" pattern="yyyy-MM-dd  HH:mm"/>
				</td>
				<td>
					<c:if test="${a.state ==0 }">未处理</c:if>
					<c:if test="${a.state ==1 }">已处理</c:if>
				</td>
			 </tr>
		  </c:forEach>
		 </table>
		 <jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhicash/findAnzhiCashMySelf.do?pageName=index/line_cash_manage&&linenumber=15&&chooseIndex=0" name="url"/>
			<jsp:param value="${anzhicashList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhicashList.num }" name="num"/>
			<jsp:param value="cashmanageform" name="formId"/>
			<jsp:param value="${anzhicashList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
	</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>
