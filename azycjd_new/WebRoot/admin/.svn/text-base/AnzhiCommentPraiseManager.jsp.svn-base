<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiCommentPraise管理
		</div>
	</div>
	<form id="AnzhiCommentPraiseForm" action="anzhicommentpraise/findAnzhiCommentPraiseAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				评论id：<input class="inputTextCss" type="text" id="commentId" name="commentId" class="txt" value="${param.commentId}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				用户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicommentpraise/findAnzhiCommentPraiseAll.do','AnzhiCommentPraiseForm')"/>
				<input id='addanzhicommentpraise' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhicommentpraise/anzhicommentpraiseAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>评论id</td>
					<td>小说id</td>
					<td>章节id</td>
					<td>用户id</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhicommentpraiseList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.commentId }</td>
						<td>${s.novelId }</td>
						<td>${s.chapterId }</td>
						<td>${s.memberId }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhicommentpraise${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhicommentpraise/findAnzhiCommentPraiseById.do?anzhicommentpraiseId=${s.id}',this,'updateanzhicommentpraise')">[查看]</a>
							<a id='deleteanzhicommentpraise${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhicommentpraise/delAnzhiCommentPraise.do?anzhicommentpraiseId=${s.id }',this,'deleteanzhicommentpraise')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhicommentpraise/findAnzhiCommentPraiseAll.do" name="url"/>
				<jsp:param value="${anzhicommentpraiseList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhicommentpraiseList.num }" name="num"/>
				<jsp:param value="AnzhiCommentPraiseForm" name="formId"/>
				<jsp:param value="${anzhicommentpraiseList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
