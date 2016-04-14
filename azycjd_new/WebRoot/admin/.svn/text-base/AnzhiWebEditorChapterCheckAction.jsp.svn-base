<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiWebEditorChapterCheck操作
		</div>
	</div>
	<form id="AnzhiWebEditorChapterCheckFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorchaptercheck/addAnzhiWebEditorChapterCheck.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>网编id：</font><input type="text" class="txt" name="editorId" id="editorId" value="${loginWebEditorUser.id}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写网编id</font></div>
			<div class="textItem"><font class='textTitleCss'>章节id：</font><input type="text" class="txt" name="chapterId" id="chapterId" value="${pojo.chapterId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节id</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-未通过 1-通过)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-未通过 1-通过)</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorChapterCheckFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
