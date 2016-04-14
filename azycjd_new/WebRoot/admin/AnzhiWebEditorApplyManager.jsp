<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编申请管理
		</div>
	</div>
	<form id="AnzhiWebEditorApplyForm" action="anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				网编编号：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				姓名：<input class="inputTextCss" type="text" id="xingming" name="xingming" class="txt" value="${param.xingming}"/>
			</div>
			<div class='searchDivItemText'>
				编辑名：<input class="inputTextCss" type="text" id="bianjiming" name="bianjiming" class="txt" value="${param.bianjiming}"/>
			</div>
			<div class='searchDivItemText' id="actionsTypeDataypeteens">
				<script language="javascript">
					showSelect("state","state","${param.state}",actionsTypeData,"actionsTypeDataypeteens","处理状态：",true,135);
				</script>
			</div>
			<div>
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do','AnzhiWebEditorApplyForm')"/>
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>读者昵称</td>
					<td>姓名</td>
					<td>性别</td>
					<td>编辑名</td>
					<td>年龄</td>
					<td>目前职业</td>
					<td>状态</td>
					<td>申请时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorapplyList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.xingming }</td>
						<td>${s.xingbie }</td>
						<td>${s.bianjiming }</td>
						<td>${s.birthdays }</td>
						<td>${s.zhiye }</td>
						<td>${s.state eq 0?'未处理':'已审核' }</td>
						<td>${s.addTime }</td>
						<td>
							<a id='updateanzhiwebeditorapply${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorapply/findAnzhiWebEditorApplyById.do?anzhiwebeditorapplyId=${s.id}',this,'updateanzhiwebeditorapply')">[查看]</a>
							<a id='deleteanzhiwebeditorapply${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorapply/delAnzhiWebEditorApply.do?anzhiwebeditorapplyId=${s.id }',this,'deleteanzhiwebeditorapply')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorapply/findAnzhiWebEditorApplyAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorapplyList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorapplyList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorApplyForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorapplyList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
