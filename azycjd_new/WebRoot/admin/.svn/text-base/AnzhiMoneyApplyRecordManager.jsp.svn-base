<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiMoneyApplyRecord管理
		</div>
	</div>
	<form id="AnzhiMoneyApplyRecordForm" action="anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				用户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				充值金额：<input class="inputTextCss" type="text" id="chongMoney" name="chongMoney" class="txt" value="${param.chongMoney}"/>
			</div>
			<div class='searchDivItemText'>
				商品订单号：<input class="inputTextCss" type="text" id="orderNo" name="orderNo" class="txt" value="${param.orderNo}"/>
			</div>
			<div class='searchDivItemText'>
				状态(0-未充值 1-已充值)：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll.do','AnzhiMoneyApplyRecordForm')"/>
				<input id='addanzhimoneyapplyrecord' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhimoneyapplyrecord/anzhimoneyapplyrecordAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>用户id</td>
					<td>充值金额</td>
					<td>商品订单号</td>
					<td>状态(0-未充值 1-已充值)</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhimoneyapplyrecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.chongMoney }</td>
						<td>${s.orderNo }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhimoneyapplyrecord${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordById.do?anzhimoneyapplyrecordId=${s.id}',this,'updateanzhimoneyapplyrecord')">[查看]</a>
							<a id='deleteanzhimoneyapplyrecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhimoneyapplyrecord/delAnzhiMoneyApplyRecord.do?anzhimoneyapplyrecordId=${s.id }',this,'deleteanzhimoneyapplyrecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhimoneyapplyrecord/findAnzhiMoneyApplyRecordAll.do" name="url"/>
				<jsp:param value="${anzhimoneyapplyrecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhimoneyapplyrecordList.num }" name="num"/>
				<jsp:param value="AnzhiMoneyApplyRecordForm" name="formId"/>
				<jsp:param value="${anzhimoneyapplyrecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
