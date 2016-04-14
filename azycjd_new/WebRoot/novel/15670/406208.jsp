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
    <title>（七十六）卿卿我我至滦城 浮沉香庄巧入囊</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406208&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406208&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406208+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七十六）卿卿我我至滦城 浮沉香庄巧入囊]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406208')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406208 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406208,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第81章&nbsp;&nbsp;&nbsp;（七十六）卿卿我我至滦城 浮沉香庄巧入囊
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	??许连城没想到南宁和南宫宁雪这么快就要回滦城去，看着二人的马车越来越远直到再也看不见了，才调转马头与其他师兄弟会和。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 或许，大概，还能再见面吧，大师嫂。许连城闭了闭眼，又换上了翩然少年儿郎的模样，冲师兄弟们打着招呼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁坐在马车里，一边看着在南宫宁雪的调养下恢复如初，甚至更加白嫩的双手，一边走着神，想着下山的时候碰见的那位长着狐狸眼的五公子，连南宫宁雪喂给她的苹果也没注意到。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “阿宁，张嘴。”南宫宁雪又重复了一遍。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁微微张嘴咬了一小口苹果，眼神一直游离，情不自禁的喃喃自语：“狐狸眼睛好漂亮啊……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁还想咬下一口，却发现南宫宁雪早就把那块苹果吃下去了，看见他脸色不怎么好，才反应过来自己说了什么，嘿嘿笑着，上去搂住他的胳膊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “好啦，阿雪可真爱吃醋，我不就是夸了一句人家眼睛漂亮么，嗯嗯，阿雪的眼睛最漂亮了，最漂亮了，好不好？”南宁像小猫似的蹭蹭他，“我想吃苹果，阿雪喂我，啊——”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宫宁雪无奈一笑，捏起一块苹果塞进她嘴里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他猛然想起了什么，低头看着满足的吃着苹果的南宁，问道：“你跟那位公子说的话，是什么意思？你怎么知道他是来寻人的？”其实他最想知道的是南宁怎么会和冥晓烨有所牵扯。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁眨眨眼，非常无辜道：“我就是之前在船上听到的啊，再说山上除了师父他们也没别人啊，他要找的人肯定不在山上啦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宫宁雪疑惑的皱了一下眉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁一个抬腿倒身直接躺在了他腿上，这马车足够宽敞，让她能在里面肆意的滚来滚去。南宁握住他的手掌，轻轻阖上眼皮，小声嘟囔了一句“有点困了”就悠哉悠哉的去见周公了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宫宁雪用另一只空闲的手轻轻抚摸南宁的头发，嘴角漫上微笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 算了算了，他们又能有什么牵扯呢？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	?<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 马车足足行了有七天七夜才在第八天晚间进入滦城，本来已经是过了关城门的时间，但南宫宁雪一道令牌，守卫就乖乖开了城门。一路上南宁睡得很香甜，等到了南宫府，南宫宁雪小心翼翼的抱她下马车，唯恐吵醒了南宁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 衣蓝也是只披了件外衫来给他开门收拾房间，谁也没想到他们会大半夜的回来，南宫宁雪将南宁抱进了自己的卧房，自己则住进了衣蓝临时收拾出来的耳房。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 看着衣蓝忙不迭的身影，南宫宁雪笑道：“怎么样，你的事情可否办妥？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 衣蓝微微一笑：“多谢公子，一切自是办妥了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “你怎么不问我为何不送阿宁回顾王府？”南宫宁雪被衣蓝侍候着脱下外衫，颇为隐晦的问道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “公子所做的必定有公子的意义，如今秦姑娘可是与公子终成眷属了，恭喜公子了。”衣蓝笑道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “啊，应该也不算吧，还有顾白那边一道难关呢。”南宫宁雪语气不明的说道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “只要秦姑娘同意了不就行了，顾王爷同她不过是义兄义妹的关系罢了，再者，公子只要求陛下……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “不行，”南宫宁雪打断他，淡淡道，“我的身份无论如何都不可以让南宁知道，大哥他或许已经探查到我的身份了，也或许是他想要追杀跟太子有关的一切人，包括常为长公主诊脉的南宫宁雪，无论是哪一点，只要南宁知道了我的身份，大哥的矛头就会指向南宁，我不想让她出一丝一毫的差错。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 衣蓝看着他严肃的表情，认真道：“公子请放心，属下，绝对会保护好秦姑娘的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “好了，”南宫宁雪也发觉自己说得太过严肃了，笑了笑，“你快些回去陪着行云吧，省的那傻小子还以为你出去鬼混了呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “公子。”衣蓝无奈地看着自家公子，施礼出去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	?<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “就送去这些礼物便是了。”顾白将礼单一合，交给了管家。然后有些头痛的揉揉眉心，这都快要到年关了，南宁竟然还没回来，连个信儿也没有，真是要将人给急死了，再过有半个月，就要到太子的生辰了，这次又是长公主住持宴会，一想到长公主拼命灌人酒的劲头，顾白就根本不想去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “唉。”顾白重重叹了一口气，猛灌了一杯凉茶，让自己冷静一下，但立刻又把自己呛住了，自己顺了好长时间的气才止住咳嗽，但又立刻火冒三丈。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 为什么南宁回来了都没人通知他一声？为什么南宁会亲密的搂着南宫宁雪？为什么南宫宁雪会一直在摸南宁的头发！他这个做哥哥都还没跟南宁这么亲密过！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白深吸几口气把怒火强压在心里，闭着眼等着南宁停到他面前。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 果然不出一会儿就听见南宁圆润的嗓音响在耳边，顾白慢悠悠的睁开眼，死死盯住南宁停在南宫宁雪胳膊上的手，南宁感受到了他炽热的视线，匆忙把手收回来背到身后。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “顾大哥，我回来了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白扬起一个微笑，站起身漫不经心的把南宁往前一拢，让她远离了南宫宁雪，然后关切的问道：“南宁这些日子有没有吃苦？过得还好吗？有没有受伤？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁笑道：“我都很好，受的伤也都好了，吃的也很好，你瞧，我又胖了一圈嘞。”说完还转了一圈给他看。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白亲昵地捏捏她的脸颊，高兴地笑道：“是啊，还是胖点儿好看。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他眼神轻轻一扫，看到南宫宁雪脸上的肌肉很明显的僵硬住，心里也愈发畅快，继续道：“南宁去见七七和绘音了吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁摇摇头，失落道：“听化叔说他们去城南去看铺子了，是七七要开服装店要用吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白揉揉南宁的头发，宠溺道：“可不只是一间铺子，还有你的一间糕点铺子，你平日里也无事可做，不如就做做糕点，我相信以你的手艺，绝对会名扬天下的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁激动地抱住顾白，又蹦又跳，天知道，她最想开一间蛋糕房了，那样她就可以肆无忌惮的想吃多少蛋糕就吃多少了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “啊啊，顾大哥最好了！最喜欢顾大哥了！欧耶！”南宁激动地就差没亲一口顾白，随即又搂住了南宫宁雪的胳膊，亲昵地问道，“阿雪，听到了没，我以后就有自己的铺子了，你可不许再拦着我吃糕点了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宫宁雪笑着一挑眉，“那可不行，你吃到牙疼，你可又得怨我。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “啊~不会怨你的啦~”南宁嘟嘴撒娇。南宫宁雪一挑眉颇为挑衅的看了顾白一眼，顾白也冷冷的怒视他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “啊，对了。”南宁忽然站定，认真的看向顾白，“顾大哥，我有一件很重要很重要很重要的事情要告诉你。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白右眼皮一跳，有一股很不祥的预感。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “顾大哥，”南宁把南宫宁雪拉过来一起站好，“我和阿雪正在交往中，我们俩是真的真心相爱的，希望顾大哥能够祝福我们。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白叹了一口气，看着南宁渴盼的眼神，也不好意思说出些什么不好的话来，只能道：“我自是希望南宁你能够找到自己的幸福，只是，我有三个条件。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “什么条件？”南宫宁雪按耐不住问出口。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “我的条件就是，第一，你们若是要成亲，就必须要等上一年，最少一年；第二，南宫宁雪你必须要好好照顾南宁，并发誓这辈子只娶她一人，绝不可招蜂引蝶与别的女人暗昧不清；最后一点，若是，你负了南宁，你必须要放开南宁，让南宁回到顾王府，而且，是南宁休了你，不是什么和离，更不是什么休妻。只要你能保证你能做到这三点，我便同意你们在一起。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白说完将右手握拳立在南宫宁雪面前，南宫宁雪认真了脸色，握拳与他击打在一起，两个男人的约定，就此签订。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	?<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 夜风袭凉，南宁紧紧裹了狐裘往顾白的书房赶去，南宁心里就一直在怨念滦城的温差怎么就这么大，白天暖和得要命，晚上就冷得要命，真是奇怪很了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 看着引路的小侍女退下，南宁上前敲了两下门，“顾大哥？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白连忙开门将她迎了进来，把小暖炉塞进她手里，笑道：“滦城的天气一向是这个样，下次你可要多穿些衣服再出门。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁抖抖肩，点了点头，坐在椅子上好一会儿，等到手掌都热透的时候，才抬头看向坐在书桌前写着什么东西的顾白。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “顾大哥，你这么着急找我来做什么？总不能是看你在这儿写字吧？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 顾白从抽屉里拿出一个信封递给南宁，“自然不是，我听木梓说过，你会做香，所以就想付给你一件事。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁奇怪的打开信封，只见了一张香料庄的内部人员图，南宁皱眉问道：“这是什么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “我想请你做这间香庄的庄主，你也晓得的，我经营不来这种东西的，所以就……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “顾大哥，不行，”南宁起身将信封塞回顾白怀里，“你已经给了我一间糕点铺子，这就足够了，这香料庄，我实在……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “南宁，”顾白也站起身，俯视她，“南宁，你就不要再推脱了，再说，我也只是请你做香庄的庄主，这香庄的主人自然还是我，你只是帮我管理，好吗？再者说，我能相信的，也只有你了，就帮大哥这一个忙好吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁深吸一口气接过信封塞进怀里，伸出小指，道：“那好，我们说好了，我只是帮你管理，你，顾白，才是香庄的主人。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “好。”顾白勾起她的小指，将大拇指与她的紧紧贴在一起，“好，说谎的人，就要吞一千根针。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “还有，南宁，不要将香庄的事透露给任何人，除了绘音，尤其是南宫宁雪，千万不要告诉他，好吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “为什么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “就当是大哥的一个小秘密，答应我好不好？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “嗯，好。”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406208&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406208&&novelId=15670'">下一章</div>
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
