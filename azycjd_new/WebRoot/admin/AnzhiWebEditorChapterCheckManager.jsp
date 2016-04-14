<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编章节审核管理
		</div>
	</div>
	<form id="AnzhiWebEditorChapterCheckForm" action="anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText'>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				章节名称：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				审核时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll.do','AnzhiWebEditorChapterCheckForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>章节id</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorchaptercheckList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.chapterId }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditorchaptercheck${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckById.do?anzhiwebeditorchaptercheckId=${s.id}',this,'updateanzhiwebeditorchaptercheck')">[查看]</a>
							<a id='deleteanzhiwebeditorchaptercheck${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorchaptercheck/delAnzhiWebEditorChapterCheck.do?anzhiwebeditorchaptercheckId=${s.id }',this,'deleteanzhiwebeditorchaptercheck')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorchaptercheck/findAnzhiWebEditorChapterCheckAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorchaptercheckList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorchaptercheckList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorChapterCheckForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorchaptercheckList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
