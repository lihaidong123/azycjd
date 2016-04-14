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
    <title>第二十四章【回忆总是带些痛】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406260&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406260&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406260+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十四章【回忆总是带些痛】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406260')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406260 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406260,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第26章&nbsp;&nbsp;&nbsp;第二十四章【回忆总是带些痛】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; “我知道你恨我，你们轩辕家都应该恨我，是我对不起泠儿！”轩辕昊被帝王带着伤心的语气打断了回忆，抬头的一瞬间，眼泪就再也止不住的夺眶而出。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “我怎么会恨您！我们都知道您也是身不由己！”轩辕昊固执的不去看帝王，故意忽略掉帝王的大掌抚过轩辕祁的面容带走额头上的汗珠。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “回禀陛下，御医带到！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在大殿内的气氛诡异的僵住的时候，萧锐良身边的大总管王康在殿外出声。萧锐良抬首看向外面，于是王康逆光行礼的模样就映入他的眼。萧锐良转身移开几步，确认这个距离不会让人心中起疑之后便负手而立，淡淡的朝王康点了点头，“宣！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 于是，王康便带着刘御医走了进来，二人对着帝王行礼，帝王挥了挥衣袖，用淡漠的声音说着，“免礼！刘御医帮诚意伯世子诊个脉吧！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “微臣遵旨！”刘御医垂首行礼，而后朝着轩辕昊走去，“请诚意伯将世子的胳膊平放在桌上！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊自然是照做，将轩辕祁趴在桌上的胳膊放平，而后将他那豆青色的宽袖往上挽了挽将他的手腕露了出来。刘御医自然是坐在另一张木凳之上仔细的为轩辕祁把起了脉。半晌过去了，刘御医从轩辕祁的左腕换至右腕，还是查不出来引起他如此疼痛的病因。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 自然，刘御医的反常状态大家都看在眼里，轩辕昊自然忍不住的出声询问，“御医，小儿到底怎么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 刘御医摸了摸胡须，一脸为难的看了轩辕昊一眼，然后才抬头看了帝王一眼，帝王看似漠不关心，但却一直关注着这边的进展，自然是看到了刘御医的动作。帝王点了点头，刘御医放开手中的手腕，朝着帝王长揖一礼，语带颤音，“回陛下，微臣诊不出世子的病因！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “什么？”帝王与轩辕昊不可置信的声音同时响起，刘御医觉得落在自己身上的目光更加骇人让自己承受不住，单看额头上一直不停淌着的汗珠就能够知道。额上的汗流下来花了眼睛，但他一直不敢抬手去擦拭一下。刘御医有些后悔放了章陵远休假，不然今日站在这里接受帝王目光的人就不是自己了。帝王的目光太过冷冽，刘御医诺诺的开口，“回禀陛下，世子并没有什么病症，但不排除突发性的疾病，微臣建议多请几位御医前来诊治。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 帝王大掌一挥，王康再次走了出去，刘御医低垂着头不敢吭声，他怕自己一不小心触怒龙颜继而一命呜呼，只能尽量缩小自己的存在感。但是，这好似并没有起到什么作用，帝王阴冷的目光还是再次扫到了他的身上，刘御医吓得大气也不敢出一下，只能默默的盯着自己黑色的靴子。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 气氛越发的诡异，刘御医甚至能够感受到空气中硝烟弥漫，他有些不太明白，但他还是鬼使神差的抬头，不知道为什么会从诚意伯的双瞳中看出了些许的仇恨，但被他掩饰的很好，只是一闪而逝，刘御医甚至怀疑是不是自己看错了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 诡异的气氛很快被王康带来的数位御医打破，虽然平日帝王对待诚意伯世子的态度不甚明显，但眼尖者还是能从各处细节看出来帝王待他与常人不同。众御医一一上前为轩辕祁请脉，耗时还都不短。最终，众人小心翼翼避过帝王的视线，围城一圈仔细的讨论着刚刚诊到的脉象。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 半个时辰过去了，最后还是刘御医站了出来，毕竟这里的御医平日都是以他为首，他也是太医院的院首。刘御医虽然千般不愿，但依旧站了出来，垂首行礼，这下子的声音比刚刚有力度了很多，“启禀陛下，诚意伯世子应当是突发性心疾，脉象上根本无从察觉，微臣同太医院众同僚的看法一致！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那要如何做他才能醒过来？”帝王转身看了轩辕昊怀中的轩辕祁一眼，仍旧负手而立，声音也不似刚才那般冷硬。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “当务之急便是让诚意伯世子平躺而卧，好好休息一番！”虽然帝王的心思你别猜，但听声而闻，刘御医也知帝王并没有怪罪自己的意思，于是便大着胆子继续开口，“脉象上显示不出来的突发性心疾，有很多只要休息一下，待醒来后就会自行痊愈的。陛下与诚意伯不必担心！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 帝王挥了挥手，一众御医陆续离去，只留下王康随侍在侧，帝王看了轩辕祁的方向一眼，低声吩咐王康，“给诚意伯父子安排一下，今夜就宿在宫中！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “诺！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “陛下，”轩辕昊与王康同时出声，但明显轩辕昊的声音较大盖过了王康，帝王垂首有些恼怒的看着轩辕昊，好似要看出他究竟意欲何为，轩辕昊完全不理会帝王恼怒的神情，只是自顾自的继续开口，“府中马车就在宫外，不用劳烦王总管安排了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 王康有些躺着中枪的感觉，他只是看到帝王的神情而停止了向外行走的步伐而已，怎么诚意伯就拿自己说事。王康扫了诚意伯一眼，发现对方并没有看自己，这才将想要说的话咽回肚中，继续垂首看着自己的鞋面，完全不参与到他们的对话中去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良盯着轩辕昊看了半晌，想要从他的脸上看出更多的情绪，只是，他失望了，轩辕昊始终都是一副面无表情的样子。最终，萧锐良露出失望的落寞神情，但是开口说话的语气丝毫不显，就与平日那般威严无二，“王康去安排一顶软轿送诚意伯父子出宫！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “诺！”王康垂首行礼，后退几步之后才转身朝外走去，渐渐的便看不到他的影子。帝王看了轩辕昊一眼，语气有些飘渺，“照顾好他！”于是，帝王头也不回的抬步离开，竟然丝毫不在留恋。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “我们回家！”轩辕昊看了帝王的背影一眼，而后垂首看了看轩辕祁昏睡的面容，他的身上应该不痛了吧，因为他至始至终纠结的眉眼也放松了下来，轩辕昊笑了笑，低声轻喃。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕祁的长相随了轩辕昊，所以外界众人从来没有怀疑过轩辕祁的身份。但轩辕昊还是从轩辕祁的脸上找到了妹妹的影子。没来由的又想起了早逝的妹妹。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哥哥，孩子可好！”轩辕泠琪躺在床榻上双眼有些迷蒙的看着轩辕昊，声音虚无之中带些飘渺，嘴角努力的弯起来，像是在笑，只是那笑容中包含了太多的酸楚。轩辕昊的眼泪一下子涌了出来，大滴大滴的眼泪顺着眼角滴落在轩辕泠琪你落线枯瘦的手背上，而后语气哽咽，“很好，是个儿子！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那就好！”轩辕泠琪虚弱的应了一声，竟然挣扎着坐了起来，对着轩辕昊伸出了双手做出要抱的姿势，轩辕昊急忙将襁褓中的婴儿放到了她的手中，自己在一旁紧紧护住他们母子。只是，令他没想到的是，轩辕泠琪抱着孩子的手异常的牢固，甚至还腾出一只手来逗弄孩子的小脸，轻声细语，“就叫你祁儿可好，与娘亲的名字同音可好？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊没有吭声，但既然是妹妹的意愿，他自然是愿意的。只是看着妹妹时不时朝外张望的神情，他就知道妹妹定然是存了期望，希望某人能够来看看她。轩辕昊知道，妹妹现在的情况是回光返照，因为难产的原因，她的时间已经不多了，她想多陪陪她的孩子，还想再看一眼那人。只是她注定要失望了，轩辕昊已经不敢提任何关于那人的话，他怕妹妹她忍受不住。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 只是，最终还是轩辕泠琪忍不住开口，“哥哥，孩子就交给你抚养了，”轩辕泠琪的声音慢慢的变小，脸上也没有刚刚回光返照的红晕，变得苍白一片，“哥哥，告诉他，我从未恨过他！”说完，孩子就顺着她的胳膊溜了下来，轩辕昊急忙将那小小的婴儿抱到怀中，就这么眨眼的功夫，轩辕泠琪彻底的闭上了眼睛，任轩辕昊如何唤她都不再睁眼。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 院外伺候的下人都是轩辕家的老人了，也是看着这两兄妹长起来的，此刻听着房内大少爷压抑的哭声，很多人眼泪也忍不住的流了下来。半晌之后，房内的哭声终于隐去，轩辕昊伸手附上妹妹那致死都未曾阖上的双眼，他知道妹妹内心是一直盼着看到那人的身影。这一刻的轩辕昊恨极了萧锐良，在今日这样的日子，他竟然没能前来，竟然连妹妹最后一个愿望都未实现。可是一想起妹妹临终前说着不恨他的话，轩辕昊只能叹息一声“傻妹妹”！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕祁躺在自己怀中的模样竟然与刚出生时候的景象重合了，轩辕昊再也忍受不住的流下眼泪，或许是为怀中孩子悲苦的命运，或许是因为早逝的妹妹，总之这一刻，他的心前所未有的疼痛。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 其实只是一瞬间的事情，但轩辕昊却觉得所有的力气都在这一刻用完，所有的事情都好像要结束一般，就连帝王身边的王总管前来他都没有感觉，就那般浑浑噩噩的任由内侍将他们父子二人扶上了轿撵，待他反应过来的时候，面前是二儿子焦急的双目以及长子躺在马车内的模样。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406260&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406260&&novelId=17990'">下一章</div>
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
