<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			网编礼品兑换操作
		</div>
	</div>
	<form id="AnzhiWebEditorGoodsChangeFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorgoodschange/addAnzhiWebEditorGoodsChange.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>网编名称：</font><input type="text" class="txt"  readonly="readonly" value="${pojo.anzhiWebEditor.editorName}" alt=""/>&nbsp;&nbsp;&nbsp;</div>
			<div class="textItem"><font class='textTitleCss'>礼品名称：</font><input type="text" class="txt" readonly="readonly" value="${pojo.goodsName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'></font></div>
			<div class="textItem"><font class='textTitleCss'>兑换说明：</font><input type="text" class="txt" name="changeVote" id="changeVote" <c:if test='${pojo ne null }'> readonly="readonly"</c:if> value="${pojo.changeVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'></font></div>
			<div class="textItem"><font class='textTitleCss'>兑换状态：</font><input type="text" class="txt" name="state" id="state" <c:if test='${pojo ne null }'> readonly="readonly"</c:if> value="${pojo.state}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'></font></div>
			<!-- <div class="textItem"><font class='textTitleCss'>添加时间：</font><input type="text" class="txt" name="addTime" id="addTime" value="${pojo.addTime}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写添加时间</font></div> -->
			<div class="textItem">
				<!-- <input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorGoodsChangeFormAction',this)"/> -->
				<input class="saveBtnCss" type="button" value="关闭" onClick="allLoadPage('anzhiwebeditorgoodschange/findAnzhiWebEditorGoodsChangeAll.do')"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
