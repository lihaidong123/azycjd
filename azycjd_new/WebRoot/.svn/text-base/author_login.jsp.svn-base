<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<script type="text/javascript">
		function memberLoginOther(obj){
			if($("#userName").val()==""){
				alert("请输入登录账户");
				return;
			}
			if($("#userPass").val()==""){
				alert("请输入登录密码");
				return;
			}
			obj.style.display="none";
			$.post(path+"/anzhimember/login.do",{
				username:$("#userName").val(),
				userpass:$("#userPass").val()
			},function(res){
				if(res.indexOf("登录成功")==-1){
					alert(res);
					obj.style.display="block";
				}else{
					window.location.href="<%=request.getContextPath()%>/index.html";
				}
			});	
		}
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<div class="div_title_css_main" style="background-color: #ffffff;">
		<div class="div_title_css_sec" style="margin: 0 auto; text-align: center; padding-left: 0px; margin-top: 20px;">系统登录</div>
		<div class="div_title_css_conetent" style="padding-left: 210px;">
			<div class="divItemsCss">登录账号：<input type="text" class="txtCss" id="userName" name="userName" ></div>
			<div class="divItemsCss">登录密码：<input type="password" class="txtCss" id="userPass" name="userPass" ></div>
			<div class="divItemsCss" style=" padding-left: 50px">
				<input type="button" value="登录" class="saveBtnCss" onclick="memberLoginOther(this)">
				<%-- <input type="button" value="申请成为作者" style="width:150px;letter-spacing:3px;margin-left: 20px;" class="resetBtnCss"  onclick="window.location.href='<%=request.getContextPath()%>/author_apply.jsp'"> --%>
			</div>
		</div>
	</div>
<jsp:include page="foot.jsp"></jsp:include>