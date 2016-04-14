<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml,http://open.weibo.com/wb">
  <head>
    <base href="<%=basePath%>">
    
    <title>安之原创|安之原创基地</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="安之原创基地、安之原创、小说、小说排行榜、言情小说、玄幻都市、免费小说" />
	<meta name="description" content="安之原创|安之原创基地|小说|小说排行榜|言情小说|玄幻都市|免费小说" />
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css">
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/index.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
	<script language="javascript" src="<%=path %>/index/js/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript">var loginMemberId='${loginUsers.id}';</script>
	
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$(".zhong_zhi_money_choose table").attr("cellpadding","0").attr("cellspacing","0");
			$(".one_money_css,.two_money_css,.three_money_css,.four_money_css").click(function(){
				initndhchongzhi();
				$(this).css("background-color","#CC0000");
				$(this).next("td").css("border","#CC0000 1px solid");
				var ts=$(this)[0].id;
				ts=ts.substring(0,ts.indexOf("money"));
				$("#chognzhi_money").val(ts);
			});
		});
		
		function initndhchongzhi(){
			$(".one_money_css").css("background-color","#79caf0");
			$(".two_money_css").css("background-color","#49baf4");
			$(".three_money_css").css("background-color","#23adee");
			$(".four_money_css").css("background-color","#1b97d7");
			$(".td_right_css").css("border","#acacac 1px solid");
		}
		
		function chongzhi(){
			var reg=/^\d{1,8}(\.\d{1,2})?$/;
			if(!reg.test($("#chognzhi_money").val())){
				alert("充值金额输入错误！");
				$("#chognzhi_money").val("1");
				return;
			}
			if(parseInt($("#chognzhi_money").val())<1){
				alert("充值金额最低充值1元！");
				$("#chognzhi_money").val("1");
				return;
			} 
			
			if(loginMemberId==''){
				showLoginNew();
				return;
			}
			var frm=$("#chongzhiform")[0];
			if($("#zhifubao")[0].checked==true){
				frm.action=path+"/index/alipayapi.jsp";
			}
			if($("#yinlian")[0].checked==true){
				frm.action=path+"/index/alipayapi.jsp";
			}
			if($("#weixin")[0].checked==true){
				frm.action=path+"/index/alipayapi.jsp";
			}
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
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
	<style type="text/css">
		.chong_zhi_t_css{ font-family:"微软雅黑"; letter-spacing:2px; clear:both; font-size:16px; color:#666666;}
		.zhong_zhi_money_choose{
			-webkit-user-select:none;
			-moz-user-select:none;
			-ms-user-select:none;
			user-select:none;
		}
		.zhong_zhi_money_choose div{ float:left; margin-top:25px; margin-left:25px;}
		.one_money_css{ background-color:#79caf0;padding:4px;width:65px;cursor:pointer; color:#FFFFFF; text-align:center; font-size:21px;}
		.two_money_css{ background-color:#49baf4;padding:4px;width:78px;cursor:pointer; color:#FFFFFF; text-align:center; font-size:21px;}
		.three_money_css{background-color:#23adee;padding:4px;width:90px;cursor:pointer; color:#FFFFFF; text-align:center; font-size:21px;}
		.four_money_css{background-color:#1b97d7; padding:4px;width:105px;cursor:pointer; color:#FFFFFF; text-align:center; font-size:21px;}
		.td_right_css{ border:#acacac 1px solid; border-left:none; padding-left:15px; color:#999999; letter-spacing:2px;}
		.yuanc_css{ margin-left:5px; font-size:18px;}
		.click_jine_css{ background-color:#CC0000 !important; color:#FFFFFF !important;}
		.chognzhi_type{ text-align:center; padding-top:20px;}
	</style>
	
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionZaixianchongzhi})  center 0px no-repeat #f0f0f0 !important;">
  	<jsp:include page="other_head.jsp" flush="false" />
  	<div style="width:1000px; margin:0 auto;">
  		<form action="" id="chongzhiform" method="post">
			<div style="overflow:auto; padding-left:265px; background:url(images/chognzhibg.png) no-repeat 200px 50px; padding-bottom:80px;">
				<div style="float:left;margin-top:130px;">
					<div>
						<img src="${loginUsers.memberHeadImg }" width="104" height="104" style=" border-radius:104px;" />
					</div>
					<div style="text-align:center; font-family:'微软雅黑'; font-size:14px; margin-top:10px;">
						${loginUsers.memberNick }
					</div>
				</div>
				<div style="float:left;margin-top:100px; text-align:center; margin-left:180px;background:url(images/bigcircle.png) no-repeat; width:172px; height:220px;">
					<div style="color:#23aced; font-size:33px; padding-top:57px;">
						${loginUsers.memberMoney }
					</div>
					<div style="font-family:'微软雅黑'; font-size:16px; margin-top:15px;">
						安之币
					</div>
					<div style=" margin-top:45px; color:#999999; font-family:'微软雅黑'; font-size:14px;">
						账户当前余额
					</div>
				</div>
			</div>
			
			<div class="chong_zhi_t_css" style="padding-bottom:15px; border-bottom:#d1d1d1 1px solid;">
				充值金额选择：
			</div>
			<div class="zhong_zhi_money_choose" style="overflow:auto;">
				
				<div style="width:260px;">
					<table width="100%" border="0">
					  <tr>
						<td class="one_money_css" id="5money">
							5<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得500安之币
						</td>
					  </tr>
					</table>
				</div>
				<div style="width:260px;">
					<table width="100%" border="0">
					  <tr>
						<td class="one_money_css" id="10money">
							10<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得1000安之币
						</td>
					  </tr>
					</table>
				</div>
				<div style="width:270px;">
					<table width="100%" border="0">
					  <tr>
						<td class="one_money_css"  id="50money">
							50<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得5000安之币
						</td>
					  </tr>
					</table>
				</div>
				
				
				<div style="width:300px;clear:both;">
					<table width="100%" border="0">
					  <tr>
						<td class="two_money_css" id="100money">
							100<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得10000安之币
						</td>
					  </tr>
					</table>
				</div>
				<div style="width:300px;">
					<table width="100%" border="0">
					  <tr>
						<td class="two_money_css"  id="500money">
							500<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得50000安之币
						</td>
					  </tr>
					</table>
				</div>
				
				
				<div style="width:350px;clear:both;">
					<table width="100%" border="0">
					  <tr>
						<td class="three_money_css"  id="5000money">
							5000<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得500000安之币
						</td>
					  </tr>
					</table>
				</div>
				<div style="width:360px;">
					<table width="100%" border="0">
					  <tr>
						<td class="three_money_css"  id="10000money">
							10000<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得1000000安之币
						</td>
					  </tr>
					</table>
				</div>
				
				<div style="width:390px;clear:both;">
					<table width="100%" border="0">
					  <tr>
						<td class="four_money_css"  id="50000money">
							50000<span class="yuanc_css">元</span>
						</td>
						<td class="td_right_css">
							获得5000000安之币
						</td>
					  </tr>
					</table>
				</div>
			</div>
			
			<div class="chong_zhi_t_css" style=" margin-top:25px; padding-top:12px; border-top:#d1d1d1 1px solid;">
				充值方式：
			</div>
			<div style="width:65%;">
				<table width="100%" border="0">
				  <tr>
					<td>
						<div class="chognzhi_type">
							<div>
								<img src="images/zhifubao.png" />
							</div>
							<div>
								<input type="radio" checked="checked" id="zhifubao" name="chongzhitype" value="0" />
							</div>
						</div>
					</td>
					<td>
						<div class="chognzhi_type">
							<div>
								<img src="images/yinlianzhifu.png" />
							</div>
							<div>
								<input type="radio" id="yinlian" name="chongzhitype" value="0" />
							</div>
						</div>
					</td>
					<td>
						<div class="chognzhi_type">
							<div>
								<img src="images/weixinzhiu.png" />
							</div>
							<div>
								<input type="radio" id="weixin" name="chongzhitype" value="0" />
							</div>
						</div>
					</td>
				  </tr>
				</table>
			</div>
			
			<div style="margin-top:25px; padding:6px; background-color:#FFFFFF; border-radius:6px; line-height:25px; font-weight:normal; text-align:left;">
			 	<div style="text-align:center; margin-top:10px; font-size:16px;">充值提示（必看）</div>
			    <div style="line-height:25px; margin-top:10px; padding:7px; text-indent:25px;">由于充值成功后，系统生成安之币的时间会略微延迟1-3秒，所以请所有用户充值时，看见【充值成功】的提示后，耐心等待页面跳转回安之原创基地，查看安之币是否到账。
			   如因没有等页面跳转而导致安之币无法正常到账，请退出重新登录系统，即可看到最新剩余安之币。如还是没有收到，请及时联系管理员处理。</div>
				<div style="text-indent:25px;">
			    	<p>米珺：2842696676</p>
		    		<p>小庄：2936481817</p>
				</div>
		    </div>
			
			<div class="chong_zhi_t_css" style="padding-top:15px; margin-top:25px; border-top:#d1d1d1 1px solid;">
				充值金额：<input type="text" style="width:75px; padding-left:10px; color:#CC0000; font-size:20px; height:28px; border:#d1d1d1 1px solid;" id="chognzhi_money" name="chognzhi_money" onKeyUp="value=value.replace(/[^\d.]/g,'')" value="1" /><span class="yuanc_css">元</span>
				<input type="hidden" id="out_trade_no" name="out_trade_no" value=""/>
			</div>
			
			<div style="margin-top:35px; padding-bottom:50px; padding-left:25px;">
				<div style="float:left; background-image:url(images/pay.png); cursor:pointer; width:112px; height:40px;" onClick="chongzhi()"></div>
				<div style="float:left; background-image:url(images/cancle.png);cursor:pointer; margin-left:15px; width:112px; height:40px;" onClick="window.location.href='index.html'"></div>
			</div>
		</form>
	</div>
	
  	<script language="javascript">
		$(function(){
			$("#top_banner").css("background-color","#f0f0f0");
		});
	</script>
<jsp:include page="foot.jsp"></jsp:include>