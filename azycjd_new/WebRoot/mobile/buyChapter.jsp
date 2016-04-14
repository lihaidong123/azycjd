<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:include page="m_head.jsp"></jsp:include>
<style>
	.div_float_css{padding-top: 7px;}
	.div_float_css div{font-size: 12px; line-height: 28px;padding-left: 15px;}
	.specil{ margin-left: 5px; margin-right: 5px; font-weight: bold; color:#e51909; font-size: 14px; font-family: '黑体';}
</style>
<div>
	<div class="index_css_title"><span class="index_css_title_one"></span><span class="index_css_title_two">${novelName }</span><span class="index_css_title_three">NOVEL TITLE</span></div>
	<div class="div_float_css">
		<div>${chapterPojo.chapterTitle }</div>
		<div>总字数:<span class="specil">${chapterPojo.chapterCharNum }</span></div>
		<div>需要<span class="specil">${chapterPojo.anzhibi }</span>安之币</div>
		<div></div>
		<div>
			<c:if test="${loginUsers.memberMoney < chapterPojo.anzhibi}">
				<input type="button" class="add_da_shang" value="余额不足"/>
				<a style="font-weight: bold;" href="javascript:window.location.href='<%=request.getContextPath()%>/mobile/m_paycharge.jsp'">充值</a>
			</c:if>
			<c:if test="${loginUsers.memberMoney > chapterPojo.anzhibi}">
				<input type="button" class="add_da_shang" value="购买" onClick="buyChapterAction(0,'${chapterPojo.id }','${loginUsers.id}','${loginUsers.memberMoney}','${chapterPojo.novelId }')"/>
			</c:if>
		</div>
	</div>
	
	<div class="div_float_css">
		<div>该书还有<span class="specil">${noBuyVip }</span>章可购买</div>
		<div>总字数:<span class="specil">${noBuyCharNum }</span></div>
		<div>需要<span class="specil">${needAnzhiBi }</span>安之币</div>
		<div>请注意：不包含未发布章节</div>
		<div>
			
			<c:if test="${loginUsers.memberMoney < needAnzhiBi}">
				<input type="button" class="add_da_shang" value="余额不足"/>
				<a style="font-weight: bold;" href="javascript:window.location.href='<%=request.getContextPath()%>/mobile/m_paycharge.jsp'">充值</a>
			</c:if>
			<c:if test="${loginUsers.memberMoney > needAnzhiBi}">
				<input type="button" class="add_da_shang" value="购买" onClick="buyChapterAction(1,'${novelId}','${loginUsers.id}','${loginUsers.memberMoney}','${chapterPojo.novelId }')"/>
			</c:if>
		</div>
	</div>
	<div class="div_float_css">
		<div>当阅读本书未购买的VIP章节</div>
		<div>将直接购买不再提示</div>
		<div>
			<input type="button" class="add_da_shang" value="订阅" onClick="buyChapterAction(2,'${novelId}','${loginUsers.id}','${loginUsers.memberMoney}','${chapterPojo.novelId }')"/>
		</div>
	</div>
	<div class="div_float_css">
		<div class="da_shang_tips">
			您当前还有<strong>${loginUsers.memberMoney}</strong>安之币！<a href="javascript:window.location.href='<%=request.getContextPath()%>/mobile/m_paycharge.jsp'">充值</a><br>
			<c:if test="${youhuiJoin eq 'yes' }">
				本书有[${discountedTypeName }]优惠，截止:${discountedEndDate }  购买折扣:<span class='discountedRebate_class'>${discountedRebate }</span>
			</c:if>
		</div>
	</div>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>