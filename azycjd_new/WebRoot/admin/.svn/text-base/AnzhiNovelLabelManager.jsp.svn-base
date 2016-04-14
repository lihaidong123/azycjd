<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			小说标签管理
		</div>
	</div>
	<form id="AnzhiNovelLabelForm" action="anzhinovellabel/findAnzhiNovelLabelAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				标签名称：<input class="inputTextCss" type="text" id="labelName" name="labelName" class="txt" value="${param.labelName}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovellabel/findAnzhiNovelLabelAll.do','AnzhiNovelLabelForm')"/>
				<input id='addanzhinovellabel' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhinovellabel/anzhinovellabelfindAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>标签名称</td>
					<td>父级标签</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovellabelList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.labelName }</td>
						<td>
							<c:if test="${s.fatherId eq 0}"><span style="color: red;">一级标签</span></c:if>
							<c:forEach items="${anzhinovellabelList.list}" var="a" varStatus="ind">
								<c:if test="${s.fatherId eq a.id}">${a.labelName}</c:if>
							</c:forEach>
						</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<a id='updateanzhinovellabel${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovellabel/findAnzhiNovelLabelById.do?anzhinovellabelId=${s.id}',this,'updateanzhinovellabel')">[查看]</a>
							<a id='deleteanzhinovellabel${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinovellabel/delAnzhiNovelLabel.do?anzhinovellabelId=${s.id }',this,'deleteanzhinovellabel')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovellabel/findAnzhiNovelLabelAll.do" name="url"/>
				<jsp:param value="${anzhinovellabelList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovellabelList.num }" name="num"/>
				<jsp:param value="AnzhiNovelLabelForm" name="formId"/>
				<jsp:param value="${anzhinovellabelList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
