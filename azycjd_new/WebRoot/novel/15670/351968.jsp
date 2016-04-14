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
    <title>（五十一）故人来去唯绘知 不知红颜心难得 </title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351968&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351968&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351968+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（五十一）故人来去唯绘知 不知红颜心难得 ]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351968')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351968 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351968,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第56章&nbsp;&nbsp;&nbsp;（五十一）故人来去唯绘知 不知红颜心难得 
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			天地苍凉，漫崖遍野的全是墨绿色的高丛草，向南的一面满是茂盛的参天碧树，向北的一面是满是碧草芳花的舒适草地，虽然还微微有些湿润，虽然是是什么荒无人烟的崖底，但绝对是情侣们谈情说爱的好地方——吧？<p class='chapter_content_read_css'>  一阵冷风呼啸而过，惊动了几只乌鸦扑扇而去。<p class='chapter_content_read_css'>  三人六目相对，书绘音倒是毫不在意的站起来理了理凌乱的衣物，看看面色尴尬的南宫宁雪再看看眼里淬满寒冰的南宁，只是南宁眼里的异样让他呆愣了一下，不过又瞬间恢复。<p class='chapter_content_read_css'>  “南宁，我来接你了。”他说的很平静，连看都没看地上的女子一眼，径直向他们走去。女子不知什么时候站了起来，还紧紧揪住了他的衣服。<p class='chapter_content_read_css'>  “阿……”<p class='chapter_content_read_css'>  “我说过的，再见你时便是杀你之时，但看在这次你帮我甚多的份儿上，便放了你这一次，绝不会再有下一次了。”<p class='chapter_content_read_css'>  女子抬头，让南宫宁雪看了个清楚，他只觉得有些面善，但还是记不得在哪里见过。<p class='chapter_content_read_css'>  “那你，也记住我的话，她绝对不会再回来，她也绝对不会再是她。”女子说罢疾跑而去，只甩给了他们一个艳红背影。<p class='chapter_content_read_css'>  “你们到底在做什么！”南宁执拗的问着。<p class='chapter_content_read_css'>  书绘音沉默不语，淡淡的看着她。<p class='chapter_content_read_css'>  南宁紧紧攥着手，指甲都陷进南宫宁雪的肩膀里，南宫宁雪只是抿着唇，三人的气氛古怪万分。<p class='chapter_content_read_css'>  “我先带你们出去。”良久，书绘音只说了这一句，径直向前方走去，正是他们来的方向，南宫宁雪在后面紧紧跟着他。<p class='chapter_content_read_css'>  再入眼，是他们住了几天今早才离开的山洞，没想到别离才不过半日就又再次相见，南宫宁雪也是忍不住的挑了挑眉，难道，出口就是这儿？<p class='chapter_content_read_css'>  书绘音轻轻一拂衣袖，原本封闭的山洞竟出现了一条通路，尽头是漫漫日光。<p class='chapter_content_read_css'>  “在下愚钝，竟不知此处别有洞天。”南宫宁雪苦笑一声。<p class='chapter_content_read_css'>  “放我下来，我有事跟他谈谈。”南宁终是忍不住，喊住了想要离开的南宫宁雪，书绘音也回头看着她。<p class='chapter_content_read_css'>  南宁一瘸一拐的走到书绘音面前，忽然踮脚搂住了书绘音的脖颈，将脸贴向他。<p class='chapter_content_read_css'>  南宫宁雪与书绘音皆是脸色一变。<p class='chapter_content_read_css'>  南宫宁雪变了脸色是因为南宁亲昵的动作；书绘音变了脸色是因为抵在他脖后的冰凉利器。<p class='chapter_content_read_css'>  “你到底，在跟她做什么。”南宁的唇紧紧贴在他耳边，语气冷冽的像换了一个人，“不要以为她换了一具身体，一张脸，我就认不出她了。”<p class='chapter_content_read_css'>  书绘音瞬间身体僵硬，嘴唇哆嗦了半天一个字也未吐露出来。<p class='chapter_content_read_css'>  “你知道的，他们都可以背叛我，只有你，只有你，我绝对不会允许，否则，你知道我会做出些什么的。”南宁忽然手上一松，并没有想象中利器掉落的声音，书绘音眼神一松，她阖上眼迅速瘫软在书绘音身上。<p class='chapter_content_read_css'>  南宫宁雪刚才很自觉地离远了些，他是不想冒犯南宁的隐私，只是这样有些让他难过。<p class='chapter_content_read_css'>  “秦姑娘她——”<p class='chapter_content_read_css'>  “我抱着她便可。”书绘音将南宁横打抱起，完全没在意他往出口走去，南宫宁雪自己也没注意到他对书绘音的敌视到底加重了几分。<p class='chapter_content_read_css'>  不多时，他们便出了山洞。<p class='chapter_content_read_css'>  通路的尽头是一片宽阔的针叶林，不远处隐隐约约有一村庄，书绘音忽然站定，吹了一声口哨，周围发出了窸窸窣窣的声音，声音越来越密集，猛然有无数黑影飞窜向他们。<p class='chapter_content_read_css'>  南宫宁雪定睛一看，竟是数十只雪狐，雪狐都十分乖巧的聚在书绘音脚边，更有胆大的跃上了他的肩头亲昵地舔舔他的脸颊，他还发现，其中一只体型稍大的雪狐居然有三条尾巴，正恭恭敬敬的抬起前爪站在书绘音面前。<p class='chapter_content_read_css'>  书绘音只是从怀里掏出颗水晶一般的珠子放到它的前爪里，雪狐将珠子含到了嘴里，又恭恭敬敬拱了几下前爪，扫了两下三条尾巴，正是感谢之意。<p class='chapter_content_read_css'>  “下次要小心，莫要再被人抢走了。”书绘音抱着南宁微微颔首叮嘱那雪狐，雪狐似乎笑了笑，轻叫一声，狐群迅速散开了。<p class='chapter_content_read_css'>  “这次，多谢了。”书绘音轻轻一言。<p class='chapter_content_read_css'>  三尾雪狐停住了身影，怪叫了些什么，只见的书绘音脸色忽然变得很难看，周身都围上了浓重的寒气，周围的草地与树枝上都凝聚了薄薄的冰霜。<p class='chapter_content_read_css'>  “书兄，至此我们该往何处去？”<p class='chapter_content_read_css'>  “跟着便是。”书绘音口气十分不好，冷冷地斜了他一眼，大步向村庄的方向走去。<p class='chapter_content_read_css'>  南宫宁雪不再多言，将大部分注意力用来观察周围的一切，前两日莫名其妙遇到的那件事他也想通了不少，那些军队并非是哪一国，甚至是风铃岛的军队，依着那神出鬼没的行踪，应当是某一位女神的下属军队，看那盔甲兵刃属寒阴，又极像是云殇女神的行事风格。<p class='chapter_content_read_css'>  只是，君上？又属何称谓？还有小殿下？又是谁？一连串的疑问又在心里浮生。<p class='chapter_content_read_css'>  南宫宁雪慢慢出神，完全不晓得前面的书绘音停了下来，不小心撞到了书绘音的胳膊，南宁也差点儿掉了下来，书绘音淡淡看了他一眼。<p class='chapter_content_read_css'>  “万分抱歉。”南宫宁雪拱手道歉，紧接着抬头看着面前的农舍，半掩着的青竹篱笆门，简陋却很干净的茅草屋，院子里还有毛绒绒的小鸡仔和大片的青色蔬菜，院子一旁还有高大的榆树，冒着墨绿色的生机。<p class='chapter_content_read_css'>  屋门忽然打开，一个七八岁的小女孩从里面窜了出来，怀里抱了只毛绒绒的兔子，眼睛余光瞥见了站在门口的书绘音，立刻欢快地蹦跶到门前，仰着脸看着书绘音，甜甜的喊着他。<p class='chapter_content_read_css'>  “阿哥！”<p class='chapter_content_read_css'>  “阿音有好好的照顾自己吗？”书绘音周身的寒气忽然化为了温暖的春风，琥珀色的眼睛里满满都是宠溺，只差腾出手亲昵地摸摸她了。<p class='chapter_content_read_css'>  这一切让南宫宁雪差些傻了眼，冰冷冷的书绘音竟然会有这么温柔的时候，看来这个小女孩还当真不简单。<p class='chapter_content_read_css'>  “阿哥，这位姐姐是谁啊？她怎么睡着了啊？还有这位小哥哥，你好啊，我叫阿音。”小女孩连忙推开篱笆门，将他们推搡进去，“你们快些进去哦，家里面有很多好吃的呢！”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351968&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351968&&novelId=15670'">下一章</div>
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
