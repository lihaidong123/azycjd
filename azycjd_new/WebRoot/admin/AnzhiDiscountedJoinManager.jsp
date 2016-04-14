<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiDiscountedJoin管理
		</div>
	</div>
	<form id="AnzhiDiscountedJoinForm" action="anzhidiscountedjoin/findAnzhiDiscountedJoinAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				优惠id：<input class="inputTextCss" type="text" id="discountedId" name="discountedId" class="txt" value="${param.discountedId}"/>
			</div>
			<div class='searchDivItemText'>
				参与读者id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				备注说明：<input class="inputTextCss" type="text" id="vote" name="vote" class="txt" value="${param.vote}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhidiscountedjoin/findAnzhiDiscountedJoinAll.do','AnzhiDiscountedJoinForm')"/>
				<input id='addanzhidiscountedjoin' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhidiscountedjoin/anzhidiscountedjoinAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>优惠id</td>
					<td>参与读者id</td>
					<td>备注说明</td>
					<td>状态</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhidiscountedjoinList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.discountedId }</td>
						<td>${s.memberId }</td>
						<td>${s.vote }</td>
						<td>${s.state }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhidiscountedjoin${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhidiscountedjoin/findAnzhiDiscountedJoinById.do?anzhidiscountedjoinId=${s.id}',this,'updateanzhidiscountedjoin')">[查看]</a>
							<a id='deleteanzhidiscountedjoin${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhidiscountedjoin/delAnzhiDiscountedJoin.do?anzhidiscountedjoinId=${s.id }',this,'deleteanzhidiscountedjoin')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhidiscountedjoin/findAnzhiDiscountedJoinAll.do" name="url"/>
				<jsp:param value="${anzhidiscountedjoinList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhidiscountedjoinList.num }" name="num"/>
				<jsp:param value="AnzhiDiscountedJoinForm" name="formId"/>
				<jsp:param value="${anzhidiscountedjoinList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
