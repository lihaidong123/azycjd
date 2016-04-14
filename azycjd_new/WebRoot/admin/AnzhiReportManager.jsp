<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			举报管理
		</div>
	</div>
	<form id="AnzhiReportForm" action="anzhireport/findAnzhiReportAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				小说名称：<input class="inputTextCss" type="text" id="novelTitle" name="novelTitle" class="txt" value="${param.novelTitle}"/>
			</div>
			<div class='searchDivItemText'>
				举报原因：<input class="inputTextCss" type="text" id="reportReason" name="reportReason" class="txt" value="${param.reportReason}"/>
			</div>
			<div class='searchDivItemText'>
				举报人员：<input class="inputTextCss" type="text" id="memberNick" name="memberNick" class="txt" value="${param.memberNick}"/>
			</div>
			<div class='searchDivItemText' id="actionsTypeDatadgfghj">
				<script language="javascript">
					showSelect("state","state","${param.state}",actionsTypeData,"actionsTypeDatadgfghj","处理状态：",true,135);
				</script>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhireport/findAnzhiReportAll.do','AnzhiReportForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>小说</td>
					<td>举报原因</td>
					<td>状态</td>
					<td>举报人</td>
					<td>举报时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhireportList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td><a href="<%=request.getContextPath()%>/novel/${s.tableId }.jsp" target="_blank">${s.novelTitle }</a></td>
						<td>${s.reportReason }</td>
						<td>${s.state eq 0?"未处理":"已处理"}</td>
						<td>${s.memberNick }</td>
						<td>${s.addTime }</td>
						<td>
							<!-- 没有处理 -->
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhireport${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhireport/findAnzhiReportById.do?anzhireportId=${s.id}',this,'updateanzhireport')">[处理]</a>
								<a id='deleteanzhireport${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhireport/delAnzhiReport.do?anzhireportId=${s.id }',this,'deleteanzhireport')">[删除]</a>
							</c:if>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="8" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="0" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhireport/findAnzhiReportAll.do" name="url"/>
				<jsp:param value="${anzhireportList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhireportList.num }" name="num"/>
				<jsp:param value="AnzhiReportForm" name="formId"/>
				<jsp:param value="${anzhireportList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
