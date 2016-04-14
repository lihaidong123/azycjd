<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml,http://open.weibo.com/wb"/>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>安之原创|安之原创基地</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="安之原创,原创网络小说,言情小说,小说在线"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="css/azycjs.css"/>
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/azycjd.js"></script>
	<script language="javascript">
		$(function(){
			$("#searchText").focus(function(){
				if($(this).val()=="请输入搜素内容"){
					$(this).val("");
				}
			});
			$("#searchText").blur(function(){
				if($(this).val()==""){
					$(this).val("请输入搜素内容");
				}
			});
			$("p").css("background","#f0f0f0");
		});
	</script>
	<script language="javascript">
		$(function(){
			$(".bold_css").click(function(){
				var t_index=1;
				$(".bold_css").each(function(){
					$(this).css("background-image","url('images/tag"+t_index+".png')").css("margin-left","0px");
					t_index++;
				});
				var index=$(".bold_css").index($(this));
				$(this).css("background-image","url('images/tag"+(index+1)+"_hover.png')").css("margin-left","-7px");
				$(".fuliitems").each(function(){
					$(this)[0].style.display="none";
				});
				$(".fuliitems")[index].style.display="block"; 
				
			});
		});
		
		function moveWin(){
			if($(window).scrollTop()>700){
				$("#fuli_type").css("position","fixed").css("top","10px");
				
			}else{
				$("#fuli_type").css("position","inherit");
			}
		}
		
		function moveNoWin(){
		}
		
		//window.onscroll=moveWin;
	
	</script>
	<style type="text/css">
		.fuli_type{width: 209px; padding-top:20px; background: url("images/pencil.png") no-repeat center 170px #eaeaea; min-height: 500px;}
		.div_title_css_main{background-color:#f0f0f0 !important;}
		.bold_css{ cursor:pointer; margin-top:35px; width:225px; height:52px;background-repeat:no-repeat;}
		.fuliitems{display: none;}
		.click_fuli{ background-image:url("images/click_fuli.png"); width:155px; height: 31px;}
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionZuojiafulitoubu})  center 0px no-repeat #f0f0f0;">
  	<jsp:include page="other_head.jsp" flush="false" />
	<div class="main_2_div">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td valign="top" width="20%">
				<div style="width:225px; height: 6px; "></div>
				<div id="fuli_type" class="fuli_type">
					<div style="width: 225px;position: absolute;">
						<div id="zuojiafuli.jsp?divid=wangzhanqianyuefuli" class="bold_css" style="background-image:url(images/tag1_hover.png);margin-left: -7px;"></div>
						<div id="zuojiafuli.jsp?divid=yuanchuangweifabiao" class="bold_css" style="background-image:url(images/tag2.png);"></div>
						<div id="zuojiafuli.jsp?divid=pingtaiqianyuefuli" class="bold_css" style="background-image:url(images/tag3.png);"></div>
						<div id="zuojiafuli.jsp?divid=zuojiapeixun" class="bold_css" style="background-image:url(images/tag4.png);"></div>
					</div>
				</div>
				<div style="height: 4px;background-color: #dedede; width:225px;"></div>
			</td>
			<td valign="top" width="80%" style="">
				<div style="width:840px; height: 6px; background-image: url(images/fuli_2.png);"></div>
				<div class="div_title_css_main" style="min-height: 800px;">
					<div class="fuliitems" id="wangzhanqianyuefuli" style="display: block;">
						${otherContent.wangzhanqianyuefuli }						
					</div>
					<div class="fuliitems" id="yuanchuangweifabiao">
						${otherContent.yuanchuangmaiduanfuli }
					</div>
					<div class="fuliitems" id="pingtaiqianyuefuli">
						${otherContent.pingtaiqianyuefuli }
					</div>
					<div class="fuliitems" id="zuojiapeixun">
						${otherContent.anzhizuojiapeixun }
					</div>
				</div>
			</td>
		  </tr>
		</table>
	</div>
<jsp:include page="foot.jsp"></jsp:include>