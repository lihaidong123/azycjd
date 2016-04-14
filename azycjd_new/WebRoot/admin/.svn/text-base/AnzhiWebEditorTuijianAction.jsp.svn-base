<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编推文操作
		</div>
	</div>
	<form id="AnzhiWebEditorTuijianFormAction" action="<%=request.getContextPath()%>/anzhiwebeditortuijian/addAnzhiWebEditorTuijian.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txt" name="editorId" id="editorId" value="<c:if test="${loginWebEditorUser ne null }">${loginWebEditorUser.id}</c:if><c:if test="${loginWebEditorUser eq null }">${pojo.editorId}</c:if>" alt=""/>
			<input type="hidden" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>
			<input type="hidden" class="txt" name="isJiajing" id="isJiajing" value="${pojo.isJiajing}" alt=""/>
			<input type="hidden" class="txt" name="isHot" id="isHot" value="${pojo.isHot}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>推文名称：</font><input type="text" class="txt" name="tuijianName" id="tuijianName" value="${pojo.tuijianName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写推文名称</font></div>
			<div class="textItem"><font class='textTitleCss'>推文链接：</font><input type="text" class="txt" name="tuijianUrl" id="tuijianUrl" value="${pojo.tuijianUrl}" alt="" style="width: 70%;"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写推文链接</font></div>
			<div class="divItemsCss">
				<p>推文说明：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="tuijianVote" name="tuijianVote"></textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorTuijianFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
