<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="AnzhiHandleFormAction" action="<%=request.getContextPath()%>/anzhihandle/addAnzhiHandle.do" method="post">
	<div class="inputItemsCssss">
		<input type="hidden" class="txt" name="tableId" id="tableId" value="${param.tableId}" alt=""/>
		<input type="hidden" class="txt" name="handleType" id="handleType" value="${param.handleType}" alt=""/>
		<input type="hidden" class="txt" name="state" id="state" value="0" alt=""/>
		<input type="hidden" class="txt" name="addMemberId" id="addMemberId" value="${loginUsers.id}" alt=""/>
		<input type="hidden" class="txt" name="actionUrl" id="actionUrl" value="${param.actionUrl}" alt=""/>
		<div class='searchDivItemText' id="actionsTypgjkheDatadgfghj">
			<script language="javascript">
				showSelect("handleResult","handleResult","1",handleResultTypeData,"actionsTypgjkheDatadgfghj","处理结果：",false,135);
			</script>
		</div>
		<div class="textItem"><font class='textTitleCss'>处理说明：</font><br>
			<textarea name="handleVote" id="handleVote" style="height: 100px; width: 90%;"></textarea>
		</div>
		<%-- <div class="textItem"><font class='textTitleCss'>处理人员：</font><input type="text" class="txt" readonly="readonly" value="${loginUsers.memberNick}${loginWebEditorUser.editorName}" alt=""/></div> --%>
		<div class="textItem">
			<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiHandleFormAction',this)"/>
		</div>
	</div>
</form>

