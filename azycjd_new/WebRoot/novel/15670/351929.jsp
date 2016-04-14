<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>（十六）欠人之情以命换 欠人之心无可偿</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/azycjs.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var readAddress='${param.readAddress}';</script>
	
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<script language="javascript">readJsp=true;</script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">var path='<%=path%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var novelId='15670';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/index/css/index.css"/>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<style type="text/css">
		img{border: none;}	
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
	<script type="text/javascript">
		var timer;
	    $(function(){
	        $(window).scroll(function(){
	            clearInterval(timer);
	            var topScroll=getScroll();
	            var topDiv="80px";
	            var top=topScroll+parseInt(topDiv);
	            timer=setInterval(function(){
	                $(".read_ds").animate({"top":top},0);
	                $(".read_left_menu").animate({"top":top},0);
	            },0)
	        });
	        
	        $(".huanfu div").click(function(){
	        	var t=$(this)[0].id.split("@");
	        	$("#novel_content").css("color","#"+t[1]).css("background-color","#"+t[0]);
	        });
	        
	        $(".replyContent").each(function(){
				$(this).slideToggle("fast");
			});
			
			$(document).bind("contextmenu",function(e){   
            	return false;   
		    });
		    $(document).bind("mousedown",function(e){   
		        if(e.which==1||e.which==3){
	        	  return false;    	
		        }
		    });
		    
		    $("#zitidiv li").click(function(){
		    	var tds=$(this)[0].id;
		    	tds=tds.substring(8,tds.length);
		    	$("#novel_content").css("font-size",tds+"px");
		    	$("#zitidivparent").html("字体["+tds+"号]");
		    	SetCookie("novel_font_size",tds);
		    	$("#zitidiv").slideUp('fast');
		    });
		    $("#beijingdiv li").click(function(){
		    	$("#novel_content").css("background-color","#"+$(this)[0].id);
		    	$("#beijingdivparent").html("背景["+$(this).html()+"]");
		    	SetCookie("novel_bg_color",$(this)[0].id);
		    	SetCookie("novel_bg_color_name",$(this).html());
		    	$("#beijingdiv").slideUp('fast');
		    });
		    var novel_font_size=getCookie("novel_font_size");
		    if(novel_font_size!=null&&novel_font_size!=undefined){
		    	$("#novel_content").css("font-size",novel_font_size+"px");
		    	$("#zitidivparent").html("字体["+novel_font_size+"号]");
		    }
		    var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#novel_content").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html("背景["+novel_bg_color_name+"]");
		    }
		    
		    if(readAddress!=''){
		    	($(window).scrollTop(parseInt(readAddress)));
		    }
		    
		    window.onkeydown=function(e){
				if(e.keyCode==39){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351929&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351929&&novelId=15670";
				}else if(e.keyCode==67){
					return false;
				}else if(e.keyCode==17){
					return false;
				}else if(e.keyCode==123){
					return false;
				}else if(e.keyCode==86){
					return false;
				}else if(e.keyCode==65){
					return false;
				}else if(e.keyCode==83){
					return false;
				}else if(e.keyCode==13){
					window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp';
				}
			}
		    
	    });
	    function getScroll(){
             var bodyTop = 0;  
             if (typeof window.pageYOffset != 'undefined') {  
                     bodyTop = window.pageYOffset;  
             } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {  
                     bodyTop = document.documentElement.scrollTop;  
             }  
             else if (typeof document.body != 'undefined') {  
                     bodyTop = document.body.scrollTop;  
             }  
             return bodyTop;
	    }
	    function loadReportReasonJsp(){
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351929+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十六）欠人之情以命换 欠人之心无可偿]</div>",
				width: 860,
				height: 600,
				top:90,
				buttons: { '关闭': true },
				closed:function(){
					$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
				}
			});	
		}
		
		function changeFontSize(num){
			var n=parseInt($("#novel_content").css("font-size"));
			n+=num;
			$("#novel_content").css("font-size",n+"px");
		}
		
		function huanfu(){
			$("#huanfu").slideToggle();
		}

		function showMulv(){
			if($("#mulvdiv")[0].style.display==""||$("#mulvdiv")[0].style.display=="none"){
				$("#mulvdiv")[0].style.display="block";
				$("#mulvdiv").animate({marginLeft:'30px'});
			}else{
				$("#mulvdiv")[0].style.display="none";
				
				$("#mulvdiv").css("margin-left","0px");
			}
		}

	</script>
  </head>
  
  <body id="body_index" style="padding:0px; margin:0px;background: center 0px no-repeat #f0f0f0;">
  	 <c:if test="${readFlag eq 'no' }">
  	 	<div class="no_read_flag_css">
  	 		该章节是VIP章节。
  	 		${errorInfo }
  	 		<a href="javascript:;" onclick="buyChapter('351929')">购买</a>
  	 	</div>
  	 </c:if>
  	 <c:if test="${readFlag eq 'yes' }">
	    <div class="read_top">
	    	<div class="huanfu" id="huanfu">
	     		<div id="f7f5ed@292927" style="background-color: #f7f5ed"></div>
	     		<div id="e1e8b2@292927" style="background-color: #e1e8b2"></div>
	     		<div id="bdebe1@292927" style="background-color: #bdebe1"></div>
	     		<div id="cfd5bb@292927" style="background-color: #cfd5bb"></div>
	     		<div id="ebd1de@292927" style="background-color: #ebd1de"></div>
	     		<div id="bfe1c6@292927" style="background-color: #bfe1c6"></div>
	     	</div>
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'">公子，请上钩</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:官秋月</div>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="zitidivparent" style="background:url(<%=request.getContextPath()%>/images/9_p_3.png) no-repeat 20px 14px;" onclick="$('#zitidiv').slideToggle('fast');">字体[12号]</div>
	    			<ul id="zitidiv">
	    				<li style="font-size: 12px;" id="fontSize12">安之<span>12号</span></li>
	    				<li style="font-size: 14px;" id="fontSize14">安之<span>14号</span></li>
	    				<li style="font-size: 16px;" id="fontSize16">安之<span>16号</span></li>
	    				<li style="font-size: 18px;" id="fontSize18">安之<span>18号</span></li>
	    				<li style="font-size: 20px;" id="fontSize20">安之<span>20号</span></li>
	    				<li style="font-size: 22px;" id="fontSize22">安之<span>22号</span></li>
	    			</ul>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="beijingdivparent" style="background:url(<%=request.getContextPath()%>/images/10_p_1.png) no-repeat 15px 11px;" onclick="$('#beijingdiv').slideToggle('fast');">背景[默认(白)]</div>
	    			<ul id="beijingdiv">
	    				<li style="background-color: #ffffff;" id="ffffff">默认(白)</li>
	    				<li style="background-color: #e1e8b2;" id="e1e8b2">浅绿</li>
	    				<li style="background-color: #bdebe1;" id="bdebe1">浅蓝</li>
	    				<li style="background-color: #cfd5bb;" id="cfd5bb">浅灰</li>
	    				<li style="background-color: #ebd1de;" id="ebd1de">小粉</li>
	    				<li style="background-color: #bfe1c6;" id="bfe1c6">青色</li>
	    			</ul>
	    		</div>
	    	</div>
	    </div>
	    <div class="read_content">
	    	<div class="read_content_left">
	    		<div class="read_left_menu" id="read_left_menu">
	    			<!-- <div id="mulvdiv">
	    				novel_chapter.chapter.menu
	    			</div>
	    			<p><a href="javascript:showMulv()">目录</a></p> -->
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351929 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351929,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第17章&nbsp;&nbsp;&nbsp;（十六）欠人之情以命换 欠人之心无可偿
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			着眼望去，南宁已在木府住了一月光景，起先是因书绘音的伤耽误了三四天，而后她想找木若涵完成任务，却被书绘音拦住，说是一定要等到木若涵临盆之后才能开始收集记忆，她刚追问了一句，就被他的一句无需多问给敷衍了，要等到临盆啊，好遥远啊。<p class='chapter_content_read_css'>现在，南宁只好老老实实在木府做个米虫。不过还好有个极其会玩的木梓，倒也不算很无聊。<p class='chapter_content_read_css'>离临盆应该还有四五天吧，南宁坐在锦鲤池边掰着手指头查日子，想着终于要结束了，心里竟有些莫名的沉重，揉揉太阳穴，不详的预感顿上眉梢，随手捡了颗石子抛到湖中，却不料砸到了对面桥上的人，她有些尴尬，站起身，低着眼不住的说抱歉。<p class='chapter_content_read_css'>只听得对面传来一阵笑声，“秦小妹，这是在发什么脾气呢？”<p class='chapter_content_read_css'>抬眼，原来是木梓，面上还有掩不住的笑，南宁真想翻个大白眼，不过她砸中的却不是木梓，而是站在他旁边的紫衣公子，南宫宁雪。<p class='chapter_content_read_css'>就在南宁愣神的时候，木梓等人就到了她面前。<p class='chapter_content_read_css'>“秦姑娘。”南宫宁雪拱拱手。<p class='chapter_content_read_css'>“南宫公子，真，真是抱歉啊。”南宁不好意思地笑笑。<p class='chapter_content_read_css'>“秦小妹，你一个人在这干嘛呢？书哥呢？”<p class='chapter_content_read_css'>“啊，书绘音他，恩，在书房呢吧。”南宁想着早晨听书绘音要找什么书来看，就应该是到书房去吧。<p class='chapter_content_read_css'>木梓听闻一笑，“那好，反正秦小妹你与南宫兄相识，就由你带南宫兄去花厅吧，我爹在那等着呢。”话音刚落，就一闪身跑远了。<p class='chapter_content_read_css'>“哎，喂！我，那个……”南宁想喊住他，他却一溜烟儿跑了个没影，南宁只好无奈的看看南宫宁雪。一个身影忽然出现在视线内。<p class='chapter_content_read_css'>“木管家。”南宁喜出望外的看着木管家。正是当初接引南宁的老者，“木管家，就麻烦您领我们去花厅了。”<p class='chapter_content_read_css'>“好，秦姑娘，公子，这边请。”<p class='chapter_content_read_css'>“有劳了。”南宫宁雪客气的颔首。<p class='chapter_content_read_css'>“南宫公子怎么会来木府？”南宁觉得气氛有些沉寂，便挑起了话题。<p class='chapter_content_read_css'>“王妃临盆在即，木老爷便请我来为王妃把脉。”南宫宁雪声音从喉咙缓缓而出，带着一种暖风的韵味，“那秦姑娘呢？”他微微一笑。<p class='chapter_content_read_css'>“我嘛，自然是来做客，当个小米虫喽，整天游手好闲的。”南宁不禁发起牢骚，“无聊死了，没有电脑，没有手机，没有WIFI，唉，整天除了给书绘音上上药，跟王妃聊聊天，翻翻话本子，玩玩木梓带来的新玩具，书绘音又不许我出府，啊，郁闷死了……”<p class='chapter_content_read_css'>南宫宁雪听她口中蹦出一个个新词，微微侧头看她，只见她眉头微微拧着，眼中闪出怨言的光，微微有些好奇，那个可以管制住她的书绘音是谁。<p class='chapter_content_read_css'>到花厅的路很近，南宁的牢骚刚发完就到了，南宁这才发觉自己说了很多无聊的话，脸上一阵尴尬，“是我失言了。”<p class='chapter_content_read_css'>他只是微微一笑，便随了木管家进厅。<p class='chapter_content_read_css'>木风早就在花厅等候，见他进来，连忙拱手施礼，南宫宁雪笑笑回礼。<p class='chapter_content_read_css'>“真是麻烦南宫公子了，给小女把脉，老夫自然会重重酬谢。”<p class='chapter_content_read_css'>“木老爷客气了，在下只拿该取的诊金，若是多拿被我师父知道了，定要训我了。”他温文而笑，取来衣蓝斜挎的医箱，“还请木老爷带路。”<p class='chapter_content_read_css'>“好，小女就在客厅等候。”	<p class='chapter_content_read_css'>客厅与花厅也不过几十步之距，就隐隐听到说话的声音。<p class='chapter_content_read_css'>南宫宁雪微微侧过身子一看，竟是木梓在高声论调，木若涵坐在木椅上，抚着肚子，无奈的笑着，南宁脸色酱红站在那里。<p class='chapter_content_read_css'>“秦小妹你这个路痴的毛病也就算了，竟然连藏书阁和书房都分不清，害我找书哥找了一大圈子，你……”<p class='chapter_content_read_css'>“梓儿，你怎么又说起南宁来了，人家是客，你怎么好意思呢？”木风打断了木梓滔滔不绝的训话。<p class='chapter_content_read_css'>南宫宁雪走进客厅才看到木若涵对面也坐着一人，正是那银发男子，他也注意到南宫宁雪的注视，抬眼看了他一眼，站起身，看向木梓，“南宁一向如此，也怪我没有说清楚，倒是如果把墨阁的牌子换成藏书阁，说不定她就晓得了。你有什么事找我，外面来谈。”说着扯南宁一块出去，木梓赶忙跟在身后。<p class='chapter_content_read_css'>“拜见王妃。”南宫宁雪只行拱手礼，木若涵收敛了笑，“南宫神医何必多礼呢？能请来南宫神医应当是本王妃的荣幸。”<p class='chapter_content_read_css'>“王妃谬赞了，还请王妃伸出手来。”说着从医箱中拿出脉枕放在木桌边，落座到旁边，将三指按到脉搏上，屏气凝神，木风静悄悄地坐到对面，眼睛直观察着他面上的表情，木若涵心中一慌，他微微一笑，“王妃莫要紧张。”<p class='chapter_content_read_css'>不过一会儿，他就收住手，将脉枕收回医箱，“王妃脉相有些异动，临盆之期便在这几天，还望王妃切莫劳心动气，不然王妃却有血崩之祸，腹中胎儿也难言可以保住。”<p class='chapter_content_read_css'>一听此言，木若涵和木风脸色皆是一变，“那南宫公子可有……”<p class='chapter_content_read_css'>“恕我冒昧一问，王妃可曾服过含有红花麝香之类的药物？”听到此问，木若涵的脸色更是惨白，颤巍巍的点了点头。<p class='chapter_content_read_css'>“那便是了，是那药物积在王妃体中，慢慢深入胎中，造此祸患。已接近临盆，无论吃何药都已无济于事，也只能……”<p class='chapter_content_read_css'>“不，南宫神医只要一副药就好，只要能保住这个孩子的药。”<p class='chapter_content_read_css'>南宫宁雪霎时明白她所说是何药，眼帘一颤，还未出口，木风便大声喝道：“若涵，你疯了吗！”<p class='chapter_content_read_css'>“爹，这是我们木家欠他的。”她嘴角漫上一丝苦笑，抚上肚子。<p class='chapter_content_read_css'>“你……那也不该由你偿还，”木风看向南宫宁雪，“南宫公子，小女的话莫要放在心上，还请你在府中住下，以免……”<p class='chapter_content_read_css'>“在下明白，不到迫不得已，还毋须做出舍一的选择，情况未必会很糟。”他展颜一笑，端起桌上刚倒上的茶，抿了一口，“适才我只是道出最坏的情况罢了。”<p class='chapter_content_read_css'>“若涵，你先回房吧。”木风看了一眼他的眼神，便明了。<p class='chapter_content_read_css'>“是，我去瞧瞧梓儿他们。”说着便有贴身的丫鬟扶她出去。<p class='chapter_content_read_css'>“南宫公子还有话说？”<p class='chapter_content_read_css'>他定了定神，略顿：“在下只是想打听一下刚才的那位秦姑娘和银发的公子，是何许人也？”<p class='chapter_content_read_css'>木风听言，心中一惊。<p class='chapter_content_read_css'>怎么会？他怎么会问起这个？<p class='chapter_content_read_css'><p class='chapter_content_read_css'>情会刚过不过数日，衣蓝便带来了他所布下去的信儿。<p class='chapter_content_read_css'>衣蓝从未先看过信中内容，但依旧要开封检查，南宫宁雪只是笑笑他：“我大小也是行医之人，怎么会中他人之毒？你也是太过小心了。”<p class='chapter_content_read_css'>“公子还是谨慎些好，大公子那边……阁中之人或许就有……”<p class='chapter_content_read_css'>“我自是知晓。”他面色一冷，抽开信纸，眼神一凝，“陌雪阁最近办事越来越不尽心了。”说着将信交给衣蓝，衣蓝扫了一眼，想着拿水来，“不必了，这信就是普普通通的信，并未做手脚。”原本就是空白一片。<p class='chapter_content_read_css'>再打开另一封，面色愈发沉重，“莫非是大哥那边插了一脚。”<p class='chapter_content_read_css'>秦南宁，只道无。<p class='chapter_content_read_css'>银发男子，只道并非宫珀。<p class='chapter_content_read_css'>“公子，这里还有一封。”说着从袖中又取出一封。<p class='chapter_content_read_css'>展开看来，只是宫珀的身世背景，将信纸一扫，这宫珀，就算陌雪阁不查他也知道的无比清楚。<p class='chapter_content_read_css'>宫珀乃三王爷宫凌独子，出生时便天生异象，数只银色灵狐和火色狐狸围着王府飞奔一昼夜后入王妃寝室眺望，王妃诞一麟儿，竟是毫不大哭，任凭产婆肆意拍打。虽是不哭，但也平安成活下来，直至不断长大才显出异象，他所生之发乃为银白发，眼瞳也逐渐变为琥珀色，显露出不同于平常小儿的怪异行径。<p class='chapter_content_read_css'>他脾气十分冷淡，常常甩掉看护的侍女爬到房顶、树上，独自一人眺望远方，一待便是一天，也极其挑嘴，这不吃，那不吃，说话极少，偶尔说一句也跟大人的语气无两样，只穿蓝色的衣服，极其喜洁，不喜他人触碰。<p class='chapter_content_read_css'>长到八岁之时便害了病离世，他只隐隐听说原先先是失踪，等找回来之后就害了不治之症，一命呜呼，那时还闹得满城风雨，即使宫珀甚是怪异，但三王爷夫妇也对他疼爱非常，自然丧子痛甚，更何况，那是他们的独子，直至后来，王妃抑郁而死，三王爷也退回封地再无音讯。<p class='chapter_content_read_css'>这世间少年银发，琥珀眼瞳之人除宫珀之外，还会有何人？<p class='chapter_content_read_css'>“当年，宫珀确实下葬？”南宫宁雪将信纸一收，连同信封一起烧掉。<p class='chapter_content_read_css'>“确实，阁中的云鸟乃为三王府旧侍女，曾亲眼看着三王爷将宫珀尸身放入棺内下葬，错不了。”<p class='chapter_content_read_css'>“难不成，是有人把他从棺木中挖出不成？”南宫宁雪看向衣蓝，衣蓝一低头，低眉沉声道，“就算有人将他尸身挖出，也不可能救活，除非是，诈死。”<p class='chapter_content_read_css'>“诈死？他堂堂一个世子，拥有无数权利荣华富贵，而且又是一个童稚小儿，哪来的心机想到诈死？”南宫宁雪忽而想到那偷取南宁东西的人，“莫不是国师？”<p class='chapter_content_read_css'>“国师早在十二年前就失踪了，他门下也并无徒弟。”衣蓝抬眸，仔细回想。<p class='chapter_content_read_css'>“算了，此事先搁一搁吧。”<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351929&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351929&&novelId=15670'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')"/>
	    		</div>
	    	</div>
	    </div>
  	 </c:if>
     

    <div class="read_foot">
   		<p style="padding-top: 43px;">Copyright 2006-2012&nbsp;&nbsp;
   			 www.azycjd.com &nbsp;&nbsp;
   			  All Rights Reserved&nbsp;&nbsp;
   			   版权所有&nbsp;&nbsp;
   			    云南安柔科技有限公司
   		</p>
   		<p>
   			滇ICP备12006807号-1 &nbsp;&nbsp;滇网文许字【2014】1100-002号
   		</p>
    </div>
  </body>
</html>
