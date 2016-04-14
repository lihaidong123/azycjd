<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<div class="formCss" id="day_registration_form">
	<div class="htmlTitleCss">
		<div class="htmlTitleCsss_one">申请福利</div>
	</div>
	<div class="divTableCss">
		<form method="post" action="<%=request.getContextPath() %>/anzhibenefit/applyAnzhiBenefit.do" id="applybenefitform">
		<div style="width:100%;height:38px;line-height:38px;">
			<div style="float:left;">选择申请的小说:&nbsp;&nbsp;&nbsp;</div>
			<div>
				<input type="hidden" value="${AnzhiNovelListsize }" class="shusize">
				<c:if test="${AnzhiNovelListsize != 0 }">
					<select name="novelId" id="novelId" style="float:left;padding-top:8px;">
						<c:forEach items="${AnzhiNovelList.list}" var="s">
							<option value="${s.id }">${s.novelTitle }</option>
						</c:forEach>
					</select>
				</c:if>
				<c:if test="${AnzhiNovelListsize == 0}">
					<a>暂时没有可以申请福利的小说哦！</a>
				</c:if>
			</div>
		</div>
		 <div class="signTitleDiv">
			<div style="width: 500px;">作家福利</div>
			<div style="width: 150px;">操作</div>
		 </div>
		 <div class="sqDiv" id="sqContent1">
		 	<div class="sqcontentone">申请内容</div><a id="shenqingdeshuname" style="padding-left:30px;"></a>
		 	<div style="width: 65px;height:40px;line-height:40px;">申请理由：</div>
		 	<div style="width: 530px;">
		 		<textarea name="applyReason" id="applyReason" style="min-width: 480px;height: 100px;max-height: 110px;max-width: 510px;" placeholder="请输入申请理由"></textarea>
		 		<input type="hidden" name="suodiandezhi" id="suodiandezhi" value=""/>
		 	</div>
		 	<div style="float:left;margin-top:10px;">
		 		<input type="button" value="提交" class="saveBtnCss" onclick="ajaxSubmit('applybenefitform',this)">
		 	</div>
		 	<div onclick="closeSign('1')" style="float:left;margin-top:10px;">
		 		<input type="button" value="关闭" class="resetBtnCss">
		 	</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">上架申请以及上架福利申请</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">0</a>
			</div>
		 </div>
		 <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">签约作品完结奖励</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">1</a>
			</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">全勤奖</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">2</a>
			</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">打赏奖</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">3</a>
			</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">订阅奖</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">4</a>
			</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">签约文、签约作者的新书福利</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">5</a>
			</div>
		 </div>
		  <div class="signContentDiv">
			<div style="width: 470px;text-align: left;padding-left:30px;">买断福利</div>
			<div style="width: 150px;cursor: pointer;" class="sqqy">申请该福利
				<a class="benefitType" style="display:none;">6</a>
			</div>
		 </div>
		 </form>
	</div>
</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>