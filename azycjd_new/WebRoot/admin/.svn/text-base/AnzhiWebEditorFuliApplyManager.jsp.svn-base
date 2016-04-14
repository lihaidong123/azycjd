<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编福利申请管理
		</div>
	</div>
	<form id="AnzhiWebEditorFuliApplyForm" action="anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编编号：<input class="inputTextCss" type="text" id="editorNo" name="editorNo" class="txt" value="${param.editorNo}"/>
			</div>
			<div class='searchDivItemText' <c:if test="${loginWebEditorUser ne null  }">style="display:none;"</c:if>>
				网编名称：<input class="inputTextCss" type="text" id="editorName" name="editorName" class="txt" value="${param.editorName}"/>
			</div>
			<div class='searchDivItemText'>
				申请标题：<input class="inputTextCss" type="text" id="applyName" name="applyName" class="txt" value="${param.applyName}"/>
			</div>
			<div class='searchDivItemText'>
				申请原因：<input class="inputTextCss" type="text" id="applyVote" name="applyVote" class="txt" value="${param.applyVote}"/>
			</div>
			<div class='searchDivItemText' id="applyTypeteens">
				<script language="javascript">
					showSelect("applyType","applyType","${param.applyType}",fuliTypeData,"applyTypeteens","福利类型：",true,135);
				</script>
			</div>
			<div class='searchDivItemText' id="stateens">
				<script language="javascript">
					showSelect("state","state","${param.state}",checkTypeData,"stateens","申请状态：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do','AnzhiWebEditorFuliApplyForm')"/>
				<!-- <input id='addanzhiwebeditorfuliapply' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiwebeditorfuliapply/anzhiwebeditorfuliapplyAction.do')"/>
				 -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>网编编号</td>
					<td>申请标题</td>
					<td>申请原因</td>
					<td>福利类型</td>
					<td>状态</td>
					<td>申请时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiwebeditorfuliapplyList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.anzhiWebEditor.editorNo }[${s.anzhiWebEditor.editorName }]</td>
						<td>${s.applyName }</td>
						<td>${s.applyVote }</td>
						<td>${s.applyType }</td>
						<td>
							<c:if test="${s.state eq 0 }">未处理</c:if>
							<c:if test="${s.state eq 1 }">已通过</c:if>
							<c:if test="${s.state eq 2 }">待处理</c:if>
							<c:if test="${s.state eq 3 }">已拒绝</c:if>
						</td>
						<td>${s.addTime }</td>
						<td>
							<c:if test="${loginUsers.memberType eq 2 && s.state eq 0}">
								<a class='updateBtnCss' href='javascript:;' onclick="adminCheck(${s.id},'${s.anzhiWebEditor.editorName }申请福利[${s.applyType }]',14)">[审核]</a>
							</c:if>
							<c:if test="${s.state eq 0 }">
								<a id='updateanzhiwebeditorfuliapply${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyById.do?anzhiwebeditorfuliapplyId=${s.id}',this,'updateanzhiwebeditorfuliapply')">[查看]</a>
							</c:if>	
							<a id='deleteanzhiwebeditorfuliapply${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiwebeditorfuliapply/delAnzhiWebEditorFuliApply.do?anzhiwebeditorfuliapplyId=${s.id }',this,'deleteanzhiwebeditorfuliapply')">[删除]</a>
						</td>
					</tr>
					<!-- 加载处理结果 -->
					<jsp:include page="get_handle_result.jsp" flush="false">
						<jsp:param value="7" name="colspanNum"/>
						<jsp:param value="${s.id }" name="tableId"/>
						<jsp:param value="14" name="handleType"/>
					</jsp:include>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorfuliapplyList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorfuliapplyList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorFuliApplyForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorfuliapplyList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
