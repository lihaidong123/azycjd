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
		<div style="background-color:#eae6e4; border:#c9c3c1 1px solid; line-height:40px; height:40px;">
			<font style="padding-left: 130px; color:#9fa5a7;">普通用户</font>
			<font style="padding-left: 70px; color:#3e3b3a;">您还不是VIP会员，开通VIP会员享受更多尊贵服务，更多会员特权。</font>
		</div>
		<div style="margin-top:20px;">
			<table width="100%" border="0">
			  <tr>
				<td colspan="2" style="background-color:#f5f4f3; padding-left:30px; font-weight:bold;">账户信息</td>
			  </tr>
			  <tr>
				<td width="25%" align="center">用户昵称：</td>
				<td width="75%">${loginUsers.memberNick }</td>
			  </tr>
			  <tr>
				<td align="center">账户余额：</td>
				<td>${loginUsers.memberMoney } 安之币
					<input type="button" value="充值" style=" margin-left:20px; width:80px;" class="resetBtnCss" onclick="window.open('<%=request.getContextPath()%>/chongzhi.jsp')">
					<a style="margin-left:15px;" href="javascript:loadIntroduceJsp('index/introduce/chongshi_introduce.jsp','用户充值指引')">用户充值指引</a>
				</td>
			  </tr>
			  
			  
			  <!-- <tr>
				<td align="center">剩余书券：</td>
				<td>42 书券
					<a style="margin-left:15px;" href="javascript:loadIntroduceJsp('index/introduce/shuquan_use_info.jsp','书券使用说明')">书券使用说明</a>
				</td>
			  </tr> -->
			</table>
		</div>
	</div>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>