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
    <title>第二十一章【咸鱼翻身？】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405961&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405961&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405961+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十一章【咸鱼翻身？】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405961')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405961 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405961,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第23章&nbsp;&nbsp;&nbsp;第二十一章【咸鱼翻身？】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 就在这时出去处理雪莹一事的唐妈妈却是掀开已经换成雨过天青色的门帘，进来先朝着张氏福了福身，而后才回答道，“夫人放心，一切都安排妥当了！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “那就好！”张氏点了点头，接过唐妈妈递过来的白色锦帕擦了擦眼泪，而后抬首，又是那一副温柔慈母模样，心疼出声，“妈妈去请个大夫入府吧，卿儿的伤耽误不得！”张氏将邵卿卿扶了起来，而后将她安顿在自己床上，自己坐在一边静静等着大夫的到来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 天色渐渐的暗了下来，轩辕澈来到轩辕祈的书房外，他本想吓轩辕祈一跳，但却忘记了轩辕祈的武功修为比他好了太多。轩辕澈学的主要是以保命为上的轻功绝学，轩辕祈虽然轻功不如他好，但听力却比他好上太多，这个是由于天赋的关系，并不是后期修炼就能够达到的，“进来吧！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 既然已被大哥识破自己的“诡计”，于是轩辕澈就谄笑了一声走了进来，刚好看到自己大哥正在作画，画的是一副美人图，而那美人却是与他有过一面之缘的邵家小姐。轩辕澈只是轻轻的扫了一眼，装作没认出此人，只是往旁边的椅子上坐了下去，声音中透着一股子道不明的意味，“大哥，你什么时候回盛京？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “该回去的时候自然就会回去了！”轩辕祈看也不看他的开口说着。而后轩辕祈只是放下他手中作画的笔，抬首斜视了轩辕澈一眼，他这个弟弟平日生意上倒是挺稳重的一个人，但是不做正经事的时候又是一副唯恐天下不乱的样子。听到轩辕祈的话，轩辕澈很不雅的翻了个白眼看了看书房顶上绘着五彩图案的承尘，“那大哥可否告诉小弟，什么时候才是该回去的时候？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “多嘴！”轩辕祈轻轻的斥了一声，但轩辕澈却从自家兄长的语气中听出了些许的不好意思，捂嘴偷笑一声，眼带揶揄的看着轩辕祈。其实，他也不知道那个邵家小姐有什么好的，跟在她兄长身后跟个鹌鹑一样，长的又不漂亮，真不知道兄长看上她什么了？好像今日还真的登门拜访了呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕祈自想与邵依依多接触几次，即便不能见面，也好在未来岳父与舅兄面前刷刷好感值，奈何他的父亲没给他这么多的机会，一封家信就就将他召回了盛京。事情之急与轩辕澈缠得之紧让他根本没有时间去与邵轻扬道别，更何谈与邵依依培养感情。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 时间一晃半个月过去了，天气也越发的炎热起来，邵依依整日整日躺在堂屋的阴凉处翻看手中的账本，而在这段时间邵轻扬也接到外派的圣旨，居然去了东南面的福州任抚台。按理来说探花是不会授予从四品这般高的职位的，很多都是在京都翰林院任编修，或者给个六品官的空缺外放，但从来没有这种情况。但帝王旨意任何人不得置喙。邵轻扬只得先北上谢恩，然后前往福州。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依对目前的生活很满意，看着手中账本上一直蹭蹭蹭的往上涨的数字，她的嘴角挑起了一抹满意的笑。生活中也没有邵卿卿时不时的找茬，毕竟她还在禁足中，但不知为何，就连张氏最近也偃旗息鼓了，基本没有在踏足过她的院子。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 日头西斜，邵依依从贵妃塌上起身走到堂屋门口，看着院中被凉爽树荫覆盖的院落，满意的眯了眯眼。院中除了上次买来的那四个婢女，还有其他几个负责洒扫的小丫头与两个稍微上了年纪的妈妈。大家都忙忙碌碌的为着等会的晚餐准备，因为这么久以来，邵渊戎只要有时间就会来陪邵依依用餐。这样的做法导致了除了张氏带来的陪嫁之外，所有人都对邵依依恭谨有加，不敢怠慢了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 果不其然，邵渊戎在邵依依的注视下慢慢的跨进了院门，看到邵依依伫立堂屋门口望向外面的模样，邵渊戎的心不自然的收缩了一下，好似又看到了已逝的妻子在焦急等待自己的模样。但是妻子喜欢的穿的是暖色的衣裙，女儿她或许是因为一直都缺乏安全感的缘故吧，病愈之后喜欢上了冷色系的裙衫。儿子还未上任之时，她还穿鹅黄之类的颜色，但现在，邵渊戎看着一身冰蓝色儒裙的邵依依，快步走到她的面前，摸了摸她的头，“怎的不在屋内等？”语气是前所未有的温柔。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依不管怎么说都是一个成年人，一个冷酷惯了的人，要不是她前世太过冷酷无情，她的丈夫也不至于为了跟别人在一起而对她暗下杀手。要说邵依依心中若是没有那个渣男的话又怎会与他结婚，只是她内敛惯了，也不习惯表达，以致于让那男人认为自己从未走到过邵依依的内心，后来才会被另一个人趁虚而入。搁到一般人，觉得不合适直接离婚就是，但渣男内心对邵依依有种执着的占有欲，虽然他觉得对方不爱他，虽然他出轨有外遇，但却不愿意对她放手，最后用了如此极端的方法将邵依依的尸体保存起来，她就还是他的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 对于邵渊戎如此的温柔，邵依依一开始还是有些不习惯的，但经过这么长时间的适应，她还是能够招架得住的。虽然今日较以往更加温柔，但邵依依想想，自己前世不就是最渴望这般的亲情吗？虽然她一直以冷酷示人，但不代表她的内心不渴望温情。既然如此，她为何不去享受这样的亲情。想到此处，邵依依便轻移莲步上前，对着邵渊戎微微一笑，“父亲，女儿给父亲请安！”说完，盈盈一礼拜了下去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 虽然在古代礼法待女子较为严苛，但在自己家中，邵渊戎从来不管那些，再者说了，有没有外人在场怕些什么，再加上他出身江湖世家后又投身行伍，对那些规矩更是嗤之以鼻。待父女二人坐定，便有院中下人将邵依依准备的饭菜一一呈了上来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “夫人，老爷又去了‘墨芽阁’，这可如何是好？”唐妈妈拂退房内众人，走上前，站在张氏身边，垂首在她的耳边轻声道。自从这次邵渊戎外出回来，就对她们夫人不似以前那般好了，这完全怪“墨芽阁”那个小贱人，要不是她老爷能这般对待夫人吗？唐妈妈越想越生气，“老爷这半个月都未曾踏足‘怡玥阁’了，夫人您快想想办法吧！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “妈妈说的哪里话，”张氏端起桌上放置的汝窑莲花茶杯轻轻的喝了一口，双眸是前所未有的凌厉，但语气却是异常温柔，“老爷是一家之主，我能有什么办法呢。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “夫人怎可如此心灰意冷，您还要想想三小姐，她已经整整半个月未踏出房门一步了，她何曾受过如此委屈？小姐您也未曾如此委屈过啊！”唐妈妈一时换了张氏小姐，她不想她的主子就此沉寂下去。再说了，她的主子也不是如此软弱之人，既然当初能够嫁给邵渊戎，能够神不知鬼不觉的除掉了安氏，那么她也一定可以重夺邵渊戎的心，将邵依依彻底的置于死地！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “妈妈说的是，”张氏起身，看了一眼“墨芽阁”的方向，阴狠布上了她的面容，让本身长相温柔的她蒙上了一层薄雾，让她整个人看起来可怕极了，声音也不似刚刚那般温柔，“不为自己想想，也要为卿卿着想啊，那个贱人就与她那个贱人娘一样，哼！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小姐能如此想就最好了！”唐妈妈看着这样的夫人露出了一丝恍惚，这样的表情有多久没有出现在自己小姐的脸上了，想来她现在应该是想通了，不会在如此沉寂了吧。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏起身走到自己梳妆的地方，看着铜镜中有些憔悴的自己，嘴角露出一抹残忍的笑。既然如此，邵依依你就没有存在的必要了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏重整旗鼓，坐在铜镜前让唐妈妈帮她挽了一个堕马髻，上面只用了一个绞银的簪子，带了一对红翡翠滴珠耳环，但是衬得她更加的苍白，但却奇异的夺人眼眸。张氏双目低垂，露出一抹脆弱之姿，所谓伊人憔悴至厮，让唐妈妈一瞬间都心软了，更何况男人，尤其是共同生活了十多年的邵渊戎。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “去‘墨芽阁’，哼！”张氏面含冷笑，带了唐妈妈与锦玥环绣跨出了院门，虽然现在已经酉时末了，但西斜的日头还是那般刺眼，张氏将手中月白的绣着青莲的锦帕举了起来，眼睛瞬间好受了许多。垂首看了看身上象牙白绣着莲花纹的长裙，张氏嘴角露出一抹势在必得的笑容。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “奴婢给夫人请安！”走到“墨芽阁”院外的时候，守着院子的两个婆子急急弯腰垂首给张氏行礼。张氏微微颔首点了点头，径直朝里走去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “好好当差就是，其他的不要多管！”走在张氏身后的唐妈妈朝着那两个婆子面色不善的道。原来，那两个婆子见张氏直接朝里走去，本想伸手拦上一拦，想要向内通报一声，但唐妈妈直接阻止了她们，并且声音是一惯的默然。两个婆子瞬间萎了，不管二小姐如何得老爷宠爱，但毕竟是女儿，是女儿就有出嫁的一天。说到底，这个家还是张氏这个名正言顺的夫人当家的。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405961&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405961&&novelId=17990'">下一章</div>
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
