<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			  充值管理
		</div>
	</div>
	<form id="AnzhiRechargeForm" action="anzhirecharge/findAnzhiRechargeAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				充值时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhirecharge/findAnzhiRechargeAll.do','AnzhiRechargeForm')"/>
				<!-- <input id='addanzhirecharge' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhirecharge/anzhirechargeAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>读者昵称</td>
					<td>充值金额</td>
					<td>充值安之币</td>
					<td>之前安之币</td>
					<td>之后安之币</td>
					<td>充值时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhirechargeList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.rechargeMoney }</td>
						<td>${s.rechargeAnzhiMoney }</td>
						<td>${s.beforeBalance }</td>
						<td>${s.afterBalance }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhirecharge${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhirecharge/findAnzhiRechargeById.do?anzhirechargeId=${s.id}',this,'updateanzhirecharge')">[查看]</a>
							<a id='deleteanzhirecharge${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhirecharge/delAnzhiRecharge.do?anzhirechargeId=${s.id }',this,'deleteanzhirecharge')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhirecharge/findAnzhiRechargeAll.do" name="url"/>
				<jsp:param value="${anzhirechargeList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhirechargeList.num }" name="num"/>
				<jsp:param value="AnzhiRechargeForm" name="formId"/>
				<jsp:param value="${anzhirechargeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
