<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>章节订阅</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="javascript" src="<%=path %>/js/jquery.js"></script>
	<script language="javascript">var barIndex='${param.divIndex}';</script>
	<script language="javascript">var path='<%=path %>';</script>
	<script language="javascript">
		$(function(){
			
		});
		 
		 
		 function closeDaShang(){
		 	window.parent.window.jBox.close();
		 }
		 
		 function buyChapterAction(types,tableId,memberId,memberMoney){
		 	if(tableId==undefined||memberId==undefined||types==undefined){
		 		alert("当前页面加载异常！");
		 		return;
		 	}
		 	if(memberId==""){
		 		alert("您还没有登录呢！");
		 		return;
		 	}
		 	if(confirm("您确定操作吗?")){
		 		$(".add_da_shang").each(function(){
		 			$(this)[0].style.display="none";
		 		});
		 		$.post(path+"/anzhichaptersubscribe/buySignChapter.do",{
		 			types:types,
		 			tableId:tableId
		 		},function(res){
	 				if(res=="yes"){
	 					alert("操作成功！");
	 					window.parent.window.location.reload();
	 				}else{
	 					alert(res);
	 					$(".add_da_shang").each(function(){
				 			$(this)[0].style.display="block";
				 		});
	 				}
	 			});
		 	}
		 }

	</script>
	<style type="text/css">
		a{ color:#666666; text-decoration:none;}
		a:hover{ text-decoration:underline;}
		.da_shang_main { padding:18px; font-famil:font: 12px/160% Tahoma, Verdana,snas-serif !important; font-size:12px; color:#666666;}
		.da_shang_main strong{margin-left: 5px; margin-right: 5px;}
		.da_shang_main ul{ list-style:none; margin:0px; padding:0px;}
		.da_shang_main li{ float:left; margin-left:10px;}
		.dashangitem{ clear:both;  margin-top:3px; padding:12px;border-radius:0px 0px 6px 6px; min-width:700px; border:#cfe0e2 1px solid; min-height:80px;}
		.dashangitem div{ clear:both; margin-top:8px; line-height:25px;}
		.add_da_shang{cursor:pointer; width:85px; letter-spacing:3px; font-family:"黑体"; font-size:14px; border-radius:4px; border:#f97e34 1px solid; height:35px; line-height:35px; text-align:center; background-color:#eb6b1d;color:#FFFFFF; }
		.add_da_shang:hover{ background-color:#f37d35;}
		.close_da_shang{cursor:pointer; width:85px;letter-spacing:3px;font-family:"黑体";font-size:14px; border-radius:4px; height:35px; line-height:35px; text-align:center;border:#999999 1px solid; background-color:#FFFFFF;}
	
		.da_shang_bar_li{ border-radius:6px 6px 0px 0px; background-color:#eb6b1d; cursor:pointer; height:45px; line-height:45px; text-align:center; color:#FFFFFF; font-family:"黑体"; font-size:14px; width:90px; margin-left:5px;}
		.da_shang_bar_li:hover{ background-color:#eb6b1d;}
		
		.da_shang_tips{ padding:7px; background-color:#f0f0f0;border-radius:3px; border:#CCCCCC 1px dashed;}
		.buy_tips div{ line-height: 22px; height: 22px;font-famil:font: 12px/160% Tahoma, Verdana,snas-serif !important; font-size:12px; color:#666666;}
		.buy_tips td{border:#d7e9f3 1px solid; border-radius:5px; padding: 15px; padding-bottom: 30px; background-color: #f8fbfc; }
		.specil{ margin-left: 5px; margin-right: 5px; font-weight: bold; color:#e51909; font-size: 14px; font-family: '黑体';}
	</style>
  </head>
  
  <body>
    	<form method="post" id="daShangForm">
    		<div class="da_shang_main">
	    		<div class="da_shang_bar" style="margin-top:2px;">
					<ul>
						<li class="da_shang_bar_li" style="margin-left:0px; width:350px;">${novelName }</li>
					</ul>
				</div>
				<!--购买-->
				<div class="dashangitem">
					<div class="buy_tips">
						<table width="100%" cellspacing="10" style="min-width: 600px;">
							<tr>
								<td valign="top" width="33%">
									<div>第<span class="specil">${param.chapterIndex}</span>章&nbsp;${chapterPojo.chapterTitle }</div>
									<div>总字数:<span class="specil">${chapterPojo.chapterCharNum }</span></div>
									<div>需要<span class="specil">${chapterPojo.anzhibi }</span>安之币</div>
									<div></div>
									<div>
										<c:if test="${loginUsers.memberMoney < chapterPojo.anzhibi}">
											<input type="button" class="add_da_shang" value="余额不足"/>
											<a style="font-weight: bold;" href="javascript:top.window.open('chongzhi.jsp')">充值</a>
										</c:if>
										<c:if test="${loginUsers.memberMoney > chapterPojo.anzhibi}">
											<input type="button" class="add_da_shang" value="购买" onClick="buyChapterAction(0,'${chapterPojo.id }','${loginUsers.id}','${loginUsers.memberMoney}')"/>
										</c:if>
										
									</div>
								</td>
								<td valign="top" width="33%">
									<div>该书还有<span class="specil">${noBuyVip }</span>章可购买</div>
									<div>总字数:<span class="specil">${noBuyCharNum }</span></div>
									<div>需要<span class="specil">${needAnzhiBi }</span>安之币</div>
									<div>请注意：不包含未发布章节</div>
									<div>
										
										<c:if test="${loginUsers.memberMoney < needAnzhiBi}">
											<input type="button" class="add_da_shang" value="余额不足"/>
											<a style="font-weight: bold;" href="javascript:top.window.open('chongzhi.jsp')">充值</a>
										</c:if>
										<c:if test="${loginUsers.memberMoney > needAnzhiBi}">
											<input type="button" class="add_da_shang" value="购买" onClick="buyChapterAction(1,'${novelId}','${loginUsers.id}','${loginUsers.memberMoney}')"/>
										</c:if>
									</div>
								</td>
								<td valign="top" width="33%">
									<div>当阅读本书未购买的VIP章节</div>
									<div>将直接购买不再提示</div>
									<div></div>
									<div></div>
									<div>
										<input type="button" class="add_da_shang" value="订阅" onClick="buyChapterAction(2,'${novelId}','${loginUsers.id}','${loginUsers.memberMoney}')"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<input type="button" class="close_da_shang" value="取消" onClick="closeDaShang()"/>
					</div>
					<div class="da_shang_tips">
						您当前还有<strong>${loginUsers.memberMoney}</strong>安之币！<a href="javascript:top.window.open('chongzhi.jsp')">充值</a><br>
						<c:if test="${youhuiJoin eq 'yes' }">
							本书有[${discountedTypeName }]优惠，截止:${discountedEndDate }  购买折扣:<span class='discountedRebate_class'>${discountedRebate }</span>
						</c:if>
					</div>
				</div>				
	    	</div>
    	</form>
  </body>
</html>
