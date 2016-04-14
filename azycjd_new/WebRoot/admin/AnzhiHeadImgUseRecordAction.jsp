<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			AnzhiHeadImgUseRecord操作
		</div>
	</div>
	<form id="AnzhiHeadImgUseRecordFormAction" action="<%=request.getContextPath()%>/anzhiheadimguserecord/addAnzhiHeadImgUseRecord.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>客户id：</font><input type="text" class="txt" name="memberId" id="memberId" value="${pojo.memberId}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写客户id</font></div>
			<div class="textItem"><font class='textTitleCss'>头像路径：</font><input type="text" class="txt" name="useImg" id="useImg" value="${pojo.useImg}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写头像路径</font></div>
			<div class="textItem"><font class='textTitleCss'>使用时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写使用时间</font></div>
			<div class="textItem"><font class='textTitleCss'>状态：</font><input type="text" class="txt" name="state" id="state" value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写状态</font></div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiHeadImgUseRecordFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
