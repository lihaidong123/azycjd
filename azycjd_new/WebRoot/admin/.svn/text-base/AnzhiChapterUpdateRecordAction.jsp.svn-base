<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapterUpdateRecord操作
		</div>
	</div>
	<form id="AnzhiChapterUpdateRecordFormAction" action="<%=request.getContextPath()%>/anzhichapterupdaterecord/addAnzhiChapterUpdateRecord.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>章节id：</font><input type="text" class="txt" name="chapterId" id="chapterId" value="${pojo.chapterId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节id</font></div>
			<div class="textItem"><font class='textTitleCss'>更新字数：</font><input type="text" class="txt" name="updateNum" id="updateNum" value="${pojo.updateNum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写更新字数</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiChapterUpdateRecordFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
