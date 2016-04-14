<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiComment操作
		</div>
	</div>
	<form id="AnzhiCommentFormAction" action="<%=request.getContextPath()%>/anzhicomment/addAnzhiComment.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>表格id：</font><input type="text" class="txt" name="tableId" id="tableId" value="${pojo.tableId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写表格id</font></div>
			<div class="textItem"><font class='textTitleCss'>书评标题：</font><input type="text" class="txt" name="commentTitle" id="commentTitle" value="${pojo.commentTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评标题</font></div>
			<div class="textItem"><font class='textTitleCss'>书评内容：</font><input type="text" class="txt" name="commentContent" id="commentContent" value="${pojo.commentContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评内容</font></div>
			<div class="textItem"><font class='textTitleCss'>评论类型(0-小说 1-章节 2-系统悬赏评论)：</font><input type="text" class="txt" name="commentType" id="commentType" value="${pojo.commentType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写评论类型(0-小说 1-章节 2-系统悬赏评论)</font></div>
			<div class="textItem"><font class='textTitleCss'>父级评论(0-第一条评论)：</font><input type="text" class="txt" name="commentFatherid" id="commentFatherid" value="${pojo.commentFatherid}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写父级评论(0-第一条评论)</font></div>
			<div class="textItem"><font class='textTitleCss'>评论状态(0-无效评论 1-正常评论)：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写评论状态(0-无效评论 1-正常评论)</font></div>
			<div class="textItem"><font class='textTitleCss'>评论时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写评论时间</font></div>
			<div class="textItem"><font class='textTitleCss'>是否置顶：</font><input type="text" class="txt" name="isTop" id="isTop" value="${pojo.isTop}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写是否置顶</font></div>
			<div class="textItem"><font class='textTitleCss'>是否精华：</font><input type="text" class="txt" name="isMarrow" id="isMarrow" value="${pojo.isMarrow}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写是否精华</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiCommentFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
