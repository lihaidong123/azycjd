<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiTrendReply管理
		</div>
	</div>
	<form id="AnzhiTrendReplyForm" action="anzhitrendreply/findAnzhiTrendReplyAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				广播id：<input class="inputTextCss" type="text" id="trendId" name="trendId" class="txt" value="${param.trendId}"/>
			</div>
			<div class='searchDivItemText'>
				回复者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				回复内容：<input class="inputTextCss" type="text" id="replyContent" name="replyContent" class="txt" value="${param.replyContent}"/>
			</div>
			<div class='searchDivItemText'>
				父级回复(0-第一条评论)：<input class="inputTextCss" type="text" id="fatherId" name="fatherId" class="txt" value="${param.fatherId}"/>
			</div>
			<div class='searchDivItemText'>
				回复时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				状态(0-启用 1-禁用)：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhitrendreply/findAnzhiTrendReplyAll.do','AnzhiTrendReplyForm')"/>
				<input id='addanzhitrendreply' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhitrendreply/anzhitrendreplyAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>广播id</td>
					<td>回复者id</td>
					<td>回复内容</td>
					<td>父级回复(0-第一条评论)</td>
					<td>回复时间</td>
					<td>状态(0-启用 1-禁用)</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhitrendreplyList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.trendId }</td>
						<td>${s.memberId }</td>
						<td>${s.replyContent }</td>
						<td>${s.fatherId }</td>
						<td>${s.addTime }</td>
						<td>${s.state }</td>
						<td>
							<a id='updateanzhitrendreply${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhitrendreply/findAnzhiTrendReplyById.do?anzhitrendreplyId=${s.id}',this,'updateanzhitrendreply')">[查看]</a>
							<a id='deleteanzhitrendreply${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhitrendreply/delAnzhiTrendReply.do?anzhitrendreplyId=${s.id }',this,'deleteanzhitrendreply')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhitrendreply/findAnzhiTrendReplyAll.do" name="url"/>
				<jsp:param value="${anzhitrendreplyList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhitrendreplyList.num }" name="num"/>
				<jsp:param value="AnzhiTrendReplyForm" name="formId"/>
				<jsp:param value="${anzhitrendreplyList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
