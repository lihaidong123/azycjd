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
    <title>第十五章 不要走前面</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405627&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405627&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405627+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十五章 不要走前面]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405627')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405627 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405627,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第19章&nbsp;&nbsp;&nbsp;第十五章 不要走前面
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪随着他的步子，慢悠悠的穿过了书房，又来到了一个小院子，按分布来讲就是左边养鸡养鸭也是迎客的地方，中间是他自个儿潇洒花天酒地的地方，右边则是休息的主屋。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这里只有柴房可以给你住，在我治疗好你的牙前，需在卯时和戌时将前院得鸡鸭都喂了，午时二刻从后院摘小喜儿要吃的果子，其外，每日务必随传随到。”温夕言淡淡扫了一眼被惊呆了的西凝雪，有些动容的挑起了好看的眉眼，“如果觉得做不到，尽可离开。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你在把我当下人使？！”半晌才得出结论的西凝雪怒道。让她住柴房已是她不能容忍了，竟还要这样将她当作能使唤得丫鬟一般挥之即来呼之即去得，她西凝雪可从没这样落魄到需要寄人篱下，给人喂鸡喂鸭又喂松鼠得场面。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“如果公子一定要这样理解，那便是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	看来他是打定主意要她知难而退了，可惜她西凝雪能屈能伸，不就是当丫鬟吗，又不是当小妾，有什么不可的，就当是给自己找磨炼得机会。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪从内心底对着上空轻蔑的冷哼，并用万分漠视的眼神斜睨他平静如水的面庞，随即一掌拍在门上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你以为本公子吃不了苦是不是？那我告诉你，这柴房……我西额宁小肆住定了！”不仅仅是这样，包括这烟雪阁，她西凝雪一寸都不会放过。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	反正不把这闹腾的鸡飞狗跳，她是不会善罢甘休的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	虽然这人是没有看穿她的计划，否则也不会摆出一副平淡无奇的表情道，“那么劳烦你了，宁公子。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“不客气。”西凝雪呲牙咧嘴的笑道，直接推门而进，又是一个大大的惊喜啊，柴房原本是充满灰尘和黑煤的地方，但这里除了一捆捆摆放好的木材之外，雪白的墙壁简直让人恨不得在上面画上一只乌龟王八蛋才好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而柴房的角落里正放着一张石床，床上只有铺好得底铺，和一条单薄的被子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪迟疑了一下，向后望去，温夕言依旧站在身后，一袭白衣不沾风尘的绝艳。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她越看越来气，很想连带着他这个人都扔进污泥里弄脏了才好，金无赤足人无完人，她真的不相信世上怎么会有这么干净的不染凡尘的人，而恰恰他却打破了这个不可能，但他的性格更是打破了常性，阴晴不定捉摸不透。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	每次与他对望，他漆黑如墨的瞳仁就像一泓深潭，如果深望几分，便会彻底迷失。西凝雪也不会蠢到为了美色忘记了自己的目的和原则，但目前尚未和他打好关系，且他的府邸虽有不少名贵之物，却始终脱离不了一股子穷酸味，要肆意毁坏什么，估计他就要倾家荡产，在这之后应该就是她小命呜呼了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	想到此，不由得为自己以后的生活担忧，但是眼下骑虎难下，更别提是要当着他的面退缩了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	狠狠将门一关，小喜儿突兀的从袖中掉了出来，然后从窗户上的小洞中钻了出去，西凝雪大惊小怪的看着那个洞，然后把拳头伸了出去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“天啊，这洞这么大怎么睡啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他果然还是在处心积虑的对付她，期待明日一早起来，她就会被吹成冰块，不过这种情况是不会发生的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪将一根粗木横摆在洞口上，正好堵的死死的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	拍拍手上的灰，一屁股坐在了床上，那顿时像坐到了书房石凳的感觉出现了，这床板硬的跟一马平川得大地似的，既没有家中的舒适温暖，就连景秀阁的床也比不上！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这个小肚鸡肠的家伙竟然这样对付她，她不过就是放话要用鹤顶红毒死他，他居然一直耿耿于怀怀恨在心得伺机准备报复，卑鄙小人！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	赌气的往床上一躺，然后将被褥铺好盖在了身上，一股子浓郁的奇特香味窜进了她的鼻中，但并不像千步香这么让人接受不了的香气，仔细一闻，这股香味中最浓的是冰片香。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	从龙脑树上提取下来的一种提神醒脑的成分，但只有皇宫中的一些皇族才会用得上，寻常人家大抵都是用樟树叶代替的，看来他是下足了血本不让她好好睡觉了，很好……你给我等着，温夕言。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	咬牙切齿的翻了个身，累了一天就先不跟他计较了，况且以后也有的是时间。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	两眼一合整个人抱着被子滚了一圈，躺在了墙角角落中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这一夜睡得并不好，底下那么硬的床板，咯的她骨头都疼了，身子也极不适应的很难受。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	半夜迷迷糊糊睡醒了，张着眼傻望了窗外的天光半晌，想起从景秀阁的波折历程。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	且先不谈自己是私逃的秀女，被人发现肯定会被关进大牢里吧，而不知不觉中自己好像又陷入了一个奇怪的迷局当中，辗转了东宫又到这烟雪阁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她虽然有自信自己这身打扮在平常人眼中绝对以真乱假、鱼目混珠，但温夕言怎么可能看不出来，还是说他明明知道了，却伺机等待着一个揭穿她得绝好的机会。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	无论是哪一样，她都不能放松警惕。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	等西凝雪将这个问题仔细想了又想的时候，天色已经亮了，西凝雪的脑袋里反射性的冒出了一句话：起得比鸡早睡得比狗晚。而她只能悲哀的想着，自己的地位还不如那只松鼠。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	就好像温夕言娶了一个正堂夫人，而她只是用不正当关系进温家的小妾，自然要受累许多。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但她西凝雪既然答应了，就一定会言出必行，这也是当一代女侠应有的江湖守则，所以她爬起来准备喂鸡喂鸭。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	饲料堆放在前院的一角，她拿起调好的饲料盆往鸡圈里倒，也没想这鸡是何时被赶进去的，她目前的任务就是喂鸡，往死里喂，喂死了她也不负任何责任。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	整整五倍的量倒了进去，西凝雪满意的拍拍手回身。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	书房中，温夕言像个幽灵一样突然出现了，西凝雪特意放轻了步子，然后悄悄的走向他的身后，兴致勃勃的要朝他耳畔大叫一声，然后手腕上一疼，整个人无法动弹。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一样的银针、一样的位置、一样捉摸不透的浅笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“宁公子，你来的真是时候，我正巧要去找你呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言恍若未见到她瞪着眼的样子，掏出小药瓶，蘸着黄药水的棉球经由他的手，放在了她半张的口里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一股清凉而又带着炽火的感觉在牙根处滋生，西凝雪提了一口气，全身都忍不住得颤抖起来，难受的朝他拼命眨眼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	眼下之意其实是：美人儿，我错了……我不该偷袭你，你大人有大量发发善心饶过我的牙吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“吱吱吱”小喜儿也为她打抱不平的从架子上跳到了她的肩头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪趁机又拼命的眨眼示好，在差点眨坏眼睛的情况下，温夕言挥挥衣袖，带走了那根银针。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪自然一脸巴结的又缠在了他的身边，狗腿的给他敲背，笑道，“温太医，我这牙就全靠你了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“吱吱吱”小喜儿俨然化成了第二个西凝雪，不过相比之下不同的是小喜儿能大胆的伸小爪子挂在他衣衫上，西凝雪看的心急，直想小喜儿再用点劲，抓烂他的衣服才好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温夕言淡淡的挑眉，“我既然答应了就不会食言，不过最重要的一味药正巧用完了，明日，你随我出宫采药。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪惊魂未定的打了一个激灵，这瘟神究竟要穷到什么地方，药材都要靠自己来挖，不过自从入了景秀阁的确许久没有出宫，他这一提正合她的心意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“先说好，我绝对不要走前面，你走前面。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	无论发生什么事也是先冲着他去，她也好有时间逃走。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	端着紫檀茶壶，温夕言微微眯起了眼，“好。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我还要你身上的这个！”西凝雪伸手指着他腰间系着的丝质香囊，目露精光。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		就在刚才他替她除却银针的时候，那隐隐的冰片香味潜进了她的鼻中，当即让她联想到那床被子上的浓香。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		她方才才思涌现，忽然又记起在药书中看过冰片有驱蚊的功效，但昨晚一夜下来她只是觉得床板太硬，但睡得安稳，并未受到冰片提神醒脑的影响，所以他一定在香囊中动了什么手脚。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		而采药肯定就要上山，山上蚊虫那么多，为了出宫一趟被叮的全身都是包这种赔本买卖她西凝雪不做，所以她才会想要他的香囊，当然他要是小肚鸡肠的不想给就另当别论了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		温夕言不可置否的点了点头，说道，“你不向我要我也一样会给，终南山中蛇蚁居多，这衿缨的作用想必你也知晓。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		那只手就这么平平无奇的抓着香囊在她的面前，她却迟愣的没有伸手去接，因为这只香囊明显是他事先制好的，她厌恶这种什么事情都被人先登一步的感觉，就好像自己明明得到了一件东西，而这件东西却是别人用过的残次品，这种痛苦怎么能忍。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'><span style="line-height:1.5;">她更讨厌这种无论什么事都做得井然有序、没有一丝瑕疵的人，但偏偏她此刻什么都说不出，仿佛他就是如此得先知，她自以为是的聪明在他的眼底不过是孩子般的戏耍。</span><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“怎么，不是你想要的，现在却不想要了？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405627&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405627&&novelId=17935'">下一章</div>
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
