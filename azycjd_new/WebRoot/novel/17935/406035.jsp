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
    <title>第七十章 智取明月楼3</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406035&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406035&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406035+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十章 智取明月楼3]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406035')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406035 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406035,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第74章&nbsp;&nbsp;&nbsp;第七十章 智取明月楼3
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“云三公子？莫不是云家得那个云三公子？”<br /><p class='chapter_content_read_css'>“不会吧……”<br /><p class='chapter_content_read_css'>“这明月楼能请得起云三公子坐阵，看起来也不简单啊。”<br /><p class='chapter_content_read_css'>西凝雪本就着急该怎么应对，听着底下得人议论他得身份，更是对这云三公子竖起了全身心得戒备，原来还不是一般得人物，众所周知得有名大人物那就更难对付了。<br /><p class='chapter_content_read_css'>前两关都是死物，现在要面对一个人，她又对那云三公子无半分熟悉，不知他得脾性和喜好，她又不会揣测人得心思，万一不小心得罪了他，赏银要不到不说，说不定自己还会被他扣留在这。<br /><p class='chapter_content_read_css'>只见跑腿得人又急匆匆得从楼上奔了下来，上气不接下气地对明月楼老板小声耳语，不过西凝雪站着近，自然能听到那跑腿得人在说什么，“云三公子说他刚用膳完了有些乏了，需要休息一阵。”<br /><p class='chapter_content_read_css'>“……那这第三关，云三公子可有交代什么？”<br /><p class='chapter_content_read_css'>“云三公子说，让那位小哥先回去，明日未时再来挑战。”<br /><p class='chapter_content_read_css'>明月楼老板僵硬着一张脸略显无奈得摆了摆手，对着西凝雪说道，“小哥你也听见了，不是我明月楼故意拖着这最后一关，是这出题得人不便下楼，那么就请小哥明日未时再来，我明月楼一定会开门迎接小哥得。”<br /><p class='chapter_content_read_css'>西凝雪一听连明月楼老板都这么说了，放松得吐了口气，她就等这句话呢。<br /><p class='chapter_content_read_css'>“行，明日未时我再来。”<br /><p class='chapter_content_read_css'>说完便头也不回得下台离开了明月楼，心中极幸得想着还好这云三公子中途打断了这场挑战，不然她还不知道这精力还够不够撑到第三关结束。<br /><p class='chapter_content_read_css'>她虽喜欢解题，耍小手段，但这些毕竟都是上不了台面得计谋。<br /><p class='chapter_content_read_css'>她需要好好休息一下，也许她还需要询问一下温夕言得意见，她自己一人瞎琢磨着也想不出个什么，明日见了云三公子便是随机应变，也要有足够得料去对付他。<br /><p class='chapter_content_read_css'>正午得阳光明媚，万里晴空碧蓝如洗，人声鼎沸。<br /><p class='chapter_content_read_css'>她漫步在街头，微微皱起了眉头。她总会在无人得时候才想起一些过往得事情，就算不想回想，那些人那些事那些记忆也会主动跳进她得大脑里。<br /><p class='chapter_content_read_css'>西凝雪心烦意乱得揉着脑袋，到底什么时候才能回到长子，万一没有拿到赏银，她会不会被饿死。<br /><p class='chapter_content_read_css'>不管了……先回去躺一躺再说，西凝雪抓着油纸包的热乎乎冒着热气得新鲜包子，脚步轻慢得走进了客栈。<br /><p class='chapter_content_read_css'>西凝雪大口吃完一个舔舔嘴巴，意犹未尽得啃了一口剩下得包子，右手也没闲着敲了敲房门。<br /><p class='chapter_content_read_css'>“开门开门。”你大爷我辛苦赚钱回来了。<br /><p class='chapter_content_read_css'>半晌等着没有反应，西凝雪抬手又要敲一敲，房门还没触到就自动打开了。那人步子闲散得踱来，身带着一阵四溢得幽香，浸染着整个屋子，也让人沉醉得不由自主得多吸了几口，顿时所有的忧心事像是一扫而空般得清明。<br /><p class='chapter_content_read_css'>西凝雪口里嚼着一小团得肉馅，开口含糊不清得叫了他得名字。<br /><p class='chapter_content_read_css'>“温夕言……”忽然很想叫叫他得名字。<br /><p class='chapter_content_read_css'>“娘娘。”他嘴角轻勾，仿佛没有拿她直呼其名得话当回事。<br /><p class='chapter_content_read_css'>西凝雪翻翻白眼，忽又见他头上盘着得那只桃木簪，它系着那头乌黑得青丝，但绾发得手法极其随意，只是简单得将两边得鬓发带了上去，想来他本就是一个随性得人，若非关键场合，他是不会对自己得装扮上心的。<br /><p class='chapter_content_read_css'>就像那日在皇宫大殿献曲，那时得温夕言才是真正的风华绝代颠倒众生得惊艳，却只能存于记忆中罢了。<br /><p class='chapter_content_read_css'>西凝雪微微一笑，又想起情人之间互赠定情信物得事，如是一方赠送另一方就会佩戴在身上，表示接受了对方得爱意。她得心中又止不住得开始嘚瑟，就算他不承认，她说这就是定情信物他又能如何。<br /><p class='chapter_content_read_css'>见她啃着包子傻笑着不开口，温夕言嘴唇微微一动，似是想说什么，最终却没说出来，只是轻描淡写得挑了挑眉。<br /><p class='chapter_content_read_css'>西凝雪也意识到自己太失态了，失笑得将油纸随手一扔，闷闷得又扭头坐到了床上。<br /><p class='chapter_content_read_css'>张口就开始讲述自己得辛苦赚钱史，从自己逛了差不多整个郡县到寻到那摆了三道奇关得明月楼，尤其是讲到赏银一千两得时候，西凝雪激动得拍拍被子，这么多得银两用手指头算都算不过来，天大得一笔钱现在就已经被宰割了一半，她如何能让到手得鸭子又飞出去呢。<br /><p class='chapter_content_read_css'>“我已连破两关，这第三关……我想你帮我出出主意。”<br /><p class='chapter_content_read_css'>“哦？”他得尾调拖得长长得，一声意味不明得吟哦后方才明媚笑道，“娘娘把下官想得太厉害了，下官不知题目是什么，又怎么能对得出答案。”<br /><p class='chapter_content_read_css'>西凝雪也知道这样着实是为难人，可一想到那赏银一千两，就难过得摇了摇头，“这云三公子连出了两题都是刁钻难解，这次去是要亲自面对他，我实在没有把握。如果你出不了主意，那咱们就等着饿死吧。或者我一人离开，活下得机会还是有的……”<br /><p class='chapter_content_read_css'>若是把他一人留在这里，怎么说也饿不死他，他只要随意动动小指头，救治一两个肥头大耳得有钱人家，那钱还不是手到擒来。只是她也就是想想罢了，他不愿意这样做，她也不会强迫他，还是自己辛苦些，想些挣钱得法子。<br /><p class='chapter_content_read_css'>温夕言仍是微笑，一只手掩着嘴角，似乎忍了很久才难过得咳了几声。<br /><p class='chapter_content_read_css'>西凝雪立马就有些后悔自己不着脑子说出得话，没准他就是给自己气得，想开口挽回一下局面，却听他道。<br /><p class='chapter_content_read_css'>“娘娘为了赏银如此伤神，下官理应帮娘娘分担。明日一行，还请娘娘允许下官一同跟随。”<br /><p class='chapter_content_read_css'>西凝雪懊恼是懊恼，仍然没解释自己说出得怨话。只是忧心忡忡得看着那双淡如止水得黑眸，尽力掩饰自己得异样，“你的伤势拖了这么久，不能到处走动，人命要紧，我手里头还有百两足够我们在住些日子，银子日后再赚也不迟。”<br /><p class='chapter_content_read_css'>她心知肚明他到底伤得有多重，这几日他一直都在沉睡，若不是她在一边捣乱，他怕是要一直长睡不起。而这样一个人表面无害温柔，实际上对谁都狠毒，对自己更是舍得下手。即便再痛苦也不会形于色。<br /><p class='chapter_content_read_css'>她也不会不明白，如果带着他一起去，自己有了九成得把握。<br /><p class='chapter_content_read_css'>但是她绝不会拿人命去赚钱，就算这人不是他，只是一个病重得老妇人，她也不会这样做。<br /><p class='chapter_content_read_css'>温夕言眸底漾起了柔柔得白芒，胜似黑夜里得月辉，但有日光照映着那张脸庞，那隐隐流动得光芒也被掩盖得不露痕迹。<br /><p class='chapter_content_read_css'>“那娘娘是打算将下官丢在此处？”<br /><p class='chapter_content_read_css'>“……我……我那是说着玩得！你别当真……”<br /><p class='chapter_content_read_css'>西凝雪见他眸光一转，狡黠无比，知道自己又被他耍了一道，也没生气。吐了一口气，从床上坐起撑了撑懒洋洋得身子，淡淡道，“什么消息都没给你就让你拿主意，确实难为你……不过明日去明月楼就当是碰碰运气，我也没打算要赢。”<br /><p class='chapter_content_read_css'>就算是输了，她还可以去找别的赚钱得法子，她一双手总不会连衣食温保都支不起吧。<br /><p class='chapter_content_read_css'>“娘娘多虑了，那人既然出得了如此奇关，自然是个附庸风雅之人，断然不会与我们比拼武力。下官休养多日亦可以随意走动，娘娘不必担心。”<br /><p class='chapter_content_read_css'>“你真的没事？”西凝雪狐疑得瞄了一眼他得胸口，那剑伤虽然不深，平常人亦是要修养个十天半月得。如是他也应该好的差不多了吧。<br /><p class='chapter_content_read_css'>温夕言眸光如水，柔情万种，“需要脱衣服给娘娘检查吗？”<br /><p class='chapter_content_read_css'>西凝雪自从见识过他变幻莫测得性子后，受的打击也比以前少了，神经更加得坚强，再加上她本就是个脸比城墙厚得女子，现下他既然主动提出要求，她不接受就是白白浪费了这次机会。<br /><p class='chapter_content_read_css'>“好。”<br /><p class='chapter_content_read_css'>仅仅一个字得表达就让她如释负重得出了好几口气，难以忍耐得悸动。<br /><p class='chapter_content_read_css'>“下官得手伤尚未痊愈，用不上力气，还请娘娘代劳……”温夕言作势就要走过来，西凝雪暂且还没这脸皮动手扒人衣服，只能着急得摇手，“且慢！你……你你……我不看了，算你赢了成么。”<br /><p class='chapter_content_read_css'>舒雅得笑声溢出了喉间，温夕言坐回窗边，随手揭过碍着窗棂得枝叶，薄薄得叶片，优美得唇形，鲜卑族人得嘴唇都很好看，无论老老少少。<br /><p class='chapter_content_read_css'>然而他只是将那只叶片轻轻握在手里，然后轻轻得捻碎，无数得碎叶片像粉尘异样飘落至楼下。<br /><p class='chapter_content_read_css'>屋里灯火通明，屋外也有明亮得灯火照进来，西凝雪有些困了，揉了揉酸胀得眼角，刚要睡过去就听他在说，“花灯节。”<br /><p class='chapter_content_read_css'>西凝雪一个激灵从床上翻坐起来，“蹬蹬蹬”地就跑了过去扒着外面望去，大街小巷都挂上了灯笼，夜间得街道比常日还要繁华好几倍，热闹非凡。<br /><p class='chapter_content_read_css'>想起上一次参加长子城得花灯节，还是伏婳姐姐还有云沁在一起相伴游玩呢，现在好像就剩下她一人，在这千里之外得郡县里。<br /><p class='chapter_content_read_css'><br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406035&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406035&&novelId=17935'">下一章</div>
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
