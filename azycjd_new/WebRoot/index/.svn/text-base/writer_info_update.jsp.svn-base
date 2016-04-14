<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<script language="javascript" src="<%=request.getContextPath() %>/js/shengshiqu.js"></script>
	<script language="javascript">
		$(function(){
			initAnzhiProvice('${loginAuthors.authorAddress }');
		});
	</script>
	<form class="formCss" id="infoupdateform" action="anzhiauthor/updateAnzhiAuthorSelf.do" method="post">
		<div>
			<div class="divItemsCss"><font style="padding-left: 27px;">笔名：</font>
				${loginAuthors.authorWriterName }
			</div>
			<div class="divItemsCss">真实姓名：
				${loginAuthors.authorRealname }
			</div>
			<div class="divItemsCss">证件号码：
				${loginAuthors.authorCredentcode }
			</div>
			<div class="divItemsCss">联系电话：
				<input type="text" style="width:240px;" class="txtCss" id="authorTel" name="authorTel" value="${loginAuthors.authorTel }" alt="1[3,4,5,7,8]\d{9};电话输入错误">
			</div>
			<div class="divItemsCss" style="padding-left: 24px;">联系QQ：
				<input type="text" style="width:260px;" class="txtCss" id="authorQq" name="authorQq" value="${loginAuthors.authorQq }" alt="\d{5,10};QQ输入错误">
			</div>
			<div class="divItemsCss">形象照片：
				<input type="text" style="width:160px;" class="txtUploadCss" id="authorImage" name="authorImage" value="${loginAuthors.authorImage }">&nbsp;&nbsp;&nbsp;
				<input type="button" id="authorImageBtn" value="上传" class="uploadBtnCss">
			</div>
			<div class="divItemsCss">详细地址：
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
	    				<input type="hidden" id="authorAddress" name="authorAddress" value="${loginAuthors.authorAddress }">
	    			</div>
				</div>
			</div>
			<div class="divItemsCss">邮政编码：
				<input type="text" style="width:130px;" class="txtCss" id="authorPost" name="authorPost" value="${loginAuthors.authorPost }" alt="[1-9][0-9]{5};邮编输入错误">
			</div>
			<div class="divItemsCss">电子邮箱：
				<input type="text" class="txtCss" id="authorEmail" name="authorEmail" value="${loginAuthors.authorEmail }" alt="\w+@\w+\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?;邮箱输入错误">
			</div>
			<div class="divItemsCss"><font style="padding-left: 34px;">MSN：</font>
				<input type="text" style="width:230px;" class="txtCss" id="authorMsn" name="authorMsn" value="${loginAuthors.authorMsn }">
			</div>
			<div class="divItemsCss">
				<p>作家简介：</p>
				<p><textarea class="htmlEditCss" style="height:230px;" name="authorInfo">${loginAuthors.authorInfo }</textarea></p>
			</div>
			
			<div class="divItemsCss">
				<input type="button" value="保存" class="saveBtnCss" onclick="ajaxFormSubmit('infoupdateform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>