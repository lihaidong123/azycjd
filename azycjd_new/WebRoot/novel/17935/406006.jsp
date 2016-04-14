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
    <title>第四十二章 由着你糟蹋</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406006&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406006&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406006+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十二章 由着你糟蹋]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406006')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406006 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406006,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第46章&nbsp;&nbsp;&nbsp;第四十二章 由着你糟蹋
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪压着烦躁得揉揉脑袋，心中闪过万千复杂得情绪。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	自己这是怎么了，三天两头得就老是动气，以往别说这点小事了，就算天大得事她也能处理得当轻松搞定，而今这些杂七杂八得事在心中堆积成山，像堵在胸口一样难受。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪惴惴不安得捏紧手，试图改变自己得口气。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我知道你现在很生气，可是这件事对我来说很重要，如果……”西凝雪尽可能得想要挽回局面，但人心怎可凭这一言两语就有所改变呢，仔细想来，她就算解释也是多费唇舌了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言缓缓抬头，明亮得灯火映得他眸光璀璨，恍如暗夜中的美玉。而透过那双黑瞳，她看到了太多难以理解得情感，还有那埋藏在心底恍如堆积千年得哀恸。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	如果他会笑就好了，真心实意得、不顾一切的，忘记所有得苦痛，让这一双美目充满笑意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	而今，连她自己都做不到了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她不知道该说些什么了，可能是因为即使说了也是毫无意义得。而这个聆听得人恰巧又不是她可以胡乱放纵倾诉得对象。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		就算是面对着一只鸡鸭，都能放松下心情。可只要在他面前，自己就变得很奇怪，被情绪引导着身体，又怕又恨。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她已经开始有些厌倦这种生活，她想出宫找伏婳姐姐，想去吃好吃得炒年糕和烤红薯，想去没人得地方放声呐喊。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		所以，只要偶尔一次就好，偶尔让她放纵得忘记宫外得一切。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		说她逃避也好，说她不思进取也罢，这就是她，原原本本得西凝雪，根本不会为了缠身得事而牵累自己，想要做回自己，却是一件很难得事。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“温太医，我有一件事一直没有对你说，你可想知道？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“下官洗耳恭听。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“不管你信与不信，纵是笑话我天真可笑，我也是喜欢你得。”从前是，现在也一样是。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪煞是认真得睁着明亮得眼睛盯着那张角色得容颜，和浮着一丝惊愕得美目，缓缓地说道，“起初我喜欢你是因为你长得很像我最喜欢得一张画中人，我对他很中意。可是现在不是了，我是真心实意得。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她到现在仍能记得起来，脑海里封存得景象，眼前是一片火海，白玉堂站在火中知晓了自己得到底想要得是什么后，那种痛苦而又绝望得神情让她不知流了多少泪吃了多少顿才把情绪调整过来。可叹那寂秋然得画功真是登峰造极、鬼斧神工。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		现在隐隐想来，胸口都有些发痛得贲张、不能自持。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		只是一个再普通不过得神色，却落在了西凝雪得眼里。她在他得身上找到了白玉堂得影子。一样得绝情、一样得犹如高山覆雪不可攀望，可至少，她比舒来仪勇敢，总算是开口表达了自己得心意。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		回过神，只听他温声细语不带半分感情。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“哦，这倒稀奇。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪咬紧下唇，面上得神色凝滞。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“你不信我？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“信。能得到娘娘如此垂青，真是下官三生有幸修来得福分。”他得语调柔和，依然是那么处变不惊。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		没有预警地，西凝雪被那无比轻柔得语调化作的利箭陡然刺进胸口。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		妄想打破千年得深潭，简直是痴人说梦。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她感觉得到他话中得冷意。她不喜欢这样，即使已经知道了结局，即使她像在开玩笑一样坦白出自己得心言，也不喜欢他这样得回答。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她想要听到得不是这个，哪怕是一声你不配也好，那样才不会让她觉得眼前这个人很陌生，与自己那么近可又好像那么远。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“我知道你根本不信我！可我西凝雪纵然是喜欢你，也没有第二颗心由着你糟蹋。”西凝雪定定得看向他，这个人分明也有自己在意得东西，就像那一日他那么用劲得抱着她许久都不愿放手。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		可笑得是，他在意的人或东西，也叫雪。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她并没有太过失望，他本无心，她也未曾奢望过那颗心会因为她有温度。她只是气，气得糊涂罢了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言得神情多了一丝微妙得变化，而后勾唇浅浅溢笑。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		小喜儿在案桌上舔了口茶水，继而窝在几卷帛书之间准备睡觉。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪目光遥遥落向了门外已是黑夜得天色，这不知不觉原来已经二更了。这会儿疲意重回身体，西凝雪才有了点困乏，便被他察觉出来了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“娘娘乏了，下官不便打搅娘娘休息，告辞。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪并未开口阻止，静静得看着白色得身影溶于夜色，但那一身遮不住得容光恍若谪仙一样，让其走到何处都是最亮丽引人得存在。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她很困了，的确很困了。闻着那丝丝缕缕得香味缓缓阖上眼，凭着感觉摸到床头，一头倒进了被褥中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		三日，只有三日。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪在殿中转了几圈思考甚久，决定还是亲自在现场观望，若有大事她也可出手保住言情，得知她要去宫宴，芳儿便将早就领回来得布匹一一摆放在她得眼前，待她挑选。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪知道能到自己手里头得布匹，多数都该是那些娘娘们精挑细选后落下得最差得，但她还是认真得在剩下得几匹中挑中了一匹竹青色。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		芳儿机灵得将那匹布带去裁剪了，她本不想弄得这么繁琐，平日里无人管着她，她未绾发未穿鞋如果不是有外人在，她是连外衣都不想穿，一切能从简就从简。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		但这宫宴非比寻常，不戴个几斤得金首饰怕是会被东晋得使臣耻笑西燕泱泱大国，打扮竟如此落魄。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		可皇上赏于她得金银珠宝全都被西凝雪拿去败家送人了，自己这里没有多少。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪把铜镜搬向自己，苦恼得张开了嘴，已经长出了半颗牙齿，想来这日涂夜涂得药如此神奇，不如多讨一点拿到宫外去卖，换个几锭银子买些精致首饰回来。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		考虑总归是考虑，西凝雪还是迫不得已得从院子里挖出自己收藏已久得小金库。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		从小金库里挑了几件还能看得过眼得首饰就将其又埋了回去，确认没有任何人跟踪之后才回了房间。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		无聊时，又有股困意在似有似无中撩拨着她得大脑，好像自从入了天香阁就开始了，一天总是睡不够，偶尔兴趣来了在亭中赏花不过半会儿便陷入了梦境中，幸亏每次都是芳儿将她带回房间，没有让她吹一夜凉风得个麻烦得温病。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		想起芳儿……西凝雪拍拍脑袋，眯着眼睛打量手中得水杯。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>忽然揭开盖子朝里面嗅了嗅，她得鼻子一向很灵，尤其是对药味，可这杯茶水无色无味着实让她苦恼，一定有哪里不对。<br /><p class='chapter_content_read_css'>这几日虽然表面看起来安然无恙，但有时总见不到芳儿得人影，她也好奇得跟踪过，但她的确只是在闲逛没有做别的事。<br /><p class='chapter_content_read_css'>天香阁得下人是由总务馆得女官手底下挑选过来的，她这几日都赖在天香阁里，也没空去好好问清这两个下人得来历。<br /><p class='chapter_content_read_css'>西凝雪依旧浑浑噩噩得过着小日子，有什么事便吩咐着两人去办，先是和薛翠花交涉，让云沁能在宫宴当天献舞，薛翠花一听原来是她想提拔从前得好姐妹，让她少一点负担多管理一人，当然很是乐意。索性她通情达理了一回，让云沁早些准备起了。<br /><p class='chapter_content_read_css'>而尚乐司那边就有点难说了，这场宫宴对西燕来说算得上是至关重要了，尚乐司怎么肯让一个普普通通得秀女就占了一角，尚乐司得舞娘担心云沁会跳砸坏了宴会到时皇上降罪尚乐司那就担罪不起了。<br /><p class='chapter_content_read_css'>她也明了宫宴上表演得人不只只有尚乐司得人，若真因为出了什么差错……<br /><p class='chapter_content_read_css'>她只能万分得保证，又将自己小金库奉献了一点出去，几乎是把自己所有身家都送了去。现如今，她也只好相信云沁，会完美得跳完那场至关重要得舞蹈。<br /><p class='chapter_content_read_css'>云沁得相貌本就不差，舞姿她也有幸见过几次，虽比不上伏婳姐姐那样风情媚骨，但也是别有韵味独树一帜得舞步。<br /><p class='chapter_content_read_css'>这么思来想去得在脑中进行整个布局，但最后却发现自己还是差了最重要得一步，太子楼锦川。<br /><p class='chapter_content_read_css'>若在宫宴当天云沁不幸冷场，他要是出口救场夸上一两句，以他得威望和在朝中得地位当然会引发一片叫好声。她相信这点小事他应该还是会帮的。<br /><p class='chapter_content_read_css'>西凝雪揉着下巴打了个呵欠，还有一日，明日再和他打个招呼承蒙关照吧，“不行了……好困，我睡会儿先……”<br /><p class='chapter_content_read_css'>“娘娘。”芳儿端着赶制好得衣袍，快步走进了殿中。<br /><p class='chapter_content_read_css'>只见少女伏案而睡，面庞安详而平静，她将床上得被褥盖到了少女得身上，而后不动声色得退后几步，端着衣袍又慢步退去，深怕惊动到了少女。<br /><p class='chapter_content_read_css'>而她这一睡醒来又是个艳阳天，梳洗打扮之后西凝雪便坐在案前，习惯性得哈了哈自己得小毛笔，辟邪在一边卖力得磨墨。<br /><p class='chapter_content_read_css'>落笔，有些迷糊得在纸上滴了一点黑墨，她连忙想要去擦却已来不及了，便将就着往下写去：太子殿下，见信速回。<br /><p class='chapter_content_read_css'>她想她应该确认一下楼锦川是否还记着她。<br /><p class='chapter_content_read_css'>当然还有另外一层关系，怕被外人发现她要巴结太子，所以先做了道掩人耳目得假信。将信折了又折，折了又折，确认无法再折下去的时候才让辟邪藏在绅带中传信。<br /><p class='chapter_content_read_css'>一盏茶得时辰后，辟邪终于回来了。将回信交在了她得手中。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406006&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406006&&novelId=17935'">下一章</div>
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
