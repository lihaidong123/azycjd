<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<style type="text/css">
		.choose_item{ width:200px; cursor:pointer; border-radius:5px; background-color:#f7fafc; border:#d8e0e3 1px solid; height:100px; float:left; margin-left:35px; margin-top:20px;}
		.choose_item:hover{ background-color:#dff1fd;}
		.choose_item div{ text-align:center; line-height:40px;}
		.choose_money{ color:#CC0000; font-size:16px;font-weight:bold;}
		.choose_info{ color:#323334; font-size:14px;}
		
		.choose_item_click{width:200px; cursor:pointer; border-radius:5px; background-color:#05a5f0; border:#d8e0e3 1px solid; height:100px; float:left; margin-left:35px; margin-top:20px;}
		.choose_item_click div{ text-align:center; line-height:40px;}
	</style>
	<script language="javascript">
		$(function(){
			$(".choose_item").click(function(){
				$(".chongzhiChoose").children("div").each(function(){
					$(this)[0].className="choose_item";
				});
				
				if($(this)[0].className=="choose_item"){
					$(this)[0].className="choose_item_click";
				}else{
					$(this)[0].className="choose_item"
				}
			});
			$("#bar_div").css("padding-bottom","10px");
		});
	</script>
	<form class="formCss" id="update_pass_form">
		<div class="htmlTitleCss">
			<div class="htmlTitleCsss_one">在线充值</div>
		</div>
		<div>
			<div class="divItemsCss">充值账号：<input type="text" readonly="readonly" class="txtCss" id="nowUserName" name="nowUserName" value="安之米珺"></div>
			<!-- <div class="divItemsCss">当前金额：<input type="text" class="txtCss" id="nowMoney" readonly="readonly" name="nowMoney" value="500"></div> -->
			<div style="clear: both; padding-top: 5px;" class="divItemsCss">
				其他金额：<input type="text" class="txtCss" />
			</div>
			<div class="divItemsCss">充值金额</div>
			<div class="chongzhiChoose">
				<div class="choose_item">
					<div class="choose_money">5元</div>
					<div class="choose_info">获得50赠送5安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">10元</div>
					<div class="choose_info">获得100赠送10安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">50元</div>
					<div class="choose_info">获得500赠送50安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">100元</div>
					<div class="choose_info">获得1000赠送100安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">500元</div>
					<div class="choose_info">获得5000赠送500安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">1000元</div>
					<div class="choose_info">获得10000赠送1000安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">5000元</div>
					<div class="choose_info">获得50000赠送5000安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">10000元</div>
					<div class="choose_info">获得100000赠送10000安之币</div>
				</div>
				<div class="choose_item">
					<div class="choose_money">50000元</div>
					<div class="choose_info">获得500000赠送5000安之币</div>
				</div>
			</div>
			
			<div class="divItemsCss" style="clear: both; padding-top: 40px;">
				<input type="button" value="下一步" class="saveBtnCss" onclick="window.location.href='<%=request.getContextPath()%>/index/add_day_recharge_confirm.jsp'" />
			</div> 
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>