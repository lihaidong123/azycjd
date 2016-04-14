<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiComment管理
		</div>
	</div>
	<form id="AnzhiCommentForm" action="anzhicomment/findAnzhiCommentAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				表格id：<input class="inputTextCss" type="text" id="tableId" name="tableId" class="txt" value="${param.tableId}"/>
			</div>
			<div class='searchDivItemText'>
				书评标题：<input class="inputTextCss" type="text" id="commentTitle" name="commentTitle" class="txt" value="${param.commentTitle}"/>
			</div>
			<div class='searchDivItemText'>
				书评内容：<input class="inputTextCss" type="text" id="commentContent" name="commentContent" class="txt" value="${param.commentContent}"/>
			</div>
			<div class='searchDivItemText'>
				评论类型(0-小说 1-章节 2-系统悬赏评论)：<input class="inputTextCss" type="text" id="commentType" name="commentType" class="txt" value="${param.commentType}"/>
			</div>
			<div class='searchDivItemText'>
				父级评论(0-第一条评论)：<input class="inputTextCss" type="text" id="commentFatherid" name="commentFatherid" class="txt" value="${param.commentFatherid}"/>
			</div>
			<div class='searchDivItemText'>
				评论状态(0-无效评论 1-正常评论)：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				评论时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				是否置顶：<input class="inputTextCss" type="text" id="isTop" name="isTop" class="txt" value="${param.isTop}"/>
			</div>
			<div class='searchDivItemText'>
				是否精华：<input class="inputTextCss" type="text" id="isMarrow" name="isMarrow" class="txt" value="${param.isMarrow}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicomment/findAnzhiCommentAll.do','AnzhiCommentForm')"/>
				<input id='addanzhicomment' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhicomment/anzhicommentAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>读者id</td>
					<td>表格id</td>
					<td>书评标题</td>
					<td>书评内容</td>
					<td>评论类型(0-小说 1-章节 2-系统悬赏评论)</td>
					<td>父级评论(0-第一条评论)</td>
					<td>评论状态(0-无效评论 1-正常评论)</td>
					<td>评论时间</td>
					<td>是否置顶</td>
					<td>是否精华</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhicommentList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.tableId }</td>
						<td>${s.commentTitle }</td>
						<td>${s.commentContent }</td>
						<td>${s.commentType }</td>
						<td>${s.commentFatherid }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>${s.isTop }</td>
						<td>${s.isMarrow }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhicomment${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhicomment/findAnzhiCommentById.do?anzhicommentId=${s.id}',this,'updateanzhicomment')">[查看]</a>
							<a id='deleteanzhicomment${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhicomment/delAnzhiComment.do?anzhicommentId=${s.id }',this,'deleteanzhicomment')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhicomment/findAnzhiCommentAll.do" name="url"/>
				<jsp:param value="${anzhicommentList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhicommentList.num }" name="num"/>
				<jsp:param value="AnzhiCommentForm" name="formId"/>
				<jsp:param value="${anzhicommentList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
