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
    <title>（十五）谁人为情而伤逃 真真假假难分辨</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351928&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351928&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351928+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十五）谁人为情而伤逃 真真假假难分辨]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351928')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351928 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351928,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第16章&nbsp;&nbsp;&nbsp;（十五）谁人为情而伤逃 真真假假难分辨
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“王妃，你着实应该多吃些。”南宁见她小口没滋没味的吃着米饭，忽然夹了一块鱼肉放到她碗中，“就算是为了腹中胎儿，你也应该多补补身子，不然到时生产时，你没了力气，孩子就会被活活闷死在肚子里。”说到后来，语气竟是严肃万分。<p class='chapter_content_read_css'>木若涵听她这么说，心中一阵惊恐，赶忙吃起来，对面的木梓见状却是轻笑出声，木风一皱眉，“梓儿莫要无礼。”<p class='chapter_content_read_css'>“爹爹，我只是在笑还是秦姑娘本事大，姐姐回来半月有余，我们不知用了多少方法，姐姐依旧少进食，可是秦姑娘不过一句话便让姐姐乖乖吃饭了，这不是很厉害吗？”<p class='chapter_content_read_css'>“是木公子谬赞了，我哪有什么办法？只是利用了做母亲的心罢了。”南宁摇摇头，又往木若涵碗中夹了几块肉还有各种青菜。<p class='chapter_content_read_css'>“秦姑娘还是赶紧吃吧，我已让下人收拾好了厢房，正在若涵院落中。”一直沉默不语的木夫人忽然开口。<p class='chapter_content_read_css'>“多谢夫人。”	<p class='chapter_content_read_css'>晚膳后，南宁跟着木若涵一起回房，刚落座，就开门见山地说：“王妃，我并不会治什么心病，我唯一能做的是取走你想忘记的记忆，这，你可明白？”<p class='chapter_content_read_css'>木若涵缓缓抚上小腹，闭起眼睛，沉思片刻：“其实，秦姑娘也可以看到我的记忆对不对？我现在……只想知道王爷他轰我出府的真正原因，相信秦姑娘一定也听到市井之中传的那些事，那些事到底有几分真，几分假，就连我都弄不清楚。”<p class='chapter_content_read_css'>“那王妃你到底想要些什么？”<p class='chapter_content_read_css'>“我想将这个孩子好好生下来。”<p class='chapter_content_read_css'>“……”这是接生婆的事吧。<p class='chapter_content_read_css'>“可我害怕这孩子会遭人毒手，他一直在恨我，这么多年了，他从未有一日是不怨我的，只是，只是这一天终于还是来了，呜呜呜呜呜呜……”木若涵忽然伏在桌上低声啜泣起来。<p class='chapter_content_read_css'>南宁听她说的话，却是丈二和尚摸不着头脑，“他”应该是指顾王吧，可是他怎么会恨她？当年不是木家救的顾王吗？这这这，怎么一回事？<p class='chapter_content_read_css'>“王妃，你……”<p class='chapter_content_read_css'>南宁见劝不住她，无奈扶额，果真应了那句话：女人都是水做的啊。<p class='chapter_content_read_css'>过了半晌，木若涵才止住了泪水，用帕子擦着眼泪，哽咽道：“是我失礼了。”<p class='chapter_content_read_css'>“能给我讲讲到底怎么回事么？”南宁递给她一杯茶水。<p class='chapter_content_read_css'>“我……”<p class='chapter_content_read_css'>南宁脸色一凝，瞬时伸出左臂将木若涵带到门边，木若涵惊呼一声，只见一个蓝色身影破窗而入，偌大的窗户霎时变得破烂不堪，框边木屑弥漫屋内，细碎的窗纸犹如断翼的白蝶，缓缓落到那人衣上，地上，桌上。<p class='chapter_content_read_css'>琥珀色的眼瞳落入二人眼中，南宁微微皱眉，喉咙还未发出声音，书绘音凉凉的手就紧紧覆在她唇上，静静地看着她，用唇语道：莫要出声。<p class='chapter_content_read_css'>南宁点点头，微微扭头看向木若涵，只见她木然的看着书绘音，紧紧咬着下唇，一双手紧紧攥着广袖。<p class='chapter_content_read_css'>南宁竖起耳朵，听到窗外窸窸窣窣的渐渐消失，身上猛然一沉，竟是书绘音倒在她身上，昏迷不醒。一抬手，却见手心满是鲜血，视线缓缓向下，竟是一支长箭刺在腰间，腰间衣衫血色弥漫。<p class='chapter_content_read_css'>南宁身影一晃靠在门框上，两手稳稳扶住他，声音有些不可置信：“书绘音……？”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>自那夜起，书绘音已整整昏迷了三日了，木风为他请了中青最好的大夫治疗，最好的药都用上了，都不见伤口有一丝一毫的愈合，气色却因止住了血而好了许多。<p class='chapter_content_read_css'>南宁早晨去看了书绘音，见他还未清醒，便从后厨寻了几碟子糕点，放在花园的凉亭里，闲下来，悠悠的时不时吃几口，眼睛出神地飘向远方，右手捏了块糕点，微微张嘴塞进一小口，就那样顿住。<p class='chapter_content_read_css'>过了良久，一只白嫩玉手搭上南宁肩膀，南宁一个激灵回过神来，赶紧找到焦点，看清来人，就觉得手臂手指发酸，才发觉半塞进嘴的糕点，又不好意思吐出来，只得赶忙咀嚼几口，硬吞进肚。<p class='chapter_content_read_css'>木若涵扶住腰背，缓缓坐到对面，掩面微微一笑。<p class='chapter_content_read_css'>“秦姑娘为何在此发呆呢？”<p class='chapter_content_read_css'>“发呆？”南宁摇摇头，“我只是有些奇怪而已，书绘音就算为人冷淡，也不至于得罪别人到想杀了他的地步，还有就是，到底是何人竟然能伤他那么重。”<p class='chapter_content_read_css'>木若涵低眉想了想，“确实有些奇怪，书公子一向不与人打交道，就连我们木家与他知交甚深也从不知道他到底得罪过些什么人，以书公子的身手，能够伤到他的人也是少之又少，再说……”她忽然噤声，南宁只觉背后一阵寒气，木若涵的脸色有些僵硬。<p class='chapter_content_read_css'>“麻烦王妃回避一下。”书绘音信步走来，面色冷淡的看向木若涵，她微微扯出一个笑容，点点头，扶住腰慢慢站起来，逃也似的离开了。书绘音见她身影消失，才落座到南宁旁边。<p class='chapter_content_read_css'>南宁眼睛落到他腰上，“怎么这么快就可以走路了，明明应该是刚刚醒来吧，还跟没事人似的。”说着将糕点碟子推到他面前，顺手倒了杯茶。<p class='chapter_content_read_css'>“唔。”书绘音只抿了口茶，“并非什么重伤。”<p class='chapter_content_read_css'>“你来的倒是真巧，王妃刚想多说一些关于你的事嘞，莫不是你是故意的？”<p class='chapter_content_read_css'>“谁知道，我只是来拜托你一件事，”说着将手伸向里衣，掏出一个香囊，将要放到桌上，顿了顿，用另一只手扯过南宁的手，放在她手心，又紧紧握了几下，“我想请你帮我寻一人。”<p class='chapter_content_read_css'>南宁见他如此郑重，不由得多看了那香囊几眼，那香囊缎面为香蚕雪绸，天蓝色的忘川花映在其上，金线反穿为花蕊，银蓝相间的细丝帛束口，结一死结。<p class='chapter_content_read_css'>那忘川花，哦不，应是须臾花，是手工绣上的吧？<p class='chapter_content_read_css'>“你什么时候会刺绣了？”南宁两手将香囊换来换去好奇地看。<p class='chapter_content_read_css'>书绘音脸色一变，竟止不住的大咳起来，南宁赶忙掏出手帕，站起身，给他顺背，见他腰间渐渐溢出血迹，片刻后，才止住咳，手帕上赫然一片血迹。<p class='chapter_content_read_css'>“书绘音！怎么会这么严重！”南宁凝了面色，一不留神将香囊掷在地上，书绘音却一沉脸色，捡起香囊，硬塞进南宁袖筒中，南宁有些气结，“这东西到底有什么重要的？难道比你的命还重要吗！”<p class='chapter_content_read_css'>“是！”书绘音袖摆往腰间一扫，血迹立即隐去，将手帕还与南宁，“抱歉，这帕子却是不能用了。”<p class='chapter_content_read_css'>“我会在意这区区一方帕子？”南宁一挑眉，伸手去扶书绘音，“走，先回房间好好养伤，大夫留的伤药还都在你房里，你以为用这障眼法伤口就真的好了吗？真是自大。”<p class='chapter_content_read_css'>“不，”书绘音将她扯到凳子上坐下，“听我讲完，我想让你寻一人。”<p class='chapter_content_read_css'>“真是不要命了。”<p class='chapter_content_read_css'>书绘音却突然一笑，“是，就算丢了命，我也要找到他她。”<p class='chapter_content_read_css'>“什么？那人肯定是个女人。”南宁直勾勾地看着他。<p class='chapter_content_read_css'>“你怎知道？”书绘音笑了只是一瞬，立刻变回面无表情的冰块脸。<p class='chapter_content_read_css'>“你很喜欢，嗯，爱她？”南宁很是八卦的笑着凑到他面前，却见他根本没有什么要脸红的迹象。<p class='chapter_content_read_css'>书绘音摇摇头，“她是我的，”他顿住，仔细思考该怎么形容才好，半晌才吞吞吐吐道：“救命恩人。”<p class='chapter_content_read_css'>只是救命恩人？她才不信，但看他的面色也不像是假，她微微犹豫了一下，正了面色道：“那好，给我瞧瞧她的画像。”<p class='chapter_content_read_css'>“并非如此寻找，这香囊中有她的象征事物，若她出现，香囊之中必有异象，而且你也可以感受到她的存在。”<p class='chapter_content_read_css'>“你怎么断言她一定会在我身旁出现？”南宁一顿仔细斟酌书绘音刚才的话，神色一变“莫非，她已过世？”<p class='chapter_content_read_css'>书绘音面色瞬间煞白，眼眸更是覆了几层寒冰。周身的气温瞬间低了几度。<p class='chapter_content_read_css'>南宁也觉失言，躲闪了一下眼神，“那个那个，我的意思只是，呃啊……”<p class='chapter_content_read_css'>书绘音也知自己刚才反应过大，正颜道：“你只帮我找她便好，别的事毋需多问。”<p class='chapter_content_read_css'>“反正一时半刻也找不到她，你就乖乖回房上药吧。”说着勾起书绘音的胳膊往外拖，拖了几十步，他猛然定住脚步，南宁一刹车差点撞到月牙门上，她猛回头：“你干嘛，说了上药就上药，你是想血流而亡吗？”<p class='chapter_content_read_css'>他无奈地看看她，一指对面：“我只是想说，你走错方向了。”<p class='chapter_content_read_css'>“……”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“你就不可以轻一点吗。”书绘音趴在床上，两手放在枕上，侧着脸背对南宁看向墙壁。虽然面上依然冷冷淡淡，但不代表他不痛啊。<p class='chapter_content_read_css'>南宁抹好药，随手拿了床头的布条，站起身往前伸着胳膊，把布条从他腰间绕过，嘴里含糊着答应了声，但随后狠狠扯了一下布条表示她根本没有听进去。<p class='chapter_content_read_css'>书绘音眼神不禁沉了一下，嘴角有些微微抽搐。<p class='chapter_content_read_css'>“呃。”南宁忽然一顿，挠挠头，“我打了个死结，没问题吧？”<p class='chapter_content_read_css'>书绘音坐起身撩好衣袍，漫不经心的瞥向南宁，“你还有什么想问的？”<p class='chapter_content_read_css'>“到底是谁伤了你？”南宁赶忙问。<p class='chapter_content_read_css'>“你……认识的人。”<p class='chapter_content_read_css'>“啊？”南宁被他的回答弄得丈二和尚摸不着头脑，“我认识的？呃，谁？”<p class='chapter_content_read_css'>书绘音也不打断她，任她神游思考。<p class='chapter_content_read_css'>南宁眸光一闪，“是个女的？”<p class='chapter_content_read_css'>书绘音点点头。<p class='chapter_content_read_css'>忽然，南宁两颊绯红，两眼闪躲的看他，他嘴角一抽，抬手，一个爆栗落到了南宁的头上，“莫要瞎想。”<p class='chapter_content_read_css'>“你怎么知道我在瞎想，是个女的，还受伤，啧啧。”<p class='chapter_content_read_css'>书绘音觉得与她解释无用，就道：“是洛瑾香。”<p class='chapter_content_read_css'>“洛瑾香……啊？洛瑾香！洛大小姐！”南宁右手猛地往下面一拍，恰恰拍在书绘音大腿上，书绘音冷冷的扫了她一眼，南宁讪讪地收手。<p class='chapter_content_read_css'>“她到底跟你有什么仇？下这么重的手，还好射偏了地方，不然……”一个女子的面容忽然出现在她眼前，“莫非是因为那什么须臾花？”<p class='chapter_content_read_css'>书绘音若有所思的点点头。<p class='chapter_content_read_css'>南宁也点点头。不过二人点头之意却大不相同。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351928&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351928&&novelId=15670'">下一章</div>
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
