<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			提现管理
		</div>
	</div>
	<form id="AnzhiCashForm" action="anzhicash/findAnzhiCashAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				作家昵称：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
			</div>
			<div class='searchDivItemText' id="advTydhjpebenefitTypes">
				<script language="javascript">
					showSelect("state","state","${param.state}",actionsTypeData,"advTydhjpebenefitTypes","提现状态：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicash/findAnzhiCashAll.do','AnzhiCashForm')"/>
				<!-- <input id='addanzhicash' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhicash/anzhicashAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>作家昵称</td>
					<td>当前安之币</td>
					<td>提现安之币</td>
					<td>提现金额(人民币)</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhicashList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.anzhiMoneyRemaining }</td>
						<td>${s.anzhiMoneyCash }</td>
						<td>${s.cashMoney }</td>
						<td>
						<c:if test="${s.state ==0 }">
							未处理
						</c:if>
						<c:if test="${s.state ==1 }">
							已处理
						</c:if>
						</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<!-- <a id='updateanzhicash${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhicash/findAnzhiCashById.do?anzhicashId=${s.id}',this,'updateanzhicash')">[查看]</a> -->
							<a id='deleteanzhicash${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhicash/delAnzhiCash.do?anzhicashId=${s.id }',this,'deleteanzhicash')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhicash/findAnzhiCashAll.do" name="url"/>
				<jsp:param value="${anzhicashList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhicashList.num }" name="num"/>
				<jsp:param value="AnzhiCashForm" name="formId"/>
				<jsp:param value="${anzhicashList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
