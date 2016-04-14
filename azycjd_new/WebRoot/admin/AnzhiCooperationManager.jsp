<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			合作渠道链接管理
		</div>
	</div>
	<form id="AnzhiCooperationForm" action="anzhicooperation/findAnzhiCooperationAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				合作单位：<input class="inputTextCss" type="text" id="cooperationUnit" name="cooperationUnit" class="txt" value="${param.cooperationUnit}"/>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhicooperation/findAnzhiCooperationAll.do','AnzhiCooperationForm')"/>
				<input id='addanzhicooperation' type='button' class='addItemsRecord' value='添加记录' onclick="window.location.href='<%=request.getContextPath()%>/admin/getHtmlEdit.jsp?needLoadJsp=cooperationn'"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>合作单位</td>
					<td>单位链接</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhicooperationList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.cooperationUnit }</td>
						<td>${s.cooperationUrl }</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm"/>
						</td>
						<td>
							<a id='updateanzhicooperation${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhicooperation/findAnzhiCooperationById.do?anzhicooperationId=${s.id}',this,'updateanzhicooperation')">[查看]</a>
							<a id='deleteanzhicooperation${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhicooperation/delAnzhiCooperation.do?anzhicooperationId=${s.id }',this,'deleteanzhicooperation')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhicooperation/findAnzhiCooperationAll.do" name="url"/>
				<jsp:param value="${anzhicooperationList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhicooperationList.num }" name="num"/>
				<jsp:param value="AnzhiCooperationForm" name="formId"/>
				<jsp:param value="${anzhicooperationList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
