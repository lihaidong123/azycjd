<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="actionIndex.jsp" flush="false"></jsp:include>
<jsp:include page="adminHtmlEdit.jsp" flush="false" />
<div class="divInit">
	<div class="divInitOne">
		<div class="divInitTwo">
			平台收录数据录入操作
		</div>
	</div>
	<form id="AnzhiThirdRecommandFormAction" action="<%=request.getContextPath()%>/anzhithirdrecommand/addAnzhiThirdRecommand.do" method="post">
		<div class="inputItemsCssss">
			<input type="hidden" class="txt" name="id" id="id" value="${pojo.id}" alt=""/>
			<div class='textItem' id="ifffdeelects">
				<script language="javascript">
					showSelect("thirdType","thirdType","${pojo.thirdType}",thirdRecommandTypeData,"ifffdeelects","收录平台：",false,135);
				</script>
			</div>
			<div class="textItem"><font class='textTitleCss'>文件选择：</font><input type="text" class="txt" name="cooperationImg" id="cooperationImg" value="${pojo.cooperationImg}" alt=""/>
				<input type="button" id="cooperationImgBtn" value="上传" class="uploadBtnCss">
				&nbsp;&nbsp;&nbsp;*<font class='textTipsCss'>请选择EXCEL文件</font>
			</div>
			<div class="textItem">
				<input class="saveBtnCss" type="button" value="保存" onClick="ajaxSubmit('AnzhiThirdRecommandFormAction',this)"/>
			</div>
		</div>
	</form>
</div>
<jsp:include page="actionFoot.jsp" flush="false"></jsp:include>
