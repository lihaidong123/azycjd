<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="accountrechargeform" action="anzhirecharge/findMyAnzhiRechargeAll.do?pageName=index/information_account_recharge&&linenumber=2&&index=1&&chooseIndex=1" method="post">
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
						<tr class="tableTitleCss">
							<td>充值序号</td>
							<td>充值时间</td>
							<td>充值金额(安之币)</td>
							<td>充值状态</td>
							<td>之前余额(安之币)</td>
							<td>之后余额(安之币)</td>
						</tr>
						<c:forEach items="${myanzhirechargeList.list }" var="mycharge" varStatus="ind">
							<tr>
								<td>${ind.index+1 }</td>
								<td>
									<fmt:formatDate value="${mycharge.addTime }" pattern="yyyy-MM-dd  HH:mm"/>
								</td>
								<td>${mycharge.rechargeAnzhiMoney }</td>
								<td>成功</td>
								<td>${mycharge.beforeBalance }</td>
								<td>${mycharge.afterBalance }</td>
							</tr>
						</c:forEach>
					</table>
		    </div>
		 	<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhirecharge/findMyAnzhiRechargeAll.do?pageName=index/information_account_recharge&&linenumber=2&&index=1&&chooseIndex=1" name="url"/>
				<jsp:param value="${myanzhirechargeList.totalNum }" name="totalNum"/>
				<jsp:param value="${myanzhirechargeList.num }" name="num"/>
				<jsp:param value="accountrechargeform" name="formId"/>
				<jsp:param value="${myanzhirechargeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
    </form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>