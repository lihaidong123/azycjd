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
    <title>第二十八章【遇袭，英雄救美】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406363&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406363&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406363+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十八章【遇袭，英雄救美】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406363')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406363 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406363,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第30章&nbsp;&nbsp;&nbsp;第二十八章【遇袭，英雄救美】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 轩辕祁冷冷扫了轩辕澈一眼，轩辕澈立刻止住了声，然后还煞有其事的搓了搓胳膊，小声的嘟囔了一句，“好冷！”但是，却再也没敢提邵家小姐的事情。轩辕澈知道兄长的底线在哪里，现在看来，邵家小姐成了他大哥的又一个底线，他现在还没胆子去挑战。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 人来人往的城门今日的人依旧很多，出城的队伍排的很长，轩辕祁看似闭目养神，其实时刻注意着外面的动向，他的心已经控制不住的想要飞去扬州，看一看那人是否安好。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 马车缓缓的驶着，队伍一点一点往前挪着。还好，正午时分的人不像早起那般多，速度也算快，但也用了将近半个时辰才到跟前。守城的侍卫上前想要检查车内所坐何人，车夫直接亮出了诚意伯府的腰牌，侍卫停下了想要掀帘子的手，问道：“车内所坐何人？”车夫直接答道，“诚意伯世子与二公子！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 诚意伯显示是盛京炙手可热的人物，虽然只是个伯爵，但架不住人家有钱，如今可是那几位皇子争相拉拢的对象，尤其是这两位公子，盛名不输其父，侍卫往旁边挪了挪，微微一礼，“请！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 马车一路往南，自朝着扬州的方向驶去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依是被一阵香味唤醒的，之前她一直在闭目养神来的，但是烤鱼的味道实在太过美味，勾起了邵依依的馋虫。吃着烤鱼，喝着野菜汤，邵依依觉得这样的生活实在是太惬意了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 休息的差不多了，于是众人上车的上车上马的上马，领头的护卫大掌一挥，于是这十几人的队伍又缓缓朝着“胜龙寺”的方向驶去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 扬州城不仅四面有水，相对的也有高山，当队伍驶入风陵山时，自山林中窜出一伙黑衣蒙面的男子，二话不说的便与他们打斗起来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 听到外面乱哄哄的样子，画影忍不住的掀开帘子朝外看去，只那一眼，便让这个孩子吓得手捂胸口说不出话来，看到她如此模样，一直当背景的浣纱也做了同样的动作，然后小脸也煞白煞白的，或许是年岁长一些，也或许是小时候经历的事情较多，此刻的她虽然害怕但到底还算镇定，从邵依依左后方的位置向前一步，挡在了邵依依面前。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影看到这里，也想起了自己的使命，想起临出来之前灯影再三叮嘱“一定要照顾好小姐，不要偷懒！”于是，她就在她呆着的原地稍微转了身子，挡在了马车的窗口位置，她刚刚好像看到那些人手中带有弓箭。如果他们对着窗口射箭，她就用身体挡住。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 但画影担心的事情一直没有发生，总之他们用剑杀人，或者搭弓射箭，但没有人对着马车，这让画影松了一口气的同时，让浣纱的心又提了起来，只听到她脸色煞白的小声对着邵依依道，“小姐，若是待会有机会您就抢匹马逃吧，若实在逃不了，您就了解了自己，总比落在那些人手中要好！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 诚然，浣纱已经想到了一种可能性，当年她与父母北上逃荒的时候，路遇一伙强盗，不管是衣衫褴褛的逃荒者，也不管是乘坐马车的富家人，他们将男人全都杀光，将女人抓到一起，当年她的父亲就是那般遇害了，而后她的母亲也大概想到了她们所要面临的事情，拔下头上的银钗，在小小浣纱的脖颈处划出了一道口子，然后将自己的手腕划破，给小浣纱的脖颈处抹了很多血迹，最后她刺破了自己的咽喉，选择随亡夫而去。小小年纪的浣纱根本没经过这种事，早都已经哭哑了嗓子，最后被她母亲藏在身下才躲过了一劫。后来，被路过的人伢子捡了回去，几经转手，去过很多家做丫头，现在终于来到了邵依依的身边。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影年纪虽小，但她们这些在大家族做丫头的哪个心思不通透，浣纱的话说完她也就明白了她的意思，虽然害怕还在脸上没能散去，但却哆哆嗦嗦的转过头对着邵依依道，“小姐，你要保护好自己！”稚嫩的脸上闪过坚定。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依的魂是现代人，自然不会像古人那般在乎什么闺誉，她所要的很简单，就是好好的活下去。但是在这一刻被两个小丫头保护了，邵依依的内心很复杂，一直以来她都是一个强者，但在这个世界，她没有强悍的躯体，也没有利落的身手，所依靠的就是邵轻扬之前交给她的那本拳谱与最简单的入门招式。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依想要掀开窗帘一看，但被画影死死挡着，她怕小姐她一露面就被外面的歹徒看到，“让开！”邵依依厉声喝道，画影垂下头改坐为跪，声音都带上了一丝颤抖，“小姐不要！”不知道为何画影竟然不敢直视邵依依的双瞳，小姐那双眼睛太过骇人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 这一刻的邵依依拿出了前世第一杀手的气势，所以两个婢女这会儿感受到的就是来自邵依依身上的杀气。虽然很想出去一战，但对于自己有几斤几两邵依依还是很清楚的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依起身，这个时候两个丫头都跪在地上不敢上前一步，邵依依没有自大到直接掀马车的门帘，而是绕过画影将窗帘掀起小小的一角，顿时一股血腥之气扑面而来，好久未曾闻到过这么重的味道了，邵依依竟然有些怀念。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 但是面前的战斗却有些不乐观，邵渊戎给她的护卫就只是一般的家丁，但由于他是武将出身，家丁也比寻常人家的比较壮实，平日也会加强锻炼，但对上那些杀人不眨眼的盗贼，他们就只有节节败退的份了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 穿着邵府灰色护卫装的人站着的越来越少，倒是黑衣人没怎么减少，邵依依看着紧紧护在马车边上执剑对敌的男子，对上他的是两个黑衣人，且出手都快如闪电。邵依依心下不解，这一般的盗匪身手会如此利落吗？邵依依甚至都在怀疑这是不是张氏的杰作，但自己外出一事与去向何处也都是昨日才决定的，她的动作怎么就这么快呢？难道她早就安排好了？邵依依心惊，若真是如此，这张氏到底是何身份？<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 马车周围最后的两个护卫也被黑衣人砍倒在地，邵依依甚至还记得就在不久前，这两个护卫还一脸憨笑的帮自己在河中捞鱼，就这么一会儿的功夫，他们就都变成了尸体。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依看着一个黑衣人朝着后面的马车走去，而另一个直奔自己所在的马车，于是她取下头上的赤金钗，攥在手中，悄悄的挪到了帘子边上静静的蜷缩在那里。帘子被掀开了一条缝，就是现在，积蓄全身的力量用手中的金钗朝着来人的咽喉刺去。不知道是邵依依运气太好，还是黑衣人太过大意。总之，她成功了！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 但是，她也成功的跳到了敌人的包围圈中，邵依依不喜欢带帷帽，所以她只能算得上是清秀的容颜就落到了众人的眼中。当然，马车内的两个丫头也自动的跳了下来，后面马车上的涟漪与画屏自然也被黑衣人连拉带拽的拉了过来，主仆五人被团团围住。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哟，主子长的不怎么样，这几个妞长的倒是不错。”由于邵依依穿了一套绯色织锦长裙，头饰也比其他几个穿着质地一般的丫头华丽一些，所以黑衣人一下子就认出了邵依依的身份。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哥几个动作快点，收工了都过来乐呵乐呵……”黑衣人狞笑着朝邵依依慢慢走来，动作越发缓慢，好像故意在看猎物的垂死挣扎。画影四人确实都吓得缩成了一团，但邵依依却依然目光平静，只是手中的金钗在刚刚跳下马车被捕的时候就被搜走了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 四周都是长剑，面前是身材高大的黑衣男子，邵依依的脑内在快速的运转，想要扭转颓势，但最终目光黯淡下来，这几乎是不可能的事。但是坐以待毙不是她的性格，邵依依最擅长的便是绝地逢生。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 男子速度虽然缓慢，但是距离很近，所以男子很快就走到了邵依依的面前，伸出满是茧子的手朝邵依依光滑的下巴伸去，底下缩成一团的画影，“唰”的一下站了起来，挡在了邵依依的面前，男子的手自然被画影挡住了，男子的火气“噌”的一下子被激怒，直接甩了画影一个巴掌，画影趔趄了一下，摔到了邵依依身上。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依伸手扶住她才避免了两人都跌倒在地的难堪，搬过画影的身子，发现她的脸已经迅速肿起，画影却还在小声问着，“小姐，你没事吧！”邵依依的双眸闪着愤怒的火焰，但同时又很心疼画影。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “看什么看！”男子不知为何有些心虚，但却用声大来掩饰，邵依依快速上前，一把掐住了男子的咽喉，但是她却高估了这个身体的爆发力，她根本没法撼动那个男子，她的手掌也根本使不出力气。男子拔剑出鞘，直接刺向邵依依。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “叮”一声，一颗小小的石子直接打到了男子的剑上，石子虽小，但却逼得对方后退两步，手中的长剑也落到了地上，男子甩了甩执剑的手，虎口处隐隐发疼。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “欺负几个弱女子，你们好意思吗？”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406363&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406363&&novelId=17990'">下一章</div>
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
