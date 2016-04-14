<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编作业操作
		</div>
	</div>
	<form id="AnzhiWebEditorWorkFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorwork/addAnzhiWebEditorWork.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			<input type="hidden" class="txt" name="editorId" id="editorId" value="${loginWebEditorUser.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>作业名称：</font><input type="text" class="txt" name="workName" id="workName" value="${pojo.workName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作业名称</font></div>
			<div class="textItem"><font class='textTitleCss'>附件路径：</font><input type="text" class="txt" id="workUrl" readonly="readonly" name="workUrl" value="${pojo.workUrl }">&nbsp;&nbsp;&nbsp;<c:if test="${empty pojo}"><input type="button" id="workUrlBtn" value="上传" class="uploadBtnCss"></c:if>
				<c:if test="${not empty pojo}">
					<a href="${pojo.workUrl }" target="_blank">下载附件</a>
				</c:if>
			</div>
			<div class="divItemsCss">
				<p>作业备注：</p>
				<p><textarea style="height:230px; width: 90%;" id="workVote" name="workVote"></textarea></p>
			</div>
			<div class="textItem">
				<c:if test="${empty pojo}">
					<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorWorkFormAction',this)"/>
				</c:if>
				<c:if test="${not empty pojo}">
					<input class="saveBtnCss" type="button" value="关闭" onClick="allLoadPage('<%=request.getContextPath() %>/anzhiwebeditorwork/findAnzhiWebEditorWorkAll.do')"/>
				</c:if>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
