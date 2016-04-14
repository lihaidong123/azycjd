<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiTrend管理
		</div>
	</div>
	<form id="AnzhiTrendForm" action="anzhitrend/findAnzhiTrendAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				员工id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				广播内容：<input class="inputTextCss" type="text" id="trendContent" name="trendContent" class="txt" value="${param.trendContent}"/>
			</div>
			<div class='searchDivItemText'>
				备注信息：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhitrend/findAnzhiTrendAll.do','AnzhiTrendForm')"/>
				<input id='addanzhitrend' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhitrend/anzhitrendAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>员工id</td>
					<td>广播内容</td>
					<td>备注信息</td>
					<td>添加时间</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhitrendList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.trendContent }</td>
						<td>${s.vote }</td>
						<td>${s.addTime }</td>
						<td>${s.state }</td>
						<td>
							<a id='updateanzhitrend${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhitrend/findAnzhiTrendById.do?anzhitrendId=${s.id}',this,'updateanzhitrend')">[查看]</a>
							<a id='deleteanzhitrend${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhitrend/delAnzhiTrend.do?anzhitrendId=${s.id }',this,'deleteanzhitrend')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhitrend/findAnzhiTrendAll.do" name="url"/>
				<jsp:param value="${anzhitrendList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhitrendList.num }" name="num"/>
				<jsp:param value="AnzhiTrendForm" name="formId"/>
				<jsp:param value="${anzhitrendList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
