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
    <title>第十九章 为她而止步</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405973&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405973&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405973+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十九章 为她而止步]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405973')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405973 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405973,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第23章&nbsp;&nbsp;&nbsp;第十九章 为她而止步
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	但这几日相处下来，她只知他进退有礼，凡事都带着礼貌性的舒雅，即便惹火了一人也会巧滑的为自己圆场或是置之不理，她不愿意承认自己在他面前是少有的会动怒，偶尔打量一下那双清冷无情的眸子，什么怒气都能被消的一干二净。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她猜不透他在想什么，自然也不知道他的心中究竟压着些什么，使他变成了如今这古怪的性格。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	路过了一个卖糖串的小摊贩时，西凝雪嘴馋病又犯了，忍不住牵了牵他的衣袖，一脸堆笑，全然忘了自己前阵子还怎么对他冷言冷语的笑眯眯。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我要吃糖串，你有银子吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“有。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他掏银子的动作真是美呆了，连西凝雪都为之倾倒的眯成了星星眼，然后不假思索的用那十两将小摊贩手里的糖串都换来了，这下好了……她这一路都可以品尝美味了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	悄悄打量了一下身边这位金主，自然软下了性子，客气的拿下了一串先递给他，“温太医，你先请，别客气。”我这还多的是。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言稍加眯起了眸，好看的眉角上蕴育着别样的风情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪不等他开口就把糖串往嘴里一塞，含糊不清的说道，“我明白了，您不吃这些杂物是吧，那我就全吃了……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	您是神仙您是全天下连吃饭都吃中药的神人，我西凝雪是个俗人，自然只能沾着您的仙气过日子了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是扛着糖串西凝雪又进行了一场长征，打量着四周还环着雾气的景色，一颗颗翡玉一样葱绿的大树千姿百怪的盘根交错在土里，还有一些叫不出名字的花花草草。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	走走歇歇，好不容易来到山脚，抬头望望这高高耸立、连山顶都望不见的高山正向她发出愉快的邀请，忽然一股叫做绝望的心情油然而生。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这么高的山，这要爬到几时，他这么有钱直接将药材都买回来不就好了，还费什么功夫亲自来爬山受罪呢。哦，对了，她是忘了那个叫做温夕言的人，他是一位连药材都当饭吃的人，此子非正常人，自然要做不正常的事。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	看了一眼眼前步伐轻快的人，她只觉得自己双腿已经开始麻木，腿脚中灌上了一大堆的木屑，又酸又痛，只要再继续走下去自己双腿就会废掉。痛苦时累死累活的如牛喘般的大口吸着空气，巴不得所有的空气都被她一人吸尽才好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	偏偏她就是倔着性子硬是独自扛了许久，一路跋山涉水她一个累字都没说，但温夕言忽然转走了水路，周边都是潺潺流动的溪水，而在水中林立着几十个可以通行的大石块。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪蹲下身子用水洗了把脸，顺便将汗也擦擦干净，再抬头时那人竟然站在水中央，为她而止步。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	心中的喜悦自然掩盖不住，西凝雪甩干了手上的水便踏着飞快的步子赶去，就在快要临近时，西凝雪没注意脚底下的青苔，她几乎是下意识的朝前倾了倾身体。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	万般无奈之下西凝雪眼疾手快的拉住了他的手，他没有防备着这突如其来的重量，但还是在几息之间调整住重心，将西凝雪紧紧牵住了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	整个过程两人都没有说一句话。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪稳住身形后自然感觉到他紧握自己的力度，心中的喜悦莫名其妙的转化为羞怯，她想甩开他的手，但温夕言并未有任何别的心思，只是这么牵着她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这些石头常年经水冲击，不小心自然会被石上的水廯滑着，我带你过去。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“啊……”西凝雪不自觉的发出了一声吟哦，随后才又安抚起自己紊乱的心神。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她该怎么面对这人呢，是坚定自己绝对不要再跟他有一丝一毫的牵连，还是再一次陷进他的温柔当中呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她忽然有些害怕牵着自己的这双手会再一次给她深渊般的打击，她一向随心所欲，但是在他面前，自己完全提不起半点能装疯卖傻的心思，甚至是一次次的出丑，一次次的被她自己所谓的聪明而打倒。而他的性子却那么好，仿佛一切事情他都在抽丝剥茧一般，能活生生的将她的内心活动剖析的没有半点差错。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他就好像千尺万尺的深潭，无论怎么努力却只能触及到表面的一层，然而真正要懂他，又要花多久呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	几十个石块他都带着她小心翼翼的踏了过来，到了岸上西凝雪主动的收回手，好似再多一秒，自己就会被那份寒意侵蚀。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她想清楚了，虽然温夕言是她喜欢的类型，但他和自己完全合不来，与其这样充满期待，还不如退避的远远的。于他，于自己，都是一项绝好的决定。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我累了，我要休息。”西凝雪一屁股坐在干净的大石块上，目光深远的望着他，他不声不语的将药娄放在一边，也坐了下来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	拿着小树枝在泥土上划了划，这一笔一划下一个无心的情字逐渐呈现出来，西凝雪回了神立即慌忙将字用脚抹掉了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	自己真是越来越奇怪了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	转头偷偷望了一眼温夕言，只见他散乱的黑发在清风中飘扬着，她只要稍一抬手就可以摸到那柔顺黑亮的长发，而她可以想象的到，在那长发之下，是怎样一张绝世秀丽的脸容轮廓，足够让世人都为之着魔了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	然而她的确是这么做了，轻抬着手，他的发丝就缠在了她的腕上，蹭过了她的指间悄然滑落，这是多好的发质啊，让她不由自主的想到《狐狸女》的第一回，狐狸女出山时，那又黑又长还弥漫着香味的青丝飘摇下得惊艳，让她深刻的刻在了脑子里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但狐狸女的结局并不好，她被无情的书生一直剥削至死，到了最后连头发都被剪下拿去给书生换钱度日子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	当时为了狐狸女西凝雪心痛的在床上卧了许多天，不吃饭也喝水，除了以泪洗面不知道该做什么了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“难不成你真的是只狐狸？”登时，西凝雪就莫名其妙的来了这么一句，她其实并不惊讶自己会这么说，但她想知道的一般都会当面问个明白。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言眸色微凝，转过头嘴角含笑，那淡定优雅的声音缓缓响起，“倘若我是，我一定会霍乱朝纲迷惑帝王心，做第二个苏妲己，可我不是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪闻言有些激动，“不对，不是这样的……你应该爱上白衣书生，然后为情而死。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言微微一笑道，“哦？我不见得我会为情所困。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我知道，因为你的心是冷的。”西凝雪突兀的笑出声，她不知道自己为什么会笑，但说的话却是锵锵有力还带着几丝自信的意味。正因为确认才会自信，正因为他从未反驳过。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	自己，是个绝情的人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	狐狸女的心思是单纯的，她敢爱敢恨有所作为，甚至为了书生拼上了毕生的修为。她的深情和温柔都献给了书生，可是到了最后书生给了狐狸女什么？是毁灭性的打击！可他不是，也幸好不是，正因如此世间才会有一个叫温夕言且冷血心肠的毒辣少年。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正午阳光火辣辣的烧着，西凝雪汗流浃背的往前赶路，前方那人依旧是一身清风步子轻快，如是再大的太阳也晒不化他坚如冰石一样的外表。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他一边弯下身子一边轻巧利落的挖起草药，但每颗草药无一例外都是只从根处便被截断了。留着根来年还可以再生长出新的草药来，这就叫挖根不忘本。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪就站在他身后，左手抱着小喜儿，右手扛着糖串，任劳任怨的帮着用空闲下来的脚踩平凹凸不平的泥土，好让药草根被泥土覆盖住。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		这么一路踩下来西凝雪只觉自己要变成了火人，就快燃烧而死，好不容易到了阴凉的大树下，实在走不动的靠着大树休息了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		温夕言微侧过身便见她抱着双膝，将自己整个人都缩成一团窝在纵横交错的树根上，他浅浅一笑，没有半点因为天热而应有的燥气，依旧径直的向着山上走，背影修长而又模糊。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪就这么抱着小喜儿在树旁呆了许久，又累又渴又有些饿的疲劳感让她叹了口气，心想着自己睡着了就会忘记饥饿了。不如人意的是，她刚做到美娇郎白玉堂郎当上解元，女山贼千里相寻的梦，那一滴冰凉的雨水就打在了她的脖颈处，缓缓划至她灼热的皮肤上。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		她寒颤得抖了抖身体，被迫从温暖得梦中醒来，无论是树身还是地面都被点点而至的雨水浸湿，她有些怕冷的抱紧了怀中缩成一团比她还能睡的小喜儿，只有小喜儿身上的温暖能带给她做为支援的能量，她无助的将下巴搁在膝盖上。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		望向远方的视线也停留在远处的雨幕中，似乎现在要走更会被淋成落汤鸡，再加上还要护着小喜儿她就更加不能离开这个还算能遮风避雨的地方了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		但等了许久都没见到他出现的身影，不禁有些失望的垂头丧气时，一件熟悉的白衣披在了她瑟瑟发抖而又潮湿的身体上，来不及问他为何这么晚才回来，就被眼前突然伸出的手打断了所有的思绪，此刻，西凝雪几乎是没有任何思考的就将自己的手交了出去，然后任由他牵着朝山上走去。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405973&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405973&&novelId=17935'">下一章</div>
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
