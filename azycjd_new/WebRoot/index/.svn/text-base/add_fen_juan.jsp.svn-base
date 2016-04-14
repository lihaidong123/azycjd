<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			添加分卷
		</div>
	</div>
	<form id="AnzhiFenJuanFormAction" action="<%=request.getContextPath()%>/anzhifenjuan/addAnzhiFenJuan.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<input type="hidden" class="txtCss" name="novelId" id="novelId" value="${param.novelId}" alt=""/>
			<div class="divItemsCss"><font class='textTitleCss'>分卷标题：</font><input type="text" class="txtCss" name="juanName" id="juanName" value="${pojo.juanName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写分卷标题</font></div>
			<div class="divItemsCss"><font class='textTitleCss'>分卷备注：</font><input type="text" class="txtCss" name="juanVote" id="juanVote" value="${pojo.juanVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写分卷备注</font></div>
			<div class="divItemsCss">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiFenJuanFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>