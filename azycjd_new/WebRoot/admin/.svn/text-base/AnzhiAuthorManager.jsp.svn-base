<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			作者管理
		</div>
	</div>
	<form id="AnzhiAuthorForm" action="anzhiauthor/findAnzhiAuthorAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				作家笔名：<input class="inputTextCss" type="text" id="authorWriterName" name="authorWriterName" class="txt" value="${param.authorWriterName}"/>
			</div>
			<div class='searchDivItemText'>
				作者电话：<input class="inputTextCss" type="text" id="authorTel" name="authorTel" class="txt" value="${param.authorTel}"/>
			</div>
			<div class='searchDivItemText'>
				作者Q&nbsp;&nbsp;Q：<input class="inputTextCss" type="text" id="authorQq" name="authorQq" class="txt" value="${param.authorQq}"/>
			</div>
			<div class='searchDivItemText'>
				真实姓名：<input class="inputTextCss" type="text" id="authorRealname" name="authorRealname" class="txt" value="${param.authorRealname}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiauthor/findAnzhiAuthorAll.do','AnzhiAuthorForm')"/>
				<!-- <input id='addanzhiauthor' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiauthor/anzhiauthorAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>作家笔名</td>
					<td>作者电话</td>
					<td>作者QQ</td>
					<td>真实姓名</td>
					<td>作者电子邮箱</td>
					<td>申请时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiauthorList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.authorWriterName }</td>
						<td>${s.authorTel }</td>
						<td>${s.authorQq }</td>
						<td>${s.authorRealname }</td>
						<td>${s.authorEmail }</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<a id='deleteanzhiauthor1${s.id}' class='delBtnCss' href='javascript:;' onclick="resetpass('anzhimember/resetpass.do?id=${s.memberId }',this,'deleteanzhiauthor')">[重置密码]</a>
							<a id='updateanzhiauthor${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiauthor/findAnzhiAuthorById.do?anzhiauthorId=${s.id}',this,'updateanzhiauthor')">[查看]</a>
							<a id='deleteanzhiauthor${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiauthor/delAnzhiAuthor.do?anzhiauthorId=${s.id }',this,'deleteanzhiauthor')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiauthor/findAnzhiAuthorAll.do" name="url"/>
				<jsp:param value="${anzhiauthorList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiauthorList.num }" name="num"/>
				<jsp:param value="AnzhiAuthorForm" name="formId"/>
				<jsp:param value="${anzhiauthorList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
