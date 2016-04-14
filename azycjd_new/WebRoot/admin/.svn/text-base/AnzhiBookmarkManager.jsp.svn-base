<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiBookmark管理
		</div>
	</div>
	<form id="AnzhiBookmarkForm" action="anzhibookmark/findAnzhiBookmarkAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				阅读位置：<input class="inputTextCss" type="text" id="readAddress" name="readAddress" class="txt" value="${param.readAddress}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhibookmark/findAnzhiBookmarkAll.do','AnzhiBookmarkForm')"/>
				<input id='addanzhibookmark' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhibookmark/anzhibookmarkAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>读者id</td>
					<td>小说id</td>
					<td>章节id</td>
					<td>添加时间</td>
					<td>阅读位置</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhibookmarkList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.novelId }</td>
						<td>${s.chapterId }</td>
						<td>${s.addTime }</td>
						<td>${s.readAddress }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhibookmark${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhibookmark/findAnzhiBookmarkById.do?anzhibookmarkId=${s.id}',this,'updateanzhibookmark')">[查看]</a>
							<a id='deleteanzhibookmark${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhibookmark/delAnzhiBookmark.do?anzhibookmarkId=${s.id }',this,'deleteanzhibookmark')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhibookmark/findAnzhiBookmarkAll.do" name="url"/>
				<jsp:param value="${anzhibookmarkList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhibookmarkList.num }" name="num"/>
				<jsp:param value="AnzhiBookmarkForm" name="formId"/>
				<jsp:param value="${anzhibookmarkList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
