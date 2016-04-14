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
    <title>楔子 离别</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405295&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405295&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405295+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[楔子 离别]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405295')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405295 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405295,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第4章&nbsp;&nbsp;&nbsp;楔子 离别
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“这夜明珠价值连城，你一个小小的宫女若不是从宫中偷顺出来的，便是胆大包天的要经专人之手转卖出宫。”绿莹莹的宝珠在慕容瑶手中辗转着，幽幽的绿光映射在眸中，如同一块极有光泽的绿石。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪给他看的时候却没有考虑那么多，但是她还是需要找一个理由搪塞过去，于是便顺着他的意说道，“我的确是准备倒卖出宫的，这宝珠少说也值百两银子，要是值钱的话换它个千两银子，我下半辈子就不用愁了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“你在这宫中来去自如，又凭着什么。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“……”西凝雪一下语塞住，半晌都说不出个字。她只是没想到，刚才圆了谎，第二个疑问又接踵而来，饶是再会找理由胡诌的西凝雪也有些棘手得没了主意。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪正在绞尽脑汁的想理由，慕容瑶却将夜明珠放回了锦盒当中，“骗我也没关系，你不想说的、想要掩盖的，我不会过问，我只要知道，你是小雪就好。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪的心被感动了，但只是转瞬即逝又变为了沉溺。要知道这谎要不是从您老住进我房里开始编的，我哪用得着费尽心思的去圆谎。归根结底这谎……必须撒下去！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“我自幼在宫中长大，大事小事都有娘亲和爹爹护着我，可是我们一家在宫中的日子过得并不好，我偷那颗宝珠，也是为了能让我爹娘过上好日子，他们年纪都大了，也许再过几年只剩下我一个人，我想在我还能看得见他们的时候，好好照顾他们。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		笑意定格在恰到好处的微妙弧度中，慕容瑶满含秋波的黑眸漾着好看的氤氲水雾，“人命不过如此，纵然再想挽留，又怎可能敌得过天意。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		诧异于他的奇怪，西凝雪变得沉默无比，但她现在最主要的任务，是思考明日该怎么将先生布置下的棋局解开。她为了给皇奶奶的大寿筹备，所以就荒废了这段时间的学业，再加上又要顾着时刻地照料慕容瑶，她更是将此事都抛之九重天后了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		但转念一想既然身边的人都是出神入化的高手了，棋艺方面自然也是……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶原本是拒绝再出手帮助她解决棋局，可西凝雪可怜巴巴的抱着他小臂，软磨硬泡的说了许多得好话，又连哭带嚷得上演要撞墙的戏码，实在让人生不出拒绝的念想。她才不介意装装小姑娘撒撒娇，只要达到了自己的目的。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪一边给他倒茶一边给他捶肩，讨好得放柔了口气道，“小瑶，你要是能在日落之前解了这棋局，晚饭我就让王大妈多给你一个馒头，不，两个。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		刚有点投入的慕容瑶闻言，强忍住笑意翩然挑眉，“别在我耳边叨扰了，给我留点思考的地方。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“您忙、您忙……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		一身轻松地西凝雪摊在了床上，忽然又翻身坐起，出神的望着手执黑子的慕容瑶，不慌不忙的落下一颗颗清脆的棋子，暖日将慕容瑶染成了明黄，所有的动作都在霞光中泛着柔光。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		要是能和小瑶一直这么呆下去就好了，被自己突兀的想法惊到，西凝雪拍拍红润的小脸，立即翻身闭上了眼。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		晚膳是小梅送来的，小梅的声音近在咫尺，“小主子，该用晚膳了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯……”一脸惺忪的西凝雪从床上坐起，刚要把盘子接过又想起慕容瑶，隔过小梅的身子看向趴在棋盘侧边的慕容瑶。见西凝雪望着自己，慕容瑶只好强打起精神坐起身子，刚用手撑了会儿的右脸颊落下了一片绯红，其本人仍未察觉的揉了揉眉心，那一幅油然而生的舒雅之态，让西凝雪刹那间几乎被勾了魂。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		片刻后，她便收敛起表情，听着小梅要吩咐的话。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“小……雪，老爷夫人吩咐说明日起就让你去内堂用饭，老爷还说，你不用整日呆在房里，出去爬爬树捉捉虫子也是可以的……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪闻言沉下了脸，内心闪过千万片得悲苦，那二老从前不是担心我疯的太厉害，整日都想让我呆在屋里吗，怎么这会儿我如你们所愿到开始担心起我了？西凝雪在心底默默的流着泪水。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“小瑶，你不要误会，我其实是一个很文静的姑娘……不是你想象中的那样……”额，调皮？活泼？已经无法往下想的西凝雪打住了话语。她遇见慕容瑶之前，的确是一个三天不出门就难受的皮姑娘，但现在能和同龄的人天天呆在一起，觉得在屋子里谈谈话聊聊天也没什么不好的，尤其是和慕容瑶说话的时候，她觉得很开心。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		小梅鸡皮疙瘩抖了一身的将门关上了，然后迅速逃走。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶静静地望着她，长久的沉默。西凝雪一时半会也找不到话给自己辩解，只好也跟着沉默得闭上了口。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		气氛沉寂了许久，慕容瑶打打呵欠，倦怠的歪过了头，夹在指腹间的黑子终是随着垂落的青丝掉落，“这棋局着实复杂，你这位先生为了这盘棋，看来也动了不少的心思。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“啊？”西凝雪对棋局从未动过半分想学的心思，不过听他这么一说却察觉到了他话中的不对，迟疑了一下还是走了几步绕到了他的身后。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		眼见着满满一棋盘的围棋，西凝雪暗地里咂了咂舌，不愧是高手……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“这个人从一开头就堵死了所有的路，他是否对你说，让你参透这一局棋以后便教你新的？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“咦……你怎么知道呢？！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“你不懂棋所以才会被欺骗，如果你肯认真一点，也就不会被蒙骗。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嚯，这死教棋的竟然欺负我不懂下棋，就这样糊弄老爷和夫人，着实可恶！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“他也不过是贪图安逸，况且你对这棋局又不感兴趣，何不就着这位先生的意，大家相安无事。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯……你说的有理。”西凝雪闻言赞同的点下了头，随后又听他在一边道，“小雪。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪迟了会儿，才发现他是在叫自己，大梦初醒般的回过神。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		她还是第一次听他这么叫她的名字，也是第一次觉得自己名字原来这么好听，尤其是从他的口中说出，更加清润柔和得让人难以抵挡得欢喜，在心中默默的压抑着，然后面不改色得反问道，“嗯，什么事？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“乱了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪迷茫的盯了他几瞬，没读出什么意思，半晌又从端着的清茶中发现了自己的模样，披头散发，衣衫不整，西凝雪羞红了脸，回过神用手将翘起的鬓发压下，可不一会儿那头发又恢复原状，让人心恼。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		更加恼火的是旁边还坐着看戏的人，她一时心急背过身更加着急的捂住头发。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶望了她片刻，端着一杯刚斟上的清茶走来，只见他用沾了茶的手顺过她乱糟糟的翘头发，没到半晌，她的心头大患就解决了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪尴尬得看着他，然后装作喜逐颜开的傻笑道，“你懂得真多呀。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“自然，从前我若是失了一分仪态，便会被娘亲责骂许久，可现下无拘无束，我却想念起娘亲的那份严厉……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪自动的把他的话总结了一下，他应该是想亲人了。她心中忽然为他感到悲哀，一个与自己一般大小的孩子，也不过是在家与同龄人玩耍，与爹娘拌嘴得年纪，怎么会一人流落在深宫中，还受着重伤。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		许久，她才想起来要安慰他，便轻声道，“……想娘亲啦？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪见他即刻背过身去，她又紧追不放的笑道，“虽然你现在双亲已不在人世，但若是他们在，也一定盼着你过得从容自如，不让二老担心。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶似笑非笑的饮下了一杯清茶，清润的黑眸中流露出决绝而又美丽的颜色，“从容自如？我还能……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		话语戛然而止，他放下杯子身影，飞快的朝床侧里躲去，随即是老爹推门而进，西凝雪惊魂未定得望了望后方，然后连忙上前迎接，“爹，你怎来了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		老爹并未将目光放在她身上，反而打量起屋里的其他地方，“方才我可是听见这屋里有别声，你屋里头是不是藏人了！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“没有啊，我方才那是自己对自己说话呢，不信您听。”西凝雪清咳一声，开始装起了慕容瑶的声，“人之初性本善……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		老爹冷哼一声，“你真当你老爹是聋子，辨不出自己女儿和别人的声音？！来人，给我搜查屋子！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“爹！”西凝雪心如雷鼓，忐忑不安的握紧了衣袖。她不想让慕容瑶暴露出来，如果真的如此，他也许就会被爹送到那个吃人不吐骨头的牢房里，她怎么能允许呢。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		老爹不动声色的转过身子，西凝雪咬了咬唇，自知劝不动眼前人，背身又去拦那两个家丁，“大胆，别随随便便碰我的东西！快放下放下！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		话音刚落，两个家丁站到了前方，“回禀老爷，没有找到其它的人。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪说不出此刻是什么心情了，却也总算如释负重得松了口气，“爹，您为何不相信女儿呢，女儿真的是想发奋图强好好努力学习琴棋书画得！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		暗地里捏了一手的冷汗，她正疑惑呢，为什么才这么会儿，冷汗就冒了出来。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“……这。”老爹只能作罢的说道，“爹听闻这些日子你总向王婶讨要食物，是不是平日里小梅那丫头没照料好你？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“没有……只是女儿最近总觉得饿，所以向王大妈讨要多余的饭菜，女儿觉得这种小事不用告诉爹爹，所以才一直没说。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“唉……你现在正是长身体，要多吃些也是应该的，这样，让王婶每日多加些菜……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯，爹爹真好！”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		将老爹打发走，西凝雪可谓是经历了一次生死大劫，连气都似掠夺般的大口喘着，忽又拍拍床梁打探情况，“小瑶，你在哪里？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯。”慕容瑶挥着衣袖捂住口鼻，还是防不住吸了几口灰尘咳嗽了几声，艰难的从床底爬了出来，那蒙了灰的脸让西凝雪不禁忘乎所以的莞尔一笑，“原来你从床侧下去了，不过那缝这么小，你伤口没被挤到吧？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶擦了擦面上的细灰，“没事。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“没事就好，方才我爹……”西凝雪顿了顿，有些不安的蹙眉，“你都听见了吧？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		更加无措的挠了挠脑袋，然后一动不动的朝着他眼睛望着，试图能从他那双黑眸中窥到一点怒气，可惜没有，慕容瑶并不在意她的欺骗。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		其实他早就识破她的身份了吧……不过现在还是应该把这个谎言继续埋下去，说白了也就是她单纯的死鸭子嘴硬，“其实我是被老爷夫人捡回来的，他们好心收留我为义女……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“小姐是我干姐姐……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶真的丝毫不在意，搞得她这一味的解释显得根本没有半点用处。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		别扭的抓抓小脸，掌心发烫。除了面对自己锦纤哥哥会紧张以外，慕容瑶在她的心里好像也逐渐占一块又一块得地盘。她对锦纤哥哥也只是兄妹之情，然而面对慕容瑶却是完全不同，比前者更加想要依赖他，和他在一起。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		而这种奇怪的想法，一旦触及到慕容瑶以后可能会离开之后，心口就有点止不住的难过。她仔细想过了，若不是他在她心中举足轻重的地位，她大可不必那么紧张的求爹爹，正是这种连自己都不知道的改变，让西凝雪明白，慕容瑶的重要。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“小瑶……”她轻声唤道，有些压抑不住的颤音。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯？”他轻声答道，仍旧是那副云淡风轻，不减丝毫的风雅。更让人想起那日身负重伤，连眼神都透露着深深的戾气的慕容瑶，但他对西凝雪也从一开始的戒备与警惕，逐渐化为了信任与温暖。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“你以后……真的会离开吗？”她的内心在忐忑，怕听到自己不愿意听到的结果，可纵使知道结果，西凝雪也要问。她不怕面对最坏的结局，只是怕会来不及面对。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“会。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪咬紧牙关，坚持的问道，“再也不会回来了？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		慕容瑶将巾帕搭在了架子上，整整齐齐的，回过头，干净的面容上笼着柔柔的笑容，“我会回来的。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪觉得那笑很美，像是被沐浴着阳光的白雪，永远都保持着最纯净最唯美的姿态。她也很开心，听到了自己想要的答案，哪怕这个答案与她的料想偏差了一点，只是她有点贪婪，想要贪婪的知道更多。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“那你……就不能一直和我在一起吗？”明明有这么多问题可以问，连西凝雪自己也不知道为什么选择了这条，就好像很多事情莫名其妙的就由自己的身体做了出来，不受控制。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“一直……？”慕容瑶的神色有些恍惚，些许眸中闪过了一丝忧愁，可他看向她的目光中仍是柔情似水，“等我回到皇宫，我会回来找你的，你……愿不愿意等着我。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“我不愿意……”西凝雪心乱的哼了一声，慕容瑶表情有些失望的垂下了头，西凝雪赶紧补上了下句，“等你回来找我的时候我都嫁人了，到时候……我就不要你了。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“那这样……”慕容瑶径直走来，西凝雪红着脸羞怯的抬眸睨了一眼他，他将她的身子板着面向他，“我发誓，此生此世我慕容瑶绝不会对除了小雪以外的人动心，若有二心，必当天地诛之、无处留身。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪心中万分的动容，恨不得也来个海誓山盟，但是她毕竟是个女子家，要矜持一点。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“……那，那我也答应你，等你回来的时候我才嫁人……不过你要早点回来哦……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯，会的。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		梦醒，又是一场过眼云烟，一次次的相思，一次次的疼痛。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405295&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405295&&novelId=17935'">下一章</div>
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
