<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			短信内容预设操作
		</div>
	</div>
	<form id="AnzhiWebEditorMessageFormAction" action="<%=request.getContextPath()%>/anzhiwebeditormessage/addAnzhiWebEditorMessage.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<c:if test="${not empty loginUsers }">
				<input type="hidden" class="txt" name="editorId" id="editorId" value="0" alt=""/>
			</c:if>
			<c:if test="${not empty loginWebEditorUser }">
				<input type="hidden" class="txt" name="editorId" id="editorId" value="${loginWebEditorUser.id}" alt=""/>
			</c:if>
			<input type="hidden" class="txt" name="types" id="types" value="0" alt=""/>
			<input type="hidden" class="txt" name="vote" id="vote" value="" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			
			<div class="divItemsCss">
				<p>短信内容：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="messContent" name="messContent">${pojo.messContent}</textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorMessageFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
