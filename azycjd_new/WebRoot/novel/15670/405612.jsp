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
    <title>（六十七）天降双婴祸亦降 火字深藏在心中</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405612&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405612&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405612+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（六十七）天降双婴祸亦降 火字深藏在心中]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405612')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405612 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405612,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第72章&nbsp;&nbsp;&nbsp;（六十七）天降双婴祸亦降 火字深藏在心中
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	??住在十四娘隔壁的南宁却在回想上午在客栈里听到的话。虽然她不知道游龙符令是什么东西，但听他们不可思议的语气应该是很重要的宝物。她又猜想南宫宁雪被一个绣球缠住的模样，差点笑出声，但又随即失落下去。当时的他应该很难堪吧，甚至成为了别人的笑柄，他又不情愿的去了风府，推却了婚事，他推的可是地位堪比公主的风大小姐啊。风岛主应该没少为难他吧……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 可自己还那样冷漠的对他，啊，自己真是坏透了！南宁嫌恶的捶捶自己的头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 其实，一切都不是南宁想的那样，她也是被客栈里的人给误导了。事实是，那些人是某个人为了帮南宫宁雪一把而收买的人，就是为了让南宁对南宫宁雪的误会解开，至于夸张点儿什么的就无所谓啦。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 村中的瘟疫就如十四娘所预测的那样，只不过两天就稳定了下来，而城中也并没有患病的人。十四娘有些乏的厉害，很早就睡下了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁虽然也很困，但还是强撑着眼皮，她可还记得今晚就是那位仙君来找她的日子了。她到现在还没想明白他能有什么事需要她一个凡人帮忙。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 苏映弦和上次的出场方式一样，都带着满满的仙气儿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 还没等着南宁开口，苏映弦就将她带进了十四娘的房间，指着熟睡中的十四娘道：“本君要看她的记忆。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “啊？十四娘的记忆？”南宁疑惑的皱皱眉头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “不是她，是荷雨的记忆。”苏映弦纠正道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “荷雨？不是，这是怎么一回事？”南宁也是糊里糊涂的，怎么是什么荷雨？她明明是十四娘啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “以你的灵气，竟然看不出她身上有两个人的魂魄？”苏映弦一抬手，两人便进到了一片白茫茫的地方，远远地能看见两个人影，一个红色的身形较小正是十四娘，另外一个则是墨绿色的，清秀的脸庞大概有十五六岁，只是额间一道黑色的印记显得狰狞无比，硬生生的让这少女布满可怕。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 两个身影都是紧闭着眼，悬空站着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “本君要看的，便是她的记忆。”苏映弦一指墨绿色的身影，“只要看完了她的记忆，本君就将玄天石交予你。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁点点头，将手抬起放在那名为荷雨的身前，默念起口诀。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	?<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她睁开眼第一眼看到的就是一个满脸皱纹的老婆婆，嘴里念叨着什么，“这孩子真怪啊，怎么就不哭呢？怎么办啊，桃儿，快去禀告给陛下。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她眨眨眼睛向那老婆婆脸上抓去，老婆婆下的差些没将她摔在地上，她被颠了一下反而笑得更开心了。老婆婆满脸可怖的将她放在水里摸来摸去，痒的她咯咯直笑，不一会儿又给她裹上了柔软的衣料。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 过了一会儿，被老婆婆唤作桃儿的女孩子跑回来，对着老婆婆悄悄说了几句，虽然很小声，但还是被她听到了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “陛下说了，将她关进禁室里。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她不知道禁室是哪儿，只觉得她们变来变去的表情很好玩。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 老婆婆喂给她了一股味道有些怪的东西，就把她放在一个好小的东西里面，又在上面捂了什么东西，眼前就变得黑漆漆的了。她撇撇嘴，不知不觉就睡着了，谁让她总觉得一晃一晃的，头有些发晕嘞。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 再醒来的时候她眼前还是黑漆漆的，周围一点声音也没有，她静默着也不发出声音，她觉得是有人在跟她做游戏，看看谁可以长时间不出声。等到她肚子咕噜噜咕噜噜叫个不停有些难受的时候。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 突然远远传来了轰隆隆的声音，紧接着她觉得有亮堂堂的东西慢慢走过来了，她目不转睛的盯着那亮光，直到亮光到了她面前，她才眨了一下眼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 男孩子将手里拿着的灯盏和盛着奶碗的托盘放下，两只手一起揉揉她的脸蛋儿，咋舌道：“你和你姐姐长得好像啊，和棉姨长得也好像，唉，怎么和我就不像呢？阿母都说我的桃花眼长得最漂亮了，不过你的眼睛也很漂亮啊，圆圆的，就跟我屋里的夜明珠一样。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 男孩子一屁股坐在了她身边，将她抱起来，仔细看着她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “嗯——阿父让我来照顾你，小七去照顾你姐姐，你姐姐叫漠漠，那么你呢？叫什么好呢？”男孩子松开一只手挠挠头，为了防止她摔倒就用另一只胳膊把她圈在怀里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他哼唧了半天，才亮着眼睛道：“不如就叫你双儿吧，哎呦喂，就算你高兴也别咬我啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她肚子实在有些难受，拿着胖乎乎的手抓住他的手指就使劲吮吸着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 从那以后，就只有这个男孩子来陪她，她也有了自己的名字——双儿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 虽然只有他一个人来陪自己，但她还是觉得很开心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他总是给她带来吃的，当然她只能喝奶，第一次喝奶的时候，味道很难喝，她一口还没咽就给吐出来了，还弄脏了裹布。他表情似乎是生气，又拿来了新的奶和裹布，这次的就比较好喝，她一气儿喝的肚子圆鼓鼓的，止不住的打嗝。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他神情比较复杂给她脱了裹布，又手忙脚乱的给她换上新的裹布，第一次绑的有些紧，差点儿就把她勒死过去了，第二次又太松，他一抱起来她，她就赤条条的对着他，她是咯咯直笑，他却满脸黑线。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 这样的事情多了几次后，他也会很熟练的喂奶给她，而且还面不改色的给她换裹布、尿布之类的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 时间似乎过得很快，又似乎过得很慢，她只能一直待在这个漆黑的地方，只有他来的时候才能带来一丝光亮，他总会给他讲外面的事情，说他阿父又训斥了他，阿母又一个人跑去寺庙进香被阿父给抓回来，太傅又让他写字写诗下棋等等。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 他还会给她讲外面的柳枝发芽了，哥哥带着他去掏了鸟窝；他院子里的荷花开了，粉红色的，就跟九重天宫女的宫纱一样美丽；卢雨山的枫叶红的像一团火似的，他们的马车在里面就感觉烧着了；晚上的时候下了大雪，他的院子被大雪给埋了，司元差点儿就被活埋在里面了，他正好在他阿母的卧室里，才没事的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “双儿，你想不想去看看哥哥院子里的荷花，昨天晚上一夜都开了呢，可漂亮了。”男孩子身体抽长了不少，也长得愈发俊美，笑眯眯地看着已经会跑的她。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她眨眨眼，伸着胳膊找他抱抱，见他无动于衷，噘嘴可怜兮兮的喊着：“哥、哥哥，哥哥抱，哥哥抱。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 男孩子喊了一声好嘞，将她抱了起来，她把胖乎乎的小手伸进他的衣襟里乱挠，他笑着求饶，却不敢松手去拦住她的小手，只是紧紧抱着她以防她摔下去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 衣衫被她挠的不成样子，大片雪白的肌肤露出来，她闪着眼睛，像是得到了什么好玩的玩具，把小手在他胸膛上摸来摸去，又把鼻子抵在他身上使劲闻闻。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她抬起头很认真的看着他，“哥哥，你好香，还滑滑的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 男孩子开心地笑起来，用鼻尖蹭蹭她的额头，赞叹道：“双儿也好香呢！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “明天我就去求求阿父，让你出去和我去看看荷花，好不好啊，双儿？”他把她的屁股往上托托，拿鼻尖蹭着她的鼻尖，她咯咯的笑起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 但是第二天她并没有出去，男孩子也没有来，她就饿了整整一天，又过了一天，男孩子才拿了吃食来看她，虽然他还是笑着，但她总觉得他就是不高兴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她摇摇晃晃的爬起来，站在床上，拽拽他的衣服，“哥哥，我饿。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “对不起啊双儿，昨天我没能你来送饭，你一定饿坏了吧。坐好，哥哥喂你。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她乖乖坐好，张开嘴一口一口吃着食物。忽然她就不吃了，直勾勾的看着他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “双儿怎么了，是粥凉了吗？”男孩子疑惑的问道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她摇摇头，低头不语。他面带担心的放下碗勺，慢慢靠近她，“怎么了？是哪里不舒服吗？”她已经有一岁多了，可是一场病也没生过，但是她知道，他最害怕她生病了，因为根本没有人会给她看病。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她忽然抬起头，用两只小手抓住他的两耳，小小的唇瓣贴在他额头上，她乖巧道：“我亲亲哥哥，哥哥就不会痛了吧，哥哥不要不开心。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 男孩子紧紧抱住她，声音有些颤抖，“嗯，哥哥不痛了，双儿好厉害哦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 她又亲了亲他有些青紫的额头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	?<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁有些黑线的看着眼前发生的一幕，所以这是什么？哥哥和妹妹那啥也……额，好吧，她已经什么也说不出了。再转脸看向身旁的苏映弦，表情是丝毫不动的淡然。只是他一身白衣和这黑暗的场景实在是太不相称了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “敢问仙君，这双儿是不是就是荷雨？只是她为什么会被关起来？”南宁摸摸下巴，觉得那男孩子似乎有些眼熟。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? “你接着看就是了。”苏映弦语气冷冷的，跟书绘音有一拼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	? 南宁也瞬间有种其实是书绘音在身边的感觉，心里默默吐槽：他跟书绘音真是绝配。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405612&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405612&&novelId=15670'">下一章</div>
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
