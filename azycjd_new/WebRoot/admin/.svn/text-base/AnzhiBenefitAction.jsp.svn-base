<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<style>
	.textTitleCss{font-weight: bold;}
</style>
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			福利申请操作
		</div>
	</div>
	<form id="AnzhiBenefitFormAction" action="<%=request.getContextPath()%>/anzhibenefit/addAnzhiBenefit.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>小说名称：</font>${pojo.novelTitle}</div>
			<div class="textItem">
				<font class='textTitleCss'>申请理由：</font><br/>
				<p style="padding-left: 15px; line-height: 23px;">${pojo.applyReason}</p>
			</div>
			
			<div class='searchDivItemText' id="advTypebenefitTypes">
				<font class='textTitleCss'>申请类型：</font>${benefitTypeTypeData[pojo.benefitType] }
			</div>
			<div class="searchDivItemText" id="isJinbitaeelects">
				<script language="javascript">
					showSelect("benefitState","benefitState","${pojo.benefitState}",tongTypeData,"isJinbitaeelects","申请状态：",false,135);
				</script>
			</div>
			<div class="textItem"><font class='textTitleCss'>未通过原因：</font><input type="text" class="txt" name="vote" id="vote" value="${pojo.vote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写未通过原因</font></div>
			<input type="hidden" name="novelId" id="novelId" value="${pojo.novelId }"/>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiBenefitFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
