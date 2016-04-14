<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapterSubscribe管理
		</div>
	</div>
	<form id="AnzhiChapterSubscribeForm" action="anzhichaptersubscribe/findAnzhiChapterSubscribeAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				订阅时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				状态(0-编写中 1-已完成)：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhichaptersubscribe/findAnzhiChapterSubscribeAll.do','AnzhiChapterSubscribeForm')"/>
				<input id='addanzhichaptersubscribe' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhichaptersubscribe/anzhichaptersubscribeAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>章节id</td>
					<td>读者id</td>
					<td>订阅时间</td>
					<td>状态(0-编写中 1-已完成)</td>
					<td>备注信息</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhichaptersubscribeList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.chapterId }</td>
						<td>${s.memberId }</td>
						<td>${s.addTime }</td>
						<td>${s.state }</td>
						<td>${s.vote }</td>
						<td>
							<a id='updateanzhichaptersubscribe${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhichaptersubscribe/findAnzhiChapterSubscribeById.do?anzhichaptersubscribeId=${s.id}',this,'updateanzhichaptersubscribe')">[查看]</a>
							<a id='deleteanzhichaptersubscribe${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhichaptersubscribe/delAnzhiChapterSubscribe.do?anzhichaptersubscribeId=${s.id }',this,'deleteanzhichaptersubscribe')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhichaptersubscribe/findAnzhiChapterSubscribeAll.do" name="url"/>
				<jsp:param value="${anzhichaptersubscribeList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhichaptersubscribeList.num }" name="num"/>
				<jsp:param value="AnzhiChapterSubscribeForm" name="formId"/>
				<jsp:param value="${anzhichaptersubscribeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
