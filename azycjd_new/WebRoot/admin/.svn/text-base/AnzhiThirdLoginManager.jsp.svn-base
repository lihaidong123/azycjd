<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiThirdLogin管理
		</div>
	</div>
	<form id="AnzhiThirdLoginForm" action="anzhithirdlogin/findAnzhiThirdLoginAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				用户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				充值金额：<input class="inputTextCss" type="text" id="thirdLoginPid" name="thirdLoginPid" class="txt" value="${param.thirdLoginPid}"/>
			</div>
			<div class='searchDivItemText'>
				0-qq 1-微博：<input class="inputTextCss" type="text" id="thirdLoginType" name="thirdLoginType" class="txt" value="${param.thirdLoginType}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhithirdlogin/findAnzhiThirdLoginAll.do','AnzhiThirdLoginForm')"/>
				<input id='addanzhithirdlogin' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhithirdlogin/anzhithirdloginAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>用户id</td>
					<td>充值金额</td>
					<td>0-qq 1-微博</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhithirdloginList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.thirdLoginPid }</td>
						<td>${s.thirdLoginType }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhithirdlogin${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhithirdlogin/findAnzhiThirdLoginById.do?anzhithirdloginId=${s.id}',this,'updateanzhithirdlogin')">[查看]</a>
							<a id='deleteanzhithirdlogin${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhithirdlogin/delAnzhiThirdLogin.do?anzhithirdloginId=${s.id }',this,'deleteanzhithirdlogin')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhithirdlogin/findAnzhiThirdLoginAll.do" name="url"/>
				<jsp:param value="${anzhithirdloginList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhithirdloginList.num }" name="num"/>
				<jsp:param value="AnzhiThirdLoginForm" name="formId"/>
				<jsp:param value="${anzhithirdloginList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
