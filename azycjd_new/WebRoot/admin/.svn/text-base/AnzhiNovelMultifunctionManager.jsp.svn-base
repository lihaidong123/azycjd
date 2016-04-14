<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelMultifunction管理
		</div>
	</div>
	<form id="AnzhiNovelMultifunctionForm" action="anzhinovelmultifunction/findAnzhiNovelMultifunctionAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				用户id(没有登录写0)：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				数据类型(0-点击 1-收藏 2-推荐票 3-推荐作品)：<input class="inputTextCss" type="text" id="actionType" name="actionType" class="txt" value="${param.actionType}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovelmultifunction/findAnzhiNovelMultifunctionAll.do','AnzhiNovelMultifunctionForm')"/>
				<input id='addanzhinovelmultifunction' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhinovelmultifunction/anzhinovelmultifunctionAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>小说id</td>
					<td>用户id(没有登录写0)</td>
					<td>数据类型(0-点击 1-收藏 2-推荐票 3-推荐作品)</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelmultifunctionList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.novelId }</td>
						<td>${s.memberId }</td>
						<td>${s.actionType }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhinovelmultifunction${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovelmultifunction/findAnzhiNovelMultifunctionById.do?anzhinovelmultifunctionId=${s.id}',this,'updateanzhinovelmultifunction')">[查看]</a>
							<a id='deleteanzhinovelmultifunction${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinovelmultifunction/delAnzhiNovelMultifunction.do?anzhinovelmultifunctionId=${s.id }',this,'deleteanzhinovelmultifunction')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovelmultifunction/findAnzhiNovelMultifunctionAll.do" name="url"/>
				<jsp:param value="${anzhinovelmultifunctionList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelmultifunctionList.num }" name="num"/>
				<jsp:param value="AnzhiNovelMultifunctionForm" name="formId"/>
				<jsp:param value="${anzhinovelmultifunctionList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
