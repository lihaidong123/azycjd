<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiFenJuan管理
		</div>
	</div>
	<form id="AnzhiFenJuanForm" action="anzhifenjuan/findAnzhiFenJuanAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				小说id：<input class="inputTextCss" type="text" id="novelId" name="novelId" class="txt" value="${param.novelId}"/>
			</div>
			<div class='searchDivItemText'>
				分卷标题：<input class="inputTextCss" type="text" id="juanName" name="juanName" class="txt" value="${param.juanName}"/>
			</div>
			<div class='searchDivItemText'>
				分卷备注：<input class="inputTextCss" type="text" id="juanVote" name="juanVote" class="txt" value="${param.juanVote}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhifenjuan/findAnzhiFenJuanAll.do','AnzhiFenJuanForm')"/>
				<input id='addanzhifenjuan' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhifenjuan/anzhifenjuanAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>小说id</td>
					<td>分卷标题</td>
					<td>分卷备注</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhifenjuanList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.novelId }</td>
						<td>${s.juanName }</td>
						<td>${s.juanVote }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhifenjuan${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhifenjuan/findAnzhiFenJuanById.do?anzhifenjuanId=${s.id}',this,'updateanzhifenjuan')">[查看]</a>
							<a id='deleteanzhifenjuan${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhifenjuan/delAnzhiFenJuan.do?anzhifenjuanId=${s.id }',this,'deleteanzhifenjuan')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhifenjuan/findAnzhiFenJuanAll.do" name="url"/>
				<jsp:param value="${anzhifenjuanList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhifenjuanList.num }" name="num"/>
				<jsp:param value="AnzhiFenJuanForm" name="formId"/>
				<jsp:param value="${anzhifenjuanList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
