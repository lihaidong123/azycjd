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
    <title>第九章【忆往昔】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405281&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405281&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405281+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九章【忆往昔】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405281')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405281 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405281,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第9章&nbsp;&nbsp;&nbsp;第九章【忆往昔】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 这一句却勾起了邵轻扬年少时的回忆，那时候他的母亲还在，自己与母亲一同去见父亲，小小的穿着月白衣衫的自己对这父亲长揖行礼，因为母亲来自盛京安家，而安家却是书香之家，孩子的礼仪都是从小教导的，所以他的母亲也一直是这般教导他的，但他的父亲却是武将，虽然后来转为文职，但那一身豪气却是丝毫未减，那时候的父亲也说着这句话，但却是摸着自己的头充满爱意的说着。此刻，虽然爱意不减，但到底却少了儿时的那份温馨。很显然，邵渊戎也想到了那件往事，因为他的脸上露出了一些称之为怀念的神色。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “父亲，”邵轻扬一时间神色有些讪讪，只是有些事情却是不能拖得，“儿子觉得，娘亲留给妹妹的嫁妆还是要尽快归还到妹妹手中，她现在已经长大了，手中没有一丝银钱也是不行的！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “放心吧，”或许是因为想起了亡妻的缘故，邵渊戎的脸上也是少有的温柔表情，“这些事情为父已经吩咐下去了，张氏她……”想到这是在儿子面前，邵渊戎将未说完的话咽了回去，只是挥挥手，“为父午后散值回来一切都会安排妥当的！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “儿子替妹妹谢过父亲！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “说什么傻话。”邵渊戎轻轻的摇了摇头。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵轻扬过段时间还是要回盛京的，毕竟他是一甲探花郎，陛下不会放着人才不用让他闲置在那里。每位中了三甲的学士会在殿试过了之后有一段时间的空窗期，这个阶段一般都是用来回家省亲。待安排好家中事宜就会去陛下钦点的职位上任，而邵轻扬则是要去六部之一的户部任从四品的户部侍郎一职。他想要在回京之前，将妹妹的事情安排妥当。实在不行，自己带她去盛京，想来父亲应该也是同意她嫁入外祖家的，表弟安胜宇与妹妹年龄倒是相配。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵轻扬送了父亲坐上官轿离去后便直接去了邵依依的院子，为了了解妹妹院中的真实情况，邵轻扬并没有推门而入，而是直接跃上了围墙。却没想到身体柔弱的邵依依已经起床了，头发干净利落的全部扎了起来，一件装饰也无，穿了一套白色的中衣在院子中正扎着马步，一旁的画影正帮她擦着额际身处的汗水，而院中本该打扫的院子的粗使丫头一个也无。邵轻扬有些生气的直接从墙上纵身跃了下去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哥哥？”邵轻扬人还在半空却突然听到邵依依的声音，只见她微抬着头，额间来不及擦拭的汗水在东方新日的照耀下闪着一层淡色光晕。一时间兄妹二人四目相对，邵轻扬倒似有些尴尬，也是，即便是自家未及笈的妹子，也断没有穿着中衣见人的缘故，但是邵依依完全没有觉得不妥，她只是有些疑问而已，“你怎么来了？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 其实，若是现代的邵依依她绝计是不会理会他人的，但是在这个皮囊中，她总会不由自主的想要跟面前之人谈笑说话。想来，还是因为二人关系较为亲密的缘故。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “我来看看你！”既然妹妹都毫不在意，邵轻扬也不是那等婆妈之人，看到芙蓉树下的竹椅，他二话不说便躺了上去，顺便看自家妹子有模有样的扎马步，间或提醒一两句。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 这一看就是一刻钟的时间，这是邵依依给自己定的短期目标，每日早起扎马步半个时辰，而现在终于听到灯影喊到点的声音了。就这短短的半个时辰，邵依依觉得自己浑身都要像散了架一般，有些吃不消的感觉，而肚子也饿得咕咕叫了。这会的邵依依也顾不得其他，穿着中衣揉着肚子也往树下的竹椅处走来，邵轻扬一看，只得起身，有心将自己的衣物给她披着吧，可是最近天气热了起来，他也只穿了一件黛青色直身，并无多余的衣物。好在此时，灯影手中拎着一套额黄色的裙衫出来，看到自己，惊讶过后便福身行了礼，而后有些羞赧的将那件裙衫盖在了躺在竹椅上的自家小姐身上。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵轻扬转道坐在了树下的石凳上，自己动手从石桌上放着的白色茶壶中帮自己倒了一杯水，然后发现是无任何茶叶的白水，当下便拍了一掌石桌，也不知他用了多大的力道，那识食物放着的一整套茶具都离开桌面跳了一下，最令邵依依惊奇的便是，邵轻扬刚刚倒出来的那杯凉白开，竟然纹丝未洒，一时间有些神游天外。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “她竟然敢如此怠慢于你！”邵依依是被邵轻扬有些怒气的声音扯回了思绪。其实，邵依依本身是喜欢可乐的，除了可乐之外就只喝清水，但自从被一杯加了料的可乐取了性命之后，她就只能和水了，再说了，这里也没有其他东西给她喝啊！<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依并不是死了之后立刻重生在本尊身上的，因为空间时差的关系，她亲眼看到渣夫将她还未冷却的尸体从床上拖了下来，然后制成标本放在一旁，而后给他们集团的另一位以“艳”出名的杀手打电话庆祝自己死掉的消息。等他们二人在自己尸体躺过的那张床上翻云覆雨的时候，一股强大的吸力将自己从那个房间吸了出来，而最后映入她眼帘的便是，站在门后已经被制成标本的尸体，她虽然想要阻止对方将她的尸体制成标本，但事实却告诉她一个孤魂的无能，她接触不到任何实质的东西。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “妹妹，你怎的了？”邵轻扬看着邵依依闭上双眼仿佛已经不存了一般，一时间心慌蜂拥而至，轻轻的抚上了邵依依的脸颊，声音中带上了一丝惶恐，“你不要吓哥哥！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哥哥，我无事！”半晌，邵依依才坐了起来，看着不顾形象蹲在自己面前的邵轻扬一时间有些无语，平日那般注意形象的一个人啊。同时又有些难过，原主已经死了，其实有这么个疼爱自己的兄长她今生也该无憾了，哪像自己，只有一个所谓的亲人，还亲手要了自己的命！那么，今后就让我来替我们两个一起好好活着吧，毕竟，我们同名同姓也算有缘。邵依依抬头对着邵轻扬笑了一下，“我喜清水，清水养颜！”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405281&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405281&&novelId=17990'">下一章</div>
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
