<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编福利申请操作
		</div>
	</div>
	<form id="AnzhiWebEditorFuliApplyFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorfuliapply/addAnzhiWebEditorFuliApply.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="editorId" id="editorId" value="<c:if test="${loginWebEditorUser ne null }">${loginWebEditorUser.id}</c:if><c:if test="${loginWebEditorUser eq null }">${pojo.editorId}</c:if>" alt=""/>
			<div class="textItem"><font class='textTitleCss'>申请标题：</font><input type="text" class="txt" name="applyName" id="applyName" <c:if test='${pojo ne null }'> readonly="readonly"</c:if> value="${pojo.applyName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写申请标题</font></div>
			<div class='textItem' id="applyTypeteens">
				<script language="javascript">
					showSelect("applyType","applyType","${pojo.applyType}",fuliTypeData,"applyTypeteens","福利类型：",false,135);
				</script>
			</div>
			<c:if test="${not empty pojo && not empty loginUsers }">
				<div class='textItem' id="stateens">
					<script language="javascript">
						showSelect("state","state","${pojo.state}",handleResultTypeData,"stateens","申请状态：",false,135);
					</script>
				</div>
			</c:if>
			<c:if test="${empty pojo || empty loginUsers }">
				<input type="hidden" class="txt" name="state" id="state" value="0" alt=""/>
			</c:if>
			<div class="divItemsCss">
				<p>申请原因：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="applyVote" name="applyVote">${pojo.applyVote }</textarea></p>
			</div>
			<div class="textItem">
				<c:if test="${empty pojo }">
					<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorFuliApplyFormAction',this)"/>
				</c:if>
				<c:if test="${not empty pojo }">
					<input class="saveBtnCss" type="button" value="关闭" onClick="allLoadPage('anzhiwebeditorfuliapply/findAnzhiWebEditorFuliApplyAll.do')"/>
				</c:if>
				<!-- <input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorFuliApplyFormAction',this)"/> -->
				
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
