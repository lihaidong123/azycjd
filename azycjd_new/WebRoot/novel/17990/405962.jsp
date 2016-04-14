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
    <title>第二十二章【夺舍之争】</title>
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
	<script language="javascript">var novelId='17990';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405962&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405962&&novelId=17990";
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
					window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405962+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十二章【夺舍之争】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405962')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'">公子万劫不复之嫡女撩人</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:苏易尘</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405962 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405962,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第24章&nbsp;&nbsp;&nbsp;第二十二章【夺舍之争】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 唐妈妈训斥完了之后急忙快步上前追上了张氏的身影，暗暗啐了一声，“狗仗人势的奴才！”却从未想过她的做派与门口那两个婆子神一般的同步了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “注意身份！”张氏目视前方，却以极低的声音对着唐妈妈说了句，声音虽然严厉，但面色却丝毫不显。唐妈妈的心颤了一下急忙垂首称是，一时间忘记了现在不是夫人当家那会可以只手遮天了，这种话要是传到了老爷的耳朵里，那样定会给夫人面上抹黑的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “墨芽阁”中人手本身就少，除了门口当值的那两个婆子，这一路走来竟然没有碰到其他人。对于这里的路张氏自然是熟悉万分的，当初就是因为这里比较偏僻，里面布置简陋，才将邵依依扔到这个院子的。你问，邵渊戎怎么会同意，那自然是因为邵依依不小心受了惊，张氏请了德高望重的云游大师为邵依依披挂算命了，她的年纪小，八字轻，自然是不能住在府中热闹的中心地段，找个偏僻点的地方方能保她一世平安。您又问，得道高僧为什么会这般讲，那自然是张氏找人假扮的云游高人，邵依依幼时受惊一事，也自然是张氏策划的了！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “给夫人请安！”张氏带着人来到了“墨芽阁”堂屋门口，门外是之前厨房当差的涟漪与买来的浣纱二人当差，二人急忙屈膝对着张氏行礼。邵依依与邵渊戎此刻就在堂屋内的厅堂用着晚餐，身边是灯影画影二人伺候着。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “无需多礼！”张氏轻轻一挥手就走了进去，涟漪挡住了准备阻挡张氏脚步的浣纱。浣纱新来的，自然不太明白张氏与她们二小姐之间的弥漫战火，但是涟漪一清二楚，再说她们刚刚请安的声音足够大，小姐她一定可以听到的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 二人默默的后退两步将地方让了出来，方便张氏进入。其实，在听到涟漪问安声音的时候，邵依依就看了邵渊戎一眼，发现对方没有任何表示，她也乐的不理睬她们。邵依依的余光看到张氏的身影，嘴角挑起一抹笑容，只是笑意不达眼底。邵依依认为张氏应该很早就会来的，没想到她这一忍就是半个多月。但张氏既然来到了这里，说明她已经完全恢复了斗志，邵依依心中暗想，自己还要多加提防她才是。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “妾身给老爷请安！”张氏完全无视邵依依自己径直走到邵渊戎的身边，垂首请安，声音柔的几乎能够滴出水来，再配上那一副略显憔悴的妆容，邵依依心想，是个男人都会起了怜香惜玉的心思吧。果不其然，这样的张氏在邵渊戎抬首的一瞬间就将对方吓了一跳，“夫人这是怎么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 这么久以来，邵渊戎几乎每日回府都会陪着邵依依用餐，而后直接回了外院的书房办公就寝。细想下来，这半个月竟然未见张氏一面，却没想到她却憔悴至此。看着张氏柔弱的样子，邵渊戎心中坚持的那一道坎似乎松了，他自起身将张氏扶了起来，“夫人坐下一道用些吧！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏顺着邵渊戎的动作起身，而后坐在了邵渊戎身边的座位上，在邵渊戎不注意的时候，张氏朝邵依依的方向看了一眼，只是那眼神中的挑衅显而易见。邵依依暗笑一声，像是没有发现对方的挑衅一般，起身对着她微微一礼，“给夫人请安！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “依依不必多礼！”张氏语气温柔，但是眼神中的恶毒却是毫不掩饰，她就不相信一个孩子她能有多深的城府，面对自己的几番挑衅能够无动于衷。她今日就要揭开她伪善的面孔，让邵渊戎看看对方的真面目！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依完全没有理会对方径自坐了下来，细细品尝着厨娘做的凉拌三丝，味道有点酸酸的，很适合在炎热的夏日食用。张氏见没有达到目的，也看似歇了心思服侍邵渊戎用餐。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 晚餐时间就在这平静而诡异的气氛中结束了，邵依依冷冷看着扶着邵渊戎离开的张氏的背影。就在此时，唐妈妈竟然回过头来，冲着邵依依笑了笑，那笑容中有说不出的诡异，但对于活第二世的邵依依来讲，从唐妈妈的笑容中看出其中的意思并不难。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 看懂唐妈妈那笑容含义的邵依依这次是真的笑了，她完全没有想到唐妈妈会如此幼稚，思维竟然能神扩散到如此地步。不就是张氏可以在邵渊戎的耳边吹吹枕边风，但作为女儿的自己却是不能如此做。自古枕边风都是异常好用的，很多耳根子软的男人不就是这般被美貌的妾氏所蛊，从而与原配与嫡出子女越来越远。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小姐，”亦趋亦步跟在邵依依身后的灯影自然也看到了唐妈妈那个笑容，只是她的年岁毕竟还小，只能看出唐妈妈的笑容不怀好意，忧心忡忡的唤了邵依依一下，“唐妈妈她……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “无事！”邵依依将右手举起挡住了灯影还未说完的话，轻笑了一声。要说演技，邵依依觉得还是自己那个渣夫特棒，可以面不改色的给自己喂下毒药，当初她被毒死之后并不是直接附在了原主的身上，而是魂魄离体后还在现代的那个家呆了两天，看着渣夫将自己的尸体做成了标本收藏起来，而后还看到了那个贱人与渣夫在自己亲自挑选的那张床上毫无羞耻之心的做起了亲密的事。但是说到心机，还属这古代生活在后院中的女人最为厉害，即便张氏那些不入流的手段自己若不是多活了一世，都有可能忍不住的出言相击。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “可是……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “不用说了。”邵依依再次打断了灯影的话，灯影未说完的意思她知道，无非就是要多加提防对方，怕对方再给她下黑手。说实话，这些邵依依都不怕，凭借前世顶尖的身手，虽然目前这个身子还较弱，但经过这么久以来的锻炼，加上邵轻扬上任之前留下的拳谱与剑谱，邵依依觉得已经比这里一般只练拳脚功夫的男子要厉害很多。但如果对方请出高手的话，邵依依只能淡笑一番，她可不是逆来顺受之辈。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “好了，别愁眉苦脸的了！”邵依依转过身便看到灯影皱成一团的小脸，想她前世即将奔四的年纪，因为职业关系一直没有要小孩，灯影的年纪在前世的话都可以做自己女儿的。或许是换了个年轻的身体，邵依依觉得自己的心态也变年轻了好多。看着灯影的模样她忍不住的安慰了一句，直到灯影忍不住的笑出声来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依看着院中郁郁葱葱的芙蓉树，思绪竟然飘回到了很久之前，其实她已经好久没有想过前世的事情了，前世的自己四岁就被拐卖，就在他们准备弄瞎自己双眼准备让自己出去乞讨的时候，遇到了杀手集团当时的金牌杀手，或许是自己倔强的双眼入了他的眼吧，他竟然从人贩子手中抢走了自己，然后自己便经过了好长一段时间的地狱式训练，直到最后在一百个与自己同龄的人当中成了活下来的十分之一，再后来，自己就成了一名杀手，最后的最后也跟上了那人的脚步，成了金牌杀手之一。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 如果自己当初没有被拐卖，或许自己就有另一番幸福的生活，或许灯影脸上那不含任何负面情绪只有开心的笑也会出现在自己的脸上吧。邵依依垂下眼帘，现在想这些还有什么意义呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;前面早已看不到邵渊戎一行人的身影了，邵依依转身准备进入闺房休息一番，但就在此时，一种陌生的情绪涌上心头，心也在瞬间疼的让她弯下了腰。捂住心口，邵依依的眼中露出挣扎的神色，一旁的灯影喊了画影一声就过来想要扶起邵依依，邵依依伸出手阻止了一下，灯影焦急的站在一旁看着她，她甚至能够看到邵依依额上流下来的汗珠，灯影不时的抬头看向里间，终于看到画影快速奔出的身影，她焦急的喊了声，“画影！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 灯影觉得时间已经过去了很久，但是画影从里间跑出来只是瞬间的功夫，在她紧张的情况下，她无限扩大了自己的恐惧心理。两人都焦急的看着紧缩眉头手捂胸口的邵依依。突然之间，画影双瞳含着恐惧大喊了一声，“涟漪”，在外面厨房的用餐的涟漪急忙放下手中的碗筷快速朝着堂屋跑了过来，而后被入眼的一幕吓了一跳，但很快就回过神来跑到画影跟前，“画影姐姐，小姐她怎么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “快，涟漪快去找老爷，请大夫！”画影慌忙喊了一声，就看到邵依依倒在了地上，就在倒下去的时候她还在阻止着众人近她的身。毕竟，她是一位杀手，在感觉到性命攸关的时候，是谁也不会相信的，所以她选择阻止她们近身。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 得到指示的涟漪慌忙朝外跑去，她知道这会老爷一定被张氏哄骗去了“怡玥阁”，所以出了院门之后她直接朝着府中的中间地段跑去，老爷，老爷他一定在那里！<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405962&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405962&&novelId=17990'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')"/>
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
