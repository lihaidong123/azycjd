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
    <title>番外之告白（3）</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351960&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351960&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351960+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外之告白（3）]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351960')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351960 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351960,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第48章&nbsp;&nbsp;&nbsp;番外之告白（3）
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  “你知道为什么你天天都可以吃芙蓉糕吗？还可以吃到那么多根本就不该是你能吃到的东西？那全是衣蓝把自己的俸钱给了厨房，让他们给你做的。还有你教你剑术的那位师父，那就是衣蓝啊，他就是为了能和你多相处一会儿啊。而现在呢，他是为了救泥儿——你的儿子才溺水的，你是没有看到啊，他自己不会水还跳下去，拼命地把泥儿举过头顶，等着弥生把泥儿接过来后，衣蓝他，他就沉下去了啊，没有一点儿挣扎，是他把所有的力气都用完了呐……”<p class='chapter_content_read_css'>徐管事实在忍受不住，拼命擦着眼泪，冷静了一会儿又继续道：“衣蓝刚跳下去的时候，后脑还撞到了石头上，血就那样漫开在水里，看的我是心痛啊……”<p class='chapter_content_read_css'>  行云紧紧攥着杯子，徐管事的话就像刺一样一根一根扎在心里，刺得是千疮百孔。<p class='chapter_content_read_css'>  “那，我该怎么做，我……”行云哽咽住，他没想到原来衣蓝为他做了这么多，可他什么也不知道，可是知道了，他又该怎么做啊？他该怎么回报他啊……<p class='chapter_content_read_css'>  “我告诉你这些，只是想让你知道衣蓝到底为你做过些什么，我并不希望你因为要回报他才回应他的感情，如果你只是感激他，那么，我会给你一笔钱，足够你带着泥儿远走高飞，好让衣蓝彻底死了这条心。”徐管事将新倒的一杯热茶推到行云面前，“你好好想想，再给我答复。好了，吃菜吧。”<p class='chapter_content_read_css'>  行云将热茶一口闷下去，苦涩慢慢弥漫在舌尖中，渐渐涌入心头。<p class='chapter_content_read_css'>  他不知道自己是怎么回到自己房间的，他整个人都是天旋地转的，才短短不到两天啊，他的生活，他自以为很满足的生活，都被彻彻底底颠覆了，原来，原来这一切都是他给予的。他真的不知道啊，他到底对他是什么感情？是感激？还是爱？<p class='chapter_content_read_css'>  如果是感激，那么就离开。<p class='chapter_content_read_css'>  如果是爱呢？那么就在一起吗？<p class='chapter_content_read_css'>  他一夜没睡，偷偷跑到衣蓝门口守了一夜，看着换班侍女古怪的眼神，他也选择忽视，他看着来给衣蓝换药的大夫良久，张了张唇，还是没能问出口，只是一句简简单单的“他还好吗”都问不出口。<p class='chapter_content_read_css'>  “衣管事醒了！醒了！”侍女惊喜的冲出去去给徐管事报信儿。<p class='chapter_content_read_css'>  行云腾地就站起来，冲进屋里，只看见衣蓝绑着新换的绷带倚靠在床头，听见他进来的声响，衣蓝微微歪头看向他，皱了皱眉，又冲他微微一笑，继续回过头跟大夫说些什么。<p class='chapter_content_read_css'>  怎么回事？那个笑，有哪里不对，到底是怎么回事？衣蓝从来没对他这么笑过。<p class='chapter_content_read_css'>  他狠狠攥上胸口的衣襟。<p class='chapter_content_read_css'>  大夫询问了一些情况很快就走了，徐管事恰好进来，又退到门口和大夫交谈了一会儿，原本紧绷的神情忽然变得轻松起来，让账房去拨些钱给大夫。<p class='chapter_content_read_css'>  “衣蓝，你终于醒了。”徐管事又坐到床边和衣蓝说了会话。<p class='chapter_content_read_css'>  衣蓝忽然转脸看向行云，道：“你不是大夫的药侍吗？怎么还留在这儿啊？”<p class='chapter_content_read_css'>  不仅是行云呆住了，连徐管事也被震住了。<p class='chapter_content_read_css'>  “啊，不对不对，看我这记性，你这不是穿的府里侍卫的衣服吗，我怎么从来没见过你啊，你是府里新来的侍卫吗？”<p class='chapter_content_read_css'>  “我……”行云还没来得及说话，就被徐管事拦住了话头。<p class='chapter_content_read_css'>  “看来衣蓝你的记性真是变差了啊，他可是从建府就在府里头了，你可是为了救他的儿子才溺水的。”<p class='chapter_content_read_css'>  “这样啊，”衣蓝不好意思的笑笑，“真是抱歉啊。”<p class='chapter_content_read_css'>  就这一句话，行云的眼泪唰的落下来了，衣蓝的笑一下子僵在脸上，下意识的看向徐管事，徐管事看看行云，道：“你先下去吧。”行云闻言夺门而出。<p class='chapter_content_read_css'>  “这是……”衣蓝疑惑的看着行云狂奔出去的身影。<p class='chapter_content_read_css'>  “啊，行云他的内人前些日子过世了，都过去那么长日子了，还是动不动就感伤啊。”徐管事哀叹道。<p class='chapter_content_read_css'>  “这样啊，那就给他放些日子的假吧，您不是还说他还有个儿子吗？就从我俸钱里拨些给他吧。”衣蓝头忽然一痛，狠狠皱了眉，徐管事赶忙让他躺下，因着伤了后脑，衣蓝只能往一侧偏偏头，阖上眼，又沉睡过去。<p class='chapter_content_read_css'>  徐管事看了衣蓝良久，忽然从衣袖里掏出一包药粉，看了一眼丢进了纸篓箱里。又给衣蓝捏了捏被子才起身离开。<p class='chapter_content_read_css'>  他刚走到荷花池边就看见行云蜷缩在那儿的身影，走上前去，手才刚刚放到他背上，行云腾地回过头来，脸上抹花的全是泪痕，鼻子还一抽一抽的吸着鼻涕。<p class='chapter_content_read_css'>  “你知不知道若是衣蓝没醒过来，我可真想就这样一巴掌把你推下去，淹死你这个混蛋算了。”徐管事撩了袍子坐到他旁边，冷冷道。<p class='chapter_content_read_css'>  行云呆呆的看着他，一撇嘴又要哭起来，徐管事一皱眉直接把自己的帕子塞到他刚张开还没哭出声的嘴里，嫌弃道：“看看你的样子，哪里像是一个孩子的爹，哭成这个样子也不嫌丢人。”<p class='chapter_content_read_css'>  行云被塞住嘴，呜咽着看着他，突然开始打起嗝，因着被堵住嘴又只能被噎下去，眼泪流的更快了。<p class='chapter_content_read_css'>  “你啊你，”徐管事忍住想要揍他的冲动，狠狠把手帕扯出来丢到一旁，硬气道，“这下，衣蓝忘了你，我们都是求仁得仁，这样的结果最好不过了，你傻哭个什么劲。至于我昨晚说的话，你就当没听过好了。”<p class='chapter_content_read_css'>  “嗝，怎么，嗝，怎么，嗝，可能，嗝，当做，嗝，没，嗝，听过，嗝，嗝。”行云胡乱地抹着脸上的眼泪，抽着气儿打着嗝。<p class='chapter_content_read_css'>  “唉，反正衣蓝已经忘了你，什么都是多说无益，我就拨给你一些银子，你带着泥儿出去玩一段日子再回来吧。”说完便要起身离开，被行云一把扯住袖子又坐了回去。<p class='chapter_content_read_css'>  “衣管事他，嗝，会不会，嗝，再想起我，嗝。”<p class='chapter_content_read_css'>  徐管事深深看他一眼，“我希望不会。”说完轻轻拂开他的手，起身走远。<p class='chapter_content_read_css'>  他终于不再哭，只呆呆的抱着自己的腿，只紧紧盯着自己的鞋尖。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351960&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351960&&novelId=15670'">下一章</div>
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
