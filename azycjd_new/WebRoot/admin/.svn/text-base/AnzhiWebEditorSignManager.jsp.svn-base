<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编签到管理
		</div>
	</div>
	<form id="AnzhiWebEditorSignForm" action="anzhiwebeditorsign/findAnzhiWebEditorSignAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText'>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorsign/findAnzhiWebEditorSignAll.do','AnzhiWebEditorSignForm')"/>
				<input id='addanzhiwebeditorsign' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiwebeditorsign/anzhiwebeditorsignAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>签到时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorsignList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.addTime }</td>
						<td>
							<%-- <a id='updateanzhiwebeditorsign${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorsign/findAnzhiWebEditorSignById.do?anzhiwebeditorsignId=${s.id}',this,'updateanzhiwebeditorsign')">[查看]</a> --%>
							<a id='deleteanzhiwebeditorsign${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorsign/delAnzhiWebEditorSign.do?anzhiwebeditorsignId=${s.id }',this,'deleteanzhiwebeditorsign')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorsign/findAnzhiWebEditorSignAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorsignList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorsignList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorSignForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorsignList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
