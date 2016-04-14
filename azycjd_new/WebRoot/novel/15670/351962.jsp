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
    <title>（四十五）晕车药中现辣椒 无奈晕船错笄礼</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351962&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351962&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351962+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十五）晕车药中现辣椒 无奈晕船错笄礼]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351962')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351962 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351962,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第50章&nbsp;&nbsp;&nbsp;（四十五）晕车药中现辣椒 无奈晕船错笄礼
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			就在南宁心惊胆战之际，那公子却邪魅一笑退了出去，还给她带上了门。<p class='chapter_content_read_css'>  南宁缓了半天，默默将被子拉上来捂住了脸。<p class='chapter_content_read_css'>所以是，走错房间了吗？怪不得如此肆无忌惮的高谈阔论。等、等等，她刚刚是不是听到了什么秘密！那么，他不会杀人灭口吧！她刚才和他对视了那么长时间呐。<p class='chapter_content_read_css'>南宁腾地一下坐起来，船体忽然一阵颠簸，胃里又一阵翻涌，但翻腾来翻腾去也只有恶酸味的胃液。<p class='chapter_content_read_css'>南宁又扶着胃慢慢躺下，手在被窝里轻轻揉着胃和肚子，闭目，男子的身影在脑海里越发鲜明起来。<p class='chapter_content_read_css'>尤其是那双狐狸眼，看的真让人不舒服。<p class='chapter_content_read_css'>没多久，门外又响起了脚步声。但她却知道那是谁的脚步声，声音不大，不疾不徐。<p class='chapter_content_read_css'>  门扉被轻声打开，南宫宁雪端了一碗黑漆漆的汤药进来，南宁紧闭着眼，鼻子很是敏锐的嗅到了汤药弥漫着的苦味，整张脸都皱了起来。<p class='chapter_content_read_css'>  南宫宁雪前脚刚进来，琴霜七后脚就迈了进来，几步走到南宁床前轻拍了她几下，南宁不情愿的睁开眼睛，委屈的看着琴霜七，很严肃的表示，她真的很不想喝药。<p class='chapter_content_read_css'>  但琴霜七像是没注意到她传递给她的意思，从南宫宁雪手里接过了汤碗，拿起勺子准备亲自喂她，南宁向床里面挪了挪，她就拿着勺子再靠近一点儿，她再挪，她再靠近，直至把南宁从双人床的床帮逼到了墙角里。<p class='chapter_content_read_css'>  “南宁乖乖喝药，不然我可不保证会对你做出些什么。”琴霜七将勺子丢到汤药碗里，一只胳膊撑着床，差点儿将脸撞到南宁脸上，面无表情的看着南宁。<p class='chapter_content_read_css'>  南宁缓缓移动视线，从琴霜七脸上慢慢移到她左手端着的汤药碗上，又慢慢看向站在一旁表情复杂的南宫宁雪脸上。<p class='chapter_content_read_css'>  南宫宁雪忽而侧过脸去伸手到医箱里翻找些什么，南宁面色死灰的接过汤药碗，眼睛一闭，大有“风萧萧兮易水寒，壮士一去兮不复还”的觉悟，一口闷吞下去，差点儿将汤药碗摔倒床底下，幸好琴霜七眼疾手快接住了汤药碗。<p class='chapter_content_read_css'>  南宁立刻蔫了吧唧的倒在床上，幽幽将被子拉上去，蒙住了头。<p class='chapter_content_read_css'>  琴霜七轻松地呼了一口气，僵硬的扯了扯嘴角，大走两步把汤药碗丢在了桌子上，发出“哐当”的声音。<p class='chapter_content_read_css'>  南宫宁雪正从医箱里拿出一个小瓷瓶，打开小木塞，一阵刺鼻的味道袭入鼻中，他皱皱眉稍稍拿远了些，琴霜七却眼睛一亮一把夺过小瓷瓶，深深吸了一下，虽是被呛得一连打了几个喷嚏，但还是满脸兴奋。<p class='chapter_content_read_css'>  “南宫，你怎么会有这个的？不是说南苧没有辣椒吗？”小瓷瓶里的东西正是碾好的辣椒面。正如琴霜七所说的，南苧是没有的辣椒的，但有很多辣味的调料品，像是芥末、茱萸和蒜如此诸类，但远远没有辣椒的那种感觉，这让很喜欢辣食的南宁和琴霜七很郁闷。<p class='chapter_content_read_css'>  “辣椒面！”刚刚还缩在被窝里的南宁在琴霜七话音还没落的时候就裹着被子撒开脚丫子跳到了琴霜七面前。<p class='chapter_content_read_css'>  眼睛一闪一闪的盯着小瓷瓶，狠狠咽了两口口水。<p class='chapter_content_read_css'>  南宫宁雪好笑的挑挑眉，好像她们两个一遇到关于吃的任何事情就会完全变了一个人。他静静地站在一旁，默默看着激动地叽叽喳喳的两个人，尤其是南宁，南宁脸上闪着异样的神采，南宫宁雪心里念叨着当初没有拒绝这奇怪的东西真是对了。<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  经过六天的江上漂泊，客船终于抵达了风铃岛。<p class='chapter_content_read_css'>  八十余米的三层客船稳稳地停靠在渡口，绣着“风”家字样的船旗被慢慢放下，船舱也被缓缓打开，客人们全都一个挨一个地下船，南宁他们等到最后才下船。<p class='chapter_content_read_css'>  一个原因是为了避开前些日子见到的紫衣公子，另一个就是南宁晕船愈发严重，就算吃了南宫宁雪开的药也没什么好转。<p class='chapter_content_read_css'>  南宁的脸都快成菜紫色的了，摇摇晃晃的被琴霜七慢慢扶下船，明明一分钟就能走完的台阶，她整整走了足足五倍的时间才走到了木栈上，起初船主还有些不耐烦，但在被南宫宁雪温和的塞了一锭银子之后立刻又迎了笑脸。<p class='chapter_content_read_css'>  好不容易进了马车，南宁一头栽进了软垫子里，双眼紧闭，默不作声。<p class='chapter_content_read_css'>  “再过两个时辰就是及笄礼开始的时候了，以你现在的样子怕只是去不了了，你就先去驿馆休息吧，及笄礼就让我和书绘音一起去就成了。”琴霜七拍拍她的后背，轻声道。<p class='chapter_content_read_css'>  南宁把头埋进软垫子里哼唧了两声以表示同意。<p class='chapter_content_read_css'>  就是这样，南宁错过了风韵的及笄礼，也错过了与这位后来对她有诸多影响的少女的初次见面。<p class='chapter_content_read_css'>  到了晚间，琴霜七兴致勃勃的跟南宁讲着白天在及笄礼上的见闻，讲着风小姐换了几身裙袍，用了什么样的布料，戴了什么腰佩，换了几种发型，配了什么首饰，还在啧啧的赞叹着风小姐怎么那么淑女，整整两个时辰下来还那么温和的笑着。<p class='chapter_content_read_css'>  南宁只能喝着蛋皮粥，强忍着不适听着琴霜七口若悬河。<p class='chapter_content_read_css'>  琴霜七终于停住了嘴，喝了两口温水润润嗓子，清咳了两声，南宁赶忙在她开口之前把盘子里的最后一块脆皮膏塞进琴霜七嘴里。<p class='chapter_content_read_css'>  “这么晚了，七七你先睡去吧，明天你不是还要到城里面去玩玩吗？”<p class='chapter_content_read_css'>  “唔嗯。”琴霜七含糊的点着头，但还是赖在南宁床上不走，南宁微微一斜眉，琴霜七终于咽下最后一口脆皮膏一溜烟没影了。<p class='chapter_content_read_css'>  南宁稍稍松了一口气，脸色忽然变得煞白，抖着手从枕头底下掏出小药瓶倒出黑漆漆的小药丸，还有一颗因为手抖掉到了床被上。将药丸猛然吞下，南宁蜷起身子缩进被窝里，起初身子有些发抖，慢慢就平静下来。<p class='chapter_content_read_css'>  夜间的风非常大，猛烈的撞击着窗户，窗纸被吹得“哗哗”作响，好似一不小心就会破个大洞，但窗纸却意外的坚韧，直直抵挡住了烈风的侵袭。<p class='chapter_content_read_css'>  屋内的烛火颇为反常的跳动起来，节奏越来越快，越来越快，终于忍不住“噗”地一声熄灭了。<p class='chapter_content_read_css'>  但一个人影就在那一瞬被定格在窗纸上。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351962&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351962&&novelId=15670'">下一章</div>
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
