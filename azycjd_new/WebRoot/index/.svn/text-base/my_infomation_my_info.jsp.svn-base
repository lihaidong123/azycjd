<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<script language="javascript" src="<%=request.getContextPath() %>/js/shengshiqu.js"></script>
	<script language="javascript">
		$(function(){
			initAnzhiProvice('${loginUsers.memberAddress }');
		});
	</script>
	<form class="formCss" id="myinfoform" action="<%=request.getContextPath() %>/anzhimember/updateAnzhiMemberMySelf.do?type=0" method="post">
		<div>
			<div class="divItemsCss">登录昵称：${loginUsers.memberNick }</div>
			<div class="divItemsCss"><font style="padding-left:43px;">QQ：</font><input type="text" style="width:240px;" class="txtCss" id="memberQq" name="memberQq" value="${loginUsers.memberQq }"></div>
			<div class="divItemsCss">读者性别：<input type="text" style="width:120px;" class="selectTxtCss" id="memberSexInput" name="memberSexInput" value="${loginUsers.memberSex }"></div>
			<div class="divItemsCss">
				<div>现居住地：</div>
				<div class="address_choose_css">
					<div>
						<span class="address_span_css">所在地区:</span>
						<select id="anzhi_provice" name="anzhi_provice" onchange="getCityData(this.value)"></select>
		    			<select id="anzhi_city" name="anzhi_city" onchange="getQuData(this.value)"></select>
		    			<select id="anzhi_qu" name="anzhi_qu" onchange="getShengShiquHtml()"></select>
		    		</div>
	    			<div>
	    				<span class="address_span_css">详细地址:</span>
	    				<span id="shengshiquHtml"></span><input type="text" style="width:250px;" class="txtCss" id="memberAddressDetail" name="memberAddressDetail" value="">
	    				<input type="hidden" id="memberAddress" name="memberAddress" value="${loginUsers.memberAddress }">
	    			</div>
				</div>
			</div>
			<div class="divItemsCss">出生日期：<input type="text" class="txtCss" id="memberBirthdays" name="memberBirthdays" class="Wdate" onClick="WdatePicker()" value="${loginUsers.memberBirthday }"></div>
			<div class="divItemsCss">绑定邮箱：
				<input type="text" class="txtCss" id="memberEmail" name="memberEmail" value="${loginUsers.memberEmail }"  alt="\w+@\w+(\.[a-zA-Z]{2,3}){1,2};电子邮箱输入错误！" onblur="updatecheckOnlyEmail(this,'${loginUsers.memberEmail }')">
				<span class="memberEmail" style="color:red;"></span>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>可用于找回密码或修改密码</font>
			</div>
			<div class="divItemsCss">绑定手机：
				<input type="text" class="txtCss" id="memberTel" name="memberTel" value="${loginUsers.memberTel }" alt="1[3,4,5,7,8]\d{9};手机号码输入错误！" onblur="updatecheckOnlyTel(this,${loginUsers.memberTel })">
				<span class="memberTel" style="color:red;"></span>
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>可用于找回密码或修改密码</font>
			</div>
			<div class="divItemsCss">
				<p>个人简介：</p>
				<p><textarea class="htmlEditCss" id="vote" name="vote" style="height:230px;">${loginUsers.vote }</textarea></p>
			</div>
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('myinfoform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>