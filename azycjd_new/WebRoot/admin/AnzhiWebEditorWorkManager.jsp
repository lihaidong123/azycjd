<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编作业管理
		</div>
	</div>
	<form id="AnzhiWebEditorWorkForm" action="anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				作业名称：<input class="inputTextCss" type="text" id="workName" name="workName" class="txt" value="${param.workName}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do','AnzhiWebEditorWorkForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>作业名称</td>
					<td>作业备注</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorworkList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.workName }</td>
						<td>${s.workVote }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditorwork${s.id}' class='updateBtnCss' href='${s.workUrl }' target="_blank">[附件下载]</a>
							<a id='updateanzhiwebeditorwork${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorwork/findAnzhiWebEditorWorkById.do?anzhiwebeditorworkId=${s.id}',this,'updateanzhiwebeditorwork')">[查看]</a>
							<a id='deleteanzhiwebeditorwork${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorwork/delAnzhiWebEditorWork.do?anzhiwebeditorworkId=${s.id }',this,'deleteanzhiwebeditorwork')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorworkList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorworkList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorWorkForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorworkList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
