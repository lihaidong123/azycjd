<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
	<style type="text/css">
		.textTitleCss{ font-weight: bold; font-size: 12px;}
		.textItem{ margin-top: 17px;}
		.saveBtnCss{ background-color:#1a9cda; letter-spacing:4px; border-radius:3px; width:65px; height:30px; line-height:30px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.saveBtnCss:hover{ background-color:#1ea9eb;}
		.resetBtnCss{ margin-left:10px; background-color:#d85224; letter-spacing:4px; border-radius:3px; width:70px; height:30px; line-height:30px; vertical-align:middle; cursor:pointer; border:none; color:#FFFFFF; font-family:"黑体"; font-size:14px; text-align:center;}
		.resetBtnCss:hover{ background-color:#ea5f2f;}
		.txtCssInput{ border-radius:6px; width:280px; background-color:#f0f0f0; border:none; font-family:"微软雅黑"; font-size:14px; height:38px; line-height:38px; vertical-align:middle; padding-left:15px;}
		.txtCssInput:focus{outline:none; background-color:#ffdfdf;}
		.find_type_pass li{float: left; width: 25%; line-height: 45px; text-align: center;}
	</style>
	<script type="text/javascript">
		var findType=0;
		var sendObj;
		var shengyushijain=60;
		var daojishiTime;
		function getCodes(obj){
			if(findType==0){
				var reg=/^1[3,4,5,7,8]\d{9}$/;
				if(!reg.test($("#telNum").val())){
					alert("电话号码输入错误！");	
					return;
				}
			}else{
				var reg=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
				if(!reg.test($("#emailName").val())){
					alert("邮箱地址输入错误！");	
					return;
				}
			}
			$.post(path+"/anzhimember/getCodes.do",{
				findType:findType,
				telNum:$("#telNum").val(),
				emailName:$("#emailName").val()
			},function(res){
				if(res.indexOf("成功")!=-1){
					$("#nextStep")[0].style.display='block';
					sendObj=obj;
					shengyushijain=60;
					sendObj.disabled=true;
					if(sendObj.id=="telButton"){
						$("#emailButton")[0].style.visibility="hidden";
					}else{
						$("#telButton")[0].style.visibility="hidden";
					}
					clearInterval(daojishiTime);
					daojishiTime=setTimeout("daojishi()",1000);
				}
				$("#sendCoderesut").html(res);
			});
		}
		
		function daojishi(){
			shengyushijain--;
			if(shengyushijain<0){
				sendObj.disabled=false;
				sendObj.value="发送";
				$("#telButton")[0].style.visibility="visible";
				$("#emailButton")[0].style.visibility="visible";
				return;
			}
			sendObj.value=shengyushijain+"秒";
			setTimeout("daojishi()",1000);
		}
		
		function checkCode(){
			var reg=/^\d{6}$/;
			if(!reg.test($("#codes").val())){
				alert("验证码输入错误！");
				return;	
			}
			$.post(path+"/anzhimember/checkCodes.do",{
				codes:$("#codes").val(),
				findType:findType
			},function(res){
				if(res=="yes"){
					$("#findPasswordOne")[0].style.display="none";
					$("#findPasswordTwo")[0].style.display="block";
				}else{
					alert(res);
				}
			});
		}
		
		function updatePassFind(obj){
			var reg=/^\w{6,20}$/;
			if(!reg.test($("#newPassweord").val())||!reg.test($("#newPassweord1").val())){
				alert("密码必须是6-20位的数字字母组合");
				return;
			}
			if($("#newPassweord").val()!=$("#newPassweord1").val()){
				alert("两次输入密码不一致！");
				return;
			}
			$.post(path+"/anzhimember/findPassword.do",{newPassweord:$("#newPassweord").val()},function(res){
				if(res=="yes"){
					alert("密码修改成功！");
					window.location.href=path+"/index.html";
				}else{
					alert(res);
				}
			});
		}
	</script>
	<div class="div_title_css_main" style="background-color: #ffffff;">
		<div class="div_title_css_sec" style="margin: 0 auto; width:60%; padding-bottom:10px; text-align: center; padding-left: 0px; margin-top: 20px;">找回密码</div>
		<form method="post" id="findPassForm" action="">
			<div class="div_title_css_conetent">
				<div style="width:80%;margin: 0 auto;" id="findPasswordOne">
					<div class="find_type_pass"> 
						<ul style="list-style: none;">
							<li onclick="findType=0;$('#telDiv')[0].style.display='block';$('#emailDiv')[0].style.display='none';$('#codes').val('');">手机找回</li>
							<li onclick="findType=1;$('#telDiv')[0].style.display='none';$('#emailDiv')[0].style.display='block';$('#codes').val('');">邮箱找回</li>
						</ul>
					</div>
					<div style="clear: both;">
						<div class="textItem" id="telDiv">
							<font class='textTitleCss'>手机号码：</font><input type="text" class="txtCssInput" name="telNum" id="telNum"  alt=""/>
							<input type="button" id="telButton" value="发送" class="resetBtnCss" onclick="getCodes(this)"/>
						</div>
						<div class="textItem" id="emailDiv" style="display: none;">
							<font class='textTitleCss'>邮箱地址：</font><input type="text" class="txtCssInput" name="emailName" id="emailName"  alt=""/>
							<input type="button" id="emailButton" value="发送" class="resetBtnCss" onclick="getCodes(this)"/>
						</div>
						<div class="textItem">
							<font class='textTitleCss' style="padding-left: 14px;">验证码：</font><input type="text" style="width: 100px;" class="txtCssInput" name="codes" id="codes"  alt=""/>
						</div>
						<div class="textItem" id="sendCoderesut" style="padding-left: 60px; padding-bottom: 7px;">
							
						</div>
					</div>
					<div class="divItemsCss" id="nextStep" style="padding-left: 60px;display: none;">
						<input type="button" value="下一步" class="saveBtnCss" onclick="checkCode()"/>
					</div>
				</div>
				<div id="findPasswordTwo" style="display: none;">
					<div style="clear: both;">
						<div class="textItem" id="telDiv">
							<font class='textTitleCss'>新的密码：</font><input type="password" class="txtCssInput" name="newPassweord" id="newPassweord" alt=""/>
						</div>
						<div class="textItem" id="emailDiv">
							<font class='textTitleCss'>密码确认：</font><input type="password" class="txtCssInput" name="newPassweord1" id="newPassweord1" alt=""/>
						</div>
					</div>
					<div class="divItemsCss" id="nextStep" style="padding-left: 60px;margin-top: 15px;">
						<input type="button" value="修改" class="saveBtnCss" onclick="updatePassFind(this)"/>
					</div>
				</div>
			</div>
		</form>
	</div>
<jsp:include page="foot.jsp"></jsp:include>