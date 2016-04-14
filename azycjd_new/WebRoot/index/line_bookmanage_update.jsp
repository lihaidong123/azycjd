<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<jsp:include page="checkNovelId.jsp" flush="false"></jsp:include>
<form class="formCss" id="day_registration_form">
	<div>
		<div class="divItemsCss">作品名称:
			<input type="text" class="txtCss" id="" name="">
		</div>
		<div class="divItemsCss">作品类型:
			<input type="text" style="width:220px;" class="selectTxtCss" id="projectType" name="projectType" value="爱情">
			<input type="text" style="width:220px;" class="selectTxtCss" id="projectTypetwo" name="projectTypetwo" value="爱情">
		</div>
		<div class="divItemsCss">作品标签:
			<input type="text" style="width:420px;" class="txtCss" id="" name="">
		</div>
		<div class="divItemsCss">授权级别:
			<input type="text" style="width:300px;" class="selectTxtCss" id="projectAccredit" name="projectAccredit" value="原创">
		</div>
		<div class="divItemsCss">作品封面:
			<input type="text" style="width:360px;" class="txtUploadCss" id="projectImg" name="projectImg">&nbsp;&nbsp;&nbsp;
			<input type="button" id="projectImgBtn" value="上传" class="uploadBtnCss">
		</div>
		<div class="divItemsCss">作品状态:
			<input type="text" style="width:300px;" class="selectTxtCss" id="projectStatu" name="projectStatu" value="连载中">
		</div>
		<div class="divItemsCss">添加时间:
			<input type="text" class="txtCss" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="" name="">
		</div>
		<div class="divItemsCss">我的编辑:
			<input type="text" style="width:420px;" class="txtCss" id="" name="">
		</div>
		<div class="divItemsCss">
			<p>作品简介:</p>
			<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
		</div>
		<div class="divItemsCss">
			<input type="button" value="保存" class="saveBtnCss">
			<input type="button" value="重置" class="resetBtnCss">
		</div> 
		</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>