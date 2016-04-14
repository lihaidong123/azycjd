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
    <title>第十九章【勾搭轩辕祁】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405863&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405863&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405863+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十九章【勾搭轩辕祁】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405863')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405863 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405863,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第21章&nbsp;&nbsp;&nbsp;第十九章【勾搭轩辕祁】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 邵渊戎慢慢的拉回了思绪，抬头看了轩辕祈一眼，眼中是轩辕祈与邵轻扬都不了解的疼爱。后来，邵渊戎轻笑一声，便留了轩辕祈用午餐，这自然是在外院了，轩辕祈虽然有些小小的失望，但为了邵二小姐的闺名着想，他就按捺住自己陪着未来的岳丈大舅兄用餐。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 只是邵卿卿不知从哪里听说邵轻扬带了一个品貌十分出众的男子进了府，于是她躲过张氏的视线，带了帷帽与贴身的丫头悄悄的出了二门，朝着邵渊戎平日宴客的大厅走了过去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 不知是不是邵卿卿的运气太好，还是邵府今日下人都在躲懒，从二门到宴客的厅堂，竟没碰到一个拦路的下人。藏在大厅的石柱后面，邵卿卿拍了拍自己的胸口，长舒一口气，运气真好！而后悄悄探出头去，一下子惊得睁大了双瞳，急忙藏好身子。拍了拍因为激动而“扑通扑通”直跳的胸口。虽然她带着帷帽，有白纱遮挡容颜，但从里面看出去还是一清二楚的，所以，邵卿卿是真真的看清了轩辕祈的俊美容颜，一下子惊为天人。看了看身上穿着的藕色裙衫，上面配了一条绯色云锦的披肩，发觉自己仪容还算得体，邵卿卿便准备跨步向外走去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 看着邵卿卿的动作，雪莹一下子给懵了，待反映过来的时候双手早已不顾尊卑的跪地拽住了邵卿卿的裙衫。自己要是让三小姐直接过去见了外男，回头夫人还不得扒了自己的皮啊。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “雪莹，你松手！”邵卿卿虽然暴怒但却压低了声音，好不容易遇到一个长相如此俊美的男子，她怎么能错过呢。看雪莹还没有松手的意向，邵卿卿怒目而视，冷哼一声，然后抬脚踹向了雪莹腹部，雪莹吃疼，松手捂向自己的肚子，口中还在小声说着，“小姐，万万不可啊！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵卿卿完全没有理会，提了裙摆径自踏上了台阶，行走间摇曳生姿，藏在帷帽下面的发髻上带着的赤金挂珠钗的赤色珠子与耳垂带着的红宝石耳坠轻轻相撞，发出清脆悦耳的声音。邵卿卿誓要将自己最美丽的一面展现给那名男子看到，只顾着看美男的邵卿卿完全没有发现自己父亲与兄长微黑的面容，只是有些恼怒那名男子竟然连看都不看自己一眼。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “女儿给父亲请安，父亲万福，”邵卿卿总归是没有忘记父兄，还记得先向父亲盈盈一礼，姿态柔美，而后有稍稍转身对这邵轻扬一礼，“卿卿给兄长问安！”邵轻扬嫌恶的看了邵卿卿一眼，完全没有理会。邵渊戎虽然生气她一点也不顾及女儿家的颜面，刚想训斥两句，但在他口微张还未发出声音之际，邵卿卿又低头对这轩辕祈盈盈一礼，“卿卿给公子请安！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵渊戎觉得这孩子太过无法无天，女儿家的闺名怎可随意告知他人，尤其是外男，还在不等父兄介绍的情况下就直接对着外男行礼，即便是今朝礼法不似前朝那般严苛，但也没有开放到这一步，这也太失了女儿家的礼数了。于是邵渊戎怒声道，“放肆！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “父亲，”邵卿卿的声音透着三分娇软，五分委屈，两分不甘，罩在帷帽下的眼眶也含着泪水，如若直接摘下帷帽，定要惹得其他男子垂怜，“女儿……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “来人！”邵渊戎根本没有听邵卿卿语无伦次的话，而是重重的放下手中的竹筷，厉声喝道！<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “老爷，奴婢错了，奴婢真的错了！”后面还一直藏着的雪莹急忙滚了出来，跪在地上磕头如捣蒜一般。她虽然十分不想现身，但一想到三小姐那些折磨人的法子，她就立刻出现磕头认错！<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “把你家小姐带下去，禁足十日！”邵渊戎挥了挥手示意她们全都退下。雪莹一看，当下也顾不得其他便就跪着的身子向着邵卿卿连连磕头。邵府在安媛柔主事期间从未体罚过下人，但是下人一个个都十分尽职守则，哪像现在的张氏当家，邵渊戎不在的时候，动辄打骂下人，反之则亦然！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 雪莹的身子抖若筛糠，她都能够想象夫人与三小姐齐齐折磨自己的样子了，雪莹打了个冷颤，转头向着邵卿卿的方向继续磕头。邵卿卿为了不让来人看到自己娇蛮的一面，于是她盈盈一礼带着哭腔跪拜父兄之后就转身欲走，只是不知是有心还是无心，竟然摔了一跤，好巧不巧的帷帽给掉了下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 雪莹眼睛一闭，她已经不能想象自己会遭遇到什么对待了，只愿夫人给自己留个全尸。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “父亲……”邵卿卿语带委屈的唤了邵渊戎一句，但她却双颊绯红双眸含泪的侧卧在地上看了轩辕祈一眼，邵卿卿自认展示了自己最美的一面，美人横卧在地，清瞳含水，若是一般人肯定会出声劝慰一番，争取给美人留下怜香惜玉的印象。只是，邵卿卿错估了轩辕祈，他根本不是一般人，再者说来他已经有了心上人，自然不会多加注意其他女子了。邵卿卿的媚眼算是白抛了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “孽女，还不快些退下！”邵渊戎仿佛是第一次认识这个三女儿一般。大女儿嫁入京都，二女儿一开始因为种种原因与自己并不亲近，二儿子身体一直较为虚弱，平日多在张氏房中休息，平日也不怎么出来，与自己也并不亲近，小女儿是妾氏王氏所出，终日与她姨娘缩在“怡玥阁”一旁的偏房也不从在自己面前晃悠。只有这个三女儿整日在自己跟前逗笑，自己也一直以为这个女儿是个知书达理的大家小姐，但自从自己这次回来之后，这个女儿一而再的让自己失望，如今竟然做出此等不顾脸面之事。邵渊戎怒从心起，一掌拍向桌子，桌子上放着的白玉酒杯应声而裂，可见邵渊戎的怒火有多大。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵卿卿心里“咯噔”一下，这才察觉出不适来，收敛了面部表情，低垂着头，声音也不自己的小了不少，讷讷唤着：“父亲！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “贤侄见笑了，”邵渊戎深吸一口气，强自忍着怒火，对着轩辕祈面露一丝苦笑，轩辕祈也是知情识趣之人，知道再呆下去也是见不到自己心心念念的那人，于是就起身对着邵渊戎俯身行礼，“小侄先行告退！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “扬儿，替我送送轩辕公子！”邵渊戎的一句话让一直默不吭声装背景的邵轻扬抬起了头，低头敛目应声道，“儿子谨遵父命！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 而后，邵轻扬带着轩辕祈对着邵渊戎躬身行礼之后就直接离去了。整个过程中轩辕祈连看都没看邵卿卿一眼。而邵轻扬的嘴角则是含了一抹冷笑，他今日真是开了眼界了，原来张氏竟然是这般教育女儿的，幸亏依依与张氏不亲近，不然依依也变成这般见了俊俏男子就迈不动步的话自己该如何向过世的母亲交代啊。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 前院的事情才发生了片刻时间，就传到了后院，张氏带了唐妈妈与贴身伺候的锦玥环绣朝着前院走去，前面带路的是邵卿卿的贴身丫头雪莹。因着邵渊戎异常生气的缘故，遣了雪莹直接去请张氏，也让顺伯清理了前院厅堂附近伺候的众人，就让邵卿卿侧卧在地不让起身。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏得到了消息，邵依依也听到了信，涟漪向她报告的时候，她正坐在花厅品着穿着青草绿裙衫的浣纱为她泡得香茗。自从邵渊戎回府后几次的来访，邵依依院子中的日常用度也都正常了起来，也喝上了今春的新茶。邵依依虽不喜品茶，但饭后还是会用上一杯的，帮助消食。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依上次买的四个丫鬟，年纪最大的那个较为老实的邵依依给她取名浣纱，心灵手巧且话少的那个取名云雁，另外一个擅长做饭的取名夏秋，邵依依将她交给了涟漪，待小厨房建立起来后，就由他们两人共同管理，最后一个话多且四面玲珑的取名画屏，就负责各院的联络事宜。四个丫头各有所长，且都是会伺候人的主。于是，“墨崖阁”的四个二等丫头诞生了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “呵呵……”听完涟漪的汇报，邵依依表示一笑而过，对于那个弱智女她表示不会过多的干预，既然人家喜欢轩辕祈那就让她勇敢的追求所爱吧，自己乐得清静。邵依依表示今生定要离男人远点，轩辕祈，还是算了吧，她要是相信轩辕祈对她一见钟情，那她就活该被渣夫毒死。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “多谢款待，”轩辕祈对着邵轻扬拱了拱手，虽然今日没有见到邵二小姐，好吧，到现在也不知道人家叫什么名字。轩辕祈也知道女子的闺名是不会外传的，尤其还是官家小姐一定要恪守闺训，但是像这邵府三小姐的，他还真没见过。但是，作为一个世家公子，是不会说道别人家的事情的，所以轩辕祈只是继续道，“邵兄，改日再会，告辞！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “轩辕兄，请！”邵轻扬拱手回礼，而后看着轩辕祈踩着脚凳踏上那辆低调的马车，乔喻收了脚凳，轻轻一跃跳上了马车，坐在了车夫的位置，朝着邵轻扬一拱手，而后扬鞭，马车缓缓向前走去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 直到再也看不见马车的影子，邵轻扬才转身回了府，站在前往二门与父亲的书房的岔路口，想了再三，还是决定去妹妹那里。邵卿卿那趟浑水，他才不想去淌，也不想看见那丢人的东西。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “老爷，”张氏一踏入前院的会客厅堂，就看到自己千娇万宠的女儿侧躺在地上，幸亏先下天气热了起来，不然非得受凉不可。即便心中再恨女儿不争气，这个时候还是心疼占了上风，心疼的跪坐在邵卿卿身侧，看着女儿蓄满泪水的双瞳，张氏的眼泪也流了下来，声音也带着些颤抖，“卿卿她还小，有什么事情您慢慢说？”说着，就伸手扶住邵卿卿想要将她扶起来。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405863&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405863&&novelId=17990'">下一章</div>
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
