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
    <title>第二十三章【心有灵犀？】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405967&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405967&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405967+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十三章【心有灵犀？】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405967')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405967 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405967,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第25章&nbsp;&nbsp;&nbsp;第二十三章【心有灵犀？】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 此刻的邵依依体内正上演着一场生死大劫，她在与原主争夺着这具身体的控制权。虽然原主的意志没有她的坚定，但原主与这个躯壳才是一个整体，她只是一个外来者，想要得到生存的机会就必须付出更大的努力！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 外人看着她只以为她哪里不舒服，但谁又能想到她体内的真实情况呢，脑海内正进行着夺舍大战，原主正在声嘶力竭的喊着让自己滚开，滚出她的身体，她不要看着父亲与那个贱人相携离去的背影，哭着喊着她不要……<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依原本还在纳闷，之前一直好好的，怎么今日她的情绪波动如此大，原来是被那个背影刺激的。其实，邵依依一直到知道原主还在体内，从平日的一些小细节中就能够感受到，最显著的便是对邵轻扬的依恋……<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在邵依依意识中冷眼看着发疯的本尊的时候，她的身体已经陷入了昏迷之中，这时灯影画影才上前扶起晕倒在地的邵依依，两人合力将邵依依扶回了房间。夏日衣物相对较薄，就这一会儿的时间，汗已经渗透了邵依依的衣服，额头的汗自然是不用说的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 待安顿好昏迷的邵依依后，灯影跑去端了一铜盆水进来，而画影早已绞了帕子帮她敷着额头。其他人只是听到画影大喊了一声涟漪，而后涟漪就快速的出了院子，但具体发生了什么事却没人知道。大家都在外当差没有一丝乱的迹象。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 时间一闪而逝，半个时辰很快就过去了，但是邵依依丝毫没有醒过来的迹象，但是汗却不像之前那般多了，二人站在床前看着陷入昏迷中的小姐，灯影像是这才想起去请老爷的涟漪来，于是，便开口询问：“涟漪她怎么还没回来？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 二人相视一眼，难道是张氏的人守着院子不让涟漪见老爷，想到这里二人相视一眼，内心有种不好的预感，画影对着灯影点了点头便朝外走去。刚刚走出邵依依的闺房便碰到了涟漪，画影朝后看了看，没有老爷的影子，没有大夫的影子，就连管家的影子也没有看到，画影着急的将涟漪拽进了内室，焦急出声，“老爷呢？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “画影姐姐，”涟漪刚一开口眼泪就流了下来，原来她这一路上都在强自忍着泪水，“张婆子根本不让我进夫人的院子，说是进去先通报一声，我就一直在那儿等着，但我看到她派进去的小丫头根本没去主屋，我想大喊，那张婆子竟然将我的嘴捂住，根本不给我喊出声的机会，”涟漪边抽噎边说着，“后来她们将我赶了出来，既然我见不到老爷，就准备去请大夫，但是我连二门都出不去，她们好几个粗壮的婆子将路给我堵住了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影听着涟漪的话，连眼泪都顾不得擦了，今日夫人一来，小姐就生病了，二门与“怡玥阁”的事一看都是夫人早早交代好的。那么，今日小姐的病就不是偶然，一定是张氏那贱人搞得鬼。其实，画影真心错怪张氏了，在府内张氏还不会如此明目张胆的对付邵依依，她只是怕邵依依派人来搅和自己与邵渊戎，二门的严禁是为了防止邵依依派人去外院请管家，如果管家来“怡玥阁”找邵渊戎，底下的婆子自是不敢拦的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影与涟漪之间的对话，最里面主卧室中伺候邵依依的灯影自然是听到了。这里与里面只有一层帘子隔着，她们说话声音虽然小，但到底是传到了灯影的耳朵中，灯影急忙掀开帘子一脸着急，“那我们现在怎么办？难道就让小姐这般难受着？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那我们能有什么办法，”画影看了灯影一眼，双眸中满是绝望，声音幽幽，“我们先照顾好小姐吧！”说完，画影便转身朝内走去，眼角的泪在空中划过一道弧线，帘子便挡住了灯影与涟漪的视线。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 同一个时间，远在盛京的轩辕祁心口一痛，此时他正在宫中赴宴，手捂心口之时一不小心打翻了桌上的白玉高脚酒杯，众人都只听到“咣当”一声，而后都低头紧盯着自己面前的器皿，好似上面雕刻的碧莲突然之间变得漂亮了很多。像是抬头张望这种御前失仪的事情是不会有人去做的，但是大家还是在用眼角的余光找寻着声音。但当大家都扫到源头的时候，都静静的不吭声了，那位主可深得帝王宠爱。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕祁的一系列动作自然是没能瞒得过御座之上的萧锐良，毕竟，宴会进行至此，萧锐良的视线有一多半的时间都在瞧着他。所以当轩辕昊带着轩辕澈起身告罪的时候，帝王根本没有理会二人，双瞳一直紧紧盯着紧蹙眉头手捂胸口的轩辕祁，看着他一脸难受模样，萧锐良急忙遣了身边的总管去宣御医。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 帝王的所作所为虽然让众人不解，但是了解帝王如轩辕昊自然明白帝王心中最重要的人是谁，自然知道能让帝王紧张的人就在自己身边。轩辕昊急忙转身这才看到大儿子强忍痛楚趴在桌上的模样，与二儿子焦急的面容。此刻他也顾不得帝王的心情，急忙走回到轩辕祁身边，“祁儿，你怎的了？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊在这一刻有些慌乱，对于轩辕祁他是真正疼爱的，并不是因为他是那九五至尊之人的儿子，而是因为他是自己唯一的妹妹存活过这个世界的唯一证据。就在这一会儿的功夫，帝王就已经宣布晚宴提前散席，众人纷纷起身朝着帝王长揖行礼，而后鱼贯而出。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 此时，“贞沅殿”内就只剩下帝王与三位皇子，还有轩辕昊父子三人。帝王对着三位皇子挥了挥手，有些心不在焉的说着，“你们也退下吧！”三位皇子相互看了一眼，眼中虽有不甘但还是不敢造次的一一退下。轩辕昊抬首看了帝王一眼，但距离有些远，不足以让他看清帝王的表情，但他还是对着自己的二儿子轩辕澈道，“澈儿你去宫外等着为父！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕澈此人，虽然平时爱玩闹了一些，为人也张扬了一些，但却十分听父兄的话。他虽然有些着急兄长的情况，但还是顺从的点了点头，带着一脸的不解与关切看了轩辕祁一眼，而后朝着帝王行礼。之后他便朝着宫外走去，进宫赴宴是乘坐的马车，但所有车辆马儿都在宫外专门开辟出的停车场停放。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊走到轩辕祁身边，伸手将他拦到怀中，将他的头搁到自己的肩膀上，而后用袖子帮他擦了擦面部沾上的一些酒水。等他做完这一切抬头的时候，赫然发现帝王已经步下丹壁站在了他的面前。但是还不等他出声，帝王便开口询问，语气中带了一丝焦急害怕，“祁儿他到底怎的了？怎的就突然疼晕过去？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “回陛下，臣不知！”轩辕昊垂首看着已经晕过去的轩辕祁依然紧蹙着眉头的模样，心疼的想要帮他抚平眉间，所以对于帝王的问话，他就回答的有些心不在焉。其实，说实话，轩辕昊是恨着萧锐良的，若不是他来招惹自家小妹，小妹她怎么会怀孕，不怀孕的话，又怎么会为了掩人耳目被父亲送去乡下，不被父亲送去乡下的话，她怎么会忧思过重从而导致难产身亡？<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在小妹迷留之际想要见他一面的时候，这个男人他在哪里？他在他那华丽的王府陪他那帝王指婚三煤六聘的正牌王妃待产！其实，妹妹她本来是不用死的，只是那样做的话腹中胎儿就会不保。直到现在，轩辕昊还时常听到妹妹的哭喊声，声音都哑了的她依然在哭求着自己保住他的孩子。隔了一层门帘，妹妹的哭喊声声击打着轩辕昊的心，“哥哥，我不许你们伤害我的孩子，我要他活着，要他好好的活着！哥哥，求求你了，一定要保护好我的孩子！哥哥，我很爱他！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕泠琪在乡下庄子生产的时候，因为种种原因就只有轩辕昊一个人前往。此刻听着产房中的妹妹声嘶力竭的喊着，面对着出来询问的女医的轩辕昊竟然说不出来保大人的话，但是他也试图告诉轩辕泠琪，“小妹，你们还有大把的时间，只要你好好的，孩子以后你们还是会有的，听哥哥的话好不好！听话好不好！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “不好！”轩辕昊没想到轩辕泠琪一口就拒绝了他，声音中带着疲惫与哭腔，想来她的精力已经达到极限了，“我知道，我若是舍弃了他，我这一辈子都不会有孩子了。哥哥，求你一定要帮我保住他！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “保大保小？”尽职尽责的女医还在焦急的等待着答案，这个答案与她们接下来的工作息息相关。轩辕昊紧闭双眼轻声说了句，“保小！”就在女医转身的那一瞬间，两行清泪沿着他的眼角滴落下来。轩辕昊抬头看向天边，想要将眼泪咽回去，可是却徒劳无功。泪，还是一颗接一颗的顺着脸颊流到脖颈，渗入月白的衣服之中，只留下一个浅浅的印痕。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405967&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405967&&novelId=17990'">下一章</div>
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
