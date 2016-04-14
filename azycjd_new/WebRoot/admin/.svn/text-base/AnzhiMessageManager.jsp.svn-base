<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			站内信管理
		</div>
	</div>
	<form id="AnzhiMessageForm" action="anzhimessage/findAnzhiMessageAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				&nbsp;&nbsp;接受者：<input class="inputTextCss" type="text" id="memberIdReceive" name="memberIdReceive" class="txt" value="${param.memberIdReceive}"/>
			</div>
			<div class='searchDivItemText'>
				&nbsp;&nbsp;发送者：<input class="inputTextCss" type="text" id="memberIdSend" name="memberIdSend" class="txt" value="${param.memberIdSend}"/>
			</div>
			<div class='searchDivItemText'>
				邮件类型：
				<select class="txt" style="width:135px;" name="messageType" id="messageType">
					<option value="">全部</option>
					<option value="1">读者</option>
					<option value="2">作家</option>
					<option value="3">管理员</option>
				</select>
			</div>
			<div class='searchDivItemText'>
				阅读状态：
				<select class="txt" style="width:135px;" name="messageRead" id="messageRead">
					<option value="">全部</option>
					<option value="0">未读</option>
					<option value="1">已读</option>
				</select>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhimessage/findAnzhiMessageAll.do','AnzhiMessageForm')"/>
				<input id='addanzhimessage' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhimessage/anzhimessageAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>接受者</td>
					<td>发送者</td>
					<td>消息标题</td>
					<td>邮件类型</td>
					<td>阅读状态</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhimessageList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.sendMemberNick }</td>
						<td>${s.messageTitle }</td>
						<td>
							<c:if test="${s.messageType == 1}">读者</c:if>
							<c:if test="${s.messageType == 2}">作家</c:if>
							<c:if test="${s.messageType == 3}">管理员</c:if>
						</td>
						<td>
							<c:if test="${s.messageRead == 0}">未读</c:if>
							<c:if test="${s.messageRead == 1}">已读</c:if>
						</td>
						<td>
							<!-- <a id='updateanzhimessage${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhimessage/findAnzhiMessageById.do?anzhimessageId=${s.id}',this,'updateanzhimessage')">[查看]</a> -->
							<a id='deleteanzhimessage${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhimessage/delAnzhiMessage.do?anzhimessageId=${s.id }',this,'deleteanzhimessage')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhimessage/findAnzhiMessageAll.do" name="url"/>
				<jsp:param value="${anzhimessageList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhimessageList.num }" name="num"/>
				<jsp:param value="AnzhiMessageForm" name="formId"/>
				<jsp:param value="${anzhimessageList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
