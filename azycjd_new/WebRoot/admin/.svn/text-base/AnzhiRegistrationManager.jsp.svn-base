<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiRegistration管理
		</div>
	</div>
	<form id="AnzhiRegistrationForm" action="anzhiregistration/findAnzhiRegistrationAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				签到者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				签到时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiregistration/findAnzhiRegistrationAll.do','AnzhiRegistrationForm')"/>
				<input id='addanzhiregistration' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiregistration/anzhiregistrationAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>签到者id</td>
					<td>签到时间</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiregistrationList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.addTime }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhiregistration${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiregistration/findAnzhiRegistrationById.do?anzhiregistrationId=${s.id}',this,'updateanzhiregistration')">[查看]</a>
							<a id='deleteanzhiregistration${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiregistration/delAnzhiRegistration.do?anzhiregistrationId=${s.id }',this,'deleteanzhiregistration')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiregistration/findAnzhiRegistrationAll.do" name="url"/>
				<jsp:param value="${anzhiregistrationList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiregistrationList.num }" name="num"/>
				<jsp:param value="AnzhiRegistrationForm" name="formId"/>
				<jsp:param value="${anzhiregistrationList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
