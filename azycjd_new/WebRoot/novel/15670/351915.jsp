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
    <title>（二）夜探假石后密室 古华苑中取魂来</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351915&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351915&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351915+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二）夜探假石后密室 古华苑中取魂来]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351915')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351915 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351915,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第3章&nbsp;&nbsp;&nbsp;（二）夜探假石后密室 古华苑中取魂来
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  琉璃珠玑、红豆膳粥、陈皮牛肉、琵琶大虾、五香仔鸽、高汤水饺、辣子鸡、酸辣黄瓜等菜摆满正厅桌案。小锦一一为南宫宁雪介绍。<p class='chapter_content_read_css'>  南宫宁雪看向南宁的眼神又有些不同，撩袍落座，他淡淡笑道：“没想到秦姑娘还精通厨艺，这些菜式怕是就连滦城如意楼的大师傅也未必能做得出来。”<p class='chapter_content_read_css'>  南宁一笑，心里不自觉得有些得意，她自小便喜欢吃各种吃食，但又不能下馆子一一吃到，只好自学厨艺了。南宫府的伙食是不错，但毕竟还是吃不惯这里的口味，只好自己闲来无事到厨房里做菜，但是府上的厨子倒也很厉害，不过看过几次就可以做出来了。最重要的还是，南宫宁雪很有钱，有很多在这里货缺的材料都能够买得到，真心土豪啊。她在心里吐槽一遍。<p class='chapter_content_read_css'>  小锦为南宁和南宫宁雪一一布菜，南宁微微一顿，刚来这里的几日，小锦不许她下床，连吃饭也是布好在床上吃，南宫府的厨子也不知道在菜里放了什么料，吃起来的味道总让南宁觉得怪怪的。<p class='chapter_content_read_css'>  再几天南宁总算能到偏厅里吃饭，小锦还是如影随形的跟在身边，还是给她布菜，绝不让她自己动筷夹桌上的菜，只能默默吃自己碟子里布好的菜，南宁争取了好几回，小锦才同意只待在她身旁，让她自己夹菜，才多长时间啊，她家公子一回来，就又开始这样了。<p class='chapter_content_read_css'>  无奈，南宁只好认认真真的吃自己碟子里的菜。<p class='chapter_content_read_css'>  南宫宁雪似乎很注重食不言这一条，南宁想插几句话，又被硬生生的吞下去了。<p class='chapter_content_read_css'>  午膳过后，南宁走到半路才想起来自己忘了和南宫宁雪提耳坠和书的事了，再拐回去，就不见了他的踪影。叹了口气，准备回到自己的院子里，听到树后面有说话的声音，正是南宫宁雪和衣蓝。<p class='chapter_content_read_css'>  南宁兴冲冲地跑过去，又硬生生的止住了脚步，因为他们正在谈论自己，猫着步子靠近，竖起耳朵听，听完却惑从心生，轻着步子回到了自己的院子，径直进了屋子，关上门，躺在床上，瞪着床幔，泄了气，自言自语道：“要不然，晚上去瞧瞧？”<p class='chapter_content_read_css'>  入夜，南宁像往常一样吹熄了灯火，摸着黑用宽绸带将宽袖口绑在手腕上，不然，行动起来会是很不方便。回想着白日里他们说的地方，潜进东苑的小花园中，拐了好几道弯，才看见一座假山，从一个犄角旮旯里翻出一颗小小的珠子，往某个小孔中胡乱一按，脚下传来“咔咔”的噪音。<p class='chapter_content_read_css'>  南宁往下一看，假山下面是个五十公分左右的正方形的洞，青石板的台阶向下通去。底下是黑漆漆的一片，南宁看看周围没有人，便一脚探了进去，刚踩上青石板，两边就突然亮起了灯火，火红色的灯笼照亮了整条甬道。<p class='chapter_content_read_css'>  向下大约走了两三分钟，台阶便到了头。<p class='chapter_content_read_css'>  南宁环顾四周，大约有她的卧室那么大，却是家徒四壁，除了几盏照明用的灯笼便什么也没有，走近其中一盏灯笼观察起来，用手摆弄了几下，也不是什么机关，又依次观察另外几盏，都没什么机关。<p class='chapter_content_read_css'> “莫非……”摸了摸下巴，划出了风符，几盏灯同时熄灭，一阵轻微的噪声从她左后方传出，“竟然是光控。”眨眨眼向密室中走去。<p class='chapter_content_read_css'>  等看清密室里的东西，南宁声音止不住的颤抖起来，“岚，岚旗……”<p class='chapter_content_read_css'>  衣架上的巴掌大的夜明珠散着柔和的光，通体紫色的女式长袍裙平整地贴在衣架上。<p class='chapter_content_read_css'>领口是旗袍样式，配两颗水紫色的花盘扣，长袖散口由四对蝴蝶配分别收褶，腰间是夜光紫色的绸缎腰带，配一块环形的羊脂玉和四条金黄色的长流苏，长裙分三层，由上自下分别是浅紫色，水紫色和夜光紫色，裙摆又绣有大朵成簇的深紫色花朵，就像是从脚下生长出的一般。<p class='chapter_content_read_css'>  南宁对这件衣服可是记忆之深，这是琴霜七刚刚出道时接的第一桩设计案，要求是中国古风、近代和现代的结合，衣服的整体造型是古风，领口袖口都用的近代风，裙摆的花朵则是用的现代的绣艺。为了这个任务，琴霜七可是熬了好几天查资料，又画设计图，又到苏杭等地求寻大师来绣裙摆紫花。<p class='chapter_content_read_css'>  等到做好衣服，琴霜七又让南宁给它起名字。<p class='chapter_content_read_css'>  南宁刚好在看某本小说，里面女主爱好紫色和花朵，便用女主的名字来命名，便叫做“岚旗”。<p class='chapter_content_read_css'>  只不过，在这个地方看见这件衣服，却给了南宁巨大的冲击。<p class='chapter_content_read_css'>  这到底是……怎么一回事？<p class='chapter_content_read_css'>  南宁没敢多想便匆匆跑走了。磕磕绊绊的回到屋里，躺到床上，用被子蒙住脸，心里一时思绪万千，各种想法围绕在脑海里，简直是剪不断理还乱。忽然想到，密室里的那件衣服似乎比琴霜七做的那件大了些，想着想着，渐渐进入梦乡，只不过，做了一个不太愉快的梦。<p class='chapter_content_read_css'>  等南宁再醒来时，却是满身冷汗，她忽的睁开眼睛，恐惧完全写在脸上，等反应过来，又茫然地晃晃头，冷笑一声用手掌拍上额头，喃喃自语：“真是的，刚才到底做的什么梦？这记性……唉。”<p class='chapter_content_read_css'>  南宁洗漱完就在院子里做早操，嘴里喊着节拍，伸伸胳膊伸伸腿。<p class='chapter_content_read_css'> “……四二三四五六七八，五二三四五六七八……”南宁猛地一闪身，右手腕一转就向后侧劈去，啪的一下扇骨打在手面上，再一转，扇柄便抵住了南宁的手心，另一只手向前一伸就牵制住了她想要偷袭的左手。<p class='chapter_content_read_css'> “哎？是你。”南宁向后退了几步挣脱开南宫宁雪的钳制，眼中的诧异一闪而过。<p class='chapter_content_read_css'> “秦姑娘身手倒是不错，不过秦姑娘大可放心，在下的宅子倒也安全。”南宫宁雪将折扇挂回腰间，看了看有些走神的南宁。<p class='chapter_content_read_css'> “哦，啊，是，是啊。”她有些漫不经心的回答着，突然想起来，“对了，南宫公子，我身上的书和耳坠是不是在公子那儿？”<p class='chapter_content_read_css'> “自然，”南宫宁雪看看天色，已到了晌午，“秦姑娘可先用午膳，过一会儿我便让衣蓝送来。”又吩咐了衣蓝几句。<p class='chapter_content_read_css'> “晌午……”南宁默默看了看天，老天，她竟然睡了一上午，还做什么早操嘛！直接叫午操好了！又想想刚才自己的动作有些大幅度，再配上这身衣服，哦，简直没法见人了。<p class='chapter_content_read_css'>南宫宁雪见她脸色不太好，开口询问道：“秦姑娘你不舒服吗？”<p class='chapter_content_read_css'> “没，没事，可能是有些饿了……”南宁真的很怀疑为什么一跟他说话都要结巴。<p class='chapter_content_read_css'> “没事就好，对了，秦姑娘刚才在做的是什么？”<p class='chapter_content_read_css'> “啊，那个，早操啊，我家乡流行的。”南宁为了让他更信服一些，特意加上了后一句。<p class='chapter_content_read_css'> “不知秦姑娘的家乡在何处？在下游历各处从未见过如此‘早操’。”<p class='chapter_content_read_css'> “呃，”南宁恨不得咬下自己的舌头，多说那一句话，“只是个很小的地方，没什么的啦。”<p class='chapter_content_read_css'> “这样啊……”<p class='chapter_content_read_css'> “公，公，公子！不好了！”小桃忽然慌慌张张地跑进来，紧张的连礼数也忘记了，眼眶红红的似要哭出来，可怜巴巴的看着南宫宁雪。<p class='chapter_content_read_css'> “慢些说，出了什么事？”南宫宁雪皱了皱眉，问道。<p class='chapter_content_read_css'> “衣蓝，衣蓝哥哥，晕倒在古华苑里了！”小桃抽搭着鼻子道。<p class='chapter_content_read_css'> “边走边告诉我怎么回事。”南宫宁雪说着便快步向院外走去，小桃紧紧跟着，南宁犹豫了一下也跟上去，心里总有股不妙的感觉。<p class='chapter_content_read_css'> “姐姐今天吩咐婢子去打扫古华苑，结果不知道怎么回事一直睡到巳时末才醒来，就慌慌张张的跑去了古华苑，结果刚到门口就听到打斗的声音，就赶紧跑进去往里面一看，就，就看到衣蓝哥哥倒在地上不省人事，还有一个人影翻墙出去了，就赶忙来禀告公子了。”小桃话语刚落，就到了古华苑苑口。<p class='chapter_content_read_css'>  南宁鼻子一嗅，心里立即不妙，焦急地喊道：“快，拿水来！”<p class='chapter_content_read_css'>  小桃立刻奔向井口打水，南宫宁雪刚想踏进苑内就被南宁拦住，南宁一脸严肃地说：“南宫公子还是在外面比较安全。”<p class='chapter_content_read_css'> “为何？”南宫宁雪不经意地掩住鼻子。<p class='chapter_content_read_css'> “这华苑内已被人下了招魂香，中此香者，轻则昏迷几日，重则可会被厉鬼缠身，损其生机。”南宁也暗道幸好，招魂香的浓度不大，只要用冷水泼醒便会没事，但是，招魂香，这不是在取忆时用的香料吗？她店内燃的便是这种香料，但在空气中的浓度很小对人体倒也无害，只是在这里出现……<p class='chapter_content_read_css'>  南宫宁雪轻轻后退一步，闪开了苑口的位置。<p class='chapter_content_read_css'> “姑娘接下来该怎么办？”小桃踉踉跄跄跑来，双手提了桶井水站到南宁面前。<p class='chapter_content_read_css'>南宁不语，掏出帕子捂住口鼻，提了水桶便冲进苑内，看见倒在书房门口的衣蓝，便二话不说一桶凉水泼过去。<p class='chapter_content_read_css'> “嘶——”衣蓝被冷水冻得打了个激灵，晕晕乎乎地看向用丝帕蒙着面，还保持泼水姿势不变的南宁。<p class='chapter_content_read_css'> “呼，醒了就好。”南宁一抹溅到脸上的水珠，轻轻松了一口气。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351915&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351915&&novelId=15670'">下一章</div>
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
