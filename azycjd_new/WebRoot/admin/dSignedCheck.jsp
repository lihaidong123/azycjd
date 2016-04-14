<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			作品签约申请管理
		</div>
	</div>
	<form id="AnzhiNovelForm" action="anzhinovel/signedCheck.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div class='searchDivItemText'>
				小说作者：<input class="inputTextCss" type="text" id="authorId" name="authorId" class="txt" value="${param.authorId}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhinovel/signedCheck.do','AnzhiNovelForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说名称</td>
					<td>小说作者</td>
					<td>最新更新</td>
					<td>点击数</td>
					<td>阅读数</td>
					<td>是否签约</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.novelId }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.authorWriterName }</td>
						<td>${s.updateTime }</td>
						<td>${s.clickNum }</td>
						<td>${s.readNum }</td>
						<td>${s.isSigned eq 0?'未签约':'已签约'}</td>
						<td>
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhinovel${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovel/findAnzhiNovelById.do?novelId=${s.novelId}&&tableId=${s.id }&&pageName=admin/dSignedCheckAction',this,'updateanzhinovel')">[处理]</a>
							</c:if>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="8" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="4" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovel/signedCheck.do" name="url"/>
				<jsp:param value="${anzhinovelList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelList.num }" name="num"/>
				<jsp:param value="AnzhiNovelForm" name="formId"/>
				<jsp:param value="${anzhinovelList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
