<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="manage_index.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapterUpdateRecord管理
		</div>
	</div>
	<form id="AnzhiChapterUpdateRecordForm" action="anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				自动增长：<input class="inputTextCss" type="text" id="id" name="id" class="txt" value="${param.id}"/>
			</div>
			<div class='searchDivItemText'>
				章节id：<input class="inputTextCss" type="text" id="chapterId" name="chapterId" class="txt" value="${param.chapterId}"/>
			</div>
			<div class='searchDivItemText'>
				更新字数：<input class="inputTextCss" type="text" id="updateNum" name="updateNum" class="txt" value="${param.updateNum}"/>
			</div>
			<div class='searchDivItemText'>
				添加时间：<input class="inputTextCss" type="text" id="addTime" name="addTime" class="txt" value="${param.addTime}"/>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll.do','AnzhiChapterUpdateRecordForm')"/>
				<input id='addanzhichapterupdaterecord' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhichapterupdaterecord/anzhichapterupdaterecordAction.do')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>自动增长</td>
					<td>章节id</td>
					<td>更新字数</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhichapterupdaterecordList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.id }</td>
						<td>${s.chapterId }</td>
						<td>${s.updateNum }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhichapterupdaterecord${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhichapterupdaterecord/findAnzhiChapterUpdateRecordById.do?anzhichapterupdaterecordId=${s.id}',this,'updateanzhichapterupdaterecord')">[查看]</a>
							<a id='deleteanzhichapterupdaterecord${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhichapterupdaterecord/delAnzhiChapterUpdateRecord.do?anzhichapterupdaterecordId=${s.id }',this,'deleteanzhichapterupdaterecord')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhichapterupdaterecord/findAnzhiChapterUpdateRecordAll.do" name="url"/>
				<jsp:param value="${anzhichapterupdaterecordList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhichapterupdaterecordList.num }" name="num"/>
				<jsp:param value="AnzhiChapterUpdateRecordForm" name="formId"/>
				<jsp:param value="${anzhichapterupdaterecordList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
