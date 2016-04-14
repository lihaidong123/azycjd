<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="accountconsumeform" action="anzhiconsume/findAnzhiConsumeMySelf.do?pageName=index/information_account_consume&&linenumber=2&&index=1&&chooseIndex=2" method="post">
		<div class="divTableCss">
				<style type="text/css">
					.selectDivCss{margin-left: 552px;}
				</style>
				<table width="100%">
					<tr>
						<td>昵称：${loginUsers.memberNick }</td>
					</tr>
					<tr>
						<td style="padding-top: 10px;">
							账户余额(安之币)：${loginUsers.memberMoney }
							<input type="text" style="width:120px; float: right; margin-right: 20px;" class="selectTxtCss" id="accountSearch" name="accountSearch" >
						</td>
					</tr>
				</table>
				<table class="tableCss" width="100%" style="margin-top: 30px;">
					<tr>
						<td>序号</td>
						<td>消费时间</td>
						<td>消费金额(安之币)</td>
						<td>消费小说</td>
						<td>消费类型</td>
						<td>之前余额(安之币)</td>
						<td>之后余额(安之币)</td>
					</tr>
					<c:forEach items="${anzhiconsumeList.list}" var="a" varStatus="ind">
						<tr>
							<td>${ind.index+1 }</td>
							<td>
								<fmt:formatDate value="${a.consumeTime }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${a.consumeAnzhiMoney }</td>
							<td>${a.consumeName }</td>
							<c:if test="${a.consumeType ==0}">
								<td>打赏</td>
							</c:if>
							<c:if test="${a.consumeType ==1}">
								<td>购买</td>
							</c:if>
							<td>${a.consumeBeforeMoney }</td>
							<td>${a.consumeAfterMoney }</td>
						</tr>
					</c:forEach>
					
				</table>
	    </div>
	   <jsp:include page="../next_page.jsp" flush="false">
			<jsp:param value="anzhiconsume/findAnzhiConsumeMySelf.do?pageName=index/information_account_consume&&linenumber=2&&index=1&&chooseIndex=2" name="url"/>
			<jsp:param value="${anzhiconsumeList.totalNum }" name="totalNum"/>
			<jsp:param value="${anzhiconsumeList.num }" name="num"/>
			<jsp:param value="accountconsumeform" name="formId"/>
			<jsp:param value="${anzhiconsumeList.total }" name="total"/>
			<jsp:param value="${param.size}" name="size"/>
		</jsp:include>
   </form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>