<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			删除章节审核操作
		</div>
	</div>
	<form id="AnzhiChapterFormAction" action="<%=request.getContextPath()%>/anzhichapter/addAnzhiChapter.do" method="post">
		<div class="inputItemsCssss" id="needDisableDiv">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说名称：</font><input type="text" class="txt" name="fenJuanId" id="fenJuanId" value="${pojo.novelTitle}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>章节标题：</font><input type="text" class="txt" name="chapterTitle" id="chapterTitle" value="${pojo.chapterTitle}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>修改时间：</font><input type="text" class="txt" name="lastUpdateTime" id="lastUpdateTime" value="${pojo.lastUpdateTime}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>章节字数：</font><input type="text" class="txt" name="chapterCharNum" id="chapterCharNum" value="${pojo.chapterCharNum}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>章节内容：</font><br>
				<div>
					${pojo.chapterContent}
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="AnzhiHandleAction.jsp" flush="false">
		<jsp:param value="${param.tableId }" name="tableId"/>
		<jsp:param value="3" name="handleType"/>
		<jsp:param value="anzhichapter/delChapterCheck.do" name="actionUrl"/>
	</jsp:include>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
