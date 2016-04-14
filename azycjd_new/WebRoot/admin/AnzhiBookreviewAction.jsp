<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiBookreview操作
		</div>
	</div>
	<form id="AnzhiBookreviewFormAction" action="<%=request.getContextPath()%>/anzhibookreview/addAnzhiBookreview.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说id：</font><input type="text" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说id</font></div>
			<div class="textItem"><font class='textTitleCss'>读者id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写读者id</font></div>
			<div class="textItem"><font class='textTitleCss'>书评标题：</font><input type="text" class="txt" name="bookreviewTitle" id="bookreviewTitle" value="${pojo.bookreviewTitle}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评标题</font></div>
			<div class="textItem"><font class='textTitleCss'>书评内容：</font><input type="text" class="txt" name="bookreviewContent" id="bookreviewContent" value="${pojo.bookreviewContent}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评内容</font></div>
			<div class="textItem"><font class='textTitleCss'>书评点击量：</font><input type="text" class="txt" name="bookreviewClicknum" id="bookreviewClicknum" value="${pojo.bookreviewClicknum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评点击量</font></div>
			<div class="textItem"><font class='textTitleCss'>书评回复量：</font><input type="text" class="txt" name="bookreviewReplynum" id="bookreviewReplynum" value="${pojo.bookreviewReplynum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写书评回复量</font></div>
			<div class="textItem"><font class='textTitleCss'>回复时间：</font><input type="text" class="txt" name="bookreviewReplyaddTime" id="bookreviewReplyaddTime" value="${pojo.bookreviewReplyaddTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写回复时间</font></div>
			<div class="textItem"><font class='textTitleCss'>是否置顶：</font><input type="text" class="txt" name="isTop" id="isTop" value="${pojo.isTop}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写是否置顶</font></div>
			<div class="textItem"><font class='textTitleCss'>是否精华：</font><input type="text" class="txt" name="isMarrow" id="isMarrow" value="${pojo.isMarrow}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写是否精华</font></div>
			<div class="textItem"><font class='textTitleCss'>是否悬赏：</font><input type="text" class="txt" name="isReward" id="isReward" value="${pojo.isReward}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写是否悬赏</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiBookreviewFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
