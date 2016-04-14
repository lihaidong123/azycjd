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
	<meta http-equiv="keywords" content="公子，请上钩,novel_pojo.guanjianci"/>
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
	<script language="javascript">var novelId='15670';</script>
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
				<div class="title_book_one" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'" style="cursor: pointer;">公子，请上钩</div>
				<div style="margin-top: 7px;">作者：<font class="tipsdex">官秋月</font></div>
				<div>
					<span >分类:<font class="tipsdex">古代言情</font></span>
					<span style="margin-left: 40px;">章节数:<font class="tipsdex">82章</font></span>
					<span style="margin-left: 40px;">最新更新时间:<font class="tipsdex">2016-04-11 09:44:42</font></span>
					<!-- <span style="margin-left: 40px;"><a href="javascript:return;">收藏本书</a></span> -->
				</div>
			</div>
			<div id="autoBuyDiv" class="autoBuyDiv"></div>
			<div class="projects_liebiaoone">
				<div class='fen_juan_items'><div class='fen_juan_name'>第1卷 正文内容<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('15670','1','0','0')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div15670'><div id='chapter351913' class='free_chapter' title="字数：2678;更新时间：2016-02-21 "><a href='javascript:;' id='2678@351913' onclick="readNovel('351913',this,'2678',1)" target="_blank">第1章 前记</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第2卷 第一章：初始之来<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('17969','13','0','0')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div17969'><div id='chapter351914' class='free_chapter' title="字数：3031;更新时间：2016-01-30 "><a href='javascript:;' id='3031@351914' onclick="readNovel('351914',this,'3031',2)" target="_blank">第2章 （一）巧入十三尘世中 自道原是故人来</a></div><div id='chapter351915' class='free_chapter' title="字数：3068;更新时间：2016-01-30 "><a href='javascript:;' id='3068@351915' onclick="readNovel('351915',this,'3068',3)" target="_blank">第3章 （二）夜探假石后密室 古华苑中取魂来</a></div><div id='chapter351916' class='free_chapter' title="字数：3042;更新时间：2016-01-30 "><a href='javascript:;' id='3042@351916' onclick="readNovel('351916',this,'3042',4)" target="_blank">第4章 （三）信中现拼音字母 玉湖知穿越真相</a></div><div id='chapter351917' class='free_chapter' title="字数：2589;更新时间：2016-01-30 "><a href='javascript:;' id='2589@351917' onclick="readNovel('351917',this,'2589',5)" target="_blank">第5章 （四）匆匆离去为厨娘 春言兰阁西闹鬼</a></div><div id='chapter351918' class='free_chapter' title="字数：2171;更新时间：2016-01-30 "><a href='javascript:;' id='2171@351918' onclick="readNovel('351918',this,'2171',6)" target="_blank">第6章 （五）君骑竹马来迎妾 君妾早已为陌人</a></div><div id='chapter351919' class='free_chapter' title="字数：3767;更新时间：2016-01-30 "><a href='javascript:;' id='3767@351919' onclick="readNovel('351919',this,'3767',7)" target="_blank">第7章 （六）琴棋书画诗酒花 红衣笑颜夜凝花</a></div><div id='chapter351920' class='free_chapter' title="字数：3164;更新时间：2016-01-30 "><a href='javascript:;' id='3164@351920' onclick="readNovel('351920',this,'3164',8)" target="_blank">第8章 （七）阴司之花开才情 才情会上惹是非</a></div><div id='chapter351921' class='free_chapter' title="字数：2546;更新时间：2016-01-30 "><a href='javascript:;' id='2546@351921' onclick="readNovel('351921',this,'2546',9)" target="_blank">第9章 （八）半生缘起半生落 岁事浮沉已成烟</a></div><div id='chapter351922' class='free_chapter' title="字数：2504;更新时间：2016-01-30 "><a href='javascript:;' id='2504@351922' onclick="readNovel('351922',this,'2504',10)" target="_blank">第10章 （九）未何以欢何以幻 亦不曾欢不曾欢</a></div><div id='chapter351923' class='free_chapter' title="字数：2551;更新时间：2016-01-30 "><a href='javascript:;' id='2551@351923' onclick="readNovel('351923',this,'2551',11)" target="_blank">第11章 （十）萤湖凉亭铃铛下 故人之情愁奈何</a></div><div id='chapter351924' class='free_chapter' title="字数：2724;更新时间：2016-01-30 "><a href='javascript:;' id='2724@351924' onclick="readNovel('351924',this,'2724',12)" target="_blank">第12章 （十一）茶楼之中遇棋手 一朝棋子定钟情</a></div><div id='chapter351925' class='free_chapter' title="字数：2459;更新时间：2016-01-30 "><a href='javascript:;' id='2459@351925' onclick="readNovel('351925',this,'2459',13)" target="_blank">第13章 （十二）一记忘川病自去 各自天涯两分隔</a></div><div id='chapter351926' class='free_chapter' title="字数：3311;更新时间：2016-01-30 "><a href='javascript:;' id='3311@351926' onclick="readNovel('351926',this,'3311',14)" target="_blank">第14章 （十三）回不回去的一切 回又回去的一切</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第3卷 第二章：幽鸣之殇<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('17970','10','12252','4')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div17970'><div id='chapter351927' class='free_chapter' title="字数：3351;更新时间：2016-01-30 "><a href='javascript:;' id='3351@351927' onclick="readNovel('351927',this,'3351',15)" target="_blank">第15章 （十四）瓦肆之间道途说 初入木府人皆惊</a></div><div id='chapter351928' class='free_chapter' title="字数：3403;更新时间：2016-01-30 "><a href='javascript:;' id='3403@351928' onclick="readNovel('351928',this,'3403',16)" target="_blank">第16章 （十五）谁人为情而伤逃 真真假假难分辨</a></div><div id='chapter351929' class='free_chapter' title="字数：3131;更新时间：2016-01-30 "><a href='javascript:;' id='3131@351929' onclick="readNovel('351929',this,'3131',17)" target="_blank">第17章 （十六）欠人之情以命换 欠人之心无可偿</a></div><div id='chapter351930' class='free_chapter' title="字数：3498;更新时间：2016-01-30 "><a href='javascript:;' id='3498@351930' onclick="readNovel('351930',this,'3498',18)" target="_blank">第18章 （十七）身世浮沉雨打萍 夜凝之巅徒伤情</a></div><div id='chapter351931' class='free_chapter' title="字数：3054;更新时间：2016-01-30 "><a href='javascript:;' id='3054@351931' onclick="readNovel('351931',this,'3054',19)" target="_blank">第19章 （十八）叶落归根为故乡 何曾相识木槿落</a></div><div id='chapter351932' class='free_chapter' title="字数：3606;更新时间：2016-01-30 "><a href='javascript:;' id='3606@351932' onclick="readNovel('351932',this,'3606',20)" target="_blank">第20章 （十九）喜讯传耳未觉喜 悲情只是无限淡</a></div><div id='chapter351933' class='vip_chapter' title="字数：3012;更新时间：2015-08-29 "><a href='javascript:;' id='3012@351933' onclick="readNovel('351933',this,'3012',21)" target="_blank">第21章 （二十）繁华三千往事近 忆中梦境何为真</a></div><div id='chapter351934' class='vip_chapter' title="字数：3042;更新时间：2015-08-29 "><a href='javascript:;' id='3042@351934' onclick="readNovel('351934',this,'3042',22)" target="_blank">第22章 （二十一）梦之局缠缠绵绵 择不情愿的威胁</a></div><div id='chapter351935' class='vip_chapter' title="字数：3108;更新时间：2015-08-29 "><a href='javascript:;' id='3108@351935' onclick="readNovel('351935',this,'3108',23)" target="_blank">第23章 （二十二）信或不信的执念  吃或被吃的的命运</a></div><div id='chapter351936' class='vip_chapter' title="字数：3090;更新时间：2015-08-29 "><a href='javascript:;' id='3090@351936' onclick="readNovel('351936',this,'3090',24)" target="_blank">第24章 （二十三）早已做好的决定 早就下定的决心</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第4卷 第三章：须臾之梦<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('17971','10','31768','10')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div17971'><div id='chapter351937' class='vip_chapter' title="字数：3314;更新时间：2015-08-29 "><a href='javascript:;' id='3314@351937' onclick="readNovel('351937',this,'3314',25)" target="_blank">第25章 （二十四）地情险盲一樱山 危险重重遇打劫</a></div><div id='chapter351938' class='vip_chapter' title="字数：3195;更新时间：2015-08-29 "><a href='javascript:;' id='3195@351938' onclick="readNovel('351938',this,'3195',26)" target="_blank">第26章 （二十五）秘密伪装突生变 原是故人在此间</a></div><div id='chapter351939' class='vip_chapter' title="字数：3261;更新时间：2015-08-29 "><a href='javascript:;' id='3261@351939' onclick="readNovel('351939',this,'3261',27)" target="_blank">第27章 （二十六）最为温柔的回忆 最为苦涩的回忆</a></div><div id='chapter351940' class='vip_chapter' title="字数：3275;更新时间：2015-08-29 "><a href='javascript:;' id='3275@351940' onclick="readNovel('351940',this,'3275',28)" target="_blank">第28章 （二十七）往事云烟已成灰 你我不必再纠葛</a></div><div id='chapter351941' class='vip_chapter' title="字数：3057;更新时间：2015-08-29 "><a href='javascript:;' id='3057@351941' onclick="readNovel('351941',this,'3057',29)" target="_blank">第29章 （二十八）迷雾之间拨迷雾 面具之后为面具</a></div><div id='chapter351942' class='vip_chapter' title="字数：3333;更新时间：2015-08-29 "><a href='javascript:;' id='3333@351942' onclick="readNovel('351942',this,'3333',30)" target="_blank">第30章 （二十九）逃离逃离快逃离 相遇相遇快相遇</a></div><div id='chapter351943' class='vip_chapter' title="字数：3052;更新时间：2015-08-29 "><a href='javascript:;' id='3052@351943' onclick="readNovel('351943',this,'3052',31)" target="_blank">第31章 （三十）素色罗衫的意外 出乎意料的绝对</a></div><div id='chapter351944' class='vip_chapter' title="字数：3007;更新时间：2015-08-29 "><a href='javascript:;' id='3007@351944' onclick="readNovel('351944',this,'3007',32)" target="_blank">第32章 （三十一）一众胭脂粉扑香 半截断木魂开散</a></div><div id='chapter351945' class='vip_chapter' title="字数：3088;更新时间：2015-08-29 "><a href='javascript:;' id='3088@351945' onclick="readNovel('351945',this,'3088',33)" target="_blank">第33章 （三十二）师父指示是救人 命定缘分遇见你</a></div><div id='chapter351946' class='vip_chapter' title="字数：3186;更新时间：2015-08-29 "><a href='javascript:;' id='3186@351946' onclick="readNovel('351946',this,'3186',34)" target="_blank">第34章 （三十三）寺院求安遇贵人 孚城之岛来新人</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第5卷 第四章：百花之妄<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('17972','8','24575','8')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div17972'><div id='chapter351947' class='vip_chapter' title="字数：3076;更新时间：2015-08-29 "><a href='javascript:;' id='3076@351947' onclick="readNovel('351947',this,'3076',35)" target="_blank">第35章 （三十四）信中秘密唯你知 我的心意有谁知</a></div><div id='chapter351948' class='vip_chapter' title="字数：3038;更新时间：2015-08-29 "><a href='javascript:;' id='3038@351948' onclick="readNovel('351948',this,'3038',36)" target="_blank">第36章 （三十五）出逃再入陷阱中 浮船千渡入滦城</a></div><div id='chapter351949' class='vip_chapter' title="字数：3132;更新时间：2015-08-29 "><a href='javascript:;' id='3132@351949' onclick="readNovel('351949',this,'3132',37)" target="_blank">第37章 （三十六）伪装还是心情糟 真相自在迷雾中</a></div><div id='chapter351950' class='vip_chapter' title="字数：3029;更新时间：2015-08-29 "><a href='javascript:;' id='3029@351950' onclick="readNovel('351950',this,'3029',38)" target="_blank">第38章 （三十七）宫珩我就要逃婚 阿南我对不起你</a></div><div id='chapter351951' class='vip_chapter' title="字数：3066;更新时间：2015-08-29 "><a href='javascript:;' id='3066@351951' onclick="readNovel('351951',this,'3066',39)" target="_blank">第39章 （三十八）真失忆是假失忆 假戏又或是真做</a></div><div id='chapter351952' class='vip_chapter' title="字数：3059;更新时间：2015-08-29 "><a href='javascript:;' id='3059@351952' onclick="readNovel('351952',this,'3059',40)" target="_blank">第40章 （三十九）仙城大雪降人间 晏家惨遭灭门祸</a></div><div id='chapter351953' class='vip_chapter' title="字数：3074;更新时间：2015-09-26 "><a href='javascript:;' id='3074@351953' onclick="readNovel('351953',this,'3074',41)" target="_blank">第41章 （四十）怕或不怕只因你 死与不死已无谓</a></div><div id='chapter351954' class='vip_chapter' title="字数：3101;更新时间：2015-09-27 "><a href='javascript:;' id='3101@351954' onclick="readNovel('351954',this,'3101',42)" target="_blank">第42章 （四十一）若曾相识白木槿 何曾见过火牡丹</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第6卷 第五章：海岛之国<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('17973','24','58880','24')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div17973'><div id='chapter351955' class='vip_chapter' title="字数：3139;更新时间：2015-09-28 "><a href='javascript:;' id='3139@351955' onclick="readNovel('351955',this,'3139',43)" target="_blank">第43章 （四十二）两舟共渡风云起 一舟直航入风铃</a></div><div id='chapter351956' class='vip_chapter' title="字数：3072;更新时间：2015-09-29 "><a href='javascript:;' id='3072@351956' onclick="readNovel('351956',this,'3072',44)" target="_blank">第44章 （四十三）鱼翔浅底祝生辰 巧做蛋糕乐融融</a></div><div id='chapter351957' class='vip_chapter' title="字数：3023;更新时间：2015-09-30 "><a href='javascript:;' id='3023@351957' onclick="readNovel('351957',this,'3023',45)" target="_blank">第45章 （四十四）偷吃药被发现啦 登徒子你干什么</a></div><div id='chapter351958' class='vip_chapter' title="字数：3243;更新时间：2015-10-01 "><a href='javascript:;' id='3243@351958' onclick="readNovel('351958',this,'3243',46)" target="_blank">第46章 番外之告白（1）</a></div><div id='chapter351959' class='vip_chapter' title="字数：3193;更新时间：2015-10-02 "><a href='javascript:;' id='3193@351959' onclick="readNovel('351959',this,'3193',47)" target="_blank">第47章 番外之告白（2）</a></div><div id='chapter351960' class='vip_chapter' title="字数：2025;更新时间：2015-10-02 "><a href='javascript:;' id='2025@351960' onclick="readNovel('351960',this,'2025',48)" target="_blank">第48章 番外之告白（3）</a></div><div id='chapter351961' class='vip_chapter' title="字数：2388;更新时间：2015-10-02 "><a href='javascript:;' id='2388@351961' onclick="readNovel('351961',this,'2388',49)" target="_blank">第49章 番外之告白（4）</a></div><div id='chapter351962' class='vip_chapter' title="字数：2075;更新时间：2015-10-17 "><a href='javascript:;' id='2075@351962' onclick="readNovel('351962',this,'2075',50)" target="_blank">第50章 （四十五）晕车药中现辣椒 无奈晕船错笄礼</a></div><div id='chapter351963' class='vip_chapter' title="字数：2056;更新时间：2015-11-01 "><a href='javascript:;' id='2056@351963' onclick="readNovel('351963',this,'2056',51)" target="_blank">第51章 （四十六）风大小姐患病之 断崖之处寻百草</a></div><div id='chapter351964' class='vip_chapter' title="字数：3201;更新时间：2015-11-14 "><a href='javascript:;' id='3201@351964' onclick="readNovel('351964',this,'3201',52)" target="_blank">第52章 （四十七）崖壁底险象求生 坐等三日待生机</a></div><div id='chapter351965' class='vip_chapter' title="字数：2416;更新时间：2015-11-15 "><a href='javascript:;' id='2416@351965' onclick="readNovel('351965',this,'2416',53)" target="_blank">第53章 （四十八）阴雨连绵怪事生 一口热汤差劫命</a></div><div id='chapter351966' class='vip_chapter' title="字数：2218;更新时间：2015-11-15 "><a href='javascript:;' id='2218@351966' onclick="readNovel('351966',this,'2218',54)" target="_blank">第54章 （四十九）大雨磅礴天外天 三生石上曾留名</a></div><div id='chapter351967' class='vip_chapter' title="字数：2209;更新时间：2015-11-29 "><a href='javascript:;' id='2209@351967' onclick="readNovel('351967',this,'2209',55)" target="_blank">第55章 （五十）崖底放晴百草现 暧昧丛生惹尴尬</a></div><div id='chapter351968' class='vip_chapter' title="字数：2084;更新时间：2015-12-13 "><a href='javascript:;' id='2084@351968' onclick="readNovel('351968',this,'2084',56)" target="_blank">第56章 （五十一）故人来去唯绘知 不知红颜心难得 </a></div><div id='chapter403359' class='vip_chapter' title="字数：2189;更新时间：2016-02-09 "><a href='javascript:;' id='2189@403359' onclick="readNovel('403359',this,'2189',57)" target="_blank">第57章 （五十二）荒野之地现村落 阿音自是阿绘妹</a></div><div id='chapter403390' class='vip_chapter' title="字数：2094;更新时间：2016-02-15 "><a href='javascript:;' id='2094@403390' onclick="readNovel('403390',this,'2094',58)" target="_blank">第58章 （五十三）强人所掳为小姐 百草奇用现显神</a></div><div id='chapter403391' class='vip_chapter' title="字数：2184;更新时间：2016-02-22 "><a href='javascript:;' id='2184@403391' onclick="readNovel('403391',this,'2184',59)" target="_blank">第59章 （五十四）风府小姐藏秘密 珍惜宝物何处寻</a></div><div id='chapter403441' class='vip_chapter' title="字数：2138;更新时间：2016-02-29 "><a href='javascript:;' id='2138@403441' onclick="readNovel('403441',this,'2138',60)" target="_blank">第60章 （五十五）春心初动倾冷雨 桃花公子引人来</a></div><div id='chapter403442' class='vip_chapter' title="字数：2180;更新时间：2016-03-07 "><a href='javascript:;' id='2180@403442' onclick="readNovel('403442',this,'2180',61)" target="_blank">第61章 （五十六）一计方知入险境 再计已是花明时</a></div><div id='chapter403443' class='vip_chapter' title="字数：2088;更新时间：2016-03-14 "><a href='javascript:;' id='2088@403443' onclick="readNovel('403443',this,'2088',62)" target="_blank">第62章 （五十七）七孔洞中现神女 毒花圣草暗中藏</a></div><div id='chapter403613' class='vip_chapter' title="字数：2408;更新时间：2016-03-21 "><a href='javascript:;' id='2408@403613' onclick="readNovel('403613',this,'2408',63)" target="_blank">第63章 （五十八）蓝色海神动人魄 湛蓝礼服裙拂扬</a></div><div id='chapter403614' class='vip_chapter' title="字数：2171;更新时间：2016-03-28 "><a href='javascript:;' id='2171@403614' onclick="readNovel('403614',this,'2171',64)" target="_blank">第64章 （五十九）巧设心计盼情动 初心已认差姻缘</a></div><div id='chapter403615' class='vip_chapter' title="字数：2456;更新时间：2016-03-31 "><a href='javascript:;' id='2456@403615' onclick="readNovel('403615',this,'2456',65)" target="_blank">第65章 （六十）今日尘世妄非断 闺蜜成仇只为情</a></div><div id='chapter403616' class='vip_chapter' title="字数：2630;更新时间：2016-04-04 "><a href='javascript:;' id='2630@403616' onclick="readNovel('403616',this,'2630',66)" target="_blank">第66章 （六十一）可怜绣球祸端惹 大浪滔天覆航船</a></div></div></div><div class='fen_juan_items'><div class='fen_juan_name'>第7卷 第六章：双荷之怨<span class='buyFenJuan'><a href='javascript:;' onclick="buyFenJuan('18119','16','50949','16')">整卷购买</a></span></div><div class='chapter_div' id='chapter_div18119'><div id='chapter405607' class='vip_chapter' title="字数：2068;更新时间：2016-04-11 "><a href='javascript:;' id='2068@405607' onclick="readNovel('405607',this,'2068',67)" target="_blank">第67章 （六十二）小小鱼竿为法宝 君玄观中十四娘</a></div></div></div>	
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