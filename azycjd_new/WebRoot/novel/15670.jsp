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
    <title>公子，请上钩</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="公子，请上钩,前世今生,淑女	,米虫,转世,生死大爱"/>
	<meta http-equiv="description" content="公子，请上钩,前世今生,淑女	,米虫,转世,生死大爱"/>
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/azycjs.css"/>
	<meta property="qc:admins" content="2315067207612132463757" />
	<meta property="wb:webmaster" content="3a36f523124c3619" />
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var loginSession='${loginUsers.id}';</script>
	<script language="javascript">var loginMemberId='${loginUsers.id}';</script>
	<script language="javascript">var loginMemberNo='${loginUsers.memberNo}';</script>
	<script language="javascript" src="<%=path %>/js/jquery.min.js"></script>
	<script language="javascript" src="<%=path %>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2050043132" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101296266" data-redirecturi="http://www.azycjd.com/qq_back.jsp" charset="utf-8"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript" src="<%=path %>/index/js/validateData.js"></script>
	<script language="javascript" src="<%=path %>/index/js/selectData.js"></script>
	<script language="javascript" src="<%=path %>/index/js/validate.js"></script>
	<script language="javascript">var scrollComentId='${param.scrollComentId}';</script>
	
	<script language="javascript" src="<%=path %>/js/jquery.jplayer.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/musicPlayer.css" />
	<script language="javascript" src="<%=path %>/js/musicPlayer.js"></script>
	<script language="javascript" src="<%=path %>/js/comment.js"></script>
	<jsp:include page="../commentHtmlEdit.jsp" flush="false"></jsp:include>
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
			getHtmlContent("xiaoshuojieshao",120);
		});
	</script>
	<style>
		.replyContent{clear: both;padding-left: 80px;}
	</style>
	<script language="javascript">
		var newsdata=new Array();
	
		var index=0;
		
		$(function(){
			loadNovelDeTail(15670);
			if(scrollComentId!=''&&parseInt(scrollComentId)!=0){
				$(".comment_items").each(function(){
					if($(this)[0].id==("comment_items_div_"+scrollComentId)){
						($(window).scrollTop($(this)[0].offsetTop));
						return false;
					}
				});
			}
		});
		
		function moves(){
			$("#chardiv").html(newsdata[index]);
			$("#chardiv").animate({marginTop:"10px"},500,function(){
				setTimeout("movesTwo()",5000);
			});
		}
		
		function movesTwo(){
			$("#chardiv").animate({marginTop:"-40px"},500,function(){
				$("#chardiv").css("margin-top","45px");
				index++;
				if(index==newsdata.length){
					index=0;
				}
				moves();
			});
		}
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
	<div id="abousus_div" style="width:16px; height:153px; background:url(images/emagazine.png); cursor:pointer; position:fixed; right:50px; top:45%;z-index: 100;"  onclick="window.location.href='aboutus.jsp'"></div>
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
						<jsp:include page="../loginType.jsp" flush="false"/>					
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
				<li id="<%=path %>/index.html">首页</li>
				<li id="<%=path %>/all_type_list.jsp">书库</li>
				<li id="<%=path %>/paihangbang.html">排行榜</li>
				<li id="<%=path %>/yhsf.html">优惠书坊</li>
				<li id="<%=path %>/zuojiafuli.jsp">作家福利</li>
				<li id="<%=path %>/news.jsp">安之公告</li>
				<li id="<%=path %>/chongzhi.jsp">充值</li>
				<li id="<%=path %>/index.html" style="border: none;">论坛</li>
			</ul>
		</div>

		<div style="position:absolute; top:720px; margin-left:70px;">
			<img src="/UploadImages/NovelWorks/Big/2015-11-12/44209091d53947d6a3c6f82f09b4fb60.jpg" width="375" height="500" />
		</div>
		<div style="position:absolute; top:1220px; margin-left:445px;">
			<img src="images/7_p_48.png"></img>
		</div>
		<div style="position:absolute; top:1120px; margin-left:745px;">
			<div class="self_btn" style="margin-left:50px;margin-top:15px;"><a href="<%=request.getContextPath()%>/novel/15670/index.jsp">立刻阅读</a></div>
		</div>		
		<div class="title_div_css">
			小说&nbsp;>&nbsp;古代言情
		</div>
		<div class="projects_main">
			<div class="projects_head">
				<div class="head_youshang">
					<div class="novel_state_info_css">
						<img src='images/lianzaizhong.png' alt='' /><br/>
						
						
					</div>
				
					<div class="head_hang" style="margin-top:25px;">
						<div style="font-size:40px;font-weight: bolder;font-family:'黑体';">公子，请上钩</div>
					</div>
					<div class="projects_qiehuan">
						<div class="zuopinxinxi" id="zuopintab" onclick="changeContent(this,'zuopin')">作品信息</div>
						<div class="zuojiaxinxi" id="zuojiatab" onclick="changeContent(this,'zuojia')">作者信息</div>
					</div>
					<div style="width:150px;height:2px;border-bottom:1px solid #ccc;"></div>
					<div class="youshang_second" id="zuopin">
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>小说编号：</div>
							<div>15670</div>
						</div>
						<!-- <div class="head_hang" style="clear:both;padding-top:7px;">
							<div>作者：</div>
							<div class="author_name" onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=40154')">官秋月</div>
						</div> -->
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>小说作者：</div>
							<div style='cursor: pointer;font-weight: bold;' onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=40154')">官秋月</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:9px;">
							<div>分类：</div>
							<div>古代言情</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>周点击：</div>
							<div id="zhoudianji">0</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>周推荐：</div>
							<div id="zhoutuijian">0</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>月点击：</div>
							<div id="yuedianji">18</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>月推荐：</div>
							<div id="yuetuijian">1</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>月票：</div>
							<div id="yuetuijian">0</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>总点击：</div>
							<div id="zongdianji">1204</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>总字数：</div>
							<div id="zongzishu">238072</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>更新时间：</div>
							<div id="gengxinshijian">2016-04-11 09:44:42</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>是否签约：</div>
							<div style="color:red;">已签约</div>
						</div>
						<div class="head_hang" style="clear:both;padding-top:7px;">
							<div>发表方式：</div>
							<div>【独家首发】</div>
						</div>
						<!-- <div class="head_hang" id="zhizhushangjia" style="clear:both;display:none; padding-top:9px;">
							<img src="images/7_p_5_1.png" width="84" height="28" />
						</div> -->
						<div class="head_hang" style="clear:both;padding-top:3px;">
							<div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a><a href="#" class="bds_mshare" data-cmd="mshare" title="分享到一键分享"></a></div>
							<script>
								window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","sqq","tieba","mshare"],"viewText":"分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","sqq","tieba","mshare"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
							</script>
						</div>
					</div>
					<div class="youshang_second" id="zuojia" style="display:none;">
						    <div class="head_hang" style="clear:both;padding-top:7px;">
								<div>作者：</div>
								<div class="author_name" onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=40154')">官秋月</div>
							</div>
							<!-- <div class="head_hang" style="clear:both;padding-top:7px;">
								<div>作者等级：</div>
								<div>白银大神</div>
							</div> -->
							<div class="head_hang" style="clear:both;padding-top:7px;">
								<div>其他作品：</div>
								<div></div>
							</div>
							<div class="head_hang" style="clear:both;padding-top:7px;">
								<div>作者简介：</div>
								<div><span style="padding-left:40px;"></span></div>
							</div>
							
							<!-- <div class="head_hang" style="clear:both;padding-top:7px;">
								<div>授权方式：</div>
								<div>原创</div>
							</div> -->
							
							<!-- <div class="head_hang" style="clear:both;padding-top:7px;">
								<div>授权范围：</div>
								<div>【实体出版代理授权，非实体出版代理授权】</div>
							</div> -->
					</div>
				</div>
				<div>
					<div class="head_zuoxia">
						<div class="zuoxia_hang">
							<div style="margin-left:50px;"><img src="images/7_p_2.png"></img></div>
							<div id="shoucangbenshu" style="display: none;"><a href="javascript:;" onclick="multifunction(this,'${loginUsers.id}','15670',1,'公子，请上钩')">收藏本书</a></div>
							<div style="margin-left:30px;margin-top:3px;"><img src="images/7_p_3.png"></img></div>
							<div><a href="<%=request.getRequestURI() %>#comment_position">评论</a></div>
						</div>
						<div class="youhui_info" id="youhui_info">
							
						</div>
						<div id="da_shang_button" class="zuoxia_hang">
							<div class="tuijian_div" onclick="daShangNovel(0,'${loginUsers.id}','15670','公子，请上钩')"></div>
							<div class="yuepiao_div" onclick="daShangNovel(1,'${loginUsers.id}','15670','公子，请上钩')"></div>
							<div class="cuigeng_div" onclick="daShangNovel(2,'${loginUsers.id}','15670','公子，请上钩')"></div>
							<div class="dashang_div" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩')"></div>
						</div>
					</div>
					<div class="head_youxia">
						<div style="height:90px;" class="xiaoshuojieshao">
							 一朝穿越使得她米虫的生活发生翻天覆地的变化，遇见他，不知是幸还是不幸。异界寻得的兄长忽然离世，故人将闺蜜的回家之路来当做要挟她的筹码，师兄的不辞而别，心爱之人的见死不救……女子凌厉一剑，那忘川河边，奈何桥前的三生石便被拦腰斩断，他二人的名...
						</div>
						<div class="youxia_er">
							<div>标签:前世今生,淑女	,米虫,转世,生死大爱</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="projects_hengtiao" style="margin-top: 130px;">
				<div style="width:38px;height:38px;float:left;padding-top:5px; padding-left: 10px;">
					<img src="images/speaker.png" width="30px" height="30px"></img>
				</div>
				<div id="chardiv" style="margin-top:45px;color:red;padding-left:10px;float:left;">
					novel_pojo.newsgonggao
				</div>
			</div>
			<div class="projects_hengxian">
				<img src="images/7_p_50.png"></img>
			</div>
			<div class="projects_mafan">
				<div style="width:70px;height:140px;" class="projects_mafanone">
					<div style="width:30px;font-size: 22px;margin-left:30px;font-weight: bold;">粉丝榜</div>
					<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
				</div>
				<div style="width:290px;height:280px;" id="fensibang">
					<table style='width:100%;' class='projects_mafantb'>
						<tr>
							<td><a style='font-weight: bold;'>排名</a></td>
							<td><a style='font-weight: bold;'>昵称</a></td>
							<td><a style='font-weight: bold;'>等级</a></td>
						</tr>
						<tr><td>1</td><td>五月虎</td><td>初窥门径</td></tr><tr><td>2</td><td>官秋月</td><td>不堪一击 </td></tr><tr><td>3</td><td>大灰猫</td><td>不堪一击 </td></tr><tr><td>4</td><td>孤月矜心</td><td>不堪一击 </td></tr><tr><td>5</td><td>梧歌</td><td>不堪一击 </td></tr>
					</table>
					<div style="margin-top: 10px; padding-bottom:30px; font-size: 12px;"><a href="javascript:window.open('<%=path %>/anzhinovel/moreFenSi.do?novelId=15670')">更多...</a></div>
				</div>
				<div style="width:50px;height:160px;" class="projects_mafanone">
					<div style="width:30px;font-size: 22px;font-weight: bold;">本书最新消息</div>
					<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
				</div>
				<div class="projects_mafanmidd" id="zuixindashang">
					<div><div class='midd_one'>梧歌</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>大灰猫</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>官秋月</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>孤月矜心</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>官秋月</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>官秋月</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>官秋月</div><div class='midd_two'><div class='midd_two_one'>投了<a style='color:#ff3535;'>1张推荐票</a></div><div class='midd_two_two'>0</div><div class='midd_two_three'><img src='images/recommanddan.png' style='width:20px;height:20px;'></img></div></div></div><div><div class='midd_one'>五月虎</div><div class='midd_two'><div class='midd_two_one'>打赏<a style='color:#ff3535;'>1只手镯</a></div><div class='midd_two_two'>1000</div><div class='midd_two_three'><img src='images/dashang/3.png' style='width:20px;height:20px;'></img></div></div></div>
				</div>
				<div style="width:70px;height:160px;" class="projects_mafanone">
					<div style="width:30px;font-size: 22px;margin-left:10px;font-weight: bold;">累计打赏</div>
					<div style="width:1px;height:120px;"><img src="images/7_p_51.png"></img></div>
				</div>
				<div class="projects_mafanlast" style="width:155px;margin-left:1px;">
					<div class='last_hang' style='width:155px;'><div title='手镯'><img src='images/dashang/3.png' width='45' height='45'></img></div><div class='da_shang_lei_ji_css'>手镯[1]</div></div>
				</div>
			</div>
		    <div class="read_pl_qs">
		    	<div style="padding:50px 0px 0px 25px;">点赞前十用户榜</div>
		    	<div class="read_pl_qs_info" id="dianzanqianshi">
		    		<div><a href='anzhimember/memberInfo.do?memberId=40154'><img src='/images/defaultHead.png' width='40' height='40' alt='' /></a><br /><span style='color: #707070'>官秋月</span></div><div><a href='anzhimember/memberInfo.do?memberId=44484'><img src='/images/defaultHead.png' width='40' height='40' alt='' /></a><br /><span style='color: #707070'>梧歌</span></div><div><a href='anzhimember/memberInfo.do?memberId=42732'><img src='/UploadImages/AuthorRubric/Small/2015-09-20/small_6d58287b2cd7478cbf50d36bdda181bb.jpg' width='40' height='40' alt='' /></a><br /><span style='color: #707070'>孤月矜心</span></div><div><a href='anzhimember/memberInfo.do?memberId=42330'><img src='/images/defaultHead.png' width='40' height='40' alt='' /></a><br /><span style='color: #707070'>磬荷</span></div><div><a href='anzhimember/memberInfo.do?memberId=41880'><img src='/UploadImages/AuthorRubric/Small/2015-12-08/small_871f5f3ce68442369a73d200845fd326.jpg' width='40' height='40' alt='' /></a><br /><span style='color: #707070'>大灰猫</span></div>
		    	</div>
		    </div>
		    <div class="read_pl_con"></div>
		    <div class="shupingqu">
		    	<div class="shupingqu_two">
		    		<div class="shupingqu_title">公子，请上钩书评区<span class="look_more_comment" onclick="window.open('<%=request.getContextPath() %>/anzhicomment/findMyAnzhiCommentAllIndex.do?novelId=15670')">更多评论</span><span id="commentLiuYanTotalNum" class="commentTotal">总共17条</span></div>
			    	<!-- <div>
			    		<input type="button" id="c_t_1" class="comment_type_css_click" value="书评区"/>
			    		<input type="button" id="c_t_2" class="comment_type_css" value="书评区" onclick="commentTypeClick(false,this)"/>
			    		
			    	</div> -->
			    	<div class="read_pl_content" id="pinglunDiv">
				    	<div class='comment_items' id='comment_items_div_146343'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=44484' target='_blank'>梧歌</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(146343,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment146343' onclick="commentPraise(this,loginMemberId,'15670','146343',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('146343','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！</div><div class='comment_time' id='comment_time146343'>2016/04/01 15:00</div></td></tr></table></div><div class='comment_items' id='comment_items_div_145955'><table width='100%'><tr><td valign='top' width='42'><img src='/UploadImages/AuthorRubric/Small/2015-12-08/small_871f5f3ce68442369a73d200845fd326.jpg' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=41880' target='_blank'>大灰猫</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(145955,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment145955' onclick="commentPraise(this,loginMemberId,'15670','145955',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('145955','15670',loginMemberId)">回复(1)</a></div></div><div class='comment_content'>给本书投了1张推荐票！大灰猫顶着一大叠书过来捧场，票票和收藏都献上了哦！祝贺大大，字数超过十万。</div><div class='comment_time' id='comment_time145955'>2016/03/22 15:29</div><div id='commentReplyDiv145955' class='commentReplyDiv'><div class='comment_items'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span>[<a href='javascript:;' onclick='delCommentByAdmin(146088,15670,this)'>删除</a>]</span></c:if></div><div class='comment_time'>2016/03/26 09:36</div><div class='nowPosition'>第1楼</div></div><div class='comment_content'>蟹蟹</div></td></tr></table></div></div></td></tr></table></div><div class='comment_items' id='comment_items_div_145206'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(145206,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment145206' onclick="commentPraise(this,loginMemberId,'15670','145206',0)">点赞(0)</div><div class='comment_reply'><a href="javascript:commentReply('145206','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！</div><div class='comment_time' id='comment_time145206'>2016/03/03 15:13</div></td></tr></table></div><div class='comment_items' id='comment_items_div_145154'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=42330' target='_blank'>磬荷</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(145154,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'></div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment145154' onclick="commentPraise(this,loginMemberId,'15670','145154',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('145154','15670',loginMemberId)">回复(1)</a></div></div><div class='comment_content'>前世今生，又有谁说得清楚呢？</div><div class='comment_time' id='comment_time145154'>2016/03/02 13:15</div><div id='commentReplyDiv145154' class='commentReplyDiv'><div class='comment_items'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span>[<a href='javascript:;' onclick='delCommentByAdmin(145208,15670,this)'>删除</a>]</span></c:if></div><div class='comment_time'>2016/03/03 15:43</div><div class='nowPosition'>第1楼</div></div><div class='comment_content'>前世今生不过是一次次的纠缠命格罢了</div></td></tr></table></div></div></td></tr></table></div><div class='comment_items' id='comment_items_div_144804'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'>[已加精]<a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144804,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'></div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144804' onclick="commentPraise(this,loginMemberId,'15670','144804',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('144804','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>喜欢公子，请上钩的读者请加群&nbsp;295865650，进群有福利哦<img src="http://www.azycjd.com/js/kindeditor/plugins/emoticons/images/13.gif" border="0" alt="" /></div><div class='comment_time' id='comment_time144804'>2016/02/21 18:12</div></td></tr></table></div><div class='comment_items' id='comment_items_div_144795'><table width='100%'><tr><td valign='top' width='42'><img src='/UploadImages/AuthorRubric/Small/2015-09-20/small_6d58287b2cd7478cbf50d36bdda181bb.jpg' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=42732' target='_blank'>孤月矜心</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144795,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144795' onclick="commentPraise(this,loginMemberId,'15670','144795',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('144795','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！加油呦</div><div class='comment_time' id='comment_time144795'>2016/02/21 15:33</div></td></tr></table></div><div class='comment_items' id='comment_items_div_144739'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144739,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'></div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144739' onclick="commentPraise(this,loginMemberId,'15670','144739',0)">点赞(0)</div><div class='comment_reply'><a href="javascript:commentReply('144739','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>求收藏，求书评，么么哒(づ￣ 3￣)づ</div><div class='comment_time' id='comment_time144739'>2016/02/18 21:34</div></td></tr></table></div><div class='comment_items' id='comment_items_div_144735'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144735,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144735' onclick="commentPraise(this,loginMemberId,'15670','144735',0)">点赞(1)</div><div class='comment_reply'><a href="javascript:commentReply('144735','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！</div><div class='comment_time' id='comment_time144735'>2016/02/18 19:10</div></td></tr></table></div><div class='comment_items' id='comment_items_div_144689'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144689,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144689' onclick="commentPraise(this,loginMemberId,'15670','144689',0)">点赞(0)</div><div class='comment_reply'><a href="javascript:commentReply('144689','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！</div><div class='comment_time' id='comment_time144689'>2016/02/16 21:28</div></td></tr></table></div><div class='comment_items' id='comment_items_div_144629'><table width='100%'><tr><td valign='top' width='42'><img src='/images/defaultHead.png' width='41' height='41'/></td><td valign='top'><div class='comment_head'><div class='comment_member_nick'><a href='<%=request.getContextPath() %>/anzhimember/memberInfo.do?memberId=40154' target='_blank'>官秋月</a><c:if test='${not empty loginUsers && loginUsers.memberType eq 2 && loginUsers.memberNo eq "admin"}'><span class='admin_del_comment_css'>[<a href='javascript:;' onclick='delCommentByAdmin(144629,15670,this)'>删除</a>]</span></c:if></div><div class='comment_title'>投票记录</div><div class='comment_dianzan' title='亲，赞一个呗' id='dianZanComment144629' onclick="commentPraise(this,loginMemberId,'15670','144629',0)">点赞(0)</div><div class='comment_reply'><a href="javascript:commentReply('144629','15670',loginMemberId)">回复(0)</a></div></div><div class='comment_content'>给本书投了1张推荐票！</div><div class='comment_time' id='comment_time144629'>2016/02/12 00:40</div></td></tr></table></div>
				    </div>
				    <!-- <div class="read_pl_content" id="liuyanpinglunDiv">
				    	novel_pojo.liuyancontent
				    </div> -->
		    	</div>   	
		    </div>
		    
		    <div class="read_pl_more">
		    	<div class="look_more_comment" onclick="window.open('<%=request.getContextPath() %>/anzhicomment/findMyAnzhiCommentAllIndex.do?novelId=15670')">查看更多评论...</div>
		    	<div style="padding:45px 0px 0px 770px; ">
		    		<span style="font-size: 13px;"><a href="javascript:;" onclick="$(window).scrollTop(0);"><img src="images/7_p_46.png" title="返回顶部" style="padding-right: 5px;"/>返回顶部</a></span>
		    	</div>
		    </div>
		    <a name="comment_position"></a>
		    <div class="read_pl">
				<div style="padding:15px;">
					<table width="100%">
						<tr>
							<td valign="top" width="14%" align="center">
								<div style="background:url(images/7_p_3.png) no-repeat 5px 4px; padding-left:28px; font-size:16px;">评论<span style="font-size:13px; padding-left:7px;">共17条</span></div>
								<div style="font-family:'宋体'; font-size:14px; margin-top:10px;">
									<c:if test="${empty loginUsers }">
										您必须登录才能评论
									</c:if>
									<c:if test="${not empty loginUsers }">
										${loginUsers.memberNick }
									</c:if>
								</div>
							</td>
							<td valign="top" width="86%">
								<div style="background-color:#FFFFFF; width:100%; border-radius:5px; padding-top:10px;">
									<div style=" margin:0 auto;width:95%;">
										<div style=" border-bottom:#CCCCCC 1px solid; padding-bottom: 7px;">
											<input type="text" class="comment_title_input" id="comment_title" name="comment_title" placeholder="请输入书评标题"/>
										</div>
										<div style=" border-bottom:#CCCCCC 1px solid; margin-top: 10px;">
											<textarea id="commentContent" name="commentContent" class="commentHtmlEditCss" placeholder="请输入书评内容..." style="height:90px; width:100%; border:none;resize: none;"></textarea>
										</div>
										<div class="shupin_css_foot" style="overflow:auto; padding-top:10px; padding-bottom:10px;">
											<div id="upload_video_div" style="background:url(images/biaoqing.png) no-repeat 1px 1px; color:#666666; width:55px; font-size:13px; float:left;cursor:pointer; padding-left:30px;" onclick="$('#video_div').slideToggle();">添加视频</div>
											<div id="remainCharNum" class="remainCharNum">
												<!-- <input type="hidden" name="c_type" value="0" checked="checked" onclick="$('#state').val(0);$('#comment_title').slideUp();"/>留言
												<input type="hidden" name="c_type" value="1" onclick="$('#state').val(1);$('#comment_title').slideDown();"/>书评 -->
												<input type="hidden" id="state" name="state" value="0"/>
											</div>
											<div style="margin-left:220px; padding-top:4px;" onclick="loadimage()">
												<img alt="code..." name="randImage" id="randImage" src="./image.jsp" width="60" height="20" border="1"/>
											</div>
											<div style="padding-top:4px;">
												<input type="text" class="txt" id="randCode" name="randCode" placeholder="输入验证码" style=" width:90px;" />
											</div>
											<div class="addCommentDiv" onclick="saveComment(this,15670,'${loginUsers.id}',0,0)">提交书评</div>
										</div>
										<div id="video_div" style="display: none;">
											<div class="video_tips">
												请输入FLASH视频地址：<input id="videoUrl" type="text" style="width:500px;" value="" class="videoUrlCss"/>
												<input class="addVideoCss" type="button" style="margin-left: 15px;" value="添加" onclick="addVideo()"/>
											</div>
											<div style="text-align: center;padding-bottom: 25px;">
												<span class="video_tips_span">本站支持：优酷、爱奇艺、腾讯、搜狐、土豆网站FLASH视频</span>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
		    </div>
		    
			<div class="projects_novellist">
				<div style="color:#666666;padding-left:30px;line-height:40px;background:#ffffff">其它作品推荐</div>
				<div id="tuijianzupin">
					<div style="clear:both; overflow:auto;" id="otherNovelList">
						
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$("#articePageMainDiv .noval_img").hover(function(){
					clearInterval(removeBookBaiscTimer);
					getBookBasicObject=$(this)[0];
					if($(this).data("novelId")==null){
						//说明没有加载
						loadNovelPartInfo(getBookBasicObject);
					}else{
						novelImg=$(this).data("novelImg");
						novelTitle=$(this).data("novelTitle");
						authorWriter=$(this).data("authorWriter");
						clickNum=$(this).data("clickNum");
						readNum=$(this).data("readNum");
						novelVote=$(this).data("novelVote");
						novelId=$(this).data("novelId");
						getBookBasicTimer=setTimeout("getBookBasicInfo()",400);
					}
				},function(){
					clearInterval(getBookBasicTimer);
					getBookBasicObject=null;
					novelImg=null;
					novelTitle=null;
					authorWriter=null;
					clickNum=null;
					readNum=null;
					novelVote=null;
					novelId=null;
					removeBookBaiscTimer=setTimeout("removeBookBasic()",1000);
				});
				$("#articePageMainDiv .noval_img").each(function(){
					var ids=$(this)[0].id;
					var novleId=ids.substring(0,ids.indexOf("novalImg"));
					$(this).children("img").click(function(){
						window.location.href=path+"/novel/"+novleId+".jsp";
					});
				});
				
				loadotherNovelList('古代言情');
			});
		</script>
		<script type="text/javascript">
			$(function(){
				$(".replyContent").each(function(){
					$(this).slideToggle("fast");
				});
			});
		
			function replyContent(index){
				$("#replyContent"+index)[0].style.display="block";
			}
			
			function closeReplyContent(index){
				$("#replyContent"+index)[0].style.display="none";
			}
			
			function openShangjia(obj){
				if(obj.checked==true||obj.checked=="selected"||obj.checked=="checked"){
					$("#zizhuImg")[0].style.display="block";
				}else{
					$("#zizhuImg")[0].style.display="none";
				}
			}
		</script>
	</div>
	<div class="foot_css">
		<div class="foot_1_css">
			<div>
				<a href="aboutus.jsp" target="_blank">关于我们</a>|
				<a href="yonghuzhinan.jsp" target="_blank">用户指南</a>|
				<!-- <a href="zuozhetougao.jsp" target="_blank">作者投稿</a>| -->
				<a href="chengpinyingcai.jsp" target="_blank">诚聘英才</a>|
				<a href="lianxiwomen.jsp" target="_blank">联系我们</a>|
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

