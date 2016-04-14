<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="m_head.jsp"></jsp:include>
	<style type="text/css">
		#menu_div_head{ display:none;}
		#head_logo_div{ display:none;}
		.login_txt{ border:#d5d3d3 1px solid;border-radius:4px; font-size:18px; height:40px; line-height:40px; width:100%; padding-left:50px;}
		.login_div_css div{ margin-top:20px;}
	</style>
	<script type="text/javascript">
		$(function(){
			loadLoginInfoCookie();
		});
	</script>
	<div align="center" style="margin-top:35px;">
		<img src="<%=request.getContextPath() %>/mobile/images/login_logo.png" width="260" />
	</div>
	<div class="login_div_css" style="width:90%; margin:0 auto; padding-top:20px;">
		<div>
			<img src="<%=request.getContextPath() %>/mobile/images/user_p.png" style="position:absolute; margin-left:-2px; margin-top:1px;" />
			<input class="login_txt" type="text" id="uname" name="uname" placeholder="请输入用户名" />
		</div>
		<div>
			<img src="<%=request.getContextPath() %>/mobile/images/pass_p.png" style="position:absolute; margin-left:-2px;" />
			<input class="login_txt" type="password" id="upass" name="upass" />
		</div>
		<div class="btn_m_css" onclick="memberLogin(this)">
			登录
		</div>
	</div>
<jsp:include page="m_foot.jsp"></jsp:include>