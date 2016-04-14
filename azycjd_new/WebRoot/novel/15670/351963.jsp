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
    <title>（四十六）风大小姐患病之 断崖之处寻百草</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351963&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351963&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351963+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十六）风大小姐患病之 断崖之处寻百草]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351963')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351963 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351963,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第51章&nbsp;&nbsp;&nbsp;（四十六）风大小姐患病之 断崖之处寻百草
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			一众黑衣刺客将南宫宁雪逼到了崖壁边缘，南宫宁雪只身一人一袭淡紫长袍手执一柄窄长剑在萧瑟的崖壁之上极其显眼。<p class='chapter_content_read_css'>  他收敛了往常的温雅，面无表情的看着他们举着统一的钺斧直直的面对自己，只要自己稍微一动，他们便会冲上来杀了自己。没想到，他也被逼入了这种境地。他心里很明白，这些人是他的大哥派来的，终于等不及了吗？他心里讽刺一笑。<p class='chapter_content_read_css'>  他向后挪了一步将手背在后面本想施出法咒，却不料忽然一个身影从旁边窜出来一下子扑到了他的身上，他踉跄了两步，好不容易稳住了身形，但扑在他身上的毛球又撞了他一下，最后一脚一空直直向后栽去，只听到耳边飓风的呼啸。<p class='chapter_content_read_css'>  不仅他自己傻眼了，就连那些刺客也是对突然出现的一团毛球感到莫名其妙，一个个都深锁着眉头呆在原地。<p class='chapter_content_read_css'>  被当成一团毛球的南宁迅速用脚扣住了崖壁上的一块岩石，一只手奋力抓住南宫宁雪的手腕，另一只手紧紧攀住崖壁边缘，她现在是想哭的心都有了，她明明有好好的藏在旁边的树丛里的啊，不知道哪个混蛋竟然从后面推了她一把，她真的不是故意的啊！<p class='chapter_content_read_css'>  南宁扭曲着面容使出全力想把南宫宁雪往上拉一些，但都只是徒劳，力气流失的愈发快了，抓着南宫宁雪的手也松动了，南宫宁雪又往下滑了寸许。南宫宁雪另一只手执剑将剑插入岩石缝中，只能依靠着薄弱的支撑力稳固住身体，他也是丝毫不敢动弹，若是一个不小心，那将会陷入万劫不复的境地。<p class='chapter_content_read_css'>  南宁脸上的冷汗越来越多，面色也几近煞白，脚下踩着的岩石也开始缓缓松动，细碎的石头接二连三的从南宫宁雪眼前滚落。<p class='chapter_content_read_css'>  “秦姑娘，你……小心！”南宫宁雪刚想唤她松手，若是这样的话，她或许还能有一线生机，若是自己一人掉下去的话，他是会施咒自保的，却忽然影影绰绰看到朝着南宁挥去的钺斧，心一下子被揪住忍不住大叫出声。<p class='chapter_content_read_css'>  骤然之间，一串血珠撒到南宫宁雪脸上，嘴角抹上了一记艳红，他的瞳孔猛然收缩。<p class='chapter_content_read_css'>  南宁瞪大着双眼，眼看着钺斧就要砍断她的手腕，抓着南宫宁雪的手也骤然一紧直接掐出了指甲印，只不过短短一瞬事态急转而下，那人的手腕反被砍下，还没来得及哀嚎便倒在地上一命呜呼。满是鲜血的手掌和钺斧正从南宁脸颊划过，温热的鲜血撒了南宁一身。<p class='chapter_content_read_css'>  玄衣男子单膝跪地，只用一只手便提起了紧紧拽着南宫宁雪的南宁的胳膊，但是却并不将他们救上来，只是将他二人悬空。<p class='chapter_content_read_css'>  刺客们见同伴被杀，全都一股脑涌了上来，还未靠近男子半步，就全都像断了线的木偶一般睁着可怖的眼睛倒在地上，钺斧还紧紧攥在手里，就那样没了气息。<p class='chapter_content_read_css'>  才只不过，短短一瞬罢了。<p class='chapter_content_read_css'>  南宁霎时间由惊慌变为了恼怒，每一个字似乎都是像从牙缝里挤出来的。<p class='chapter_content_read_css'>  “你、怎、么、会在这儿！”<p class='chapter_content_read_css'>  玄衣男子眼里带着温笑，面若春风，语气却像是生来的冷冽：“自是为了阿南而来。”<p class='chapter_content_read_css'>  南宁从鼻翼发出一声冷哼随即变为冷笑，空着的手慢慢握成拳头，她有些明了了，刚才定然是他推她那一把吧，不然，她怎么又会落入这种境地，还在这里装什么好人！“所以，是来找我为葵儿报仇吗？那你就只管看着他们杀了我便是了，何必如此作态。”<p class='chapter_content_read_css'>  “阿南你当真是在说笑，”玄衣男子虽是温柔相对南宁，却分了一半精力冷冷斜了南宫宁雪一眼，眼里充满了怨气与蔑视，“若是阿南肯松手的话，我便救你上来，如何？”<p class='chapter_content_read_css'>  南宁不傻，自是看懂了他的眼中的让人讨厌的蔑视以及听懂了他话中的含义，想让她放弃南宫宁雪，别说门都没有就连窗户也没有！<p class='chapter_content_read_css'>  听到这话时南宫宁雪也是深深地看着玄衣男子，在他的记忆里，完全没有这样一号人物，而且，玄色是只有天子才可以穿着所用的颜色，就连身为太子的他也只能穿降一级的黑色，这个人，到底是何来历？他默默抓紧了握着剑柄的手，脚也慢慢探索着可以支撑自己的地方，他倒是有些希望南宁真的听他的话将他丢下去。<p class='chapter_content_read_css'>  回答玄衣男子的是，南宁倔强的看着他对着他虎口狠狠咬了下去，南宁口腔里瞬时溢满了鲜血的腥咸味道。<p class='chapter_content_read_css'>  玄衣男子脸色骤冷，眼神凌厉的射向南宁，“没想到你还是对他如此执迷不悟，我有心救你，你却……”<p class='chapter_content_read_css'>  南宁淡淡的斜视他一眼，微微张唇，血液从嘴角溢出，模模糊糊的一句话在她唇间散开。<p class='chapter_content_read_css'>  “No way……”<p class='chapter_content_read_css'>  南宁使出全身的力气挣开了他的手，她和南宫宁雪的身影骤然急坠而下，消失在玄衣男子视线中。<p class='chapter_content_read_css'>  他缓缓站起身，用左手在虎口处一拂，南宁留下的伤痕血迹立刻消失不见，淡淡的看着深不见底的峡谷，半晌，竟是发出了一声微不可闻的带着深深无奈的底叹。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “奇怪，南宁去哪儿了？”琴霜七正捧着一堆刚从街上买来的玩艺儿踏进南宁的房间，只见床褥凌乱，在衣架上挂的好好的狐毛披风也不见了踪影。<p class='chapter_content_read_css'>  她将东西一股脑儿放在桌子上，想去寻南宁，但旁的来去匆匆的人却引起了她的注意，她顺手捞了一个仆人打扮的男子来询问。<p class='chapter_content_read_css'>  那人见她衣着华贵也不敢怠慢，恭恭敬敬回答道：“风大小姐突然患了重病，急需百草医治，诸位公子们自是为了寻百草而忙碌着，姑娘若是无事，那小人便先下去了。”<p class='chapter_content_read_css'>  琴霜七微微颔首道了声谢，心想南宁莫不是也去寻什么百草了？但是，南宁身体刚好，去凑什么热闹啊？琴霜七摇摇头，脚往厨房的方向走去，应当是去找吃的了吧，毕竟已经这么多天没有好好吃过东西了。<p class='chapter_content_read_css'>  但往厨房一探头，还是没有人，琴霜七终于皱了眉头，手不自觉的附上心口，心里慢慢溢上不详的预感，转身，快步走向南宫宁雪的房间。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351963&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351963&&novelId=15670'">下一章</div>
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
