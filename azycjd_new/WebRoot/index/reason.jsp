<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<form class="formCss" id="reason_form"  method="post" action="<%=request.getContextPath() %>/anzhimessage/addAnzhiMessage.do">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">申请说明</div>
		</div>
		<div>
			<div class="divItemsCss">
				<p>备注说明：</p>
				<p><textarea class="htmlEditCss" id="vote" name="vote" style="height:230px;"></textarea></p>
			</div>
			<div class="divItemsCss">
				<input type="button" value="提交" class="saveBtnCss" onclick="delTable(this,${param.tableId},${param.tabNameIndex},${param.actionType},${param.stateValue},'${param.actionUrl }','${param.t }')">
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>