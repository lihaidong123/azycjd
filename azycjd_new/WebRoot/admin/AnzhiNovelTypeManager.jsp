<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelType管理
		</div>
	</div>
	<form id="AnzhiNovelTypeForm" action="anzhinoveltype/findAnzhiNovelTypeAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				大的类型：<input class="inputTextCss" type="text" id="bigType" name="bigType" class="txt" value="${param.bigType}"/>
			</div>
			<div class='searchDivItemText'>
				小的类型：<input class="inputTextCss" type="text" id="smallType" name="smallType" class="txt" value="${param.smallType}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinoveltype/findAnzhiNovelTypeAll.do','AnzhiNovelTypeForm')"/>
				<input id='addanzhinoveltype' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhinoveltype/anzhinoveltypeAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>小说id</td>
					<td>大的类型</td>
					<td>小的类型</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinoveltypeList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.novelId }</td>
						<td>${s.bigType }</td>
						<td>${s.smallType }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhinoveltype${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinoveltype/findAnzhiNovelTypeById.do?anzhinoveltypeId=${s.id}',this,'updateanzhinoveltype')">[查看]</a>
							<a id='deleteanzhinoveltype${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinoveltype/delAnzhiNovelType.do?anzhinoveltypeId=${s.id }',this,'deleteanzhinoveltype')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinoveltype/findAnzhiNovelTypeAll.do" name="url"/>
				<jsp:param value="${anzhinoveltypeList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinoveltypeList.num }" name="num"/>
				<jsp:param value="AnzhiNovelTypeForm" name="formId"/>
				<jsp:param value="${anzhinoveltypeList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
