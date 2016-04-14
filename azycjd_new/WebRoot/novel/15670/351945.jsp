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
    <title>（三十二）师父指示是救人 命定缘分遇见你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351945&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351945&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351945+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十二）师父指示是救人 命定缘分遇见你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351945')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351945 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351945,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第33章&nbsp;&nbsp;&nbsp;（三十二）师父指示是救人 命定缘分遇见你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“啊啊啊啊！”晏紫荆整个人都有些要崩溃了，她怎么就在这里迷路了，她是遇到鬼打墙了还是怎么回事，怎么上次来这儿就一点事也没有？<p class='chapter_content_read_css'>阿南背着包袱紧跟在她后面，双腿有些打抖，面色苍白，很明显对上次被打劫的事还心有余悸。<p class='chapter_content_read_css'>晏紫荆猛地拨开面前半人高的杂草一股脑向前冲去，腰间的长剑被晃得咔咔直响，阿南双手紧紧攥住包袱跟着窜进去。<p class='chapter_content_read_css'>远远传来刀剑激烈相撞的声响，晏紫荆又加快了脚步完全将阿南甩在了后面，阿南磕碰了几下最终只能瞧见她一个模糊的背影。<p class='chapter_content_read_css'>“哈！又是你们！”晏紫荆隔着十几步的距离就瞧见了之前遇到的还被她痛揍一顿的那群山匪，立刻抽出剑，手指骨节被她摁得咔咔响动，“看来还真是不长记性。”<p class='chapter_content_read_css'>山匪们也注意到她，应当是想起那日的悲惨的遭遇，面色瞬间一白，就这一晃神，其中一个人的咽喉就被打劫的男子的剑就刺中了，顿时一命呜呼。<p class='chapter_content_read_css'>所有人都停下来看着晏紫荆，她认准了之前的几人，轻蔑道：“怎么？还敢下山打劫，看来上次还没打到让你们长记性呢哈。”<p class='chapter_content_read_css'>“臭娘们！你以为小爷这次还会怕你吗？”一直藏在树丛里的山匪小头头冒出来奸邪一笑，打了个响指，看来是早有准备。<p class='chapter_content_read_css'>一大群山匪从山上狂奔而下，明明很有气势的一幕却因为有一个小喽喽而变得极其搞笑。那人大概是脚滑扑通扑通滚下来，撞倒了一堆人然后直接摔在打响指的山匪身上。摔得那些人是眼冒金星。<p class='chapter_content_read_css'>这下根本就用不着晏紫荆动手了解决那些人了，原本山脚下的山匪们再一次慌不择路的逃回山寨。<p class='chapter_content_read_css'>“这年头，山匪也这么没水平。”晏紫荆将剑入鞘，看向被打劫的男子，“怎么样，没事吧？”<p class='chapter_content_read_css'>男子二十岁左右，一身侠客打扮，和晏紫荆一样使长剑，但身后所带的侍童暴露了他其实是某家的一名公子。他用娟帕擦拭剑上的血迹，将剑入鞘之后才回答晏紫荆：“多谢姑娘救命之恩，公孙感激不尽。”<p class='chapter_content_read_css'>“我也没出什么力哈，只是那——”<p class='chapter_content_read_css'>满身杂草的阿南突然出现在他们面前，眼睛通红，面色相比之前更加苍白，攥着包袱的手微微发着抖。<p class='chapter_content_read_css'>晏紫荆一拍额头，满脸歉意：“对不起阿南，刚才是我心急把你落在后面了，我怎么忘了你害怕这儿了，对不起。”<p class='chapter_content_read_css'>“没事，小姐。”阿南努力挤出这几个字。<p class='chapter_content_read_css'>晏紫荆回头就发现男子有意无意的看看阿南。<p class='chapter_content_read_css'>“抱歉，这位姑娘怎么有些眼熟。”男子先出口。<p class='chapter_content_read_css'>“啊——是和泠玉师姐有些相像，”晏紫荆笑笑，她第一眼看见阿南的时候也险些认错了，“你也见过师姐啊，确实是，师姐她当年嫁给顾王的时候也是闹得满城风雨。”<p class='chapter_content_read_css'>“姑娘是顾王妃的师妹？”男子一顿，了然的笑笑，“孚城岛晏家大小姐，晏紫荆。”<p class='chapter_content_read_css'>“哈，哈，没想到我也小有名气啊。”晏紫荆看见他的笑心脏猛然漏了一拍，不自觉地回想到当初师姐对自己说的话。<p class='chapter_content_read_css'>“紫荆，喜欢一个人，你就会很在乎他，连心脏也会记住喜欢上他时的那份悸动，等你喜欢上一个人的时候你就会知道了。”<p class='chapter_content_read_css'>悸动……这就是悸动吗？<p class='chapter_content_read_css'>晏紫荆出神地按住心脏，身子慢慢前倾，等她回过神的时候，男子已经扶住了她。<p class='chapter_content_read_css'>男子想要松开手，她一把抓住了他的双手合在胸前，踮起脚尖靠近他，男子向后退了退。<p class='chapter_content_read_css'>晏紫荆目光炯炯的看着他，真心诚意道。	<p class='chapter_content_read_css'>“我喜欢你。”<p class='chapter_content_read_css'>“！”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>月黑风高夜，杀人放火时。琴霜七此时的心境已经不能用害怕来诠释了。<p class='chapter_content_read_css'>他们最后还是找到了南宁，不过是在离滦城很远的荒郊野林，还是一处很像乱葬岗的地方找到的。<p class='chapter_content_read_css'>顾白派出顾王府全部的守卫来找南宁，彻底将花魁赛搅得乌烟瘴气，守卫在各条大小街道出没，到处都人心惶惶，最后就在顾白准备惊动皇帝的时候，一纸书信被送到顾白等人面前，只道侯南林。<p class='chapter_content_read_css'>于是他们就到了这里。<p class='chapter_content_read_css'>琴霜七刚踏进林子里的时候，就觉得有一股阴风袭来，树枝碰撞发出微妙的声音，眼前还仿佛闪过点点鬼火，整个林子里都回荡着乌鸦凄厉的叫声，她使劲咽了口唾沫。<p class='chapter_content_read_css'>身后的公孙风清轻拍了她一下，她立刻整个人吓得撞到顾白身上。<p class='chapter_content_read_css'>公孙风清收回手，劝慰道：“七七你要是真害怕就回去吧。”<p class='chapter_content_read_css'>“怎、怎、怎么可能，就算、就算吓死我也不能回去，在找到南宁之前我死也不会回去的。”琴霜七两手分别搂住顾白和公孙风清胳膊，心里才稍微有了些底，但背后总感觉冷飕飕的，“这样，这样就好了。”<p class='chapter_content_read_css'>顾白一心放在寻找南宁上没有注意琴霜七的举动，公孙风清瞧着琴霜七两腿打抖还硬撑，只好任由她搂着自己的胳膊，没再说些什么，只是将手晤在她背上，希望能让她好点儿。<p class='chapter_content_read_css'>“王爷，前面的土丘上好像有人。”有位守卫举着火把匆匆跑向顾白，指给他方位。<p class='chapter_content_read_css'>顾白撇下两人，飞奔而去，白色的衣袂翩飞而起，在这漆黑的夜间极其醒目。<p class='chapter_content_read_css'>琴霜七也完全抛下了害怕，紧紧跟上去。<p class='chapter_content_read_css'>等到琴霜七和公孙风清追上顾白的时候，南宁已经躺在顾白怀里昏迷不醒。<p class='chapter_content_read_css'>而他们所处的四周竟是一片乱葬岗，而他们就在这乱葬岗的中央，一个光秃秃微微隆起的小土丘上。<p class='chapter_content_read_css'>“南宁到底是怎么了？”公孙风清终于打破这诡异的寂静，率先问出口。<p class='chapter_content_read_css'>顾白僵着身子抱着南宁站起来，琴霜七刚将手探向南宁，就被顾白一把扇开。<p class='chapter_content_read_css'>“南宁她，怎么样？”琴霜七见他这么凶，心都提到了嗓子眼，声音也颤巍巍的。<p class='chapter_content_read_css'>“放心，南宁她应该还没事。”公孙风清从后面扶住她，他了解顾白，如果南宁真的没了气息，顾白绝对不只会是这样，绝对会做出更过激的行为来，就算他不知道南宁是什么来路，但他还没有到看不出来顾白有多在乎她的这种地步。<p class='chapter_content_read_css'>“走吧。”顾白终于出声。<p class='chapter_content_read_css'>琴霜七梗了一下，被公孙风清拉着跟上了顾白的步子。<p class='chapter_content_read_css'>不足半刻钟他们就回到了顾王府，琴霜七扶着门框气喘吁吁，不停地擦着脸上的热汗。她没想到平时看起来文质彬彬的顾白走起路来跟她跑起来的速度差不多，要不是公孙风清一直带着她，她早就被落的没影了。<p class='chapter_content_read_css'>公孙风清守在门口安抚一直等在王府的楚萱雨，顾白守在南宁床前，周身都散着一种凄凉的寒意，琴霜七看着忙忙碌碌进出房间的下人，忽然想到了一个人，抬腿便消失在所有人的视线内。<p class='chapter_content_read_css'>书绘音的院子与南宁的院子只有一墙之隔，几步远的距离琴霜七很快就到了。<p class='chapter_content_read_css'>琴霜七刚到院门口就听到里面传来“噗噗噗”的声音，很像砸草药时发出的声响，果不其然，书绘音点了一盏油灯在院子中央的石桌上砸着草药，在夜色中发黑的汁水顺着桌沿滴进一个半透明的小瓶子里。<p class='chapter_content_read_css'>“你怎么砸草药？一般不都是要煎的吗？难道是那汁水？”琴霜七觉得自己真的是问了一个很无聊的问题。<p class='chapter_content_read_css'>但书绘音还是回答了，虽然只是轻轻“嗯”了一声。<p class='chapter_content_read_css'>“南宁她，正在昏迷，你不去看看她吗？”琴霜七总觉得只有跟书绘音说话的时候需要字字斟酌，书绘音总会给她一种无形的压力，让她没了气场。<p class='chapter_content_read_css'>“她会醒的。”书绘音很冷静地回答她，手上的动作一点儿也没慢。<p class='chapter_content_read_css'>琴霜七刚想松口气，他又接着说。<p class='chapter_content_read_css'>“短则六七天，长则一个月。”<p class='chapter_content_read_css'>“什、什么意思？”琴霜七心里一抖知道什么意思，但还是要问一遍，默默的希望是自己想错了。<p class='chapter_content_read_css'>“就是你想的那样。”书绘音终于放下手中的东西，从袖中掏出一个小木塞塞紧小瓶子，然后递给琴霜七，“把这个每天子时涂在南宁心口，子时，你应该知道吧？”<p class='chapter_content_read_css'>“我知道。”琴霜七双手握住小瓶子，抿抿唇又问道，“南宁她，一定没事的，是吧。”<p class='chapter_content_read_css'>书绘音看着她，点头“嗯”了一声。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>晏紫荆晃了晃大概完全呆住的男子，有些奇怪。其实呆住的不只是男子一人，就连他身边的侍童也是震惊到石化的地步，阿南悄悄挪了挪步子稍微离晏紫荆远一些，大概是没见过如此“不拘小节”的女子吧……啊哈哈……<p class='chapter_content_read_css'>“怎么样，我喜欢你，你接不接受我？”<p class='chapter_content_read_css'>男子一挑眉，奇怪道：“明明你连在下是谁都不知道，怎能谈得上喜欢？”<p class='chapter_content_read_css'>“我喜欢你跟你是谁可没有关系，喜欢就是喜欢，是吧？”晏紫荆自问自答，“就是啊。”<p class='chapter_content_read_css'>“好吧，”男子竟然笑眯眯地摸摸晏紫荆的头，“真是个有趣的姑娘，我叫公孙翎，你喊我翎就好了。”<p class='chapter_content_read_css'>“嗯！”晏紫荆努力地点点头，用力抱住他，“啊，翎喊我紫荆就好。”<p class='chapter_content_read_css'>“公子……”侍童在后面弱弱的喊了一声，但是除了阿南微微抬头看了他一眼，完全被他二人给忽视掉了。<p class='chapter_content_read_css'>这到底算什么莫名其妙的告白啊？<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351945&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351945&&novelId=15670'">下一章</div>
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
