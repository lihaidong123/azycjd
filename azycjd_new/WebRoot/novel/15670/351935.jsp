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
    <title>（二十二）信或不信的执念  吃或被吃的的命运</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351935&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351935&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351935+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十二）信或不信的执念  吃或被吃的的命运]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351935')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351935 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351935,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第23章&nbsp;&nbsp;&nbsp;（二十二）信或不信的执念  吃或被吃的的命运
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“刚才，呃，是我对……”<p class='chapter_content_read_css'>“你没错，是我，是我没有告诉你取七圣珠要付出的代价，下次你要打人的话最好不要用自己的手，作用力是相互的。”说完将手伸出来，打开手心，一颗水蓝色的珠子静静的躺在手心，“这是七圣珠中的定水珠。”<p class='chapter_content_read_css'>南宁袖中的九世转魂书发出强光，珠子自动融进书中，南宁又接回书，眼神沉闷，“你什么意思？取七圣珠还有代价？木若涵不是因为同命草耗尽生机才死的么？”<p class='chapter_content_read_css'>“那只是一部分原因罢了……噤声，木风来了。”<p class='chapter_content_read_css'>“啊——那我们要不要跑路啊？要是被发现她的死跟我们有关，会不会会被拉去见官啊——”南宁又开始不淡定起来，想着就要爬窗跑，被书绘音一把揪了回来，他恨铁不成钢地看着她，“就算木家人知道了，也绝不敢动你，只因为你——是师父的徒儿，我的师妹。”<p class='chapter_content_read_css'>“什么啊——”南宁怪诧地看着他，师父他老人家难道不是现代的人吗？还有他，这么有面子啊——那可是跟人命有关系的哎喂。<p class='chapter_content_read_css'>“若涵！”木风推开房门，完全忽视站在窗边的二人，失魂落魄的走到床边，静静地看着了无生气的木若涵，良久才声音喑哑的喊道，“这些天来麻烦南宁和绘音了，最后还要有一件事麻烦南宁，还望你一定答应。”<p class='chapter_content_read_css'>南宁上前一步：“木老爷尽管说，我一定尽力。”<p class='chapter_content_read_css'>“好，老夫想请南宁送叶儿去他父亲那里，今日便启程。”木风除了眼神有些哀伤，情绪便立刻收敛起来，“这也是若涵的心愿，老夫已经让管家收拾了些财物让南宁路上带着，还有梓儿也同你一起去，如何？”<p class='chapter_content_read_css'>南宁对木若涵心有惭愧，而且只是出去一趟罢了，便很痛快的答应下来。<p class='chapter_content_read_css'>木风很快便唤来了下人整理一切，南宁和书绘音也被请到饭厅吃饭，还有迟来的南宫宁雪和木梓，因为伤心木夫人便没有来吃饭。<p class='chapter_content_read_css'>木梓眼眶红红很明显就是哭过，吃饭整个人也完全不在状态，差点把饭吃到鼻孔里，南宁见状只好扯开话题，缓缓道：“木少爷，木老爷跟你说了没有今天要同我一道送叶子去顾王府？”<p class='chapter_content_read_css'>木梓吸吸鼻子，点点头道：“昨日父亲就同我说了，可是没想到姐姐她会，怕是父亲早就有预感了，才让我跟着你一块儿去滦城。”<p class='chapter_content_read_css'>“嗯，”南宁点点头猛然顿住，“你说什么？滦城？顾白的封地不是在宁州吗？”这些天书绘音教给她的知识她还是很认真的记住的。<p class='chapter_content_read_css'>“姐夫的封地是在宁州没错，但他的王府可是在滦城。”木梓吸溜的吃了一口面条，想着能和南宁一起出门，心情也好了些。<p class='chapter_content_read_css'>南宁淡淡的“哦”了声，一挑眉，看了书绘音一眼。<p class='chapter_content_read_css'>南宫宁雪状态也不好，虽是解了毒但面色依然苍白，胃口也十分不好，刚吃了几口就停箸不食。只静静的坐在位置上听他二人讲话。<p class='chapter_content_read_css'>书绘音放下汤碗，漫不经心道：“七七，琴霜七。”<p class='chapter_content_read_css'>南宁猛地被饭哽住，不详的预感顺着心脉展到汗毛，他忽然提这个做什么？<p class='chapter_content_read_css'>“也该到了。”书绘音话音刚落，衣蓝就拿着一封信匆匆忙忙赶到饭厅，将信交予南宫宁雪，信封俨然是被打开过的，“公子，主府管事有要事，衣蓝越矩先拆过信了。”<p class='chapter_content_read_css'>南宫宁雪闻言便知不是什么机密要事，便当着众人的面拆开信，看完信面色惊疑不定，将信交给南宁，南宁放下筷子疑惑的接过信，看完手指蜷缩信纸便被捏皱在一起，狠狠地将信纸砸在书绘音的脸上，面色阴沉，咬牙切齿道：“是你干的，是不是！是你将她送到这来的，送到滦城去的！”<p class='chapter_content_read_css'>书绘音淡淡扫开信纸，拿到手中，平静地念出：“公子，吾寻拾一女，唤为琴霜七，来此寻妹，其妹唤南宁。”<p class='chapter_content_read_css'>“书绘音，我告诉你，我一定会，一定会把她送回去的！你不就是想拿她来威胁我吗？好，很好，我一定会好、好、完、成、任、务、的。”南宁深吸了一口气，看向南宫宁雪，“不知南宫公子可否书信一封，我会到南宫府上将七七接回来。”<p class='chapter_content_read_css'>“不必，在下还是亲自到滦城去一趟，毕竟在下还想拜会一下顾王，秦姑娘与木少爷尽可与在下同行。”<p class='chapter_content_read_css'>“那多谢了，”南宁语气不善，看向木梓，“木少爷吃完了没，吃完了早些上路。”<p class='chapter_content_read_css'>“吃完了。”木梓连忙应声，他还头一次见南宁如此认真的生气，心里打了一下哽，也不敢再火上浇油，看着南宁怒气冲冲的出了饭厅，南宫宁雪后脚就跟了去，他瞅瞅书绘音，“那个，秦小妹怎么还有个姐姐啊？只不过去了滦城，怎么——呃。”<p class='chapter_content_read_css'>书绘音扫了他一眼，又如无其事的吃起饭来，木梓一叹气，转身就走，书绘音抬起头，淡淡的看着他的后背。木梓忽觉后背一阵凉风，一咧嘴打了个寒颤又环臂抱了抱，慢慢消失在书绘音的视野中。<p class='chapter_content_read_css'>不得不说木家的动作是十分快的，早膳刚过管家就为南宁木梓打包好了行李，安排好马车，连着顾叶也一并拾落好塞到了南宁怀中，南宁心中还是在生书绘音的气，抱顾叶的时候也不小心用大了劲，惹得他一阵哭号。南宫宁雪使了个眼色，衣蓝就乖乖上前接过顾叶做了婴儿护理。<p class='chapter_content_read_css'>和来中青时一样，南宁坐马车，南宫宁雪骑马，不过因为衣蓝要照顾顾叶也坐到马车中，木梓受不了马车的颠簸也毅然和南宫宁雪一样骑马。<p class='chapter_content_read_css'>尾随在他们后面的还有一人，一身紫衣，被衣蓝唤为行云，当夜他们停下来进客栈吃饭的时候，南宫宁雪才想起来问他：“你怎么骑乘快马来送信？府中不是还养了诸多信鸽了吗？”<p class='chapter_content_read_css'>行云一本正经回答：“禀公子，府中的信鸽全部被七七姑娘拿来炖汤、红烧、油焖、蒸煮——”南宫宁雪赶忙打住他，唉，直接说是被那位姑娘吃了不就行了，不过他记得主府中好像有不下两笼子信鸽吧，怎么会一只都不剩？<p class='chapter_content_read_css'>“真是抱歉，南宫公子，我那位姐姐，别的不喜欢吃，就是喜欢吃鸽子，至于吃了多少鸽子，我会赔给你的。”南宁羞愧地低声道。<p class='chapter_content_read_css'>南宫宁雪看着她，一笑：“在下与秦姑娘相识也甚久了，难道在姑娘眼中在下就是一个如此吝啬之人吗？不过是区区几只鸽子而已，姑娘何必如此计较？”<p class='chapter_content_read_css'>“就是啊，秦小妹，干嘛那么客气生疏，区区几只鸽子罢了，大不了我帮你还就是了。”木梓也应声附和道。<p class='chapter_content_read_css'>南宁忽然站起身，放下筷子，沉声道：“总之，我会还你的鸽子的。”说完就匆匆回了房间。<p class='chapter_content_read_css'>木梓奇怪地说：“秦小妹这是怎么了？一路上都不对劲，还在生书哥的气吗？她的姐姐到滦城又怎么了？”<p class='chapter_content_read_css'>南宫宁雪收敛了笑，沉默地吃饭，只是眼中划过不一样的流光。<p class='chapter_content_read_css'>二楼走廊响起蹬蹬蹬的急促脚步声，最西边的房间门发出两声“砰砰”的摔门声。<p class='chapter_content_read_css'>南宁气冲冲的回到房间，“啪”的一声摔在床上，良久都是面无表情地发着呆，终是沉沉地呼了一口气儿。<p class='chapter_content_read_css'>自己好像最近做事都很冲动，无论是不问代价接下木若涵的交易，还是打书绘音的一巴掌，还是说那些话，到底是怎么一回事？冲动是魔鬼，南宁默默在心里念了几遍，翻身面朝上，仔细回想中间细节。<p class='chapter_content_read_css'>七七不是那么轻易相信人的人，书绘音与她不曾相识，七七断然不会相信于他，若是书绘音用了强制性的手法，那七七也不会如此轻易的入这十三尘世来，她可是跆拳道黑带五段；再推算时间，书绘音应该和自己来到这里的时间差不多，已经三月有余快到四个月，书绘音中间应该不会有时间回到现代，还有就是，他到底能不能回去也是个变数。最重要的是，我信不信他……<p class='chapter_content_read_css'>南宁闭上眼，努力回想，果然，还是无法不信他吧……露出一丝苦笑，只觉得心口开始麻酥，紧接着剧烈疼痛起来，和上次在才情会上时极其相似，痛感慢慢从心口开始扩展，延伸到内脏，接着是四肢，南宁痛苦地蜷起身子，冷汗很快浸湿衣服，视线也开始模糊起来，只觉得嘴角慢慢有些黏腻。<p class='chapter_content_read_css'>……难道是中毒吗？	<p class='chapter_content_read_css'><p class='chapter_content_read_css'>南宫宁雪回到房中，衣蓝早早就将顾叶哄睡着了，不用他问，衣蓝便将从行云那里了解的消息悉数回禀给他。<p class='chapter_content_read_css'>“那日行云同主府管事一起到留茶坊采收茶叶，就听到人群中发出阵阵吵杂，二人挤进去一瞧，只见一个打扮怪异的姑娘在卖极其古怪的玩艺，本来行云对这是很无感，但主府管事却对那些东西起了兴趣，跟那姑娘攀谈起来，不经意听到她是来此地寻自家妹妹秦南宁，而那时公子又刚来信件不久，信中又让调查秦南宁此人，于是主府管事就寻了借口让那姑娘在府上住下，本想用信鸽传信，结果她每日杀两鸽，不过几日就把府上的鸽子杀完吃掉了，这才让行云乘快马来送信。”<p class='chapter_content_read_css'>衣蓝话音刚落，房门就被人一脚踹开。房门痛苦的被砸在墙上，“吱呀”着摇晃了几下。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351935&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351935&&novelId=15670'">下一章</div>
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
