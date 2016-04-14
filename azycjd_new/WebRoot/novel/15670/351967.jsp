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
    <title>（五十）崖底放晴百草现 暧昧丛生惹尴尬</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351967&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351967&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351967+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（五十）崖底放晴百草现 暧昧丛生惹尴尬]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351967')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351967 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351967,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第55章&nbsp;&nbsp;&nbsp;（五十）崖底放晴百草现 暧昧丛生惹尴尬
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			乌云终是渐渐散开，第一缕阳光开始射入崖底，数只鸟儿抖抖有些湿润的翅膀，从高枝滑翔而下，就在快要撞到地面之时又猛然向上冲去，发出了几天来的第一声鸣叫，无比欢畅。<p class='chapter_content_read_css'>墨绿的枝叶还是被重重重水压得向下弯曲，最后又向上弹起，雨滴直接射在不远处正藏着粮食的松鼠身上，弄得小东西是一阵呲牙咧嘴，狠狠捋着湿漉漉的毛发。突然被吓了一跳窜进了树洞里。<p class='chapter_content_read_css'>小东西又好奇的向外探着头，两只圆溜溜的大眼睛直勾勾的盯着从自己身旁经过的庞大生物。<p class='chapter_content_read_css'>南宁乖乖的趴在南宫宁雪背上，两只眼睛滴溜溜的看着周围的景物，恰好与那小东西对视了一下，小东西被她一看吓得一抖正坐在了树枝凹处的水坑里，一脸懊恼。<p class='chapter_content_read_css'>南宁捂嘴嘿嘿笑了一下。<p class='chapter_content_read_css'>“怎么了？秦姑娘？”南宫宁雪顿了步子微微侧头。<p class='chapter_content_read_css'>  “没什么，没什么。”南宁慌忙摇头，又静静地趴回他背上，只是胳膊又使劲搂了搂他的脖子。<p class='chapter_content_read_css'>  两人在萧寂的林子里走了整整一个时辰，但发现却是在原地转了一个大圈，南宁再次瞧见了树上的小东西，南宫宁雪向上抬了抬南宁的腿，南宁抿了抿唇。<p class='chapter_content_read_css'>  “南宫公子，你可否还找得到我们落进的那条河？若是寻着水源便可能出去了。”<p class='chapter_content_read_css'>  南宫宁雪摇了摇头，他自是知晓要寻那水源，他明明记得山洞本身就离那河流不足一里，可是，现在哪里有什么溪流水源？不过是漫山遍野的树木罢了。莫不是有人使了什么障眼法？<p class='chapter_content_read_css'>  南宫宁雪闭上眼，闭四感，唯留听觉寻着流水的声音。<p class='chapter_content_read_css'>  南宁见他不再动弹，也下意识的将呼吸放轻，只是一会儿还好，慢慢又觉得有些窒气儿，终于快要憋不住的时候他忽然睁开了双眼，面露喜色。<p class='chapter_content_read_css'>  “秦姑娘，在下寻着水源了。” <p class='chapter_content_read_css'>  南宁猛地深吸一口气，笑道：“那我们就快些去吧，我可是在这崖底待够了啊！”<p class='chapter_content_read_css'>  “好。”南宫宁雪紧紧胳膊大步向听到的水源的方向走去。<p class='chapter_content_read_css'>  走了小一会儿就听到了湍急的水声，但任凭二人再瞪大眼睛也瞧不见半丝水的影子，又哪来的河呢？<p class='chapter_content_read_css'>  “果然是有人施了障眼法。”南宫宁雪微微一撇眉头，向四周望了望，“秦姑娘，你且在旁边等一下吧。”<p class='chapter_content_read_css'>  南宁应了声，他用袖摆一拂不远处的大石头，慢慢弯下腰让她坐在上面。<p class='chapter_content_read_css'>  紧接着他便对着水流的方向施法，双眼半闭，嘴唇一张一合轻灵的咒文便回荡在这崖底，手指也在灵活的操动着。一股气流忽然围绕在他周围，有水滴慢慢聚集在那气流之中，随那气流一起旋舞。水滴折射出曼妙的五彩光芒将他整个人包围住，他双眉一敛，水滴及气流便化作了万支利箭射向前方。<p class='chapter_content_read_css'>  利箭便那样硬生生地停住了，颤抖着发出低低的嗡鸣声，密密麻麻的布在一起又像是一道极为壮观的水墙。南宁抬脸看着，眼睛不可思议的瞪大，嘴里似乎溢出了惊呼声。<p class='chapter_content_read_css'>  南宫宁雪额间滑下了细细的冷汗，睁开了双眸，漆黑的眼瞳愈发深渊，嘴唇重重一合，手腕也随之一动。巨大的断裂声冲击着耳膜，南宁忍不住地捂住了双耳，下意识地蜷缩身体，双眼只悄悄打开一条缝瞧向南宫宁雪。<p class='chapter_content_read_css'>  “轰隆隆！”<p class='chapter_content_read_css'>最后一声巨响直震得地面都晃动了一下，南宁迅速攀住了石头幸免了摔下来的惨剧。紧接着是瓷器破裂的清脆声音，无数光点肆意纷飞，淡淡的水雾映出了一道弯弯的彩虹，而彩虹下……南宁呆呆的看着紫色衣袍的俊俏公子。<p class='chapter_content_read_css'>南宫宁雪侧过头来，对着南宁温文一笑，墨色的眸子里都溢出了星光。<p class='chapter_content_read_css'>“秦姑娘。”<p class='chapter_content_read_css'>  南宁发誓那是她见到过的最美的彩虹，虽然这是她第一次见到现实中的彩虹，她也不知道虽然她极力否认，却还是在心里将这一幕偷偷藏了起来。<p class='chapter_content_read_css'>  当然，如果忽略接下发生的事的话，南宁想，这三天果然是最好的三天了。<p class='chapter_content_read_css'>  南宁还未来得及张嘴说些什么，南宫宁雪就一眨眼找不到人了，南宁低头想要扶额，这一低头还没来得及扶额，却吓得南宁心肝直颤，她只想爆声粗口，南宫宁雪怎么就这么准的把她放在河中间的石头上了！！<p class='chapter_content_read_css'>  看着四周湍急的流水，南宁只觉得头晕目眩，整个人都轻飘飘的，两条腿都在止不住的打颤，上身猛的一沉就向后倒去，一只胳膊紧紧搂住了她，南宁费力地想睁开双眼，却只是瞧着南宫宁雪的身影渐渐模糊，渐渐没入黑暗之中。<p class='chapter_content_read_css'>  无尽的黑暗也将她吞噬，耳边急切的呼唤也无法将她救出。<p class='chapter_content_read_css'>  南宫宁雪将南宁背到了身上，他一步步踏出湍急冷冽的河水，平静的外表下揣着的是惴惴不安的心。<p class='chapter_content_read_css'>  他没想到，只是一瞬而已。<p class='chapter_content_read_css'>他从她眼前消失是因为看见了河岸边上的百草，他此行的目的也大抵是寻找百草，所以才那么急切的跑走了，再等他看向南宁时，却是南宁摇摇欲坠的身影。<p class='chapter_content_read_css'>  慌乱之中虽是搂住了她，但她又陷入了昏迷，任凭他再怎么呼唤也无以醒来。好像这种情况发生过好多次了，他的心里就像揣了数只兔子，整个人也都混乱起来，恐惧就蔓延他的身心，他是不是得了病了呢？师父教于他各种病症与治疗方法，可是却从未提及这种病，那么，他又该怎么治啊？<p class='chapter_content_read_css'>  他是不是，无药可救了？	<p class='chapter_content_read_css'>  可是……当他看着她跟自己有说有笑的时候，尤其是依赖自己的时候，心里又是溢满了欣喜，莫非是师弟们曾经提及的身为男子的……什么来着？到时一定要揪着师弟好好问问——不对！现在重点是，要赶快出了这山崖，秦姑娘……<p class='chapter_content_read_css'>  “你们在做什么！”<p class='chapter_content_read_css'>  “秦姑娘？！”南宫宁雪猛的听见南宁的声音，是又喜又惊。喜的是自己的一颗心砰然而落，惊的是南宁语气里是藏不住的怒意以及——杀意。<p class='chapter_content_read_css'>他刚才只顾着想自己的事，完全没注意不远处的状况，再定睛看去却是尴尬的红了一张面皮。<p class='chapter_content_read_css'>一双衣衫凌乱的男女躺在地上，而且还是那女子趴在了那男子身上，依着南宫宁雪的角度只依稀瞧见那女子将头埋在了男子的肩膀处，刚刚好将那男子的面目遮了个严严实实。<p class='chapter_content_read_css'>男子忽的将女子一把甩开，女子摔在地上。让南宫宁雪更为尴尬的不是撞破这缠绵的一幕，而是，这男子竟是南宁的师兄——书绘音。<p class='chapter_content_read_css'>他深深感觉到了来自肩膀的彻骨的疼痛。<p class='chapter_content_read_css'>心也猛地一沉。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351967&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351967&&novelId=15670'">下一章</div>
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
