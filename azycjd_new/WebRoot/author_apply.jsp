<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	if(session.getAttribute("loginUsers")==null){
		response.sendRedirect(request.getContextPath()+"/register.jsp?wantToWriter=yes");
		return;
	}
	if(session.getAttribute("loginAuthors")!=null){
		response.sendRedirect(request.getContextPath()+"/index.html");
		return;
	}
 %>
<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="htmlEdit.jsp" flush="false" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
	<script language="javascript" src="<%=request.getContextPath() %>/js/shengshiqu.js"></script>
	<script language="javascript">
		$(function(){
			initAnzhiProvice('${loginUsers.memberAddress }');
		});
	</script>
	<div class="div_title_css_main" style="background-color: #ffffff;">
		<div class="div_title_css_sec" style="margin: 0 auto; width:60%; padding-bottom:10px; text-align: center; padding-left: 0px; margin-top: 20px;">作者专区-申请成为作者</div>
		<form method="post" id="authorapplyform" action="anzhiauthor/addAnzhiAuthor.do">
		<div class="div_title_css_conetent">
			<div>
			<div class="divItemsCss">
				<font style="padding-left: 28px;">笔名：</font>
				<input type="text" style="width: 240px;" class="txtCss"	id="authorWriterName" name="authorWriterName" alt="[\u4E00-\u9FA5A-Za-z\d]{2,};笔名输入错误" onblur="checkwritename(this)">
				<span class="authorWriterName" style="color:red;"></span>
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<!-- <div class="shurushuju">
					<div class="shurushuju_left">昵称</div>
					<div class="shurushuju_right">
						<input type="text" name="memberNick" id="memberNick" style="background:#ffdfdf;width:200px" alt="[\u4E00-\u9FA5A-Za-z\d]{2,};昵称输入错误" onblur="checkOnlyNick(this)"/>
						<span class="memberNick" style="color:red;"></span>
					</div>
				</div> -->
			<div class="divItemsCss">
				联系电话：
				<input type="text" style="width: 240px;" class="txtCss"	id="authorTel" name="authorTel" value="${loginUsers.memberTel }" alt="1[3,4,5,7,8]\d{9};手机号码输入错误！" onblur="updatecheckOnlyTel(this,${loginUsers.memberTel })">
				<span class="memberTel" style="color:red;"></span>
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<div class="divItemsCss">
				联系Q&nbsp;&nbsp;Q：
				<input type="text" style="width: 260px;" class="txtCss" id="authorQq" name="authorQq" value="${loginUsers.memberQq }" alt="\d{5,10};QQ输入错误">
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<div class="divItemsCss">
				形象照片：
				<input type="text" style="width: 160px;" class="txtUploadCss" id="authorImage" name="authorImage" value="${loginUsers.memberHeadImg }">
				&nbsp;&nbsp;&nbsp;
				<input type="button" id="authorImageBtn" value="上传" class="uploadBtnCss">
			</div>
			<div class="divItemsCss">
				真实姓名：
				<input type="text" style="width: 220px;" class="txtCss"	id="authorRealname" name="authorRealname" value="${loginUsers.memberRealName }" alt="[\u4E00-\u9FA5]{2,};姓名输入错误">
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
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
	    				<span id="shengshiquHtml"></span><input type="text" style="width:250px;" class="txtCss" id="authorAddressDetail" name="authorAddressDetail" value="">
	    				<input type="hidden" id="authorAddress" name="authorAddress" value="">
	    			</div>
				</div>
<!-- 
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
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
	    				<span id="shengshiquHtml"></span><input type="text" style="width:250px;" class="txtCss" id="authorAddressDetail" name="authorAddressDetail" value="">
	    				<input type="hidden" id="authorAddress" name="authorAddress" value="">
	    			</div>
				</div> -->

			</div>
		    <div class="divItemsCss">
				邮政编码：
				<input type="text" style="width: 130px;" class="txtCss"	id="authorPost" name="authorPost" alt="[1-9][0-9]{5};邮编输入错误">
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<div class="divItemsCss">
				电子邮箱：
				<input type="text" class="txtCss" id="authorEmail" name="authorEmail" value="${loginUsers.memberEmail }" alt="\w+@\w+(\.[a-zA-Z]{2,3}){1,2};电子邮箱输入错误！" onblur="updatecheckOnlyEmail(this,'${loginUsers.memberEmail }')">
				<span class="memberEmail" style="color:red;"></span>
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<div class="divItemsCss">
				<font style="padding-left: 28px;">MSN：</font>
				<input type="text" style="width: 230px;" class="txtCss" id="authorMsn" name="authorMsn">
			</div>
			<div class="divItemsCss">
				证件类型：
				<input type="text" style="width: 160px;" class="selectTxtCss" id="authorCredenttypeInput" name="authorCredenttypeInput" value="0">
			</div>
			<div class="divItemsCss">
				证件号码：
				<input type="text" class="txtCss" id="authorCredentcode" name="authorCredentcode" value="${loginUsers.memberCode }" alt="(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$);身份证输入错误">
				&nbsp;&nbsp;&nbsp;<font class='textTipsCss' style="color:red;">*必填项</font>
			</div>
			<div class="divItemsCss">
				<p>
					作家简介：
				</p>
				<p>
					<textarea class="htmlEditCss" style="height: 230px;" name="authorInfo" id="authorInfo"></textarea>
				</p>
			</div>

			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('authorapplyform',this)"/>
				<input type="button" value="重置" class="resetBtnCss" />
			</div>
		</div>
		</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>