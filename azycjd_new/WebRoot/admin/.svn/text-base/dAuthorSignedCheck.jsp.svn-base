<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			作者签约申请管理审核
		</div>
	</div>
	<form id="AnzhiNovelForm" action="anzhiauthor/signedCheck.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				作者笔名：<input class="inputTextCss" type="text" id="authorWriterName" name="authorWriterName" class="txt" value="${param.authorWriterName}"/>
			</div>
			<div class='searchDivItemText'>
				真实姓名：<input class="inputTextCss" type="text" id="authorRealname" name="authorRealname" class="txt" value="${param.authorRealname}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiauthor/signedCheck.do','AnzhiNovelForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>作家笔名</td>
					<td>真实姓名</td>
					<td>证件类型</td>
					<td>证件号码</td>
					<td>电子邮箱</td>
					<td>作家QQ</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiauthorList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.authorWriterName }</td>
						<td>${s.authorRealname }</td>
						<td>${s.authorCredenttype }</td>
						<td>${s.authorCredentcode }</td>
						<td>${s.authorEmail }</td>
						<td>${s.authorMsn }</td>
						<td>
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhinovel${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiauthor/findAnzhiAuthorById.do?anzhiauthorId=${s.novelId}&&tableId=${s.id }&&pageName=admin/dAuthorSignedCheckAction',this,'updateanzhinovel')">[处理]</a>
							</c:if>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="8" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="5" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiauthor/signedCheck.do" name="url"/>
				<jsp:param value="${anzhiauthorList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiauthorList.num }" name="num"/>
				<jsp:param value="AnzhiNovelForm" name="formId"/>
				<jsp:param value="${anzhiauthorList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
