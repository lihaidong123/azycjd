<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelReadMoneyBuyRecord管理
		</div>
	</div>
	<form id="AnzhiNovelReadMoneyBuyRecordForm" action="anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				用户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				消费阅读币：<input class="inputTextCss" type="text" id="userMoney" name="userMoney" class="txt" value="${param.userMoney}"/>
			</div>
			<div class='searchDivItemText'>
				之前阅读币：<input class="inputTextCss" type="text" id="beforeReadMoney" name="beforeReadMoney" class="txt" value="${param.beforeReadMoney}"/>
			</div>
			<div class='searchDivItemText'>
				之后阅读币：<input class="inputTextCss" type="text" id="afterReadMoney" name="afterReadMoney" class="txt" value="${param.afterReadMoney}"/>
			</div>
			<div class='searchDivItemText'>
				备注说明：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div class='searchDivItemText'>
				状态(0-未启用 1-启用)：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll.do','AnzhiNovelReadMoneyBuyRecordForm')"/>
				<input id='addanzhinovelreadmoneybuyrecord' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhinovelreadmoneybuyrecord/anzhinovelreadmoneybuyrecordAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>章节id</td>
					<td>用户id</td>
					<td>消费阅读币</td>
					<td>之前阅读币</td>
					<td>之后阅读币</td>
					<td>备注说明</td>
					<td>状态(0-未启用 1-启用)</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelreadmoneybuyrecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.chapterId }</td>
						<td>${s.memberId }</td>
						<td>${s.userMoney }</td>
						<td>${s.beforeReadMoney }</td>
						<td>${s.afterReadMoney }</td>
						<td>${s.vote }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhinovelreadmoneybuyrecord${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordById.do?anzhinovelreadmoneybuyrecordId=${s.id}',this,'updateanzhinovelreadmoneybuyrecord')">[查看]</a>
							<a id='deleteanzhinovelreadmoneybuyrecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinovelreadmoneybuyrecord/delAnzhiNovelReadMoneyBuyRecord.do?anzhinovelreadmoneybuyrecordId=${s.id }',this,'deleteanzhinovelreadmoneybuyrecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovelreadmoneybuyrecord/findAnzhiNovelReadMoneyBuyRecordAll.do" name="url"/>
				<jsp:param value="${anzhinovelreadmoneybuyrecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelreadmoneybuyrecordList.num }" name="num"/>
				<jsp:param value="AnzhiNovelReadMoneyBuyRecordForm" name="formId"/>
				<jsp:param value="${anzhinovelreadmoneybuyrecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
