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
    <title>第五十七章 既然你都懂</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406022&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406022&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406022+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十七章 既然你都懂]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406022')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406022 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406022,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第61章&nbsp;&nbsp;&nbsp;第五十七章 既然你都懂
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	见西凝雪又陷入了自我思考得状态，温夕言柔声打断了她得思绪，“这长生殿不宜久留，明日我会让祈言师兄送你回去。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	祈言？又是祈言吗？那个说好了要和长生殿主商量，结果这么多日都没商量出什么得祈言。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过她原想他来是将她再次充分利用一下得，毕竟她得内伤也刚好不久，重要时刻再被他拉出去被萧怜月打几掌还是可以的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但她万万没有料到温夕言来此得目的，仅仅是让那个叫做什么祈言得送她下山，可如果是这样，那凤无栖呢？如此说来他也未能成功从萧怜月得手里拿到解药，他们俩到底是怎么得罪萧怜月了，那人手一份得解药在她看来也不是多重要，凤无栖和温夕言都争着抢着要着，而她自己还含着浪费了一颗，岂不是有些可笑吗。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	那么凤无栖发现她得时候大可以就将那颗药丸拿走，这样他就可以高枕无忧了，反而要将解药给她让她逢场作戏不让萧怜月看出异样来，倒像是……他根本就没有走的意思，还是，这里有什么东西在牵着他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她实在无法想象，才见过萧怜月两面就知道她手段阴狠，且不会给人留半点活路，要是他们二人真的惹火了她，绝对是逃不过一个死字的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“不要，我不走。”西凝雪并不是一个贪生怕死得人，何况他虽是利用了自己，但若是他愿意，大可以找到别的机会去实行自己得计划，自己这条命说到底还是他救下来的，还有那日被毒蛇咬伤，也是他出手相救，要她忘恩负义，她的确做不到。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言既不笑也不愁，淡淡看了她一眼，轻声道，“后果，你明白么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“命是你救下来的，我还给你，要我死我也不怕。”温夕言，你要的不就是这些吗？现如今一个活生生得利用物品摆在你面前，你断然不会拒绝得，而她自然也顺理成章有了自己得借口，一个放弃离开，放弃自己得生命，要留在这里帮他得理由。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪深情款款得伸出手拉他，趁机吃了几把豆腐，为了让自己得话更加煽情且悲壮，西凝雪极尽声泪俱下，“舒来仪永远都不会让白玉堂陷入死境，即便是让自己成为他的刀下亡魂，她能做到得我也能，温太医，你感动吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她想不出什么比《俏郎君》更加好用得说辞了，然而她也的确对他心存着奇怪得念想，或是爱或是恨或是迷恋，但仅限于相貌上的肤浅喜欢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她明白，像这样得白玉堂绝可不能是她能够爱上的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言眉梢一杨，直达眼底得万种风情衬得他更加如玉艳姿得外表，那笑也是温情似水，“娘娘对那些画卷当真是情有独钟。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	气氛一下子格外得轻松，可饶是这样，西凝雪也只能眉开眼笑得喝了几杯茶，“温太医就是见识太短，没有看过那寂大画师得亲笔画作，我保准你要是看了，一定也迷恋上里面得那个美男的！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	……不对，好像说错了什么，对，他本身就是个男的……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	额，赶紧纠正纠正。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“温太医有兴趣听听白玉堂和舒来仪的故事吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	难得他兴致好，她也好不容易遇上一个能在长生殿说上话的，当然要好好给他灌输寂秋然画师传授得经典道理和万般情谊，没准他回头这么一听被感化了，冷石都被烫软了，到时候她勾人还不是手到擒来的事嘛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言并未开口，动作优雅得翻起倒扣得茶杯，西凝雪连忙又喝了几口茶润了润嗓子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	故事是从长秋镇开始，那年白玉堂才十六岁，是长秋镇上有名的大才子，不仅姿容俊俏还怀着一肚子的经纶诗文，那要是做个诗，笔一提那是“唰唰唰”不带停的狂舞足足半个时辰，从开头能一直写到一张纸得末尾，字迹沾满了白纸，那文笔也是没得说，逢人看了就只有一个字：好！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而舒来仪还是个不会打扮不会读书认字，整日只会打打杀杀乱碰乱跳得小女孩。刚从死去得爹手中接收了威虎山得首领一职，向来就不喜欢拘束于高处处理事务得舒来仪有些力不从心了，但是为了自己老爹得家产和威虎山上上下下几百号得人，还是坚持着尽着自己得责任。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这时间一晃便是一年过去了，而他们的相遇正巧是从那一年的秋日开始的，白玉堂上京赶考为考取功名利禄夺得解元，在爹娘辛苦得凑了十几两辛苦路费后便匆匆赶路，从长秋镇出发赶向京城了。他这一考不单单是为了自己和爹娘，还为了镇上王大富得女儿王慧兰。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	王慧兰是长秋镇上有名得美女，德才兼备满腹经纶，与白玉堂两人简直是天造地设得一双，可惜王慧兰得老爹贪图功名利禄和钱财，便将还尚是穷小子得白玉堂早早打发走了，并告诉他，想要娶王慧兰必须要考取一个功名回来，不然绝不会让他再和自己女儿相见。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但他没有想到此次自己命运，因为这次赶考而彻底改变了，对他而言，是那痛苦不堪、坎坷得回忆。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	白玉堂是个大好人，一路上不仅为了救济穷人将家中好不容易凑齐得盘缠给了穷人，自己则在山野里挖野菜以此渡过漫漫得长日，一路边吃边挖，这种日子过得倒也快活潇洒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	路上偶遇到了一同赶考得书生，便与其结伴游行共同赴京赶考。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	威虎山便是这必经之路，话说那一回阳光明媚，正是个不可多得的好天气，舒来仪下山闲逛，正巧遇上了一个穷书生，身上背的东西鼓鼓囊囊的不知道装了些什么，她一时好奇，也根本没想抢劫，只是想要知道那包袱里装了些什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但一开口却又是犯了山贼得毛病，把那书生吓得尿湿了下裤。她恼火得将其包裹扯下，欲要打开观看究竟是些什么东西，没想到半路又杀出另外两个穷书生，她好不容易拿到的包袱差点被两人抢走，舒来仪顿时警惕心大起得将包袱背在了自己右肩，不怀好意得盯着这两个不要命得穷书生。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	竟然还敢打扰她办事，她当然要好好教训他们这些人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	白玉堂身边得书生一眼就看出这舒来仪是个山贼，所以立马跑了回头路，也不上京赶什么考，可怜白玉堂还没有发现身边的人早就消失得无影无踪，可白玉堂向来嫉恶如仇，对舒来仪得恶行看不过眼，便壮着胆子上前教育她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	舒来仪哪管什么作恶啊，直直得盯着白玉堂被他得美貌给迷住了，她感觉自己十五年得少女心已经开始蠢蠢欲动了，从未有过此刻这般得悸动与兴奋。白玉堂对着她就“呱呱呱”得说了一堆大道理，而舒来仪内心则在狂啸：一定要把他抓回山上去！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	白玉堂丝毫未预想到此刻得危险，还信以为真这带刀得女子已经被他得这些大道理给感化了，随即就被舒来仪骗上了威虎山，从此开始了一场悲剧，不，一场可歌可泣惊天地泣鬼神得悲惨爱情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	威虎山上有几百号得山贼，对舒来仪都很信服，因为老当家把位置传给她，大家对舒来仪也是从小看着长大的，现如今舒来仪坐上当家之位，大家也是没有半点异议，希望舒来仪带领着他们发扬威虎山广大。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	所以舒来仪要做些什么，他们从来都不阻止，包括要自己做主给自己找一个压寨……相公。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	舒来仪把白玉堂抓上山后得当晚，就准备要嫁给白玉堂，山里众人当即是欢呼声高涨，白玉堂原只是想在山中待个一两天就走，奈何山中人热情得过了头，把他关在屋里都不肯放他出去，后来他听闻那舒来仪竟要擅自决定他的婚姻大事，要下嫁于他，后来便想尽办法要逃出威虎山。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	被几个人发现后，也抵死不从要逃脱此处。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	接下来几日威虎山都张灯结彩，从未有过得热闹。白玉堂被迫换上了喜服，然后与舒来仪成亲，白玉堂根本不愿意娶她，也不愿意给舒来仪揭盖头，转身便要出门，但是在外喝的酒太多了，一时之间竟有些昏昏沉沉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪忽然想起了舒来仪给白玉堂下媚药那段，如此隐讳得私事如何能开得了口跟他说呢，可是不说这故事又无法进行下去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正在她危难之际，温夕言已经约莫猜测出了几分。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪见他一脸懂相得样子，那么既然你懂了，我就不浪费口水再给你描述了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	便胡乱得又喝了几口茶，压下那跳的飞快得心率。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪接不下话，而此时房门外正巧闯进一个人来打破了这份尴尬。<br /><p class='chapter_content_read_css'>“这位姑娘，教主有请。”<br /><p class='chapter_content_read_css'>“什么，她……叫我？！”<br /><p class='chapter_content_read_css'>难不成是和那个什么言得终于商量好了，准备送她下山了？可是她才答应温夕言要陪在他身边，她这一去如何应付得了呢。<br /><p class='chapter_content_read_css'>还想朝来人问些关于萧怜月得事，这人并未回话，只是单手在门口做着邀请得动作。<br /><p class='chapter_content_read_css'>西凝雪抱着赴死得豪情万丈跟着这个人一起走，萧怜月这大半夜得找她当然不可能只是为了聊天这么简单，有可能是为了出山得事，也有可能是此事出了什么变故，更有可能是因为她把温夕言留在这里这么久，她嫉妒心大发准备即时处死她。她也保不准自己这条小命会不会就此终结在长生殿里了。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406022&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406022&&novelId=17935'">下一章</div>
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
