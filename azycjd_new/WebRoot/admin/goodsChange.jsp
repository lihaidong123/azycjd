<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			礼品兑换[当前积分:${loginWebEditorUser.editorScore }]
		</div>
	</div>
	<form id="AnzhiWebEditorGoodsForm" action="anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do" method="post">
		<div class="tableCss">
			<div class="goodsDiv">
			<c:forEach items="${anzhiwebeditorgoodsList.list}" var="s" varStatus="ind">
				<div class="goodsItems">
					<div>
						<img src="${s.goodsImg }" width="170" height="100"/>
					</div>
					<div class="goodsTitle">${s.goodsName }</div>
					<div class="goodsScore">兑换积分:<span style="color:red;">${s.goodsScore }</span></div>
					<div class="goodsDetail">
						<input class="buttonBtnCss" type="button" value="详情" onclick="goodsDeatil(${s.id},'${s.goodsName }')"/>
						<input type='button' class='goodsChangeCss' value='兑换' onclick="goodsChange(${s.id},'${s.goodsName }')"/>
					</div>
				</div>
			</c:forEach>
			</div>
			<jsp:include page="../next_page.jsp" flush="false">
				<jsp:param value="anzhiwebeditorgoods/findAnzhiWebEditorGoodsAll.do" name="url"/>
				<jsp:param value="${anzhiwebeditorgoodsList.totalNum }" name="totalNum"/>
				<jsp:param value="${anzhiwebeditorgoodsList.num }" name="num"/>
				<jsp:param value="AnzhiWebEditorGoodsForm" name="formId"/>
				<jsp:param value="${anzhiwebeditorgoodsList.total }" name="total"/>
				<jsp:param value="${param.size}" name="size"/>
			</jsp:include>
		</div>
	</form>
</div>
<jsp:include page="middle.jsp" flush="false"></jsp:include>
