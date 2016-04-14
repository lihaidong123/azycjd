<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>安之后台管理登录</title>
<script language="javascript" src="<%=path%>/js/jquery.js"></script>
<script language="javascript">var path='<%=path%>';</script>
<style type="text/css">
	.login_div{ width:350px; margin:0 auto; margin-top:100px;}
	.login_txt_css{ width:100%; height:40px; line-height:40px; text-align:center; border:#ebf6fb 1px solid;font-family:"黑体"; background-color:#22b8f7; color:#FFF; border-radius:4px;}
	.login_txt_css:focus{ outline:none;}
	
	.login_txt_css_focus{ width:100%; height:40px;line-height:40px; text-align:center; border:#ebf6fb 1px solid;font-family:"黑体"; background-color:#fff; color:#333; border-radius:4px;}
	.login_txt_css_focus:focus{ outline:none;}
	.login_div div{ width:65%; margin:0 auto; margin-top:20px; font-family:"黑体";}
	
	.login_btn_css{ width:100%; height:35px; line-height:35px; text-align:center; letter-spacing:3px; border-radius:4px; cursor:pointer;color:#0CC; background-color:#f2f8fa; border:#f2f8fa;}
	.welcome{ color:#f2f8fa; font-size:42px; text-align:center; display:none;}
	.move_div{ background-color:#91c1d8; width:50px; float:left; height:50px; border:#a6cbdd 1px solid; margin-top:500px;}
</style>
<script language="javascript">
	$(function(){
		$(".login_txt_css").focus(function(){
			$(this)[0].className="login_txt_css_focus";							   
			$(this).parent().animate({width:"85%"});								   
		});	
		$(".login_txt_css").blur(function(){
			$(this)[0].className="login_txt_css";							   
			$(this).parent().animate({width:"65%"});								   
		});
		$("body").bind('keydown', function (e) {
	        var key = e.which;
	        if (key == 13) {
	            var obj=document.getElementById("denglubtn");
				login(obj);
	        }
	    });
	});

	function login(obj){
		if($("#uname").val()==""){
			alert("请输入登录账户");
			return;
		}
		if($("#upass").val()==""){
			alert("请输入登录密码");
			return;
		}
		obj.style.display="none";
		$.post(path+"/anzhimember/login.do",{
			username:$("#uname").val(),
			userpass:$("#upass").val()
		},function(res){
			if(res.indexOf("登录成功")==-1){
				alert(res);
				$("#upass").val("");
				obj.style.display="block";
			}else{
				var delay=700;
				$(".login_div").fadeOut(delay,function(){
					$(".welcome").animate({marginTop:"150px"},function(){
						$(".welcome").fadeIn(delay,function(){
							window.location.href=path+"/admin/index.jsp";
						});											   
					});								  
				});
			}
		});	
	}
	
</script>
</head>

<body style="background:url(<%=path%>/admin/images/admin_login.jpg) no-repeat center 0px;padding:0px; margin:0px;">
	<div style="height:400px; margin-top:200px; overflow:hidden;">
    	<div style="position:absolute; z-index:4;width:100%;">
        	<div class="welcome">Welcome</div>
            <div class="login_div">
                <div>
                    <input type="text" class="login_txt_css" value="" id="uname" name="uname" />
                </div>
                <div>
                    <input type="password" class="login_txt_css" value="" id="upass" name="upass" style="font-size: 30px;font-weight: bold;"/>
                </div>
                <div>
                    <input type="button" class="login_btn_css" value="登录" id="denglubtn" onclick="login(this)"/>
                </div>
            </div>
        </div>
    	
    </div>
	
</body>
</html>
