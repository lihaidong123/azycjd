<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编${param.isSigned eq 0?'驻站':'签约' }管理
		</div>
	</div>
	<form id="AnzhiWebEditorAuthorForm" action="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=${param.isSigned }" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=${param.isSigned }','AnzhiWebEditorAuthorForm')"/>
				<!-- <input id='addanzhiwebeditorauthor' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiwebeditorauthor/anzhiwebeditorauthorAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>笔名</td>
					<td>书名</td>
					<td>最近更新</td>
					<td>签约与否</td>
					<td>驻站时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorauthorList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.authorWriterName }</td>
						<td>${s.novelTitle }</td>
						<td><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></td>
						<td>${s.isSigned eq 0?'未签约':'已签约' }</td>
						<td><fmt:formatDate value="${s.addTime}" pattern="yyyy/MM/dd HH:mm"/></td>
						<td>
							<a href='<%=request.getContextPath() %>/novel/${s.novelId}.jsp' target="_blank">[查看]</a>
							<a id='deleteanzhiwebeditorauthor${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorauthor/delAnzhiWebEditorAuthor.do?anzhiwebeditorauthorId=${s.id }',this,'deleteanzhiwebeditorauthor')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorauthor/findAnzhiWebEditorAuthorAll.do?isSigned=${param.isSigned }" name="url"/>
				<jsp:param value="${anzhiwebeditorauthorList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorauthorList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorAuthorForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorauthorList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
