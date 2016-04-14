<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			短信预设管理
		</div>
	</div>
	<form id="AnzhiWebEditorMessageForm" action="anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do" method="post">
		<div class="searchItemsCssss">
			<div style="clear: both; width:90%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do','AnzhiWebEditorMessageForm')"/>
				<input id='addanzhiwebeditormessage' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiwebeditormessage/anzhiwebeditormessageAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td width="30">序号</td>
					<td>消息内容</td>
					<td width="60">状态</td>
					<td width="80">添加时间</td>
					<td width="190">操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditormessageList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.messContent }</td>
						<td>${s.state eq 0?'未启用':'已启用' }</td>
						<td>${s.addTime }</td>
						<td>
							<a href='javascript:;' class="setDefaultCss" onclick="setDefault(${s.editorId},${s.id })">[设为默认]</a>
							<a id='updateanzhiwebeditormessage${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditormessage/findAnzhiWebEditorMessageById.do?anzhiwebeditormessageId=${s.id}',this,'updateanzhiwebeditormessage')">[查看]</a>
							<a id='deleteanzhiwebeditormessage${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditormessage/delAnzhiWebEditorMessage.do?anzhiwebeditormessageId=${s.id }',this,'deleteanzhiwebeditormessage')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditormessage/findAnzhiWebEditorMessageAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditormessageList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditormessageList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorMessageForm" name="formId"/>
				<jsp:param value="${anzhiwebeditormessageList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
