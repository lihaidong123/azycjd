<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			收益查询
		</div>
	</div>
	<form id="AnzhiWebEditorWorkForm" action="anzhichaptersubscribe/income.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				开始日期：<input class="inputTextCss" type="text" id="begTime" onClick="WdatePicker()" name="begTime" class="txt" value="${param.begTime}"/>
			</div>
			<div class='searchDivItemText'>
				结束日期：<input class="inputTextCss" type="text" id="endTime" onClick="WdatePicker()" name="endTime" class="txt" value="${param.endTime}"/>
			</div>
			<div class='searchDivItemText'>
				作家笔名：<input class="inputTextCss" type="text" id="writerName" name="writerName" class="txt" value="${param.writerName}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhichaptersubscribe/income.do','AnzhiWebEditorWorkForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>作家笔名</td>
					<td>章节购买收入</td>
					<td>打赏收入</td>
					<td>阅读币收入</td>
				</tr>
				<c:forEach items="${incomeList}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.writerName }</td>
						<td>${s.zhangjieIncome }</td>
						<td>${s.dashangIncome }</td>
						<td>${s.yuedubiIncome }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
