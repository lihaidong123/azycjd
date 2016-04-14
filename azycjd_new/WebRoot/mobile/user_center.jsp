<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
	<%
		if(session.getAttribute("loginUsers")==null){
			%>
			<script type="text/javascript">
				window.location.href=path+"/mobile/m_login.jsp";
			</script>
			<%
			return;
		}
	 %>
	<style type="text/css">
		#menu_div_head{ display:none;}
	</style>
	<div style="background-color:#FFFFFF;" class="head_user_cent">
		<table width="100%" border="0" style="height:110px;">
		  <tr>
			<td width="140" align="center">
				<div style="position:absolute;margin-top:-38px; margin-left:20px;">
					<img src="${loginUsers.memberHeadImg }" width="104" style="border-radius:104px;" />
				</div>
			</td>
			<td>
				<div style="border-right:#999999 1px solid;">
					<div style="text-align:center; font-weight:bold;">${loginUsers.memberNick }</div>
					<div style="text-align:center; font-size:12px; color:#999999;">
						<c:if test="${loginUsers.memberType eq 0 }">读者</c:if>
						<c:if test="${loginUsers.memberType eq 1 }">作者</c:if>
						<c:if test="${loginUsers.memberType eq 2 }">管理员</c:if>
					</div>
				</div>
			</td>
			<td>
				<div style="text-align:center; font-weight:bold; color:#09abf7; font-size:16px;">${loginUsers.memberMoney }</div>
				<div style="text-align:center; font-size:12px; color:#999999;">安之币余额</div>
			</td>
		  </tr>
		</table>
	</div>
	<div style="background-color:#e8e8e8;top:170px; height:40px;width:100%;">
		
	</div>
	
	<div class="user_div_xss" onclick="window.location.href='<%=request.getContextPath()%>/mobile/m_paycharge.jsp'">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">用户余额:<span style="color:#09abf7;">${loginUsers.memberMoney }</span></span>
			</td>
			<td width="80" align="center">
				<img src="<%=request.getContextPath() %>/mobile/images/chognzhiba.png" width="60"/>
			</td>
		  </tr>
		</table>
	</div>
	<div class="user_div_xss" style="cursor:pointer;" onclick="window.location.href='<%=request.getContextPath()%>/anzhirecharge/findMyAnzhiRechargeAll.do?pageName=mobile/chongzhijilu&&size=1000'">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">充值记录</span>
			</td>
			<td width="47" align="center">
				<img src="<%=request.getContextPath() %>/mobile/images/jiantou.png" width="8"/>
			</td>
		  </tr>
		</table>
	</div>
	<div class="user_div_xss" style="cursor:pointer;" onclick="window.location.href='<%=request.getContextPath()%>/mobile/chongzhijilu.jsp'">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">当前经验</span>
			</td>
			<td width="80" align="center">
				<span class="user_span_css" style="font-weight:bold;">${loginUsers.memberExperience }</span>
			</td>
		  </tr>
		</table>
	</div>
	<div class="user_div_xss" style="cursor:pointer;" onclick="window.location.href='<%=request.getContextPath()%>/mobile/myBookMark.do'">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">我的书签</span>
			</td>
			<td width="47" align="center">
				<img src="<%=request.getContextPath() %>/mobile/images/jiantou.png" width="8"/>
			</td>
		  </tr>
		</table>
	</div>
	
	<div class="user_div_xss" style="margin-top:30px;">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">经验等级</span>
			</td>
			<td width="80" align="center">
				<span class="user_span_css">${dengjiNum }级</span>
			</td>
		  </tr>
		</table>
	</div>
	<div class="user_div_xss">
		<table width="100%" border="0">
		  <tr>
			<td>
				<span class="titls_info_td">每日签到</span>
			</td>
			<td width="155" align="center">
				<c:if test="${qiandao eq 'no' }">
					<span class="user_span_css"><input type="button" value="签到" onclick="qiandao(this)"/> <span id="qiandao_info">签到送经验</span><img src="<%=request.getContextPath() %>/mobile/images/jiantou.png" style="vertical-align:middle; margin-left:10px; margin-right:10px;" width="8"/></span>
				</c:if>
				<c:if test="${qiandao eq 'yes' }">
					<span class="user_span_css">您今日已经签到！<img src="<%=request.getContextPath() %>/mobile/images/jiantou.png" style="vertical-align:middle; margin-left:10px; margin-right:10px;" width="8"/></span>
				</c:if>
			</td>
		  </tr>
		</table>
	</div>
	
	<div class="btn_m_css" style="margin-top: 35px;" onclick="outSystemFn()">
		退出
	</div>
	
<jsp:include page="m_foot.jsp"></jsp:include>