<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			删文审核操作
		</div>
	</div>
	<form id="AnzhiChapterFormAction" action="<%=request.getContextPath()%>/anzhichapter/addAnzhiChapter.do" method="post">
		<div class="inputItemsCssss" id="needDisableDiv">
			<div class="textItem"><font class='textTitleCss'>小说名称：</font><input type="text" class="txt" name="novelTitle" id="novelTitle" value="${pojo.novelTitle}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>小说作者：</font><input type="text" class="txt" name="authorWriterName" id="authorWriterName" value="${pojo.authorWriterName}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>小说作者：</font><input type="text" class="txt" name="authorId" id="authorId" value="${pojo.authorId}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>更新时间：</font><input type="text" class="txt" name="updateTime" id="updateTime" value="${pojo.updateTime}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>小说类型：</font><input type="text" class="txt" name="novelType" id="novelType" value="${pojo.novelType}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>授权级别：</font><input type="text" class="txt" name="authorizationLevel" id="authorizationLevel" value="${pojo.authorizationLevel eq 0?'原创':'转载'}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>点击次数：</font><input type="text" class="txt" name="clickNum" id="clickNum" value="${pojo.clickNum}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>阅读次数：</font><input type="text" class="txt" name="readNum" id="readNum" value="${pojo.readNum}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>总收藏数：</font><input type="text" class="txt" name="totalSaveNum" id="totalSaveNum" value="${pojo.totalSaveNum}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>总共字数：</font><input type="text" class="txt" name="totalCharNum" id="totalCharNum" value="${pojo.totalCharNum}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>总推荐数：</font><input type="text" class="txt" name="totalRecommand" id="totalRecommand" value="${pojo.totalRecommand}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>是否签约：</font><input type="text" class="txt" name="isSigned" id="isSigned" value="${pojo.isSigned eq 0?'未签约':'已签约'}" alt=""/></div>
			<div class="textItem"><font class='textTitleCss'>小说封面：</font><br>
				<img src="${pojo.novelImg}" width="375" height="500"/>
			</div>
			<div class="textItem"><font class='textTitleCss'>作品简介：</font>
				<br>
				${pojo.vote}
			</div>
		</div>
	</form>
	<jsp:include page="AnzhiHandleAction.jsp" flush="false">
		<jsp:param value="${param.tableId }" name="tableId"/>
		<jsp:param value="2" name="handleType"/>
		<jsp:param value="anzhinovel/delNovelCheck.do" name="actionUrl"/>
	</jsp:include>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
