<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiFriend管理
		</div>
	</div>
	<form id="AnzhiFriendForm" action="anzhifriend/findAnzhiFriendAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				好友id：<input class="inputTextCss" type="text" id="friendMemberId" name="friendMemberId" class="txt" value="${param.friendMemberId}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				1-禁用  0-启用：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhifriend/findAnzhiFriendAll.do','AnzhiFriendForm')"/>
				<input id='addanzhifriend' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhifriend/anzhifriendAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>读者id</td>
					<td>好友id</td>
					<td>添加时间</td>
					<td>1-禁用  0-启用</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhifriendList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.friendMemberId }</td>
						<td>${s.addTime }</td>
						<td>${s.state }</td>
						<td>
							<a id='updateanzhifriend${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhifriend/findAnzhiFriendById.do?anzhifriendId=${s.id}',this,'updateanzhifriend')">[查看]</a>
							<a id='deleteanzhifriend${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhifriend/delAnzhiFriend.do?anzhifriendId=${s.id }',this,'deleteanzhifriend')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhifriend/findAnzhiFriendAll.do" name="url"/>
				<jsp:param value="${anzhifriendList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhifriendList.num }" name="num"/>
				<jsp:param value="AnzhiFriendForm" name="formId"/>
				<jsp:param value="${anzhifriendList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
