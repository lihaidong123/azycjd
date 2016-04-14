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
    <title>江湖险恶医女求生记</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="江湖险恶医女求生记,novel_pojo.guanjianci"/>
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
	<script language="javascript">var novelId='17935';</script>
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
				<div class="title_book_one" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935.jsp'" style="cursor: pointer;">江湖险恶医女求生记</div>
				<div style="margin-top: 7px;">作者：<font class="tipsdex">瓶盖币</font></div>
				<div>
					<span >分类:<font class="tipsdex">古代言情</font></span>
					<span style="margin-left: 40px;">章节数:<font class="tipsdex">114章</font></span>
					<span style="margin-left: 40px;">最新更新时间:<font class="tipsdex">2016-04-11 10:29:54</font></span>
					<!-- <span style="margin-left: 40px;"><a href="javascript:return;">收藏本书</a></span> -->
				</div>
			</div>
			<div id="autoBuyDiv" class="autoBuyDiv"></div>
			<div class="projects_liebiaoone">
				<div class='fen_juan_items'><div class='fen_juan_name'>第1卷 正文内容<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('18009','104','258470','84')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div18009'><div id='chapter403755' class='free_chapter' title="字数：4633;更新时间：2016-04-01 "><a href='javascript:;' id='4633@403755' onclick="readNovel('403755',this,'4633',1)" target="_blank">第1章 楔子 邂逅</a></div><div id='chapter405293' class='free_chapter' title="字数：4134;更新时间：2016-03-18 "><a href='javascript:;' id='4134@405293' onclick="readNovel('405293',this,'4134',2)" target="_blank">第2章 楔子 悸动</a></div><div id='chapter405294' class='free_chapter' title="字数：3626;更新时间：2016-03-18 "><a href='javascript:;' id='3626@405294' onclick="readNovel('405294',this,'3626',3)" target="_blank">第3章 楔子 约定</a></div><div id='chapter405295' class='free_chapter' title="字数：4606;更新时间：2016-03-18 "><a href='javascript:;' id='4606@405295' onclick="readNovel('405295',this,'4606',4)" target="_blank">第4章 楔子 离别</a></div><div id='chapter405473' class='free_chapter' title="字数：3483;更新时间：2016-03-22 "><a href='javascript:;' id='3483@405473' onclick="readNovel('405473',this,'3483',5)" target="_blank">第5章 第一章 长子吟风楼</a></div><div id='chapter405512' class='free_chapter' title="字数：3883;更新时间：2016-03-23 "><a href='javascript:;' id='3883@405512' onclick="readNovel('405512',this,'3883',6)" target="_blank">第6章 第二章 今儿艳阳天</a></div><div id='chapter405542' class='free_chapter' title="字数：3710;更新时间：2016-03-24 "><a href='javascript:;' id='3710@405542' onclick="readNovel('405542',this,'3710',7)" target="_blank">第7章 第三章 我等你回来</a></div><div id='chapter405580' class='free_chapter' title="字数：3746;更新时间：2016-03-25 "><a href='javascript:;' id='3746@405580' onclick="readNovel('405580',this,'3746',8)" target="_blank">第8章 第四章 我跟你不熟</a></div><div id='chapter405617' class='free_chapter' title="字数：4668;更新时间：2016-03-26 "><a href='javascript:;' id='4668@405617' onclick="readNovel('405617',this,'4668',9)" target="_blank">第9章 第五章 皇宫深似海</a></div><div id='chapter405618' class='free_chapter' title="字数：4895;更新时间：2016-03-27 "><a href='javascript:;' id='4895@405618' onclick="readNovel('405618',this,'4895',10)" target="_blank">第10章 第六章 赶不上杀猪大会</a></div><div id='chapter405619' class='free_chapter' title="字数：4487;更新时间：2016-03-27 "><a href='javascript:;' id='4487@405619' onclick="readNovel('405619',this,'4487',11)" target="_blank">第11章 第七章 撒鹤顶红毒死你</a></div><div id='chapter405620' class='free_chapter' title="字数：4141;更新时间：2016-03-28 "><a href='javascript:;' id='4141@405620' onclick="readNovel('405620',this,'4141',12)" target="_blank">第12章 第八章 软硬都不吃</a></div><div id='chapter405621' class='free_chapter' title="字数：3363;更新时间：2016-03-28 "><a href='javascript:;' id='3363@405621' onclick="readNovel('405621',this,'3363',13)" target="_blank">第13章 第九章 惹不起我躲</a></div><div id='chapter405622' class='free_chapter' title="字数：3592;更新时间：2016-03-29 "><a href='javascript:;' id='3592@405622' onclick="readNovel('405622',this,'3592',14)" target="_blank">第14章 第十章 本宫也耳背</a></div><div id='chapter405623' class='free_chapter' title="字数：3118;更新时间：2016-03-29 "><a href='javascript:;' id='3118@405623' onclick="readNovel('405623',this,'3118',15)" target="_blank">第15章 第十一章 你总要躲我</a></div><div id='chapter405624' class='free_chapter' title="字数：3267;更新时间：2016-03-30 "><a href='javascript:;' id='3267@405624' onclick="readNovel('405624',this,'3267',16)" target="_blank">第16章 第十二章 吾得大门牙</a></div><div id='chapter405625' class='free_chapter' title="字数：3196;更新时间：2016-03-30 "><a href='javascript:;' id='3196@405625' onclick="readNovel('405625',this,'3196',17)" target="_blank">第17章 第十三章 这姿势美不</a></div><div id='chapter405626' class='free_chapter' title="字数：3167;更新时间：2016-03-30 "><a href='javascript:;' id='3167@405626' onclick="readNovel('405626',this,'3167',18)" target="_blank">第18章 第十四章 你开个价吧</a></div><div id='chapter405627' class='free_chapter' title="字数：3092;更新时间：2016-03-30 "><a href='javascript:;' id='3092@405627' onclick="readNovel('405627',this,'3092',19)" target="_blank">第19章 第十五章 不要走前面</a></div><div id='chapter405628' class='free_chapter' title="字数：3135;更新时间：2016-04-01 "><a href='javascript:;' id='3135@405628' onclick="readNovel('405628',this,'3135',20)" target="_blank">第20章 第十六章 不动歪心思</a></div><div id='chapter405864' class='vip_chapter' title="字数：3037;更新时间：2016-03-30 "><a href='javascript:;' id='3037@405864' onclick="readNovel('405864',this,'3037',21)" target="_blank">第21章 第十七章 不疼才有鬼</a></div><div id='chapter405869' class='vip_chapter' title="字数：3093;更新时间：2016-03-31 "><a href='javascript:;' id='3093@405869' onclick="readNovel('405869',this,'3093',22)" target="_blank">第22章 第十八章 夜里这么冷</a></div><div id='chapter405973' class='vip_chapter' title="字数：3086;更新时间：2016-04-01 "><a href='javascript:;' id='3086@405973' onclick="readNovel('405973',this,'3086',23)" target="_blank">第23章 第十九章 为她而止步</a></div><div id='chapter405974' class='vip_chapter' title="字数：3161;更新时间：2016-04-01 "><a href='javascript:;' id='3161@405974' onclick="readNovel('405974',this,'3161',24)" target="_blank">第24章 第二十章 你会着凉得</a></div><div id='chapter405981' class='vip_chapter' title="字数：3102;更新时间：2016-04-01 "><a href='javascript:;' id='3102@405981' onclick="readNovel('405981',this,'3102',25)" target="_blank">第25章 第二十一章 做个了结吧</a></div><div id='chapter405982' class='vip_chapter' title="字数：3067;更新时间：2016-04-02 "><a href='javascript:;' id='3067@405982' onclick="readNovel('405982',this,'3067',26)" target="_blank">第26章 第二十二章 不敢得罪你</a></div><div id='chapter405983' class='vip_chapter' title="字数：3011;更新时间：2016-04-02 "><a href='javascript:;' id='3011@405983' onclick="readNovel('405983',this,'3011',27)" target="_blank">第27章 第二十三章 你不可伤他</a></div><div id='chapter405984' class='vip_chapter' title="字数：3008;更新时间：2016-04-02 "><a href='javascript:;' id='3008@405984' onclick="readNovel('405984',this,'3008',28)" target="_blank">第28章 第二十四章 这人不是你</a></div><div id='chapter405985' class='vip_chapter' title="字数：3074;更新时间：2016-04-03 "><a href='javascript:;' id='3074@405985' onclick="readNovel('405985',this,'3074',29)" target="_blank">第29章 第二十五章 打狗看主人</a></div><div id='chapter405986' class='vip_chapter' title="字数：3123;更新时间：2016-04-03 "><a href='javascript:;' id='3123@405986' onclick="readNovel('405986',this,'3123',30)" target="_blank">第30章 第二十六章 咱有话好说</a></div><div id='chapter405987' class='vip_chapter' title="字数：3004;更新时间：2016-04-03 "><a href='javascript:;' id='3004@405987' onclick="readNovel('405987',this,'3004',31)" target="_blank">第31章 第二十七章 死并不可怕</a></div><div id='chapter405988' class='vip_chapter' title="字数：3099;更新时间：2016-04-04 "><a href='javascript:;' id='3099@405988' onclick="readNovel('405988',this,'3099',32)" target="_blank">第32章 第二十八章 这么中意你</a></div><div id='chapter405989' class='vip_chapter' title="字数：3006;更新时间：2016-04-04 "><a href='javascript:;' id='3006@405989' onclick="readNovel('405989',this,'3006',33)" target="_blank">第33章 第二十九章 非君子所为</a></div><div id='chapter405990' class='vip_chapter' title="字数：3141;更新时间：2016-04-04 "><a href='javascript:;' id='3141@405990' onclick="readNovel('405990',this,'3141',34)" target="_blank">第34章 第三十章 立下生死状</a></div><div id='chapter405991' class='vip_chapter' title="字数：3061;更新时间：2016-04-05 "><a href='javascript:;' id='3061@405991' onclick="readNovel('405991',this,'3061',35)" target="_blank">第35章 第三十一章 恶整一千遍</a></div><div id='chapter405992' class='vip_chapter' title="字数：3099;更新时间：2016-04-05 "><a href='javascript:;' id='3099@405992' onclick="readNovel('405992',this,'3099',36)" target="_blank">第36章 第三十二章 等着后悔吧</a></div><div id='chapter405993' class='vip_chapter' title="字数：3066;更新时间：2016-04-05 "><a href='javascript:;' id='3066@405993' onclick="readNovel('405993',this,'3066',37)" target="_blank">第37章 第三十三章 拿来我画押</a></div><div id='chapter405995' class='vip_chapter' title="字数：3134;更新时间：2016-04-06 "><a href='javascript:;' id='3134@405995' onclick="readNovel('405995',this,'3134',38)" target="_blank">第38章 第三十四章 不会太久得</a></div><div id='chapter405996' class='vip_chapter' title="字数：3070;更新时间：2016-04-06 "><a href='javascript:;' id='3070@405996' onclick="readNovel('405996',this,'3070',39)" target="_blank">第39章 第三十五章 唯一得选择</a></div><div id='chapter405997' class='vip_chapter' title="字数：3089;更新时间：2016-04-06 "><a href='javascript:;' id='3089@405997' onclick="readNovel('405997',this,'3089',40)" target="_blank">第40章 第三十六章 不要来找我</a></div><div id='chapter405999' class='vip_chapter' title="字数：3073;更新时间：2016-04-07 "><a href='javascript:;' id='3073@405999' onclick="readNovel('405999',this,'3073',41)" target="_blank">第41章 第三十七章 只有这个吗</a></div><div id='chapter406000' class='vip_chapter' title="字数：3092;更新时间：2016-04-07 "><a href='javascript:;' id='3092@406000' onclick="readNovel('406000',this,'3092',42)" target="_blank">第42章 第三十八章 给他占便宜</a></div><div id='chapter406002' class='vip_chapter' title="字数：3055;更新时间：2016-04-07 "><a href='javascript:;' id='3055@406002' onclick="readNovel('406002',this,'3055',43)" target="_blank">第43章 第三十九章 去河里捞去</a></div><div id='chapter406003' class='vip_chapter' title="字数：3080;更新时间：2016-04-08 "><a href='javascript:;' id='3080@406003' onclick="readNovel('406003',this,'3080',44)" target="_blank">第44章 第四十章 我喜欢得很</a></div><div id='chapter406005' class='vip_chapter' title="字数：3080;更新时间：2016-04-08 "><a href='javascript:;' id='3080@406005' onclick="readNovel('406005',this,'3080',45)" target="_blank">第45章 第四十一章 不信可试试</a></div><div id='chapter406006' class='vip_chapter' title="字数：3137;更新时间：2016-04-08 "><a href='javascript:;' id='3137@406006' onclick="readNovel('406006',this,'3137',46)" target="_blank">第46章 第四十二章 由着你糟蹋</a></div><div id='chapter406007' class='vip_chapter' title="字数：3097;更新时间：2016-04-09 "><a href='javascript:;' id='3097@406007' onclick="readNovel('406007',this,'3097',47)" target="_blank">第47章 第四十三章 胸口碎大石</a></div><div id='chapter406008' class='vip_chapter' title="字数：3003;更新时间：2016-04-09 "><a href='javascript:;' id='3003@406008' onclick="readNovel('406008',this,'3003',48)" target="_blank">第48章 第四十四章 这恐怕不妥</a></div><div id='chapter406009' class='vip_chapter' title="字数：3079;更新时间：2016-04-09 "><a href='javascript:;' id='3079@406009' onclick="readNovel('406009',this,'3079',49)" target="_blank">第49章 第四十五章 最后得时日</a></div><div id='chapter406010' class='vip_chapter' title="字数：3069;更新时间：2016-04-10 "><a href='javascript:;' id='3069@406010' onclick="readNovel('406010',this,'3069',50)" target="_blank">第50章 第四十六章 为什么是他</a></div><div id='chapter406011' class='vip_chapter' title="字数：3082;更新时间：2016-04-10 "><a href='javascript:;' id='3082@406011' onclick="readNovel('406011',this,'3082',51)" target="_blank">第51章 第四十七章 不吃白不吃</a></div><div id='chapter406012' class='vip_chapter' title="字数：3042;更新时间：2016-04-10 "><a href='javascript:;' id='3042@406012' onclick="readNovel('406012',this,'3042',52)" target="_blank">第52章 第四十八章 竟如此动人</a></div><div id='chapter406013' class='vip_chapter' title="字数：3045;更新时间：2016-04-11 "><a href='javascript:;' id='3045@406013' onclick="readNovel('406013',this,'3045',53)" target="_blank">第53章 第四十九章 什么玩意儿</a></div><div id='chapter406014' class='vip_chapter' title="字数：3016;更新时间：2016-04-11 "><a href='javascript:;' id='3016@406014' onclick="readNovel('406014',this,'3016',54)" target="_blank">第54章 第五十章 说砍就砍啊</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第2卷 绝地反击：一攻天下<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('18137','10','30670','10')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div18137'></div></div>	
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