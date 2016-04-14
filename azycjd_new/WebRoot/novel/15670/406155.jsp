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
    <title>（七十三）双生一蛊不复再 嗜血巫女现世间</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406155&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406155&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406155+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七十三）双生一蛊不复再 嗜血巫女现世间]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406155')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406155 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406155,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第78章&nbsp;&nbsp;&nbsp;（七十三）双生一蛊不复再 嗜血巫女现世间
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;双儿激动地抱住她，大哭出声，这是她的姐姐，她的姐姐啊！在这个世界上与她有着相同血液的亲人啊！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 良久，她才止住哭声，一脸兴奋的看着被她吓到的漠漠。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “漠漠，你怎么会在这儿？”双儿握着她的手，跪坐在地上，语气激动。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 漠漠呆呆看了她一会儿，哽咽着道：“我也不知道，我想找我阿哥，我想找我阿哥，阿哥，阿哥……呜呜……阿哥呜呜……我要找我阿哥……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她说着说着又哭开了，完完全全就是一个小孩子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿抱住她，“我陪你去找你阿哥，我陪你去找，不要哭了，哭坏了眼睛可怎么办？不要哭了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她不知道为什么她姐姐是个十岁的孩子，可她却是一个十六岁的少女，或许，这就是司命星君口中的奇葩？不过不管为什么，她总要弄清楚，为什么姐姐会在这里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 漠漠对她也是甚为亲近，两人相依为命，一直朝着远方走去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 一路上，双儿是遇妖杀妖，遇鬼杀鬼，漠漠总是小心地躲在她身后。她曾也害怕过若是漠漠看见她满手血腥会不会讨厌她远离她，但是漠漠没有，还很关切的询问她有没有受伤。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 漠漠虽是对她亲近，却一直不肯说出有关她的任何事，只是一昧地喊着要阿哥。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿也是倍感无奈，她心中隐隐觉得，是漠漠又重蹈她的覆辙，至于她的那个什么阿哥，肯定和当初照顾她的那个人是一样的性质。只是她无法对漠漠说出她的猜测，漠漠太过干净了，所以才会在这儿肮脏之地还能散着光芒，所以才会被那些居心叵测的妖鬼盯上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 就算她们无法从这里脱身，她也绝对要，也绝对会保护好她唯一的姐姐。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 一日，许是夜间，双儿搂着漠漠睡下，再次睁眼，却被微弱的日光包围，她怔忪了一会子，呆呆的看向坐在自己旁边少年，十四五岁的模样，与那人是几分相似，只是那双杏仁般的眼睛让她清楚的明白，这个少年不是他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “漠漠？”少年疑惑地看着她，停下了手中的勺子，“怎么了？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿反应了好大一会儿才明白过来少年原来是在喊她，不，是在喊她的姐姐，这具身体真正的主人，她不知道这是梦境还是真的附身在漠漠身上，她握了握不属于自己的稚嫩的小手，缓缓扬起一个笑容，声音的稚嫩让她有些晃神。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “没，没事，阿哥。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年笑笑，盛了一小勺粥吹了吹，小心翼翼的喂给她，双儿心中有些高兴的去吃，手却不由自主地抬起来甩开了少年靠近的手，瓷质的勺子一下子滑出去，摔在地上，断成了三节。少年面色复杂的看着她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她的身体不受控制腾地站起来，一边哭泣一边喊道：“为什么云觅会消失了！为什么！为什么只有我还在！他们全都消失了！为什么！阿哥，你告诉我啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年紧紧抿着唇放下碗，缓慢地站起来，低头看着漠漠，眼里满是复杂的情绪。然后蹲下身紧紧把她抱在怀里，低声道：“因为，漠漠是云殇最尊贵的女孩子，所以……所以……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 他却是一个字也说不出来，漠漠站在那里，大声哭泣，像是要把所有的委屈和不解全都哭出来。双儿这才明白过来，或许，这便是漠漠的记忆。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她或许都明白了，她微微扬起一丝冷笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 漠漠同少年一直住在乡下，漠漠还有一个很要好的青梅竹马，名叫云觅，生活本是风平浪静，但村子里的小孩子却从一天晚间开始陆陆续续失踪，衙门搜寻多日，是连一丝蛛丝马迹也没有发现，最终，村里只剩下了漠漠一个小孩子，就连云觅，也是在跟她一起睡觉的夜里突然消失的。漠漠只能向少年追问那些人都去哪儿了？云觅为什么消失了？为什么只剩了她一个人？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 但是，少年没能给出答案。她不再像以前出门玩耍，因为她害怕那些人的眼神，那些人看她的眼神都很怪，就跟云觅看到最讨厌的黄蛇的时候一样，她还听到一些人说她不是阿爹阿娘的孩子，可是，她不是阿爹阿娘的孩子，还能是谁的？她最害怕的还是阿哥会嫌弃她，如果，她不是阿爹阿娘的孩子的话，阿哥会把她赶出去吧？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 幸好，阿哥似乎没有注意到这些话呢。漠漠躲在厨房外，小心翼翼的偷看正在做饭的少年。少年仿佛什么事都没有发生过似的，依旧每天很细心照料着漠漠。漠漠觉得，这样就够了，只要阿哥不嫌弃她，怎么都好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 但最终还是事与愿违。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 是夜，漠漠睡眼朦胧间恍若看到了什么闪亮的东西从自己面前闪过，她紧紧闭上眼，听到轻微的脚步声愈来愈远，她咬住被子，稀里哗啦的落着泪，不敢出一点声音。她晓得那是什么东西，那东西云觅和阿哥都有一把，云觅叫那匕首，她曾经亲眼看着一个男人把那东西刺在云觅大腿上，然后，云觅就一直流着殷红的血。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 阿哥和云觅都嘱咐她，以后一定要离这东西远远的，一刀下去，或许会命丧黄泉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 可是，为什么，阿哥会拿着那东西从她面前划去？为什么？其实，阿哥他，早就知道了……吧？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 第二日起床，少年照旧来给她穿衣服，漠漠却在接触到他的那一刻，浑身打了一个冷颤，她握住他的手，有些近乎疯狂的喊道：“阿哥，阿哥，你会一直陪着我吧！阿哥，不要丢下我！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年抱住她，温柔道：“嗯，阿哥会一直陪着漠漠的……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 话音还未落，房门就被人粗暴的踢开，少年将她用被子从头到脚包裹起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她在黑漆漆的被子里面听见外面的对话。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你们这是做什么！怎么可以乱闯我阿妹的闺房！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “柳家大郎，我们昨个都已经给你说过了，要带走这个小丫头，要不是看在你平日心眼好帮过村里不少事，我们可是昨个晚上就把她带走了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “好，那你们也得等我阿妹穿好衣服吧？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “好，再卖给你一个面子，最多一刻钟。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年慢慢把被子掀开，漠漠瞪着湿漉漉的眼睛看着他，呜咽道：“阿哥……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年扬起一个僵硬的笑容，慢慢帮漠漠穿好衣服。期间是死一般的寂静，漠漠死死咬住唇不让自己发出一点声音。少年低低道：“好了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 门外的人进来，一把便扯住了漠漠的手腕，将她向外带去，漠漠死死抓住少年的手，大叫着“阿哥，阿哥”，但少年却别过脸去，将她的手指一一掰开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她直接被一掌劈晕过去，再次醒来后，迎接她的却是永无止境的黑漆漆的药水，有时还会看到上面漂着的蝎子蛇胆等毒物，一群蒙着面的黑衣人将她绑在一个凳子上，日日灌着这些乱七八糟的东西。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她看不清楚眼前的人面，只觉得大脑都是混沌一片。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 最后一次，她被人绑在了床上，有人绞开了她的脚趾和手指，有什么东西迅速顺着鲜血和伤口钻进了身体里面，她想要惨叫却被人用东西塞住了嘴，她瞪着眼珠盯着黑色的屋顶。那些细小的东西迅速侵占她的血肉，似乎要吃尽她的肉，喝尽她的血，那些东西在她身体里翻涌，慢慢侵占她的每一丝神志。她奋力挣扎着，想要逃开这种折磨，但有更多的手死死按住她，她绝望的连一滴眼泪都没有了，连泪腺都有黑色的东西在缓缓爬进去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她浑身猛一抽搐，很快没了反应，瘫在床上，像死尸一般瞪着可怖的眼睛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 但她还能听见说话声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “五公子的那个早就失败了，剩下七公子的这个，当真是个好材料，七公子也当真用心，提前给她滋补身体，若是此次她能挺的过去，这届的大巫司便非她莫属，若是挺不过去，只能用剩下的最后一个了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “只是没想到，从小娇生惯养的身体，竟然还可以挺得住这么多毒物的毒性，只是这最后一道双子蛊，就看她气运如何了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “砰！！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “漠漠！漠漠！你们这是做了什么！谁允许你们这么大胆！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 听到了熟悉的声音，漠漠死板的眼珠转动了一下。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “七公子。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “我在问你们，是谁允许你们做这些事的！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “七公子心里自是明白的，何必让我们这些下属再说呢？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你这个老妖婆！你早就看我姑姑不顺眼，想要除掉她，才向阿父进这等谗言的吧！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “阿……阿……”漠漠僵硬着身体坐起来，眼珠机械般的一转，十分怪异的看着眼前的众人，声音也是僵硬无比，没有任何起伏，“阿，阿，阿哥，阿哥，阿，哥……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “漠漠！”少年冲上前想要抱住她，被一个女人拦住。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “七公子，不可上前。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你让开！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她僵硬地歪头，眨了一下暗无颜色的眼睛，突然冲到了女人面前，将她一下子甩到了一旁，静静地站在少年面前，像是个木偶娃娃呆呆的喊着：“阿——哥，阿——哥，阿——哥。”像是被洗脑了一般，她知晓的喊阿哥二字，但事实是她连眼前的人是谁都不知道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 少年弯腰抱起她，泪眼婆娑，哽咽道：“对不起，漠漠，对不起，漠漠。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她眼中忽然闪起红光，微微张嘴，两颗虎牙朝着少年的咽喉狠狠咬下……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她只知道，眼前人的血肉很美味。这样，或许就已经足够了。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406155&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406155&&novelId=15670'">下一章</div>
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
