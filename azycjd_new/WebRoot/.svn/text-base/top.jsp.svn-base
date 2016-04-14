<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml,http://open.weibo.com/wb" >
  <head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>安之原创|安之原创基地</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta name="keywords" content="安之原创基地、安之原创、小说、小说排行榜、言情小说、玄幻都市、免费小说" />
	<meta name="description" content="安之原创|安之原创基地|小说|小说排行榜|言情小说|玄幻都市|免费小说" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var loginSession='${loginUsers.id}';</script>
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
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
		});
	</script>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionShouyetoubu})  center 0px no-repeat #f0f0f0;">
  	<div style="width:16px; height:153px; background:url(images/activities.png); cursor:pointer; position:fixed; left:50px; top:45%; z-index: 100;" onclick="window.open('<%=request.getContextPath()%>/activity.jsp')"></div>
	<div id="abousus_div" style="width:16px; height:153px; background:url(images/activities.png); cursor:pointer; position:fixed; right:50px; top:45%;z-index: 100;"  onclick="window.open('<%=request.getContextPath()%>/activity.jsp')"></div>
	<div class="login_div_css" id="login_div_css">
		<div class="top_1">
			<!-- <div title="首页" style="background:url(images/home.png) 1px 3px no-repeat;width:40px;" onclick="window.location.href='index.html'">首页</div> -->
			<c:if test="${empty loginUsers }">
				<div title="用户登录" style=" background:url(images/userIcon.png) 1px 3px no-repeat;width:140px;" id="showLoginDiv">
					<a href="javascript:;" onclick="showLoginWin()">登录</a>&nbsp;|&nbsp;<a href="register.jsp">注册</a>|&nbsp;<a href="register.jsp?wantToWriter=yes" class="wantToWriter">成为作者</a>
				</div>
			</c:if>
			<c:if test="${not empty loginUsers }">
				<div style="background:url(images/star.png) 1px 3px no-repeat;width:150px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath() %>/indexMenu.jsp?indexMenuType=duzhe'">${loginUsers.memberNick }</a><span class="outSystemcss"><a href="javascript:outAnZhiSystem()">[退出]</a></span></div>
			</c:if>
			<div>
				<a class="search_a_css" href="<%=request.getContextPath()%>/search.jsp">搜索书籍</a>
			</div>
		</div>
		<div class="login_css" id="login_css">
			<div class="login_close_css" title="关闭" onclick="$('#login_css').css('position','static').css('display','none')">X</div>
			<div style="height:1px;"></div>
			<table width="100%" border="0">
			   <tr>
				<td colspan="2" style="font-weight: bold; text-align: center; font-size: 16px;">用户登录</td>
			  </tr>
			  <tr>
				<td width="29%"><div align="right" style="padding-right: 10px;">用户名</div></td>
				<td width="71%"><input type="text" id="uname" name="uname" class="login_txt_css" /></td>
			  </tr>
			  <tr>
				<td><div align="right" style="padding-right: 10px;">密&nbsp;&nbsp;&nbsp;码</div></td>
				<td><input type="password" id="upass" name="upass" class="login_txt_css" /></td>
			  </tr>
			  <tr>
				<td></td>
				<td>
					<div class="top_2">
						<div class="login_btn" onclick="memberLogin(this)">登录</div>
						<div><a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/findPassword.jsp">忘记密码?</a></div>
					</div>				
				</td>
			  </tr>
			  <tr>
				<td></td>
				<td>
					<div class="other_css">
						<jsp:include page="loginType.jsp" flush="false"/>
					</div>				
				</td>
			  </tr>
			</table>
		</div>
	</div>
	
    <div class="top">
		<div class="menu_css" id="menu0">
			<div class="menu_pic"><img src="images/xuanhuan.png" /></div>
			<div>玄幻·奇幻</div>
		</div>
		<div class="menu_css" id="menu1">
			<div class="menu_pic"><img src="images/wuxia1.png" /></div>
			<div>武侠·仙侠</div>
		</div>
		<div class="menu_css" id="menu2">
			<div class="menu_pic"><img src="images/dushih.png" /></div>
			<div>都市·异能</div>
		</div>
		<div class="menu_css" id="menu3">
			<div class="menu_pic"><img src="images/junshi.png" /></div>
			<div>历史·军事</div>
		</div>
		<div class="menu_css" id="menu4">
			<div class="menu_pic"><img src="images/youxi.png" /></div>
			<div>游戏·竞技</div>
		</div>
		<div class="menu_css" id="menu5">
			<div class="menu_pic"><img src="images/kehuan.png" /></div>
			<div>科幻·灵异</div>
		</div>
		<div class="menu_css" id="menu6">
			<div class="menu_pic"><img src="images/xiandaiyanqing.png" /></div>
			<div>现代言情</div>
		</div>
		<div class="menu_css" id="menu7">
			<div class="menu_pic"><img src="images/gudaiyanqing.png" /></div>
			<div>古代言情</div>
		</div>
	</div>
	
	<div class="main_css">
		<div style="background:url(images/title.png) bottom no-repeat; font-weight:bold; text-align:center;height:45px; margin-bottom: 70px;">
			<ul class="menuPage">
				<li id="<%=request.getContextPath() %>/index.html">首页</li>
				<li id="<%=request.getContextPath() %>/all_type_list.jsp">书库</li>
				<li id="<%=request.getContextPath() %>/paihangbang.html">排行榜</li>
				<li id="<%=request.getContextPath() %>/yhsf.html">优惠书坊</li>
				<li id="<%=request.getContextPath() %>/zuojiafuli.jsp">作家福利</li>
				<li id="<%=request.getContextPath() %>/anzhinews/news.do">安之公告</li>
				<li id="<%=request.getContextPath() %>/chongzhi.jsp">充值</li>
				<li id="<%=request.getContextPath() %>/index.html" style="border: none;">论坛</li>
			</ul>
		</div>
		