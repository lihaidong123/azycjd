<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="my_information">
		<div>
			<div class="divItemsCss">登录昵称：<input type="text" class="txtCss" id="userName" name="userName"></div>
			<div class="divItemsCss">作家笔名：<input type="text" class="txtCss" id="biming" name="biming"></div>
			<div class="divItemsCss">身份证号：<input type="text" style="width:160px;" class="txtUploadCss" id="userHeadImg" name="userHeadImg">&nbsp;&nbsp;&nbsp;<input type="button" id="userHeadImgBtn" value="上传" class="uploadBtnCss"></div>
			<div class="divItemsCss">读者昵称：<input type="text" class="txtCss" id="nick" name="nick"></div>
			<div class="divItemsCss">读者性别：<input type="text" style="width:120px;" class="selectTxtCss" id="userSex" name="userSex"></div>
			<div class="divItemsCss">联系地址：<input type="text" style="width:450px;" class="txtCss" id="userAddress" name=""></div>
			<div class="divItemsCss">读者生日：<input type="text" class="txtCss" id="" name=""></div>
			<div class="divItemsCss">联系邮箱：<input type="text" class="txtCss" id="" name=""></div>
			<div class="divItemsCss">隐私设置：<input type="text" class="selectTxtCss" id="yinsishezhi" name="" value="1"></div>
			<div class="divItemsCss">注册时间：<input type="text" class="txtCss" class="Wdate" onClick="WdatePicker()" id="" name=""></div>
		
			
			<div class="divItemsCss">联系电话：<input type="text" style="width:240px;" class="txtCss" id="telNum" name="telNum"></div>
			<div class="divItemsCss">证件类型：<input type="text" style="width:160px;" class="selectTxtCss" id="signType" name="signType" value="0"></div>
			<div class="divItemsCss">证件号码：<input type="text" class="txtCss" id="signCode" name="signCode"></div>
			<div class="divItemsCss">联系Q&nbsp;&nbsp;&nbsp;Q：<input type="text" style="width:450px;" class="txtCss" id="qqNum" name="qqNum"></div>
			<div class="divItemsCss">
				<p>作家简介：</p>
				<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
			</div>
			
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>