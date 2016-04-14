<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelReward操作
		</div>
	</div>
	<form id="AnzhiNovelRewardFormAction" action="<%=request.getContextPath()%>/anzhinovelreward/addAnzhiNovelReward.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说id：</font><input type="text" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说id</font></div>
			<div class="textItem"><font class='textTitleCss'>章节id：</font><input type="text" class="txt" name="chapterId" id="chapterId" value="${pojo.chapterId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写章节id</font></div>
			<div class="textItem"><font class='textTitleCss'>用户id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户id</font></div>
			<div class="textItem"><font class='textTitleCss'>打赏类型(0-推荐票 1-催更票 2-月票 )：</font><input type="text" class="txt" name="rewardType" id="rewardType" value="${pojo.rewardType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写打赏类型(0-推荐票 1-催更票 2-月票 )</font></div>
			<div class="textItem"><font class='textTitleCss'>打赏数量：</font><input type="text" class="txt" name="rewardNum" id="rewardNum" value="${pojo.rewardNum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写打赏数量</font></div>
			<div class="textItem"><font class='textTitleCss'>打赏安之币：</font><input type="text" class="txt" name="rewardAnzhiMoney" id="rewardAnzhiMoney" value="${pojo.rewardAnzhiMoney}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写打赏安之币</font></div>
			<div class="textItem"><font class='textTitleCss'>状态：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelRewardFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
