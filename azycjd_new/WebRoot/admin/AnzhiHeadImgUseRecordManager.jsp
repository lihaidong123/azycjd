<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiHeadImgUseRecord管理
		</div>
	</div>
	<form id="AnzhiHeadImgUseRecordForm" action="anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				客户id：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				头像路径：<input class="inputTextCss" type="text" id="useImg" name="useImg" class="txt" value="${param.useImg}"/>
			</div>
			<div class='searchDivItemText'>
				使用时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div class='searchDivItemText'>
				状态：<input class="inputTextCss" type="text" id="state" name="state" class="txt" value="${param.state}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll.do','AnzhiHeadImgUseRecordForm')"/>
				<input id='addanzhiheadimguserecord' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiheadimguserecord/anzhiheadimguserecordAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>客户id</td>
					<td>头像路径</td>
					<td>使用时间</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiheadimguserecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.memberId }</td>
						<td>${s.useImg }</td>
						<td>${s.addTime }</td>
						<td>${s.state }</td>
						<td>
							<a id='updateanzhiheadimguserecord${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiheadimguserecord/findAnzhiHeadImgUseRecordById.do?anzhiheadimguserecordId=${s.id}',this,'updateanzhiheadimguserecord')">[查看]</a>
							<a id='deleteanzhiheadimguserecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiheadimguserecord/delAnzhiHeadImgUseRecord.do?anzhiheadimguserecordId=${s.id }',this,'deleteanzhiheadimguserecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiheadimguserecord/findAnzhiHeadImgUseRecordAll.do" name="url"/>
				<jsp:param value="${anzhiheadimguserecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiheadimguserecordList.num }" name="num"/>
				<jsp:param value="AnzhiHeadImgUseRecordForm" name="formId"/>
				<jsp:param value="${anzhiheadimguserecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
