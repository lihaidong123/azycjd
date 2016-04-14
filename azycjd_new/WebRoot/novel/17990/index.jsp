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
    <title>公子万劫不复之嫡女撩人</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="公子万劫不复之嫡女撩人,novel_pojo.guanjianci"/>
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
	<script language="javascript">var novelId='17990';</script>
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
				<div class="title_book_one" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'" style="cursor: pointer;">公子万劫不复之嫡女撩人</div>
				<div style="margin-top: 7px;">作者：<font class="tipsdex">苏易尘</font></div>
				<div>
					<span >分类:<font class="tipsdex">古代言情</font></span>
					<span style="margin-left: 40px;">章节数:<font class="tipsdex">32章</font></span>
					<span style="margin-left: 40px;">最新更新时间:<font class="tipsdex">2016-04-11 09:29:33</font></span>
					<!-- <span style="margin-left: 40px;"><a href="javascript:return;">收藏本书</a></span> -->
				</div>
			</div>
			<div id="autoBuyDiv" class="autoBuyDiv"></div>
			<div class="projects_liebiaoone">
				<div class='fen_juan_items'><div class='fen_juan_name'>第1卷 正文内容<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('18074','32','0','0')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div18074'><div id='chapter405047' class='free_chapter' title="字数：1973;更新时间：2016-04-05 "><a href='javascript:;' id='1973@405047' onclick="readNovel('405047',this,'1973',1)" target="_blank">第1章 第一章【异世之行】</a></div><div id='chapter405101' class='free_chapter' title="字数：2029;更新时间：2016-03-15 "><a href='javascript:;' id='2029@405101' onclick="readNovel('405101',this,'2029',2)" target="_blank">第2章 第二章【与夫人对峙】</a></div><div id='chapter405102' class='free_chapter' title="字数：2138;更新时间：2016-03-16 "><a href='javascript:;' id='2138@405102' onclick="readNovel('405102',this,'2138',3)" target="_blank">第3章 第三章【邵渊戎回府】</a></div><div id='chapter405177' class='free_chapter' title="字数：2027;更新时间：2016-03-17 "><a href='javascript:;' id='2027@405177' onclick="readNovel('405177',this,'2027',4)" target="_blank">第4章 第四章【一碗饭引发的怒意】</a></div><div id='chapter405185' class='free_chapter' title="字数：2049;更新时间：2016-03-18 "><a href='javascript:;' id='2049@405185' onclick="readNovel('405185',this,'2049',5)" target="_blank">第5章 第五章 【心如蛇蝎】</a></div><div id='chapter405225' class='free_chapter' title="字数：2014;更新时间：2016-03-19 "><a href='javascript:;' id='2014@405225' onclick="readNovel('405225',this,'2014',6)" target="_blank">第6章 第六章【靠山回府？】</a></div><div id='chapter405226' class='free_chapter' title="字数：2111;更新时间：2016-03-20 "><a href='javascript:;' id='2111@405226' onclick="readNovel('405226',this,'2111',7)" target="_blank">第7章 第七章【出来露个脸】</a></div><div id='chapter405280' class='free_chapter' title="字数：2067;更新时间：2016-03-21 "><a href='javascript:;' id='2067@405280' onclick="readNovel('405280',this,'2067',8)" target="_blank">第8章 第八章【有公子轩辕祁】</a></div><div id='chapter405281' class='free_chapter' title="字数：2104;更新时间：2016-03-22 "><a href='javascript:;' id='2104@405281' onclick="readNovel('405281',this,'2104',9)" target="_blank">第9章 第九章【忆往昔】</a></div><div id='chapter405415' class='free_chapter' title="字数：2077;更新时间：2016-03-23 "><a href='javascript:;' id='2077@405415' onclick="readNovel('405415',this,'2077',10)" target="_blank">第10章 第十章【梦中倩影】</a></div><div id='chapter405416' class='free_chapter' title="字数：2043;更新时间：2016-03-25 "><a href='javascript:;' id='2043@405416' onclick="readNovel('405416',this,'2043',11)" target="_blank">第11章 第十一章【嫁妆】</a></div><div id='chapter405510' class='free_chapter' title="字数：2064;更新时间：2016-03-25 "><a href='javascript:;' id='2064@405510' onclick="readNovel('405510',this,'2064',12)" target="_blank">第12章 第十二章【挑拨离间】</a></div><div id='chapter405511' class='free_chapter' title="字数：2052;更新时间：2016-03-26 "><a href='javascript:;' id='2052@405511' onclick="readNovel('405511',this,'2052',13)" target="_blank">第13章 第十三章【一瞥】</a></div><div id='chapter405537' class='free_chapter' title="字数：2020;更新时间：2016-03-27 "><a href='javascript:;' id='2020@405537' onclick="readNovel('405537',this,'2020',14)" target="_blank">第14章 第十四章【不知令妹可许配人家？】</a></div><div id='chapter405538' class='free_chapter' title="字数：2047;更新时间：2016-03-28 "><a href='javascript:;' id='2047@405538' onclick="readNovel('405538',this,'2047',15)" target="_blank">第15章 第十五章【来日再访】</a></div><div id='chapter405539' class='free_chapter' title="字数：2013;更新时间：2016-03-29 "><a href='javascript:;' id='2013@405539' onclick="readNovel('405539',this,'2013',16)" target="_blank">第16章 第十六章【挑选丫头】</a></div><div id='chapter405575' class='free_chapter' title="字数：2028;更新时间：2016-03-31 "><a href='javascript:;' id='2028@405575' onclick="readNovel('405575',this,'2028',17)" target="_blank">第17章 第十七章【那厮对妹妹不怀好意！】</a></div><div id='chapter405761' class='free_chapter' title="字数：1666;更新时间：2016-03-31 "><a href='javascript:;' id='1666@405761' onclick="readNovel('405761',this,'1666',18)" target="_blank">第18章 第十八章【上门】</a></div><div id='chapter405762' class='free_chapter' title="字数：3021;更新时间：2016-03-31 "><a href='javascript:;' id='3021@405762' onclick="readNovel('405762',this,'3021',19)" target="_blank">第19章 番外一 【往事如烟（上）】</a></div><div id='chapter405819' class='free_chapter' title="字数：3827;更新时间：2016-04-01 "><a href='javascript:;' id='3827@405819' onclick="readNovel('405819',this,'3827',20)" target="_blank">第20章 番外一 【往事如烟（下）】</a></div><div id='chapter405863' class='free_chapter' title="字数：3327;更新时间：2016-04-02 "><a href='javascript:;' id='3327@405863' onclick="readNovel('405863',this,'3327',21)" target="_blank">第21章 第十九章【勾搭轩辕祁】</a></div><div id='chapter405914' class='free_chapter' title="字数：3236;更新时间：2016-04-03 "><a href='javascript:;' id='3236@405914' onclick="readNovel('405914',this,'3236',22)" target="_blank">第22章 第二十章【将军威仪】</a></div><div id='chapter405961' class='free_chapter' title="字数：3132;更新时间：2016-04-04 "><a href='javascript:;' id='3132@405961' onclick="readNovel('405961',this,'3132',23)" target="_blank">第23章 第二十一章【咸鱼翻身？】</a></div><div id='chapter405962' class='free_chapter' title="字数：3036;更新时间：2016-04-05 "><a href='javascript:;' id='3036@405962' onclick="readNovel('405962',this,'3036',24)" target="_blank">第24章 第二十二章【夺舍之争】</a></div><div id='chapter405967' class='free_chapter' title="字数：3045;更新时间：2016-04-06 "><a href='javascript:;' id='3045@405967' onclick="readNovel('405967',this,'3045',25)" target="_blank">第25章 第二十三章【心有灵犀？】</a></div><div id='chapter406260' class='free_chapter' title="字数：3112;更新时间：2016-04-07 "><a href='javascript:;' id='3112@406260' onclick="readNovel('406260',this,'3112',26)" target="_blank">第26章 第二十四章【回忆总是带些痛】</a></div><div id='chapter406261' class='free_chapter' title="字数：3101;更新时间：2016-04-08 "><a href='javascript:;' id='3101@406261' onclick="readNovel('406261',this,'3101',27)" target="_blank">第27章 第二十五章【双双清醒】</a></div><div id='chapter406316' class='free_chapter' title="字数：3015;更新时间：2016-04-09 "><a href='javascript:;' id='3015@406316' onclick="readNovel('406316',this,'3015',28)" target="_blank">第28章 第二十六章【胜龙寺之行】</a></div><div id='chapter406317' class='free_chapter' title="字数：3044;更新时间：2016-04-10 "><a href='javascript:;' id='3044@406317' onclick="readNovel('406317',this,'3044',29)" target="_blank">第29章 第二十七章【恶毒计划】</a></div><div id='chapter406363' class='free_chapter' title="字数：3090;更新时间：2016-04-11 "><a href='javascript:;' id='3090@406363' onclick="readNovel('406363',this,'3090',30)" target="_blank">第30章 第二十八章【遇袭，英雄救美】</a></div></div></div>	
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