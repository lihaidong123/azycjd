<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="htmlEditAdmin.jsp" flush="false"></jsp:include>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			礼品操作
		</div>
	</div>
	<form id="AnzhiWebEditorGoodsFormAction" action="<%=request.getContextPath()%>/anzhiwebeditorgoods/addAnzhiWebEditorGoods.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>礼品名称：</font><input type="text" class="txt" name="goodsName" id="goodsName" value="${pojo.goodsName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写礼品名称</font></div>
			<div class="textItem"><font class='textTitleCss'>礼品图片：</font><input type="text" class="txt" id="goodsImg" readonly="readonly" name="goodsImg" value="${pojo.goodsImg }">&nbsp;&nbsp;&nbsp;<input type="button" id="goodsImgBtn" value="上传" class="uploadBtnCss"></div>
			<div class="textItem"><font class='textTitleCss'>兑换积分：</font><input type="text" class="txt" name="goodsScore" id="goodsScore" value="${pojo.goodsScore}" alt="\d{1,5};兑换积分输入错误"/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写兑换积分</font></div>
			<div class="textItem"><font class='textTitleCss'>礼品类型：</font><input type="text" class="txt" name="goodsType" id="goodsType" value="${pojo.goodsType}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写礼品类型</font></div>
			<div class='searchDivItemText' id="pictureStateTypeDataDatatwens">
				<script language="javascript">
					showSelect("state","state","${pojo.state}",pictureStateTypeData,"pictureStateTypeDataDatatwens","礼品状态：",false,135);
				</script>
			</div>
			<div class="divItemsCss">
				<p>兑换说明：</p>
				<p><textarea class="htmlEditCss" style="height:230px; width: 90%;" id="goodsVote" name="goodsVote"></textarea></p>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiWebEditorGoodsFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
