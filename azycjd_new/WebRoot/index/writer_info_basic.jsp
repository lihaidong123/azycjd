<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<style type="text/css">
		.divItemsCss{font: 12px/160% Tahoma, Verdana,snas-serif; color:#686463}
		.divItemsCss table{ border-collapse:collapse;}
		.divItemsCss tr{ line-height:45px;}
		.divItemsCss td{ border:#dfdddc 1px solid; padding-left:15px;}
	</style>
	<div class="divItemsCss" style="width:90%; margin:0 auto; margin-top:30px;">
		<div style="margin-top:20px;">
			<table width="100%" border="0">
			  <tr>
				<td colspan="2" style="background-color:#f5f4f3; padding-left:30px; font-weight:bold;">作家基本信息</td>
			  </tr>
			  <tr>
				<td width="25%" align="center">登录昵称：</td>
				<td width="75%">${loginUsers.memberNo }</td>
			  </tr>
			  <tr>
				<td align="center">作家笔名：</td>
				<td>${loginAuthors.authorWriterName }</td>
			  </tr>
			  <tr>
				<td align="center">身份证号：</td>
				<td>${loginAuthors.authorCredentcode }</td>
			  </tr>
			   <tr>
				<td align="center">真实姓名：</td>
				<td>${loginAuthors.authorRealname }</td>
			  </tr>
			   <tr>
				<td align="center">作家性别：</td>
				<td>${loginUsers.memberSex }</td>
			  </tr>
			</table>
		</div>
	</div>
	<div class="divItemsCss" style="width:90%;padding-left:220px; margin-top:30px;">
		<input type="button" value="修改资料" class="resetBtnCss" id="index/writer_info_update.jsp#linenumber=8#index=5#chooseIndex=1" onclick="getJspData(this)">
		<%-- <c:if test="${loginAuthors.authorState eq 0}">
			<input type="button" value="申请签约" class="saveBtnCss" onclick="getJspDataByUrl('index/reason.jsp#tableId=${loginAuthors.id}#tabNameIndex=2#actionType=12#stateValue=3#actionUrl=index/writer_info_basic.jsp')">
		</c:if>
		<c:if test="${loginAuthors.authorState eq 2}">
			<input type="button" value="已签约" class="saveBtnCss" >
		</c:if> --%>
	</div>
	
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>