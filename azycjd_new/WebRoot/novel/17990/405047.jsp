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
    <title>第一章【异世之行】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405047&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405047&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405047+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一章【异世之行】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405047')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405047 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405047,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第1章&nbsp;&nbsp;&nbsp;第一章【异世之行】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp;“吱呀”一声，穿着淡青色裙衫的丫鬟推开“墨崖阁”紧闭的院门，看着院中的景象，有些无奈的笑了笑才走到那一株芙蓉树下，看着树下湘妃竹椅上躺着的女子，女子穿着鹅黄色的裙衫，腰间挂了一只绣着腊梅的荷包，而衣袖却是大大咧咧的挽了起来，嫩白如藕的玉臂都露了出来。好在，这院子再无他人了，不然这样子的小姐叫人看了禀告夫人的话，好些便是配给那人为妻，最坏的便是要常伴清灯古佛了。所以丫鬟便急忙上前将她放在小腹上的手放平，然后将衣袖全都放了下来，或许是动作有些大了吧，也或许是躺着的人只是浅眠而已，只见她伸出纤纤玉指将盖着脸部的书籍取了下来，嘴里嘟囔了一声：“几时了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>她的声音有些绵软，透着一股子刚刚睡醒的慵懒，丫鬟抬头看了看头顶的日头，而后小心翼翼的回答道：“小姐，已经未时三刻了。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“哦！”说着，那个躺着的少女便睁开了双眼，只见双瞳湿润如波光潋滟划过，大大的眼睛闪着灵动的光，睁开眼的瞬间，原本清秀淡雅的面容就像渡了一层光一样闪着耀眼的光芒，仿佛这个小院都一改之前的死气沉沉。少女鹅蛋脸上的酒窝若隐若现，酒窝中间的樱桃小口轻轻的嘟了一下，高挺的鼻梁也皱了一下，然后伸手揉了揉肚子，好似有些饿了一般，然后便坐了起来，下半部分未束起的及腰墨发便撒了下来，发质丝滑如绸，眼角一斜，冷声道：“怎的还不摆饭？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“小姐，”丫鬟嘴角垮了下来，有些委屈的道，“大厨房说现在还没轮到我们‘墨芽阁’领菜，画影还在那里等着呢。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“哼，”邵依依冷哼一声，语气中充满了不屑，“不肖说，定是那知府大人的好夫人暗中吩咐的了。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“小姐，”丫鬟惊呼一声急忙捂住邵依依的粉嫩樱唇，害怕与不甘的表情充斥着年轻的面容，小心翼翼的环顾四周之后才继续开口，“小心隔墙有耳！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>邵依依垂下眼睑，现在想想当初自己来到这个世界，定然不会是偶然，定是那知府夫人与她那继妹搞得鬼。虽然所有人都告诉她，是她不小心踩在湖边的小石块上，小石块上面又长满了滑腻的青苔，于是她脚一滑便跌落下去，于是真正的邵依依就这样的魂归地府，而她便鸠占鹊巢了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“小姐，”邵依依刚刚转身，挽着的发髻上簪着的银簪上垂下来的一丝流苏与下面长长的头发在空中甩过一道优美的弧度，然后便听到了自己另一个丫鬟画影的声音，“奴婢回来了！”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<br /><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	画影的声音与灯影的一般都充满了委屈，邵依依转头便看到提了一个食盒的画影，嘴角露出一抹冷笑，自从自己一个月前来到这个世界，然后便一直待在这院中养病，每日三餐都是一些能淡出鸟来的东西，半丝肉腥都未沾得。一开始，是大厨房的老妈子前来送餐，说：夫人说了，二小姐生病期间不宜见荤，容易导致肠胃不适，消化不良，说了一大堆有的没的。当初她自己还在昏睡，两个丫头便低眉垂眼哭哭啼啼的将食盒收了，清醒之后看着那几样自己从来不食用的菜品，邵依依的嘴角抽了抽，只喝了一点粥剩下来的让两个丫头分食了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>直到自己病愈也未见到荤腥，更遑论其他补品，好在穿越过来的自己心理素质过强硬是挺了过来，但是也一直拖拉到前些日子才好了起来。实在是忍受不了，然后趁着夜色翻强出去，用自己身上仅有的银子买了几道肉菜拎了回来，自己叫了两个丫头同桌而食，想必她们以前也经常这般吧，所以那二人只是惊叹了一番菜品然后就坐了下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>邵依依现在都还记得当初这两个丫头那狼吞虎咽的模样，像是几辈子没吃过肉一样。还是吃完之后，稍大一些的灯影告诉邵依依，她们已经好久没吃过肉了，上次吃肉还是大少爷在的时候的事了。大少爷邵轻扬与邵依依乃是一母同胞的兄妹，只是去岁开始就去了盛京外祖安家等待今年的春试。大少爷还在的时候，张氏对待邵依依还不敢做的这么明显，大少爷一走邵依依的院子不仅见不到荤腥了，就连院子里的丫头也都开始偷懒到如今这院子里就只剩下了她们主仆三人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>两个丫头还告诉她，这院中上至管事妈妈下至粗使丫头都是这继夫人张氏的人，所以他们才敢如此怠慢她这知府家的嫡女。而邵依依的奶娘则是因为一直不愿归顺张氏而只是这“墨芽阁”的一个老妈子而已，而这个忠心护主的老妈子却在邵依依跌入后院池塘之后被现在的夫人寻了个“看护主子不利”的错处直接打死了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>自然，这些也都是这两个小丫鬟告诉邵依依的，这两个丫鬟是邵依依的母亲从娘家带来的陪嫁丫头所出，待邵依依的母亲去世后，她们两个的母亲也被那张氏害死了。再加上这两个丫头年纪小又没有什么根基倒是逃过一节就一直伺候着邵依依了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>邵依依收回思绪，看着两个小丫头打开食盒将里面的菜端出来，一盘青菜豆腐，一盘水煮的豆芽菜，还有一盘清炒土豆棍，再加上一碗米饭？里面加了很多料的米饭，邵依依的怒火在看到这些菜的时候彻底的爆发出来，这一个月的忍辱偷生让这些看盘下菜的狗奴才越发的怠慢起来。邵依依从灯影的手中抢过食盒，将桌子上的菜盘全都扔了进去。邵依依冷哼一声，这饭菜搁到一起怕是连这府里的奴才都不吃的吧，竟然拿来糊弄她这嫡出的小姐，且这里还是富庶的有着鱼米之乡的扬州。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'><br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405047&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405047&&novelId=17990'">下一章</div>
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
