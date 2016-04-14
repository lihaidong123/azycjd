<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	
	<form class="formCss" id="dayregistrationform" action="<%=request.getContextPath() %>/anzhiregistration/qiandao.do">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">每日签到</div>
		</div>
		<div>
			<div class="divItemsCss">
				<p>签到心情：</p>
				<p><textarea class="textareaCss" style="width:80%; height:100px;"></textarea></p>
			</div>
			<div class="divItemsCss">
				<input type="button" value="签到" class="saveBtnCss" onclick="ajaxFormSubmit('dayregistrationform',this)">
				<input type="button" value="重置" class="resetBtnCss">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>