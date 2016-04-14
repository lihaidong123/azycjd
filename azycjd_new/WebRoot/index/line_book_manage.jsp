<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
<form class="formCss" id="day_registration_form">
<div class="divTableCss">
	<table class="tableCss" width="100%" border="0">
	  <tr class="tableTitleCss">
		<td>序号</td>
		<td>作品名称</td>
		<td>作品类型</td>
		<td>授权状态</td>
		<td>点击/收藏</td>
		<td>总字数</td>
		<td>操作</td>
	  </tr>
	</table>
</div>
	<jsp:include page="../next_page.jsp" flush="false"></jsp:include>
</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>