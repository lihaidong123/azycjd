<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiNovelMultifunction操作
		</div>
	</div>
	<form id="AnzhiNovelMultifunctionFormAction" action="<%=request.getContextPath()%>/anzhinovelmultifunction/addAnzhiNovelMultifunction.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说id：</font><input type="text" class="txt" name="novelId" id="novelId" value="${pojo.novelId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写小说id</font></div>
			<div class="textItem"><font class='textTitleCss'>用户id(没有登录写0)：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户id(没有登录写0)</font></div>
			<div class="textItem"><font class='textTitleCss'>数据类型(0-点击 1-收藏 2-推荐票 3-推荐作品)：</font><input type="text" class="txt" name="actionType" id="actionType" value="${pojo.actionType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写数据类型(0-点击 1-收藏 2-推荐票 3-推荐作品)</font></div>
			<div class="textItem"><font class='textTitleCss'>状态：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态</font></div>
			<div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiNovelMultifunctionFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
