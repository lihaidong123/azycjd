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
    <title>第二十九章【武林公子风落饮】</title>
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
	<script language="javascript">var novelId='17990';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406364&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406364&&novelId=17990";
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
					window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406364+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十九章【武林公子风落饮】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406364')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'">公子万劫不复之嫡女撩人</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:苏易尘</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406364 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406364,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第31章&nbsp;&nbsp;&nbsp;第二十九章【武林公子风落饮】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 听到一丝带着戏谑的陌生男音，黑衣男子全都戒备起来，然后四处张望想要找到声源。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “别找了，小爷在上面！”那个声音继续说着，伴随着声音一同飘下的是一些油炸的花生粒，颗颗都砸在黑衣人的虎口处。小小的花生粒仿佛蕴含了巨大的能量，一时间只能听到兵器“咣当”落地的声音。邵依依趁着这个机会捡起地上的长剑卧在手中，横身挡在四个丫头面前。你问邵依依的手？当然是在男子被小石子打得后退的时候就被迫分开了。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在一群黑衣人集体往上看寻找神秘人物的时候，就在包围圈外面的树上缓缓落下了一位白衣翩翩的公子，低垂着头落在了地上，身子还靠着树干。其实，刚刚听到声音的时候，谁都没有想到他竟然离他们这么远，邵依依目测都有五十米的距离，想来他刚刚应该是用内力将声音传送过来，让众人都以为他就在跟前。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小子，不要多管闲事！”众人都捡起了地上的刀剑，就只有一个人两手空空，因为他的剑此刻正被邵依依紧紧的抓在手中。众人这会儿望着的方向都不一致，有很多还在朝上望着，在附近的几颗树上寻着声音的主人，当然也包括喊话的黑衣人，但还有一少部分人看到了不远处的白衣男子。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “我们乃是‘梦迴楼’的人，此时正奉命行事。”两手空空的男子应该是这群人的头领，应该也是这群人中武功最高的，只见他双手抱拳，“敢问阁下尊姓大名？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “梦迴楼”，在场的五位女子有可能不知道，但身为江湖中人的风落饮却是知道的，他其实就是一个臭名昭著的杀手组织。“梦迴楼”接单根本没有任何原则可言，只要有足够的钱，他就会帮你出手干掉任何人，才不会管你是欺男霸女的恶霸，还是贪脏王法的奸臣，抑或是为民请命的清官，他都不会拒绝。总之，他就是一个用钱就可以买到命的地方，当然他的价格与目标人物成正比。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哦，”白衣男子的语调微微上扬，漫不经心的说着，仿佛只是在谈论一件微不足道的事情，“‘梦迴楼’，那就全都杀掉好了！”语毕，男子的身形已经来到了众人的面前，但是却无一人发现他是何时到达的，也无一人看清他的动作，大家只看到他墨色的发丝在空中飞舞，而现在则慢慢的垂下来，柔顺的垂在脑后。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依这才发现男子并未曾用冠束发，而是简单的用墨色发带绑了个马尾在脑后，整个人透着一股子阳光、干净的味道。站在阳光之下，邵依依才发现对方的白衣不仅仅是白衣，因为在阳光的照射下有的地方会反射出不同的光。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 细看之下，邵依依才发现对方的衣摆以及袖口的位置用金丝银线绣着繁复的花朵，似牡丹却又像玫瑰，好吧，她是真的不认识，只是发现挺好看的。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “阁下是铁了心要和‘梦迴楼’作对了吗？”邵依依再次被黑衣首领打断了思绪，然后她一头黑线的想着，这个时候她竟然还有心思欣赏白衣男子衣襟上花是否漂亮，都不知道对方是敌是友呢。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那又如何？”男子笑着反问，完全不在乎对方那狠厉的语气。一个云淡风清，一个气急败坏，两者形成鲜明的对比。或许是男子毫不在意的态度激怒了对方，他们执剑就杀了过来。首当其冲被对付的自然是邵依依主仆五人，邵依依手执长剑朝着朝着向她们杀来的黑衣人刺了过来，手中的动作毫无章程可言，也十分缺乏美感，但却非常实用，这是邵依依将自己常年运用匕首的手法转换到了长剑之上。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 几个丫头缩在邵依依的身后，虽然她们很害怕，但意外的没有喊叫出声，这让邵依依惊诧的同时也放心了很多。但她这个身体却意外瘦弱，没一会儿便虚弱非常。再加上她双拳难敌四手，对方又采取的包围的方式，她根本护不住后面的两个丫头。气喘吁吁的邵依依有些绝望，难道她们今日要命丧于此吗？<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依朝后看去，想要看清楚后面的状况，一回头就看到一双微笑的桃花眼，只见白衣男子嘴角微挑的对她笑了笑，然后快如闪电般的出手，手中还未打开的折扇就刺穿了袭向画屏涟漪的两个黑衣人的心口。黑衣人围着遮挡面容的黑色布巾被风轻轻一吹便掉落在地，仰面倒下的瞬间他们的眼中是深深的恐惧与不甘。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 虽然是一瞬间发生的事情，但邵依依却觉得时间仿佛过去了很久。接下来的事情就变得顺利了很多，白衣男子似乎也发现了邵依依的不支，脚底生风围着五位女子转了一圈，邵依依根本没看清对方是怎样出手的，就只看到十几个黑衣人的小队瞬间就只剩下了自己面前的一个。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 黑衣首领一看情况不妙，立刻转身就跑，对于他们这些杀手来讲，保命才是第一位的。但是白衣男子并未给他这个机会，直接飞身而起，空中一个华丽的转身就出现在了黑衣首领的前方。黑衣人看了男子华丽的背影一眼，转个方向继续跑，但还是没能跑出两步就再次被男子挡住了前行的方向。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 四个方向全都试了一遍，黑衣人惊恐的发现自己根本跑不出对方的手心，自己就像是被关在了一间牢房中，除了用钥匙打开门，无论怎样都出不去。想到此处，黑衣人突然想起一个人来，他的轻功可以说是如今武林第一人，简直已经到了出神入化的地步，但是他本人的性格却着实有些“恶劣”，性子也十分好玩，然后他便创造出了一种玩法，专门“招待”他不喜欢的对手，此玩法名曰“画地为牢，猫捉耗子”。于是黑衣人脱口而出，“‘风潋山庄’少庄主？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “正是小爷风落饮！”白衣男子，也就是风落饮此刻正在黑衣人的正前方的树干上坐着，手中的折扇已经被打开，正扇着风，然后抽空看了黑衣人一眼，丢给他了一个还算没笨到家的眼神。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “落在风少庄主手中，马某死而无憾！”黑衣人竟然熄了想要逃走的念头，有些认命的坐在了地上恢复一下刚刚因为逃跑而有些虚脱的身体，虽然知道接下来等待自己的下场是什么，但黑衣人目前还不想做个累死鬼。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 风落饮是江湖中赫赫有名的十大公子排行榜中的榜眼，也就是江湖第二公子，但是轻功确是公认的武林第一，就连武林盟主骆鑫杰也如是说。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那小爷就成全你！”风落饮说完便隔空拍出一掌，掌风扫过黑衣人就看到他躺在了地上，嘴角含着一丝解脱的笑意看着天空。虽然知道自己必死无疑，但等死的时间却是最令人绝望的，虽然他是大家口中十恶不赦的杀手坏蛋，但同时他又是十分怕死的，黑衣人看向碧蓝天空的眼神慢慢涣散，慢慢无神，最终变得没有任何焦距。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 风落饮解决掉最后一个黑衣人，本来以他的性格接下来的事情自然是不会继续插手了，但不知道为何他又回到了刚刚那个地方，或许是因为那位小姐给他的感觉太过冷静了吧，根本不像一个十五六岁的小姐该有的表现。其实他离她们并不远，对他来说只需要一眨眼的功夫就到了摆了满地死尸的地方，只见四个丫头小脸煞白煞白，小腿还一抖一抖的，到现在了身子都还直不起来。但那位小姐却依旧一副表情淡漠的样子，仿佛面前的一地死尸并没有给她造成任何影响。这一刻，风落饮甚至觉得对方就不是一个十五六岁的小姐，她应该是个是个身经百战的战士，不然怎么可以这般镇定。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 此时的风落饮脑海中闪过一个恶劣的念头，不知道她那张淡漠的脸上露出其他表情是个什么样子。几乎就在瞬间风落饮的脑中冒出了一个坏主意。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “终于没有不相干的人打扰了。”风落饮故意做出一副色/欲熏心的样子朝着五人走去。浣纱眼中的是不甘，难道她们是刚出虎穴，又入狼窝吗？其他三个婢女再次吓得脸色发白，但画影这次没忘了自己的责任，她将邵依依护在身后，但是她的个子有些小，根本挡不住邵依依的人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 众人都只顾着害怕，但只有邵依依一人嘴角含笑，因为她从对方的眼中只看到了恶作剧成功的得意，他根本不是一个十恶不赦之人。邵依依不顾画影的阻止重新走到最前面，朝着风落饮抱拳道，“多谢公子相救！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依不是一个不识好歹之人，她知道今日若是没有风落饮她的下场肯定会很惨，虽然她不至于失身就寻死逆活的，但一想到被那些人碰的话肯定会恶心的好久都吃不下东西。所以，不管对方现在是如何捉弄她们，谢还是要道的。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406364&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406364&&novelId=17990'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')"/>
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
