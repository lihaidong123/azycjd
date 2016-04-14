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
    <title>第七章 撒鹤顶红毒死你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405619&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405619&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405619+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七章 撒鹤顶红毒死你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405619')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405619 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405619,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第11章&nbsp;&nbsp;&nbsp;第七章 撒鹤顶红毒死你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪猛然停止抽咽，一下子被揭穿把戏的感觉不太好，而且他这种侮辱性的话语深深的打击到了她的自尊心，所以……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你这个庸医，我可没听说过天花需要用清水来治得，我看你就是个喜欢胡乱捏造方子，害人不浅得庸医！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我也没听说过，患上了天花这痘苍只长一半得。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪被他的话一时噎住回不上嘴，她只顾着画上下半张脸，只是不想在还未进来就被外面的人发现了蹊跷，只是她似乎太过自信，岂料遇到了一个胆子这么大，见了凶猛得天花之后，还敢镇定从容得坐在原处观赏的人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她倒要看看这人究竟什么来头，西凝雪站起身要把帘子掀起来，打算将其中的人狠狠揪出来教训一顿，但手刚碰到帘子就被人捉住了，一双微凉但掌心带着些许热度的手，这样两种不同的温度，实实在在的停留在此人的手上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她忽然冒着火的内心，似乎被这份微凉化了几分。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪冷静下来，抽回了自己的手，但还是恶狠狠的说道，“怎么，你还怕我这个脸上只长一半痘苍的人，会不小心害病给你吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姑娘心中有了怨气，见我一面更是徒增麻烦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她自然知晓他所说的麻烦不是为了怕她麻烦，而是他自己怕麻烦。这个可恶的卑鄙小人！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“算你狠，不过以后若是再让我见到你，别怪我撒鹤顶红毒死你！”就算在动作上占不到半点利势，但口头上一定要把面子挣回来，深信这点的西凝雪正在心中默默诅咒此人的祖上十八代。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“既然姑娘盛情邀请，那么在下后三日便会再来这景秀阁一趟，姑娘想下毒尽管来。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……”西凝雪变了变脸色，心知他又是在存心戏耍自己，又是气又是怨的哼了哼，“狗屁庸医。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	既然是你自己找死，那就怪不得本姑娘了，不过现在是不与你计较，三日之后待她准备充分就让他好好接受教训一趟，要是长得丑就把他毒成呆子，要是长得美就把他的脸划烂，要是不丑不美得就在没人得时候找个棍子狠狠揍他一顿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	让你下回再敢这么不收敛的惹本姑娘，就等着死吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	回过神，女官已经冲进来站在了她的身后，一顿劈头盖脸的骂道，“你还想磨多久啊，还不赶紧去学礼！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪忙把小红点用面纱擦了干净。回过身又对着帘子吐舌，无声的毒骂：王八蛋。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官催促的将西凝雪推了出去，然后笑得花枝乱颤的靠近了帘纱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“温太医，这丫头不懂事碍了您回府的时间，我替她给您赔个罪。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“无妨。”白帘纱后走出一人，隐约可见的绝色，世间如此多能够称之为绝色之人，却不及这真正的绝色之姿，那双如墨般的黑瞳看得最为真切，女官只怯怯打量了一眼便羞涩的别过了头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪自然是没这机会见到这死太医的真面目，怨恨的啃咬着枕头发泄怒气，云沁看她的样子，有些不忍，想安慰，却见西凝雪突兀的转身，吐了满口的棉花。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿，咱们走吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……小雪，你从刚刚回房就一直不说话，是不是在检查出什么怪病了？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“当然没有，我身体很健康得。”就是无端端被人打破了计划，还狠狠得羞辱了一顿，这份气她闷在心头难受，可若是如实交代给云沁，难免云沁不会趁此机会好好奚落她一把，以后拿此作为她的笑柄。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪自我安慰的压下了怒火，这才多大点事儿啊，她尚且不做打算，等自己空闲时再想想应该怎么对付那个庸医。接着和云沁赶到了集合得场地，女官的心情似乎出奇的好，连瞧见她们俩公然迟来也没有计较。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	再看这足足五列，个个环肥燕瘦、穿的衣裳红的蓝的花了眼，依她看这不是选秀，是来比试自己穿衣打扮如何得选美。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎哎哎，都站开点，站开点！”女官拿着戒尺指手画脚得将队伍分的清楚。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪长得还算高，所以排在了队伍中央，而云沁比她要矮上一小截，被安排在了第二列。女官发完话以后就由侍女给大家分发物品，拿到手一看竟是一碗发臭还长霉的绿色液体，顿时嫌弃的就要丢手。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“都给我端起来放头上！这就是教你们学礼的第一步，如何端端正正的走路，你们每个人都要稳着头上的碗然后从这里走到那里，凡是没有成功的，今天中午就不许吃饭！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这死老丑婆！西凝雪最讨厌的就是学礼，小时候爹娘在这方面给她请的人就不在少数，这些人被她不是被她恶整就是被她恶言相向，各种捉弄之下只好放弃了一心只想当女侠得西凝雪。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	如今时局不同，这女官手里头的戒尺可还没开过头呢……戒尺有多可怕她是知道得，打得轻一点也就罢了，要是打得重了都能将皮肉翻起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	强忍住腻烦的心情，西凝雪将双手拢在了腰前，双眼平视前方……没学过礼的平民女子没走三两步就摔碎了碗，带着臭气的液体浇在身上，此处俨然变成了一个杀猪会场。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	除了一些管家大小姐从小就学过礼对这些应对自如之外，西凝雪终于也不堪负重的歪了头，然后迎来了光荣的一刻。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪并没有尖叫，她反而知道自己迟早都会把碗打算的，无非分别就是早点和迟点。无声的把脸上的绿色液体从眼睛上抹开，臭皮蛋的滋味真不好受，西凝雪本不想这么折腾勉强自己去做一件事情，但女官还在一边看着呢，只好重新振作的从侍女手里边接过了新的碗。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这一时半会儿已经有不少完成的秀女三五成群的坐到亭子下休息了，就连云沁在一边焦急的呼喊，“小雪，你不要太急，放松下身心会更好一点。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪当然知道要放松身心，只是这一放松，连带着头上的碗也跟着一并放松得掉在地上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	被臭皮蛋洗礼了这么久，西凝雪知道自己无望再学会大家闺秀得正常走路方式，更加面无表情心如死灰地换上了第二十只碗，这时其他秀女已经被吩咐着去用膳了，也就是说，这个空地方只有她和拿碗的侍女在。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	就她一个人还在辛苦的练着，负责换碗的侍女急得快要哭了，委屈道，“小主子，您快点啊，再晚点我都吃不上饭了，呜呜呜……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我知道了，我尽量早点完事！”最厌烦侍女哭腔的西凝雪深呼吸一口气，然后继续换碗。慎重慎重再慎重的向前走，开头走的挺好，结果一没注意脚底下的石子，又不幸的被浇上了一层臭皮蛋的液体。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	无穷无尽的怒火压抑在心头，西凝雪抓狂的跺脚。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我都这么努力得练习了，老天你为什么连一次让我成功的机会都不给我呢！”现在咬着牙一遍遍的经受如此折磨，都拜那个死瘟神所赐，下次见面她不好好整他一顿怎么对得起地上这么多碗的尸体呢！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	瘟神……王八蛋……眼睛都要冒火的西凝雪踢翻了地上几只唯一还完好的碗，女官闻声而来，见如此场景，立即火冒三丈的抽出腰间的戒尺，那戒尺滑动的响声如同魔音一样窜进了西凝雪的耳里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪抖了抖身子，脑中忽然闪现小时候默不出诗句被先生打得手肿的场景。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	委屈的花了心思解释了一番自己是如何如何不小心扭到脚，从而不小心踢到那堆碗的，到了最后只能跟女官妥协了，继续默默的练习走路，这走路就走路，还要闷骚的扭屁股，这怎么能忍！怎么能忍！不过偷瞥了一眼正在喝茶的女官还是坚定的忍了下去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一边在心底低咒着老丑婆突然死掉，一边开着小差换碗，直到深夜，女官单独把她叫到跟前说了一句话。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“西凝雪，你简直就是个猪脑子，我没教过你这么笨的！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪在心底鄙视的想，没错，我就是开了这个先例，让你这没见识的好好开了一番眼界，还不赶快感谢我。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	谢倒是没有，被轰进了浴池里洗了一个时辰，才精疲力竭的回到房间，但身上大老远的还是散着臭皮蛋的味道，这时她倒有些怀念起千步香的味道了，刺鼻的香总比刺鼻的臭好闻的多。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	打开门，云沁和刘淑妙坐在油灯底下读书，她稍一打量，云沁读的是诗词歌赋，刘淑妙读的是史书。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她也读书，读的是一本叫梦的书。和正堂夫人被子好好亲热了一番，抱着一个叫枕头的小妾就沉沉的睡了过去，不得不说走路是个体力活，且在一日三餐都没吃的情况下，更是累的她身子都要散架了，巴不得这一觉直接睡到天昏地暗，海枯石烂。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但实际上刚眯着眼打了会儿盹，就被人推醒了，西凝雪咽着满肚子的火睁眼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小雪，小雪？”云沁动作轻柔的推着她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嗯？”西凝雪睁眼一见是云沁，便压抑住烦躁，平静地说。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你回来了怎么也不告诉我一声，我刚才读的太投入……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪抽抽嘴角，指头都不想动，能尽量避免说话当然是好的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我知道你练习久，没来得及吃上饭，我特地给你藏了两个馒头，你快些吃了吧。”云沁把布袋子掏了出来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪热泪盈眶的更加不想说话，只是用眼神表达了一下自己的感动然后狼吞虎咽的把两个馒头吞下了腹。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿，谢谢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“说的哪的话，咱们两姐妹跟我见外什么。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	心想着有姐妹就是好啊，要是哪天云沁吃不上饭，她也会藏馒头的，不过显然前提是自己解决了走路这个问题之后。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪打了个呵欠，眯着眼困乏的和云沁扯了一阵话唠子，又去读她的梦书和拥着她的三妻四妾了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她的梦多姿多彩，但是被自己讨厌的人插足了，西凝雪自然是不遗余力的要将此人赶出去，而此人恰恰就是那个长得丑一脸麻子一口龅牙身上长满痘苍不敢见人的温太医。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他越是那么神秘，她就越想揭开一切，看看他到底是个怎么样的人。后悔的是没见到他面目，心中就有如一只爪子在不停的挠，她好奇啊，这人又是悬丝诊脉，又是故弄玄虚，怎么能不让人胡思乱想的猜测。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她可以被打被欺负，大不了事后她再还回去，但岂能忍受的是这哑巴吃黄连有苦说不出的憋屈，她可是堂堂的西大女侠……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	最后的思考都沉入了清晨孕育的晨曦中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	众人都是早早的起身练习，西凝雪照旧在床上磨了一会儿，然后云沁看不过眼就跑过来掀了她的床被。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小雪，你还磨蹭什么，快点起了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我起了，我起了……”西凝雪一边说一边窝成一团的滚向床的内侧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你这哪是起了，还想赖着呢？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我梦见我起了……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是乎被云沁连人带枕头一同拉了起来，她寻思着云沁怎么突然这么大的劲，把她都拉了起来。然后吃过一顿饱饱的早饭，就要继续练习走路，侍女都已经一脸麻木的看着她这个老熟人，估计心里一定在想，把她一刀砍死扔进乱葬岗里永远都不要再见到她才好。她更是没有心思重复这枯燥的端碗走路的过程，每次都是只持续了一小会儿就败下阵了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	硬气的又练了一日，身上的臭味熏的女官都避之不及了，那满地得碎片更是连人脚都站不进去的场景让人发指。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是女官终于放弃了让她如同鸭子一样丑陋的扭屁股和永无止境的摔碗。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	然后女官对两眼呆滞装傻充愣的西凝雪拍了拍肩，语重心长道，“我们景秀阁可没这么多碗给你糟蹋了，你现在给我从最简单的立姿开始练起！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪面无表情的立着，心想你要是让我练睡姿，我保证睡出各式各样的动作给你看，不仅能睡出动作，还外加鼻哼、打呼、说梦话这几项绝技她也不介意展示一下，但仔细一想这站姿也挺好的，至少到了吃饭的点就可以跟着其他秀女一块开饭。就在她这么庆幸的想着，天上开始冒小雨点了，今个这天气本就凉，没想到竟是要下雨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官像赶鸭子一样把其他秀女赶了回去，然后连看都不看她一眼，就回了房间，没准是把她给忘了，更或者是压根就不想理她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪朝四周打量了一下，然后才小步小步的往亭子奔去，她并没有蠢到要傻站在原处淋雨，她西凝雪还没有这么大无畏得牺牲精神。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	有时候该精明的就要精明，就像你明明只能吃三个包子，但是你一定要拿四个以备不时之需，该装傻充愣的也不能少，她小时候犯了错就装傻充愣，老爹对她无辜的样子自然也就忽略了始作俑者都是她的可能。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	总结成一句话就是说，她长了一张摆什么像什么表情的脸。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	雨下了一阵，风刮得呼呼的响。女官房间的大门动了动，西凝雪赶紧往淅淅沥沥的雨中一站，女官出来时西凝雪不差一分一秒的朝地上来了个妩媚多姿的晕倒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官惊吓的奔了过来，“你这丫头，下雨也不知躲躲。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪自以为自己的表情是憔悴的，当然声音也是虚弱的，“薛嬷嬷，我身子好冷，好难受，我是不是要死了……”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405619&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405619&&novelId=17935'">下一章</div>
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
