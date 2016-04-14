<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
<div style="clear:both; line-height:60px; padding-left:15px;font-weight:bold;">
	充值记录
</div>
<div class="table_css_mobile">
	<table width="100%" border="0">
	  <tr style="background-color:#FFFFFF; border-bottom:#e8e8e8 1px solid; line-height:45px;font-family:'黑体'; font-weight:bold;">
		<td style="font-size:14px; color:#565454;">充值金额</td>
		<td style="font-size:14px;color:#565454;">充值时间</td>
	  </tr>
	  <c:forEach items="${myanzhirechargeList.list }" var="mycharge" varStatus="ind">
	  	<tr>
			<td>${mycharge.rechargeMoney }元</td>
			<td><fmt:formatDate value="${mycharge.addTime}" pattern="yyyy/MM/dd HH:mm"/></td>
		  </tr>
	  </c:forEach>
	</table>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>