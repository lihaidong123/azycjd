<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>打赏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="<%=path %>/js/jquery.js"></script>
	<script language="javascript">var barIndex='${param.divIndex}';</script>
	<script language="javascript">var con='${param.con}';</script>
	<script language="javascript">var path='<%=path %>';</script>
	<script language="javascript">
		var dashangArr=new Array("鲜花,200,1.png","仕女扇,588,2.png","手镯,1888,3.png","玉佩,5000,4.png","凤冠,10000,5.png","M9军刺,200,6.png","葵花宝典,588,7.png","星际母舰,1888,8.png","鲲鹏,5000,9.png","麒麟,10000,10.png","直接打赏,0");
		$(function(){
			$(".da_shang_bar_li").click(function(){
				$(".da_shang_bar_click").each(function(){
					$(this)[0].className="da_shang_bar_li";
				});
				$(this)[0].className="da_shang_bar_click";
				
				var index=$(".da_shang_bar li").index($(this));
				$(".dashangitem").each(function(){
					$(this)[0].style.display="none";
				});
				$(".dashangitem")[index].style.display="block";
			});
			
			$(".da_shang_icon").each(function(){
				var index=$(".da_shang_icon").index($(this));
				var tmp=dashangArr[index].split(",");
				var t="<div class='img_div_css'><img src='"+path+"/images/dashang/"+tmp[2]+"' width='60' height='60' /></div>";
				t+="<div class='char_div_css' style='display:none;'>"+tmp[0]+"<br><span style='color:red;'>"+tmp[1]+"</span><br>安之币"+"</div>";
				$(this).html(t);
			});
			//移动
			$(".da_shang_icon").hover(function(){
				($(this).children(".char_div_css"))[0].style.display="block";
				($(this).children(".img_div_css"))[0].style.display="none";
			},function(){
				$(this).children(".char_div_css")[0].style.display="none";
				$(this).children(".img_div_css")[0].style.display="block";
			});
			
			$(".da_shang_icon").click(function(){
				try{
					$("#ok_div").remove();
				}catch(e){}
				$("<div id='ok_div' class='ok_div'></div>").insertBefore(($(this).children("div"))[0]);
				var index=$(".da_shang_icon").index($(this));
				$("#ok_div").data("daojuIndex",index);//设置点击的道具索引
				var tmp=dashangArr[index].split(",");
				$("#daShangMoney").val(tmp[1]);
			});
			
			if(barIndex!=''){
				setChooseBar();
			}
			$("#cuiGengNum").bind('propertychange input', function () {  
		        $("#cuiGengAnzhiMoney").val(parseInt($(this).val())*200);
			});
			
			//如果是从章节阅读界面打开的
			if(con=='yes'){
				$(".da_shang_bar li").each(function(){
					$(this)[0].style.display='none';
				});
				$(".dashangitem").each(function(){
					$(this)[0].style.display='none';
				});
				$(".da_shang_bar li")[3].style.display='block';
				$(".da_shang_bar li")[3].style.marginLeft='0px';
				$(".dashangitem")[3].style.display='block';
			}
		});
		 function setChooseBar(){
		 	$(".da_shang_bar_li")[barIndex].className="da_shang_bar_click";
		 	$(".dashangitem")[barIndex].style.display="block";
		 }
		 
		 function closeDaShang(){
		 	window.parent.window.jBox.close();
		 }
		 
		 function daShang(types,novelId,memberId,moneyRemain,chapterId,yetTuiJianPiao){
		 	if(novelId==undefined||novelId==0||novelId==""){
		 		alert("当前页面加载异常！");
		 		return;
		 	}
		 	if(memberId==""){
		 		alert("您还没有登录呢！");
		 		return;
		 	}
		 	var params={};
		 	params.types=types;
		 	params.novelId=novelId;
		 	params.chapterId=chapterId;
		 	if(types=="tuijian"){
		 		params.rewardAnzhiMoney=0;
		 		params.rewardNum=parseInt($(".tuijian_div input:checked")[0].value);
		 		if(parseInt($(".tuijian_div input:checked")[0].value)>yetTuiJianPiao){
		 			alert("您剩余的推荐票不足！");
		 			return;
		 		}
		 		params.rewardType=0;
		 		params.vote=$("#tuijianContent").val();
		 	}else if(types=="yuepiao"){
		 		if(parseInt($("#yuePiaoNum").val())>yetTuiJianPiao){
		 			alert("您的月票不足！");
		 			return;
		 		}
		 		params.rewardAnzhiMoney=0;	
		 		params.rewardNum=$("#yuePiaoNum").val();
		 		params.rewardType=2;
		 		params.vote=$("#yuepiaoContent").val();
		 	}else if(types=="cuiGeng"){
		 		var c=(parseInt($(".cui_geng_div input:checked")[0].value)/3000);
		 		var d=parseInt($("#cuiGengNum").val());
		 		if(c>d){
		 			if(confirm("您催更的字数和投的催更票与系统设定的最低要求不一致。是否更改催更票数继续催更？")){
		 				$("#cuiGengNum").val(c);
		 			}else{
		 				return;
		 			}
		 		}
		 		if(d*200>parseInt(moneyRemain)){
		 			alert("对不起，您账户剩余安之币不足！请先充值。");
		 			return;
		 		}
		 		params.vote=$("#cuiGengContent").val();
		 		params.rewardNum=d;
		 		params.rewardType=1;
		 		params.rewardAnzhiMoney=d*200;
		 	}else if(types=="daShang"){
		 		var daojuIIndex=$("#ok_div").data("daojuIndex");
		 		if(daojuIIndex==undefined){
		 			params.rewardType=13;
		 			daojuIIndex=10;
		 		}else{
		 			params.rewardType=(daojuIIndex+3);
		 		}	
		 		var tmp=dashangArr[daojuIIndex].split(",");
		 		if(parseInt($("#daShangMoney").val())<parseInt(tmp[1])){
		 			alert("您打赏的安之币不足以购买该道具!");
		 			return;
		 		}
		 		if(parseInt($("#daShangMoney").val())>parseInt(moneyRemain)){
		 			alert("对不起，您账户剩余安之币不足！请先充值。");
		 			return;
		 		}
		 		if(parseInt($("#daShangMoney").val())<=0){
		 			alert("请输入正确的打赏金额");
		 			return;
		 		}
		 		params.vote=$("#daShangContent").val();
		 		params.rewardNum=1;
		 		
		 		params.rewardAnzhiMoney=parseInt($("#daShangMoney").val());
		 	}
		 	//if(confirm("您确定操作吗?")){
		 		$(".da_shang_main input[type='button']").each(function(){
		 			$(this)[0].style.display="none";
		 		});
		 		$.post(path+"/anzhinovelreward/daShangRecord.do",params,function(res){
	 				if(res=="yes"){
		 				if(params.rewardType>2){
		 					alert("打赏成功!");
		 				}else{
		 					alert("投票成功！");
		 				}
	 					//window.parent.window.jBox.close();
	 					window.parent.window.location.reload();
	 				}else{
	 					alert(res);
	 					$(".da_shang_main input[type='button']").each(function(){
				 			$(this)[0].style.display="block";
				 		});
	 				}
	 			});
		 	//}
		 }
		 
		 function setCuiGengPiao(obj){
		 	$("#cuiGengNum").val(parseInt(obj.value)/3000);
		 	$("#cuiGengAnzhiMoney").val(parseInt(obj.value)/3000*200);
		 }
		 
	</script>
	<style type="text/css">
		a{ color:#666666; text-decoration:none;}
		a:hover{ text-decoration:underline;}
		.da_shang_main { padding:18px; font-famil:font: 12px/160% Tahoma, Verdana,snas-serif !important; font-size:12px; color:#666666;}
		.da_shang_main strong{margin-left: 5px; margin-right: 5px;}
		.da_shang_main ul{ list-style:none; margin:0px; padding:0px;}
		.da_shang_main li{ float:left; margin-left:10px;}
		.dashangitem{ clear:both; display:none; margin-top:3px; padding:12px;border-radius:0px 0px 6px 6px; border:#cfe0e2 1px solid; min-height:80px;}
		.dashangitem div{ clear:both; margin-top:8px; line-height:25px;}
		.add_da_shang{cursor:pointer; width:85px; letter-spacing:3px; font-family:"黑体"; font-size:14px; border-radius:4px; border:#f97e34 1px solid; height:35px; line-height:35px; text-align:center; background-color:#eb6b1d;color:#FFFFFF; }
		.add_da_shang:hover{ background-color:#f37d35;}
		.close_da_shang{cursor:pointer; width:85px;letter-spacing:3px;font-family:"黑体";font-size:14px; border-radius:4px; height:35px; line-height:35px; text-align:center;border:#999999 1px solid; background-color:#FFFFFF;}
	
		.da_shang_bar_li{ border-radius:6px 6px 0px 0px; background-color:#09a7f3; cursor:pointer; height:35px; line-height:35px; text-align:center; color:#FFFFFF; font-family:"黑体"; font-size:14px; width:90px; margin-left:5px;}
		.da_shang_bar_li:hover{ background-color:#2fb9fb;}
		
		.da_shang_bar_click{ border-radius:6px 6px 0px 0px; background-color:#eb6b1d; cursor:pointer; height:35px; line-height:35px; text-align:center; color:#FFFFFF; font-family:"黑体"; font-size:14px; width:90px; margin-left:5px;}
		
		.da_shang_tips{ padding:7px; background-color:#f0f0f0;border-radius:3px; border:#CCCCCC 1px dashed;}
		.da_shang_icon{ height:68px;border:#bed2d8 1px solid;cursor:pointer; border-radius:4px; padding-top:0px !important; }
		.da_shang_icon div{ margin-top:0px;}
		.da_shang_daoju{padding-left: 70px;}
		.da_shang_daoju li{ width:68px; margin-left:35px; margin-top:10px; text-align:center; }
		.char_div_css{ line-height:20px !important; margin-top:4px !important;}
		.img_div_css{ margin-top:4px !important;}
		.ok_div{ position:absolute; margin-left:36px; z-index:1px; background:url(images/ok.png) no-repeat; width:30px; height:30px; }
		.da_shang_anzhi{margin-top:0px !important; font-size:14px;}
	</style>
  </head>
  
  <body>
    	<form method="post" id="daShangForm">
    		<div class="da_shang_main">
	    		<div class="da_shang_bar" style="margin-top:2px;">
					<ul>
						<li class="da_shang_bar_li" style="margin-left:0px;">投推荐票</li>
						<li class="da_shang_bar_li">我投月票</li>
						<li class="da_shang_bar_li">我要催更</li>
						<li class="da_shang_bar_li">打赏作品</li>
					</ul>
				</div>
				<!--推荐票-->
				<div class="dashangitem">
					<div>这本书写的很好，我要投推荐票：</div>
					<div class="tuijian_div">
						<ul>
							<li><input type="radio" name="tuijianpiao" value="1" checked="checked"/>1张推荐票</li>
							<li><input type="radio" name="tuijianpiao" value="2"/>2张推荐票</li>
							<li><input type="radio" name="tuijianpiao" value="3"/>3张推荐票</li>
							<li><input type="radio" name="tuijianpiao" value="4"/>4张推荐票</li>
							<li><input type="radio" name="tuijianpiao" value="${remainTuiJianPiao}"/>所有${remainTuiJianPiao}张推荐票</li>
						</ul>
					</div>
					<div>
						<textarea class="da_shang_textarea" id="tuijianContent" name="tuijianContent" style=" height:70px; width:100%;resize: none;" placeholder="说点推荐话吧..."></textarea>
					</div>
					<div>
						<input type="button" class="add_da_shang" value="投票" onClick="daShang('tuijian','${param.novelId}','${loginUsers.id}','${loginUsers.memberMoney}',0,'${remainTuiJianPiao }')"/>
						<input type="button" class="close_da_shang" value="关闭" onClick="closeDaShang()"/>
					</div>
					<div class="da_shang_tips">
						您今天总共有<strong>${totalTuijianpiao}</strong>张推荐票，今天已用<strong>${yetTuiJianPiao}</strong>张推荐票。
					</div>
				</div>
				
				<!--月票-->
				<div class="dashangitem">
					<c:if test="${yuepiao eq 'yes' }">
						<div>这本书写的很好，是我喜欢的书，我要投月票：</div>
						<div>
							<textarea class="da_shang_textarea" id="yuepiaoContent" name="yuepiaoContent" style=" height:70px; width:100%;resize: none;" placeholder="给作者打点打气吧..."></textarea>
						</div>
						<div>
							我要投月票:<input type="text" id="yuePiaoNum" name="yuePiaoNum" value="1" onKeyUp="value=value.replace(/\D/g,'')" style="width:50px; height:30px; line-height:30px; padding-left:7px;"/>&nbsp;张
						</div>
						<div>
							<input type="button" class="add_da_shang" value="投票" onClick="daShang('yuepiao','${param.novelId}','${loginUsers.id}','${loginUsers.memberMoney}',0,${yuepiaoNum-yuepiaoYiTou })"/>
							<input type="button" class="close_da_shang" value="关闭" onClick="closeDaShang()"/>
						</div>
						<div class="da_shang_tips">
							剩余<span style="padding-left: 3px;padding-right: 3px;font-weight: bold;">${yuepiaoNum-yuepiaoYiTou }</span>张月票。您本月有且仅有<strong>${yuepiaoNum }</strong>张月票，已经投了<strong>${yuepiaoYiTou }</strong>张月票。请投给您最喜欢的书吧！
						</div>
					</c:if>
					<c:if test="${yuepiao eq 'no' }">
						您本月有且仅有<strong>${yuepiaoNum }</strong>张月票，已经投了${yuepiaoYiTou }张月票。
						<div>
							<input type="button" class="close_da_shang" value="关闭" onClick="closeDaShang()"/>
						</div>
					</c:if>
				</div>
				
				<!--催更票-->
				<div class="dashangitem">
					<div>这本书写的很好，我实在等不及了，我要催更：</div>
					<div class="cui_geng_div">
						<ul>
							<li><input type="radio" name="cuiGeng" value="3000" checked="checked" onClick="setCuiGengPiao(this)"/>3000字</li>
							<li><input type="radio" name="cuiGeng" value="6000" onClick="setCuiGengPiao(this)"/>6000字</li>
							<li><input type="radio" name="cuiGeng" value="9000" onClick="setCuiGengPiao(this)"/>9000字</li>
							<li><input type="radio" name="cuiGeng" value="12000" onClick="setCuiGengPiao(this)"/>12000字</li>
						</ul>
					</div>
					<div style="padding-top: 5px;">
						催更票:<input type="text" id="cuiGengNum" name="cuiGengNum" value="1" onKeyUp="value=value.replace(/\D/g,'')" style="width:50px; height:30px; line-height:30px; padding-left:7px;"/>&nbsp;张
						&nbsp;&nbsp;&nbsp;将消耗&nbsp;<input type="text" id="cuiGengAnzhiMoney" name="cuiGengAnzhiMoney" disabled="disabled" value="200" readonly="readonly" style="width:50px; height:30px; line-height:30px; padding-left:7px;"/>&nbsp;安之币
					</div>
					<div>
						<textarea class="da_shang_textarea" id="cuiGengContent" name="cuiGengContent" style=" height:70px; width:100%;resize: none;" placeholder="给作者说点什么吧..."></textarea>
					</div>
					<div>
						<input type="button" class="add_da_shang" value="催更" onClick="daShang('cuiGeng','${param.novelId}','${loginUsers.id}','${loginUsers.memberMoney}',0)"/>
						<input type="button" class="close_da_shang" value="关闭" onClick="closeDaShang()"/>
					</div>
					<div class="da_shang_tips">
						您当前还有<strong>${loginUsers.memberMoney}</strong>安之币！<a href="javascript:top.window.open('chongzhi.jsp')">充值</a><br>
						催更3000字可以只投一票，催更6千字必须最少投2票；催更9000字最少投3票；催更12000最少投4票。(一次性)<br>
						您可以使用200安之币购买一张催更票！
					</div>
				</div>
				
				<!--打赏-->
				<div class="dashangitem">
					<div>这本书写的很好，我要打赏：</div>
					<div class="da_shang_daoju" style="margin-top: 0px;">
						<ul>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">200</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">588</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">1888</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">5000</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">10000</div>
							</li>
							<li style="clear: both;">
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">200</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">588</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">1888</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">5000</div>
							</li>
							<li>
								<div class="da_shang_icon"></div>
								<div class="da_shang_anzhi">10000</div>
							</li>
						</ul>
					</div>
					<div>
						打赏:<input type="text" id="daShangMoney" name="daShangMoney" value="10" onKeyUp="value=value.replace(/\D/g,'')" style="width:70px; height:30px; line-height:30px; padding-left:7px;"/>&nbsp;安之币&nbsp;&nbsp;&nbsp;[亲，可以打赏比道具多的安之币打赏哦！]
					</div>
					<div>
						<textarea class="da_shang_textarea" id="daShangContent" name="daShangContent" style=" height:70px; width:100%;resize: none;" placeholder="说点打赏话吧..."></textarea>
					</div>
					<div>
						<input type="button" class="add_da_shang" value="立即打赏" onClick="daShang('daShang','${param.novelId}','${loginUsers.id}','${loginUsers.memberMoney}',0)"/>
						<input type="button" class="close_da_shang" value="关闭" onClick="closeDaShang()"/>
					</div>
					<div class="da_shang_tips">
						您当前还有<strong>${loginUsers.memberMoney}</strong>安之币！<a href="javascript:top.window.open('chongzhi.jsp')">充值</a>
					</div>
				</div>
	    	</div>
    	</form>
  </body>
</html>
