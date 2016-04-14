<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="m_head.jsp"></jsp:include>
<script language="javascript">var loginMemberId='${loginUsers.id}';</script>
<style type="text/css">
	#menu_div_head{display:none;}
	.paytype_type{ border:#FFFFFF 4px solid;}
</style>
<script language="javascript">
	$(function(){
		$(".paytype_type").click(function(){
			$(".paytype_type").css("border","#FFFFFF 4px solid");
			$(this).css("border","#1a9bdc 2px solid");
		});
	});
	
	function chongzhi(){
		var reg=/^\d{1,8}(\.\d{1,2})?$/;
		if(!reg.test($("#chognzhi_money").val())){
			alert("充值金额输入错误！");
			$("#chognzhi_money").val("1");
			return;
		}
		/* if(parseInt($("#chognzhi_money").val())<1){
			alert("充值金额最低充值1元！");
			$("#chognzhi_money").val("1");
			return;
		}  */
		
		if(loginMemberId==''){
			window.location.href=path+"/mobile/m_login.jsp";
			return;
		}
		var frm=$("#chongzhiform")[0];
		frm.action=path+"/mobile/alipay/alipayapi.jsp";
		$.post(path+"/anzhimoneyapplyrecord/addAnzhiMoneyApplyRecord.do",{chognzhi_money:$("#chognzhi_money").val()},function(res){
			if(res.indexOf("操作异常")!=-1||res.indexOf("您还没有登录呢")!=-1){
				alert(res);
			}else{
				$("#out_trade_no").val(res);
				frm.submit();
			}
		});
	}
</script>
<div>
	<form action="" id="chongzhiform" method="post">
		<input type="hidden" id="out_trade_no" name="out_trade_no" value=""/>
		<input type="hidden" id="chognzhi_money" name="chognzhi_money" value="${param.chongzhijine }"/>
		<div class="paytype_two">
			付款方式选择
		</div>
		<div class="paytype_three">
			付款金额：<span style="font-size: 24px !important; font-weight:bold; color: #e1250c; padding-left: 5px; padding-right: 5px;">${param.chongzhijine }</span>元
		</div>
		<div class="paytype_type" style="border: #1a9bdc 2px solid;">
			<img src="<%=request.getContextPath() %>/mobile/images/payzhifubao.png" width="120" height="40"></img>
		</div>
		<div class="paytype_type">
			<img src="<%=request.getContextPath() %>/mobile/images/payweixin.png" width="130" height="40"></img>
		</div>
		<div class="paytype_type">
			<img src="<%=request.getContextPath() %>/mobile/images/payyinlian.png" width="140" height="40"></img>
		</div>
		<div class="btn_m_css" style="margin-top: 35px;" onclick="chongzhi()">
			去付款
		</div>
		<div style="margin-top: 35px; text-align:20px; color:#666666;margin-bottom:40px; line-height:24px; font-size:14px; padding:8px;">
			网站目前支持支付宝支付。
		</div>
	</form>
	
</div>
<jsp:include page="m_foot.jsp"></jsp:include>
