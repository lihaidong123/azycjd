<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			互动专区管理
		</div>
	</div>
	<form id="AnzhiInteractiveForm" action="anzhiinteractive/findAnzhiInteractiveAll.do" method="post">
		<div class="searchItemsCssss">
			<div class='searchDivItemText'>
				用户名称：<input class="inputTextCss" type="text" id="memberId" name="memberId" class="txt" value="${param.memberId}"/>
			</div>
			<div class='searchDivItemText'>
				主题：<input class="inputTextCss" type="text" id="interactiveTitle" name="interactiveTitle" class="txt" value="${param.interactiveTitle}"/>
			</div>
			<div class='searchDivItemText' id="interactiveType">
				<script language="javascript">
					showSelect("interactiveType","interactiveType","${param.interactiveType}",interactiveTypeData,"interactiveType","类型：",true,135);
				</script>
			</div>
			<div style="clear: both; width:80%;">
				<input class="searchBtnCss" type="button" value="查询" onclick="direcNum('anzhiinteractive/findAnzhiInteractiveAll.do','AnzhiInteractiveForm')"/>
				<!-- <input id='addanzhiinteractive' type='button' class='addItemsRecord' value='添加记录' onclick="loadPageData('anzhiinteractive/anzhiinteractiveAction.do')"/> -->
			</div>
		</div>
		<div class="tableCss">
			<table width="100%" border="0">
				<tr class="titleCss">
					<td>序号</td>
					<td>用户名称</td>
					<td>主题</td>
					<td>内容</td>
					<td>类型</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${anzhiinteractiveList.list}" var="s" varStatus="ind">
					<tr>
						<td>${ind.index+1 }</td>
						<td>${s.memberNick }</td>
						<td>${s.interactiveTitle }</td>
						<td>${fn:substring(s.interactiveContent,0,20) }</td>
						<td>
							<c:if test="${s.interactiveType ==0}">编辑区</c:if>
							<c:if test="${s.interactiveType ==1}">公告区</c:if>
							<c:if test="${s.interactiveType ==2}">版权维护区</c:if>
						</td>
						<td>
							<fmt:formatDate value="${s.addTime }" pattern="yyyy/MM/dd HH:mm:ss"/>
						</td>
						<td>
							<a id='updateanzhiinteractive${s.id}' class='updateBtnCss' href='javascript:;' onclick="loadUpdatePageData('anzhiinteractive/findAnzhiInteractiveById.do?anzhiinteractiveId=${s.id}',this,'updateanzhiinteractive')">[查看]</a>
							<a id='deleteanzhiinteractive${s.id}' class='delBtnCss' href='javascript:;' onclick="del('anzhiinteractive/delAnzhiInteractive.do?anzhiinteractiveId=${s.id }',this,'deleteanzhiinteractive')">[删除]</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiinteractive/findAnzhiInteractiveAll.do" name="url"/>
				<jsp:param value="${anzhiinteractiveList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiinteractiveList.num }" name="num"/>
				<jsp:param value="AnzhiInteractiveForm" name="formId"/>
				<jsp:param value="${anzhiinteractiveList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
