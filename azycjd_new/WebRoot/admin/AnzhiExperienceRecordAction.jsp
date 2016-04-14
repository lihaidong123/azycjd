<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiExperienceRecord操作
		</div>
	</div>
	<form id="AnzhiExperienceRecordFormAction" action="<%=request.getContextPath()%>/anzhiexperiencerecord/addAnzhiExperienceRecord.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>经验类型(0-签到获得 1-每日动态 2-每日投票 3-每日充值 4-每日订阅 5-每日收藏 6-每日评论 7-每日打赏 8-每日点赞)：</font><input type="text" class="txt" name="experienceType" id="experienceType" value="${pojo.experienceType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写经验类型(0-签到获得 1-每日动态 2-每日投票 3-每日充值 4-每日订阅 5-每日收藏 6-每日评论 7-每日打赏 8-每日点赞)</font></div>
			<div class="textItem"><font class='textTitleCss'>获得经验：</font><input type="text" class="txt" name="experienceNum" id="experienceNum" value="${pojo.experienceNum}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写获得经验</font></div>
			<div class="textItem"><font class='textTitleCss'>用户id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户id</font></div>
			<div class="textItem"><font class='textTitleCss'>状态：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态</font></div>
			<div class="textItem"><font class='textTitleCss'>备注说明：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注说明</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiExperienceRecordFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
