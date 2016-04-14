<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			阅读币管理
		</div>
	</div>
	<form id="AnzhiNovelReadMoneyRecordForm" action="anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordAll.do?memberId=${param.memberId}" method="post">
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>用户</td>
					<td>充值阅读币</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhinovelreadmoneyrecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.readMoney }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhinovelreadmoneyrecord${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordById.do?anzhinovelreadmoneyrecordId=${s.id}',this,'updateanzhinovelreadmoneyrecord')">[查看]</a>
							<a id='deleteanzhinovelreadmoneyrecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhinovelreadmoneyrecord/delAnzhiNovelReadMoneyRecord.do?anzhinovelreadmoneyrecordId=${s.id }',this,'deleteanzhinovelreadmoneyrecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhinovelreadmoneyrecord/findAnzhiNovelReadMoneyRecordAll.do?memberId=${param.memberId}" name="url"/>
				<jsp:param value="${anzhinovelreadmoneyrecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhinovelreadmoneyrecordList.num }" name="num"/>
				<jsp:param value="AnzhiNovelReadMoneyRecordForm" name="formId"/>
				<jsp:param value="${anzhinovelreadmoneyrecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
