<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			违法关键字管理
		</div>
	</div>
	<form id="AnzhiIllegalCharForm" action="anzhiillegalchar/findAnzhiIllegalCharAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				关键字符：<input class="inputTextCss" type="text" id="charName" name="charName" class="txt" value="${param.charName}"/>
			</div>
			<div style="width:600px; clear: both;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiillegalchar/findAnzhiIllegalCharAll.do','AnzhiIllegalCharForm')"/>
				<input id='addanzhiillegalchar' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiillegalchar/anzhiillegalcharAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>关键字符</td>
					<td>备注说明</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiillegalcharList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.charName }</td>
						<td>${s.charVote }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiillegalchar${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiillegalchar/findAnzhiIllegalCharById.do?anzhiillegalcharId=${s.id}',this,'updateanzhiillegalchar')">[查看]</a>
							<a id='deleteanzhiillegalchar${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiillegalchar/delAnzhiIllegalChar.do?anzhiillegalcharId=${s.id }',this,'deleteanzhiillegalchar')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiillegalchar/findAnzhiIllegalCharAll.do" name="url"/>
				<jsp:param value="${anzhiillegalcharList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiillegalcharList.num }" name="num"/>
				<jsp:param value="AnzhiIllegalCharForm" name="formId"/>
				<jsp:param value="${anzhiillegalcharList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
