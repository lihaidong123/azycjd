<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="adminHtmlEdit.jsp" flush="false" />
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			图片操作
		</div>
	</div>
	<form id="AnzhiPictureFormAction" action="<%=request.getContextPath()%>/anzhipicture/addAnzhiPicture.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class="textItem"><font class='textTitleCss'>图片名称：</font><input type="text" class="txt" name="pictureName" id="pictureName" value="${pojo.pictureName}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写图片名称</font></div>
			<div class="textItem"><font class='textTitleCss'>图片路径：</font><input type="text" class="txt" id="pictureUrl" readonly="readonly" name="pictureUrl" value="${pojo.pictureUrl }">&nbsp;&nbsp;&nbsp;<input type="button" id="pictureUrlBtn" value="上传" class="uploadBtnCss">	
			</div>
				
			<div class="textItem"><font class='textTitleCss'>图片说明：</font><input type="text" class="txt" name="pictureVote" id="pictureVote" value="${pojo.pictureVote}" alt=""/>&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请填写图片说明</font></div>
			<div class='searchDivItemText' id="pictureStateTypeDatadfghjk">
				<script language="javascript">
					showSelect("state","state","${pojo.state}",pictureStateTypeData,"pictureStateTypeDatadfghjk","启用状态：",false,135);
				</script>
			</div>
			<div class='searchDivItemText' id="dfgpictureType">
				<script language="javascript">
					showSelect("pictureType","pictureType","${pojo.pictureType}",pictureTypeData,"dfgpictureType","图片类型：",false,135);
				</script>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiPictureFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
