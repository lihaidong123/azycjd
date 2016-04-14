<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	#menu_div_head{display:none;}
	.pay_tips{ color:#999999; font-size:12px;}
	.pay_monet_css_c{ width:90px; padding-left:30px; font-family:"微软雅黑";}
</style>
<script language="javascript">
	$(function(){
		$(".paycharge_one").click(function(){
			$(".paycharge_one").css("background-color","#FFFFFF");
			$(".pay_tips").css("color","#999999");
			var index=$(".paycharge_one").index($(this));
			$(this).css("background-color","#1a9bdc");
			$($(".pay_tips")[index]).css("color","#ffffff");
			var t=$(this)[0].id;
			t=t.substring(0,t.indexOf("yuan"));
			$("#chongzhijine").val(t);
		});
	});
</script>
<div>
	<form id="chongzhijinexaunzhe" action="<%=request.getContextPath() %>/mobile/m_paytype.jsp" method="post">
		<div class="paytype_two">
			充值金额选择
		</div>
		<div class="paycharge_one" id="5yuan">
			<div class="pay_monet_css_c">5元</div>
			<div class="pay_tips">获得500安之币</div>
		</div>
		<div class="paycharge_one" id="10yuan">
			<div class="pay_monet_css_c">10元</div>
			<div class="pay_tips">获得1000安之币</div>
		</div>
		<div class="paycharge_one" id="50yuan">
			<div class="pay_monet_css_c">50元</div>
			<div class="pay_tips">获得5000安之币</div>
		</div>
		<div class="paycharge_one" id="100yuan">
			<div class="pay_monet_css_c">100元</div>
			<div class="pay_tips">获得10000安之币</div>
		</div>
		<div class="paycharge_one" id="500yuan">
			<div class="pay_monet_css_c">500元</div>
			<div class="pay_tips">获得50000安之币</div>
		</div>
		<div class="paycharge_one" id="5000yuan">
			<div class="pay_monet_css_c">5000元</div>
			<div class="pay_tips">获得500000安之币</div>
		</div>
		<div class="paycharge_one" id="10000yuan">
			<div class="pay_monet_css_c">10000元</div>
			<div class="pay_tips">获得1000000安之币</div>
		</div>
		<div class="paycharge_one" id="50000yuan">
			<div class="pay_monet_css_c">50000元</div>
			<div class="pay_tips">获得5000000安之币</div>
		</div>
		<div class="paycharge_shuru" style="font-family:'微软雅黑';">
			<div>付款金额：</div>
			<div><input id="chongzhijine" name="chongzhijine" type="text" style=" border:none; width:150px; background-color:#e8e8e8; line-height:35px; height:35px; border-bottom:#333333 1px solid; text-align:center; font-size:18px; color:#CC3300;">&nbsp;元</div><a>可手动输入</a>
		</div>
		<div class="btn_m_css" style="margin-top: 35px;" onclick="$('#chongzhijinexaunzhe')[0].submit();">
			下一步
		</div>
	</form>
</div>
<jsp:include page="m_foot.jsp"></jsp:include>
