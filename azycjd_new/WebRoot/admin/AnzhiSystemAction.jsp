<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiSystem操作
		</div>
	</div>
	<form id="AnzhiSystemFormAction" action="<%=request.getContextPath()%>/anzhisystem/addAnzhiSystem.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>关于我们：</font><input type="text" class="txt" name="aboutUs" id="aboutUs" value="${pojo.aboutUs}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写关于我们</font></div>
			<div class="textItem"><font class='textTitleCss'>用户指南：</font><input type="text" class="txt" name="userGuide" id="userGuide" value="${pojo.userGuide}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写用户指南</font></div>
			<div class="textItem"><font class='textTitleCss'>作者投稿：</font><input type="text" class="txt" name="authorProject" id="authorProject" value="${pojo.authorProject}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写作者投稿</font></div>
			<div class="textItem"><font class='textTitleCss'>诚聘英才：</font><input type="text" class="txt" name="talentsWanted" id="talentsWanted" value="${pojo.talentsWanted}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写诚聘英才</font></div>
			<div class="textItem"><font class='textTitleCss'>联系我们：</font><input type="text" class="txt" name="touchUs" id="touchUs" value="${pojo.touchUs}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写联系我们</font></div>
			<div class="textItem"><font class='textTitleCss'>合作渠道：</font><input type="text" class="txt" name="channelsCooperation" id="channelsCooperation" value="${pojo.channelsCooperation}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写合作渠道</font></div>
			<div class="textItem"><font class='textTitleCss'>编辑专区：</font><input type="text" class="txt" name="editArea" id="editArea" value="${pojo.editArea}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写编辑专区</font></div>
			<div class="textItem"><font class='textTitleCss'>版权维护：</font><input type="text" class="txt" name="copyrightProtection" id="copyrightProtection" value="${pojo.copyrightProtection}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写版权维护</font></div>
			<div class="textItem"><font class='textTitleCss'>备注信息：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写备注信息</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiSystemFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
