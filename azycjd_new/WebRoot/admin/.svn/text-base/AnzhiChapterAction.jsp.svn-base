<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiChapter操作
		</div>
	</div>
	<form id="AnzhiChapterFormAction" action="<%=request.getContextPath()%>/anzhichapter/addAnzhiChapter.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>分卷id：</font><input type="text" class="txt" name="fenJuanId" id="fenJuanId" value="${pojo.fenJuanId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写分卷id</font></div>
			<div class="textItem"><font class='textTitleCss'>章节标题：</font><input type="text" class="txt" name="chapterTitle" id="chapterTitle" value="${pojo.chapterTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节标题</font></div>
			<div class="textItem"><font class='textTitleCss'>章节内容：</font><input type="text" class="txt" name="chapterContent" id="chapterContent" value="${pojo.chapterContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节内容</font></div>
			<div class="textItem"><font class='textTitleCss'>章节备注：</font><input type="text" class="txt" name="chapterVote" id="chapterVote" value="${pojo.chapterVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节备注</font></div>
			<div class="textItem"><font class='textTitleCss'>状态(0-编写中 1-已完成)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态(0-编写中 1-已完成)</font></div>
			<div class="textItem"><font class='textTitleCss'>创建时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写创建时间</font></div>
			<div class="textItem"><font class='textTitleCss'>修改时间：</font><input type="text" class="txt" name="lastUpdateTime" id="lastUpdateTime" value="${pojo.lastUpdateTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写修改时间</font></div>
			<div class="textItem"><font class='textTitleCss'>字数：</font><input type="text" class="txt" name="chapterCharNum" id="chapterCharNum" value="${pojo.chapterCharNum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写字数</font></div>
			<div class="textItem"><font class='textTitleCss'>阅读方式(0-免费 1-VIP)：</font><input type="text" class="txt" name="readType" id="readType" value="${pojo.readType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写阅读方式(0-免费 1-VIP)</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiChapterFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
