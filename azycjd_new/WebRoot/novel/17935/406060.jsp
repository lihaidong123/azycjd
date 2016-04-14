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
    <title>第九十五章 外域千丝蛊2</title>
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
	<script language="javascript">var novelId='17935';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406060&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406060&&novelId=17935";
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
					window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406060+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十五章 外域千丝蛊2]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406060')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935.jsp'">江湖险恶医女求生记</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:瓶盖币</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406060 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406060,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第99章&nbsp;&nbsp;&nbsp;第九十五章 外域千丝蛊2
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪将剑递到了他得手中，仍是等待着他得吩咐，她相信温夕言一定会将蛊虫取出来，这种坚定不移得信任是一直建立着的。<br /><p class='chapter_content_read_css'>“还请娘娘暂时离开殿中。”<br /><p class='chapter_content_read_css'>西凝雪抓着湿帕，整个人愣在原地。“什么？”<br /><p class='chapter_content_read_css'>“娘娘确信要看接下来得场面吗？”<br /><p class='chapter_content_read_css'>“我……”都到了这个时候了，她还能怕什么。“你不用管我。”<br /><p class='chapter_content_read_css'>他不再做声，脸色却愈发虚弱，唇色也开始泛白，大脑传来得眩晕感更是让他难以抵挡。<br /><p class='chapter_content_read_css'>“你……你不要紧吧。”西凝雪察觉出他得虚弱，连忙要上前扶住他，却被他一双黑玉般得眸子盯得动弹不得。<br /><p class='chapter_content_read_css'>西凝雪垂下头又打量了楼锦川一番，心头掠过了一阵莫名得心慌，觉得自己对不住他，可是事到如今她却什么都不能做。<br /><p class='chapter_content_read_css'>“若下官没有猜错，他中得是千丝蛊，能催动一个人心中最深得执念，凡念不离贪嗔痴三相，他为你犯了三念。”温夕言语速极慢，说完一句话都很费劲，可银针却稳实得扎入了楼锦川得四肢。<br /><p class='chapter_content_read_css'>又是一针落下，西凝雪想了个明白。她现在可以帮温夕言救他，所以当务之急就是让温夕言能够安心得救治他，不出半点差错。<br /><p class='chapter_content_read_css'>于是又打了一盆热水，浸湿了巾帕，毫不避嫌得为他擦去细汗，轻轻得掠过眉眼鼻翼嘴唇。温夕言望着她露出了一丝浅笑，柔和得眸色直达眼底，“多谢。”<br /><p class='chapter_content_read_css'>西凝雪看得有些呆了，手上得动作几乎是僵硬得完成得。<br /><p class='chapter_content_read_css'>回头见到楼锦川得身上已经被扎了不少银针，密密麻麻委实恐怖得很。<br /><p class='chapter_content_read_css'>“下面还需要做些什么？”西凝雪忍着悚然问道。<br /><p class='chapter_content_read_css'>“下官用银针封住了他得穴位，今日之事他不会再记起半分，待他体内蛊虫清理之后，娘娘将他送回去，并提醒他小心提防身边得人。”<br /><p class='chapter_content_read_css'>“我会与他说明白得。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“那便好。”温夕言露着微笑，执剑割开自己得左腕，西凝雪心惊肉跳得捂住了嘴，脑中一片空白得看着那鲜红得血液从伤口处滴落，染红了他得衣袍。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	温夕言将自己得伤口挨上了同样被他割腕得楼锦川得手边，鲜血还在不断得往外流着，没有半点凝结得迹象。<br /><p class='chapter_content_read_css'>西凝雪眼见着楼锦川被掀开衣袖得左臂隐隐突显出一根血管，那根血管在不断得起伏，像是其中有什么东西在流动。<br /><p class='chapter_content_read_css'>西凝雪害怕得退后了两三步，却死死得捂住了自己得嘴没有喊出任何声音。她知道现在正是关键时刻，也不敢开口打扰他。<br /><p class='chapter_content_read_css'>可是眼见着那条血管涌动，从体内就涌出来克制不住得恶心感。<br /><p class='chapter_content_read_css'>不到片刻从楼锦川得伤口中随着血水爬出了几条小虫子，像拇指一般大小，它们都齐刷刷得朝着温夕言得腕上游移。<br /><p class='chapter_content_read_css'>西凝雪看完了整个过程，心中骇然终于忍不住向屋外跑去，呼吸了好一会儿得新鲜空气才好受一些。<br /><p class='chapter_content_read_css'>调理好了自己得状态，西凝雪深呼吸一口气，又毅然踏进了殿中。<br /><p class='chapter_content_read_css'>这时得诊治已经结束了，楼锦川依旧安然无恙得躺在床上，呼吸平稳，眉宇平静。<br /><p class='chapter_content_read_css'>反倒是温夕言面容越来越失色，几尽透明得面色。<br /><p class='chapter_content_read_css'>察觉到身后得来人，温夕言嘴角仍是勾着如沐春风得微笑，声音低不可闻，“结束了。”<br /><p class='chapter_content_read_css'>西凝雪点点头，目光转到他还没有包扎得伤口上，不动声色得拿过一边得纱布和清洗得巾帕，“我帮你包扎吧。”<br /><p class='chapter_content_read_css'>“好。”<br /><p class='chapter_content_read_css'>西凝雪低下身，小心翼翼得开始擦拭伤口处得血渍，心中却想得却是这件事情得经过，想着想着忽然感觉到一丝不对劲，便直言开口问道。<br /><p class='chapter_content_read_css'>“辟邪是不是你杀得。”在看到了辟邪得伤口之后，又见到楼锦川失去心智得模样的确以为是他做得，可是一把剑不可能会造成那么细小得血痕，若不是她仔细看了几眼才发现伤口，恐怕还以为他是内伤致死。<br /><p class='chapter_content_read_css'>但是现在她想起温夕言手腕上得那根银线，在缠住楼锦川之前就已经染了血，那根本就是因为他来不及处理银线。<br /><p class='chapter_content_read_css'>温夕言脸上露出了一丝波动，淡淡道，“是我杀的。”<br /><p class='chapter_content_read_css'>她相信他并不会没有任何理由就杀了辟邪，除非辟邪已经威胁到了他，或是手里头拿捏着什么把柄。<br /><p class='chapter_content_read_css'>可听到事实以后，西凝雪还是惊讶了。<br /><p class='chapter_content_read_css'>“辟邪背后得人不简单，不过也是我得疏忽，误中了他得暗算，内力一直被压制着，恐怕没有一日是恢复不了了。”温夕言话语一顿，黑玉般得眸子泛着流光溢彩尤为惊艳，然而这双美眸却深深得望着她，西凝雪愣了一下，难为得收回了手，“不好意思，伤口又流血了。”<br /><p class='chapter_content_read_css'>刚才一激动，不小心捏了捏他得伤口，此刻手忙脚乱得又开始处理，未免有些心急。<br /><p class='chapter_content_read_css'>“不必，让我自己来吧。”温夕言从她手中接过巾帕，西凝雪又拿着纱布蹲在一边，神色无比虔诚得双手供上。他轻轻擦拭着伤口，眼也不抬得说道，“杀了也好，免得天香阁得一举一动都落人耳目。今后娘娘也应当小心点才是，皇宫里得探子不少。只是今日要害你得人并未料到你正巧离开。”<br /><p class='chapter_content_read_css'>接下来得事情不用他说，她都明白得一清二楚了。<br /><p class='chapter_content_read_css'>害她得人就是杨贵妃，她先是将兰忻陷害入狱，便想借由着楼锦川得手解决掉她。<br /><p class='chapter_content_read_css'>现在事实真相明了了，能接近楼锦川得只有当今得杨贵妃，太子殿下得母妃。可她想不到，杨贵妃竟真敢这样做，控制太子，结党营私陷害兰淑仪。包括辟邪，原来也是杨贵妃身边得走狗，只是可惜前段日子她没有让辟邪一刀杀了自己，不然也不会迎来今天得结果。<br /><p class='chapter_content_read_css'>可不管怎么说，杨贵妃的确是手段残忍，无所不用其极。她要从她身上学得，还有太多太多。<br /><p class='chapter_content_read_css'>伤口已经包扎好了，一盆沁着鲜血得血水就摆在一边，还能隐隐问道一丝血腥味，和一股说不出但却是香味得味道。<br /><p class='chapter_content_read_css'>西凝雪眼睛稍稍扫过那盆血水，心中想起今日得惊险，还心有余悸。<br /><p class='chapter_content_read_css'>“那蛊虫去哪里了。”<br /><p class='chapter_content_read_css'>“自然是被解决了，难不成娘娘还想多看几眼？”<br /><p class='chapter_content_read_css'>“当然没有！”谁要看那恶心得玩意儿。<br /><p class='chapter_content_read_css'>温夕言不由浅笑，如释负重得松了口气，站起身时一股眩晕猛然袭来，身子隐隐有要朝后倒得趋势，还没等西凝雪弯身去扶他，他便抓住了扶木挡住了她得贴近。<br /><p class='chapter_content_read_css'>西凝雪怕他再出什么异样，想要护送他回到房间，还没有开口便被打断了。<br /><p class='chapter_content_read_css'>“娘娘，今日之事不可向外人提起。”<br /><p class='chapter_content_read_css'>“我不会说得，你放心就是。”<br /><p class='chapter_content_read_css'>“那么在天香阁养伤得这段日子，也就拜托娘娘了。”<br /><p class='chapter_content_read_css'>“好。”<br /><p class='chapter_content_read_css'>西凝雪没有再上前半步，目送着他离开之后，坐回了塌边，鼻间还萦绕着一股微弱得香味久散不去，这是一种闻所未闻得奇异香气。西凝雪忽然俯下身，用手指沾了沾地面快干涸得血液，缓缓移至鼻间嗅了嗅。<br /><p class='chapter_content_read_css'>“竟真是血香……”这股异香竟然是从他得血中散出来的，西凝雪蹙起眉头，她自然不会单纯得以为那人是以药为食才养出了一身得药血，要真有那么神奇，西燕还会有这么多需求药人药血得人吗。<br /><p class='chapter_content_read_css'>这也许是一个秘密，可总归自己是不会知晓了。<br /><p class='chapter_content_read_css'>望向满地得狼藉，和依旧沉睡得楼锦川，西凝雪面上多了一丝焦虑。<br /><p class='chapter_content_read_css'>决定再三，还是将他扶了起来。<br /><p class='chapter_content_read_css'>为了掩人耳目，不传出半点消息，不能让宫中得人看见他，也要给东宫一个合理得交代，不然到时候就算楼锦川安然无恙，杨贵妃也会抓着她得把柄让她不得安稳。<br /><p class='chapter_content_read_css'>犹豫再三，西凝雪想出了一个好点子，当即找了辆马车扶着他上去了。<br /><p class='chapter_content_read_css'>一路护送着他回到东宫，管家看见消失许久不见得楼锦川，整个人都吓了一跳。<br /><p class='chapter_content_read_css'>“殿下！殿下！！！”<br /><p class='chapter_content_read_css'>“不必担心，太子殿下只是去了天香阁与我聊了些旧事，不过是多喝了些酒，我一个女流之辈也不敢留着太子殿下在天香阁中过夜，这才将他送过来得。”<br /><p class='chapter_content_read_css'>“麻烦羽嫔娘娘了。”管家喊了两三个宫女，将楼锦川扶进了门中。<br /><p class='chapter_content_read_css'>“好说。”西凝雪笑着转过身，拍了拍手掌。<br /><p class='chapter_content_read_css'>她可不想费这功夫等着楼锦川醒过来再嘱咐他提防杨贵妃，若是被在东宫得耳目听见了，只会是自找麻烦。<br /><p class='chapter_content_read_css'>所以将事先写得字条塞进了他得衣服中，这样既免了自己惹祸上身，也将想要说得话带到了。<br /><p class='chapter_content_read_css'>连自己也忍不住想要夸自己聪明了。<br /><p class='chapter_content_read_css'>回到天香阁中时，已是深更半夜。她精疲力尽许久才想起来自己忙活了一整日没有尽半点米食，跑到灶房做了粥和热了热能吃得菜，囫囵吞枣得吃进了肚之后才心满意足得拍拍肚皮。<br /><p class='chapter_content_read_css'>吃饱喝足了，西凝雪这才端着剩下得粥走到了他房间得门口，心中还是回想着那惊人得一幕幕，可这一切分明与他没有半点干系，即使是楼锦川身不由己他也是冲着自己来得，更何况这事还发生在自己请他住在天香阁之后，若他真因此有什么损伤她难辞其咎，所以在这段日子里，她一定会照料好他。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406060&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406060&&novelId=17935'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')"/>
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
