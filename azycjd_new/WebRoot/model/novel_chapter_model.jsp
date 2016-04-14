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
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>novel_pojo.novelTitle</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="novel_pojo.novelTitle,novel_pojo.guanjianci"/>
	<meta http-equiv="description" content="This is my page"/>
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css"/>
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var loginSession='${loginUsers.id}';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var memberMoney='${loginUsers.memberMoney}';</script>
	<script language="javascript">var readMoney='${loginUsers.readMoney}';</script>
	<script language="javascript">var novelId='novel_pojo.id';</script>
	<script language="javascript">var loginMemberNo='${loginUsers.memberNo}';</script>
	<script language="javascript">var autoBuy=0;</script><!-- 是否自动购买 -->
	<script language="javascript">var youhuiType=-1;</script><!-- 是否有优惠 -->
	<script language="javascript">var discountedTypeName='';</script><!-- 优惠名称 -->
	<script language="javascript">var discountedRebate='';</script><!-- 优惠折扣 -->
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/jquery.color.js"></script>
	<script language="javascript" src="js/azycjd.js"></script>
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
			//加载当前用户已经订阅的章节数
			$.post(path+"/anzhichaptersubscribe/getDingYueChapter.do",{novelId:novelId},function(res){
				var tjson=eval('(' + res + ')');
				var json=tjson.data; 
				if(tjson.youhuiInfo=="yes"){
					discountedTypeName=tjson.discountedTypeName;
					discountedRebate=tjson.discountedRebate;
					$("#autoBuyDiv").html("本书有["+tjson.discountedTypeName+"]优惠，截止:"+tjson.discountedEndDate+"  <span class='discountedRebate_class'>"+parseFloat(tjson.discountedRebate)+"折</span><br/>");
					youhuiType=tjson.discountedType;
					$("#autoBuyDiv").slideDown();
				}
				
				if(memberId!=''){
					for(var i=0;i<json.length;i++){
						var chapterId=json[i].chapterId;
						$("#chapter"+chapterId)[0].className="yetbuy";
					}
					autoBuy=tjson.autoBuy;
					if(autoBuy==1){
						$("#autoBuyDiv").html($("#autoBuyDiv").html()+"您已经为当前小说设置为[自动订阅]，当您阅读未购买的VIP章节时，系统将不会提示自动购买。您可以[<a href='javascript:;' onclick=\"delautoBuy('"+novelId+"',this)\">取消自动订阅</a>]");
						$("#autoBuyDiv").slideDown();
					}
				}
			});
			
		});
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/index/js/validate.js"></script>
	<style type="text/css">
		.projects_update_time{display: none;}
		.projects_liebiaoone a{color: #404142;}
		.projects_liebiaoone a:hover{color: #1a9cda;}
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
  </head>
  
  <body id="top_banner" style="padding:0px; margin:0px; background:url(${sessionShouyetoubu})  center 0px no-repeat #f0f0f0;">
  	<div style="width:16px; height:153px; background:url(images/activities.png); cursor:pointer; position:fixed; left:50px; top:45%; z-index: 100;" onclick="window.open('<%=request.getContextPath()%>/activity.jsp')"></div>
	<div id="abousus_div" style="width:16px; height:153px; background:url(images/emagazine.png); cursor:pointer; position:fixed; right:50px; top:45%;z-index: 100;"  onclick="window.location.href='aboutus.jsp'"></div>
	<div class="login_div_css" id="login_div_css">
		<div class="top_1">
			<!-- <div title="首页" style="background:url(images/home.png) 1px 3px no-repeat;width:40px;" onclick="window.location.href='index.html'">首页</div> -->
			<c:if test="${empty loginUsers }">
				<div title="用户登录" style=" background:url(images/userIcon.png) 1px 3px no-repeat;width:140px;" id="showLoginDiv"><a href="javascript:;" onclick="showLoginWin()">登录</a>&nbsp;|&nbsp;<a href="register.jsp">注册</a>|&nbsp;<a href="register.jsp?wantToWriter=yes" class="wantToWriter">成为作者</a></div>
			</c:if>
			<c:if test="${not empty loginUsers }">
				<div style="background:url(images/star.png) 1px 3px no-repeat;width:150px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath() %>/indexMenu.jsp?indexMenuType=duzhe'">${loginUsers.memberNick }</a><span class="outSystemcss"><a href="javascript:outAnZhiSystem()">[退出]</a></span></div>
			</c:if>
			<div>
				<a class="search_a_css" href="<%=request.getContextPath()%>/search.jsp">搜索书籍</a>
			</div>
		</div>
		<div class="login_css" id="login_css">
			<div class="login_close_css" title="关闭" onclick="$('#login_css').css('display','none')">X</div>
			<div style="height:1px;"></div>
			<table width="100%" border="0">
			   <tr>
				<td colspan="2" style="font-weight: bold; text-align: center; font-size: 16px;">用户登录</td>
			  </tr>
			  <tr>
				<td width="29%"><div align="right" style="padding-right: 10px;">用户名</div></td>
				<td width="71%"><input type="text" id="uname" name="uname" placeholder="用户名/手机/邮箱/昵称" class="login_txt_css" /></td>
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
						<jsp:include page="../../loginType.jsp" flush="false"/>						
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
		<div class="projects_main">
			<div class="title_book">
				<div class="title_book_one" onclick="window.location.href='<%=request.getContextPath()%>/novel/novel_pojo.id.jsp'" style="cursor: pointer;">novel_pojo.novelTitle</div>
				<div style="margin-top: 7px;">作者：<font class="tipsdex">novel_pojo.zuozhe</font></div>
				<div>
					<span >分类:<font class="tipsdex">novel_pojo.novelType</font></span>
					<span style="margin-left: 40px;">章节数:<font class="tipsdex">novel_pojo.zhangjieshu章</font></span>
					<span style="margin-left: 40px;">最新更新时间:<font class="tipsdex">novel_pojo.gengxinshijian</font></span>
					<!-- <span style="margin-left: 40px;"><a href="javascript:return;">收藏本书</a></span> -->
				</div>
			</div>
			<div id="autoBuyDiv" class="autoBuyDiv"></div>
			<div class="projects_liebiaoone">
				novel_pojo.content	
			</div>
		</div>
	</div>
	<div class="foot_css">
		<div class="foot_1_css">
			<div>
				<a href="<%=request.getContextPath() %>/aboutus.jsp"  target="_blank">关于我们</a>|
				<a href="<%=request.getContextPath() %>/yonghuzhinan.jsp" target="_blank">用户指南</a>|
				<!-- <a href="zuozhetougao.jsp" target="_blank">作者投稿</a>| -->
				<a href="<%=request.getContextPath() %>/chengpinyingcai.jsp" target="_blank">诚聘英才</a>|
				<a href="<%=request.getContextPath() %>/lianxiwomen.jsp" target="_blank">联系我们</a>|
				<a href="<%=request.getContextPath() %>/admin/webEditorLogin.jsp" target="_blank">网编登录</a>|
				<a href="http://weibo.com/u/3020942093?topnav=1&wvr=6&topsug=1&is_hot=1" target="_blank">微博链接</a>	
			</div>
			<div>
				Copyright© 2006-2015 www.azycjd.com   All Rights Reserved 版权所有 云南安柔科技有限公司
			</div>
			<div>
				滇ICP备12006807号-1 滇网文许字【2014】1100-002号
			</div>
		</div>
	</div>
  </body>
</html>