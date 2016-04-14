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
    <title>（四十八）阴雨连绵怪事生 一口热汤差劫命</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351965&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351965&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351965+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十八）阴雨连绵怪事生 一口热汤差劫命]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351965')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351965 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351965,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第53章&nbsp;&nbsp;&nbsp;（四十八）阴雨连绵怪事生 一口热汤差劫命
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			 啊啊啊啊啊啊啊啊啊啊啊！这、这、这，谁能告诉她怎么回事啊！她怎么会趴在南宫宁雪腿上睡觉，还是，还是，还是衣衣衣不蔽体！<p class='chapter_content_read_css'>  南宁刚睁开眼就震惊的想要爬起来，但猛地起身却牵扯动了全身的伤口，不由得倒抽一口冷气，手下一个不稳又华丽丽的摔到了南宫宁雪身上，她很清楚的听到了他发出了一声闷哼。<p class='chapter_content_read_css'>  真的是，丢人丢到家了，南宁通红着脸干脆将头埋在了衣褶间，万万不敢再动。<p class='chapter_content_read_css'>  南宫宁雪将近天明时才有了困意，刚阖上眼皮没多久就被重物狠狠砸了一下，吃痛的唔了一声，缓缓打开眼皮，刚稍稍向下移了一下视线，就腾地一下红了脸，迅速抄了手将披风往上轻轻拉了拉，再次将南宁裹了起来。他明显感觉到了她身子的僵硬，脸上闪过一丝尴尬。<p class='chapter_content_read_css'>  “秦……姑娘？”<p class='chapter_content_read_css'>  南宁的身子又僵硬了起来，十分尴尬的哼了两声，若不是她现在根本没法大幅度活动，她早就去刨个坑将自己埋了！<p class='chapter_content_read_css'>  “秦姑娘，你，”南宫宁雪忽然抿了抿唇，“秦姑娘你现在可否能动？能否稍稍抬一下身子，在下的腿有些……麻了。<p class='chapter_content_read_css'>  南宁闻言赶忙用手撑着向上挪挪，结果，披风又往下滑了寸许，南宫宁雪慌忙移开了视线，迅速站起身来，但很明显地晃了两晃，靠着墙活动了好半天才舒缓了些麻痛，再看南宁，她早将自己缩进了偌大的披风里，只露出凌乱的墨发，却因为披风本身的长度问题而露出了赤足。<p class='chapter_content_read_css'>  南宫宁雪走到早已熄灭的篝火面前，摸了摸晾在旁边的衣物，摸着确实已经干透，背着脸递给南宁。<p class='chapter_content_read_css'>  “这是，咳，秦姑娘的衣物，在下，在下去找些吃食。”说罢便将同样干透的外袍简单一披匆忙逃离开了。<p class='chapter_content_read_css'>  南宁缓缓扭过头，看着他有些落荒而逃的身影，抻出手冰了冰滚烫的脸颊，好不容易有了降温的趋势，但当从一堆衣物里翻找出亵衣时，就彻彻底底从头顶冒出了热烟。<p class='chapter_content_read_css'>  啊啊啊啊啊，这到底是干了什么啊！<p class='chapter_content_read_css'>  南宫宁雪出去没多久刚晴了没一会儿的天气又阴沉起来，他抬头看看变幻莫测的乌云，低低叹息了一声，一只雪白的野兔突然窜了出来，定定的停在他面前，一双红通通的眼睛直勾勾的盯着他。<p class='chapter_content_read_css'>  他本来还觉得会有食物，现下却觉得蹊跷起来，这只兔子，是怎么回事？<p class='chapter_content_read_css'>  忽然一阵缥缈白烟在兔子周围形成一股漩涡，愈来愈大，愈来愈大，直至烟雾散开，一位身着白衣的妙龄女子出现在他面前。<p class='chapter_content_read_css'>  女子忽然跪拜在他面前，恭敬道。<p class='chapter_content_read_css'>  “妙儿参见少公子。”<p class='chapter_content_read_css'>  南宫宁雪很微妙地看着她，她是个兔子精吧？她怎么喊自己为少公子？<p class='chapter_content_read_css'>  女子见他半晌没有反应，竟是自顾自的站了起来，“少公子？您怎么还在这儿？若是被君上看到您，您定是会被捉回去的，若是那般，君上定是不会放过您的。”<p class='chapter_content_read_css'>  南宫宁雪敛了敛眉，没有应答。<p class='chapter_content_read_css'>  女子耳朵忽然一动，神色紧张起来，“是他们来了，少公子，您快些走啊！若是被他们捉了回去，怕是要被诛根了！”<p class='chapter_content_read_css'>  南宫宁雪看她认真的神情并不像是在作假，轻轻点颌，刚想离开只觉得周围卷起了一阵阴风，飞沙都被席卷飞扬，他只得用袖子遮面，待到风势平静下来再放下手一看，倒是让人冒了一身冷汗。<p class='chapter_content_read_css'>  黑压压的穿着甲胄的士兵正立在离他不过三步之遥的地方，将他包围在中间，周围席卷着浓重的黑暗气息。<p class='chapter_content_read_css'>  这是什么状况？南宫宁雪冷着脸看向像是将军的那人，完全不像是东陆任何一个国家的军队，更何况，只是一阵阴风便送来了这些人，还有就是，这些人的气息，根本就跟死人一般。<p class='chapter_content_read_css'>  “少公子。”做将军打扮的人上前一步朝南宫宁雪拱手行礼，“公子大可放心，吾等皆不会做伤害公子之事，只是，君上让属下前来问公子一件事，公子可还记得当年对小殿下许下的誓言？”<p class='chapter_content_read_css'>  还未等着南宫宁雪回答，那将军便一肃容，打了一个手势，又一阵阴风刮起，紧随而来的还是一阵飞沙走石，即使他很想看清这些人是怎么走的，但依旧是有心无力。<p class='chapter_content_read_css'>  待四周平静下来，南宫宁雪定睛看了周围好一会儿，根本一丝异样都没有，甚至那只小兔子也没有了，莫不是，他出现了幻觉又或是他在做梦？<p class='chapter_content_read_css'>  “南宫公子，南宫公子！咳，南宫、南宫公子！”<p class='chapter_content_read_css'>  南宫宁雪忽儿听到身后传来阵阵呼喊，转身一瞧，却是南宁不知从哪里寻来了一根粗木棍，把它当做拐杖一瘸一拐的朝他走过来。<p class='chapter_content_read_css'>  他立刻疾步上前扶住了南宁，“秦姑娘，你怎的出来了？你身上的伤尚不可见风。”<p class='chapter_content_read_css'>  “没事，只是，我见你去了几个时辰都没回来，还以为你被这山谷里的野兽给……嗯。”南宁没好意思说出后面几个字。<p class='chapter_content_read_css'>  “几个时辰？”南宫宁雪忍不住挑了一下眉，若是他没记错，明明还不到半个时辰啊。<p class='chapter_content_read_css'>  “啊？没错，是几个时辰啊，就算这天阴沉沉的瞧不见太阳的方位，但最基本的时间计算能力我还是有的。”南宁奇怪的瞅瞅南宫宁雪。<p class='chapter_content_read_css'>  “约莫是在下糊涂了。”他苦笑一下，摊开空空如也的两手，“这么长时间，在下竟是连颗野果也没弄到，怕是要让秦姑娘饿肚子了。”<p class='chapter_content_read_css'>  “无事，这种阴雨天气最容易长蘑菇、木耳一类的菌了，我们便寻些那吃吧，”说着便指了指远处的木桩子旁边黑压压的一片，“那便是了。”<p class='chapter_content_read_css'>  南宫宁雪微微一笑，将她扶到一旁的的稍干些的木桩子上坐着，听着南宁指挥着他采着蘑菇木耳，她还叮嘱他哪些是不可以采的，哪些可以采，他微微苦笑一下，他至少算是个大夫啊，怎会连这些事都不晓得呢？但看到她指挥着自己时那副认真的样子，他又微微勾了勾唇角。<p class='chapter_content_read_css'>  “秦姑娘腿脚不方便，还是让在下背你回去吧。”他说着便弯下了身子。<p class='chapter_content_read_css'>  南宁红了脸愣是没憋出一句拒绝的话，就被他背了回去。<p class='chapter_content_read_css'>  昨日他寻的木柴还未用完，便不用再跑一趟，很容易就点起了火，南宫宁雪又找了竹签似的树枝串了蘑菇来烤。但是只有吃的没有汤却不怎么合南宁的胃口，他只好施咒变出一汤砂锅用来煮汤。<p class='chapter_content_read_css'>  篝火上是冒着腾腾热气的木耳汤和香味四溢的烤蘑菇，饿了两顿饭的南宁的肚子终于忍不住咕咕叫起来。<p class='chapter_content_read_css'>  有锅自是有碗，南宫宁雪先给她盛了热汤让她揣在手里暖暖，又将稻草床重新铺了一遍，又缓缓走到南宁面前，跪坐在她面前。<p class='chapter_content_read_css'>  他还未开口说话便先红了面皮，清了清嗓子，严肃道。<p class='chapter_content_read_css'>  “在下自会对秦姑娘负责的。”<p class='chapter_content_read_css'>  南宁正喝了一口热汤，听他这话差点没将汤喷到他脸上，硬生生地向下咽，却直接呛到了气管里，这口热汤差点没结束了南宁为数不多的年岁。<p class='chapter_content_read_css'>  也不知是咳得还是怎样，南宁的脸也是煞红。<p class='chapter_content_read_css'>  南宁艰难的抬起头看向他，看见他红彤彤的耳根子，十分想怒吼一声。<p class='chapter_content_read_css'>  这是要闹哪样啊啊啊啊！<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351965&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351965&&novelId=15670'">下一章</div>
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
