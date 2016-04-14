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
    <title>第六章【靠山回府？】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405225&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405225&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405225+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六章【靠山回府？】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405225')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405225 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405225,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第6章&nbsp;&nbsp;&nbsp;第六章【靠山回府？】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 而邵渊戎这一做便是十几年，从一开始的入不敷出需要倒贴娘子嫁妆到现在的留有余钱，邵渊戎每年都会将这个账策贴在整个扬州城最繁华的地方。大到每个商铺的捐款数额，小到每个受到这笔资助的每个病人的药方上每味药材的价格，事无巨细都写得清清楚楚，而且每一项花费都能够找到直接的人证，来证明这告示之上所言非虚。即便后来留有的余钱数目，还有这攒下来的余钱的去向，不管是建桥修路，还是修建大坝也都交待的一清二楚。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 也就是这样，邵渊戎才赢得了整个扬州城乃至他管辖区内所有百姓的爱戴，也将扬州城治理成一个路不拾遗，夜不闭户的城市，再加上风调雨顺，整个扬州便有了“鱼米之乡”的美誉，也是从那时候起，邵渊戎才明白了圣上“贬”他来此的重要原因。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 好像跑题跑得有些偏了，接下来我们言归正转。望闻问切，沈漠霖刚刚只是望了邵依依一眼便得出了以上结论，由于病人还处在昏迷中，沈大夫直接将食指与中指放在了邵依依的皓腕之上，凝神把起了脉，邵渊戎虽然担心女儿的身体状况，但还是只能压下自己满心的焦急静静等候结果。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 因为邵渊戎全部注意力都放在沈大夫处的缘故，所以他未曾发现想要开口讲话的邵卿卿被张氏拧了一下之后便满含委屈的看着他的模样，也正因为如此，邵卿卿又将恨意全部转嫁到了邵依依头上。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在邵依依昏倒被医治的这个过程中，一辆外表看着普通实则内有乾坤的马车缓缓的驶入了扬州城的大门，只见那赶马的车夫都不似寻常人家，更何况那马车后面八位骑马的穿着劲装的黑衣男子，这些人一看就是练家子，这么多的武人一气儿涌进这文雅之士的扬州城引起了城中百姓的驻足围观。百姓虽在围观，却丝毫未引起交通堵塞，可见这里百姓的素质还是极高的。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “公子，我们已经入了扬州城了！”赶马的车夫虽然恭敬的对着马车内说话，但却仍旧不缓不慢的赶着马车。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “既然入城了，那在下就告辞了，”车夫虽然没有听到自家公子说话，但却听到另外一位公子稍显低沉的声音，“多谢轩辕兄这一路以来的照顾，我们有缘再见！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “邵兄不必多言，”这下是自家公子那温润如玉的声音，但仍旧不是对着他这个车夫说的，没有得到具体的指令，车夫依旧稳稳当当的赶着马车，“相逢必是有缘，况且你我一见如故，帮你只是举手之劳而已，再者说了，我与安兄也是旧友，邵兄不必客气！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “就此别过，我们后会有期！”紧接着那位邵兄这句的便是自家公子的，“停车！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “吁……”车夫将马车稳稳的停了下来，而后自己从马车后面的架子上取过脚凳放好，紧接着就看到马车上那暗色的无任何装饰的帘子被一只骨节分明的大掌掀开，他甚至能够看到大掌虎口处的茧子，以他习武多年的经验来看，此人定是个用剑高手。只是还未待他分析完毕，一个穿着月白色直衫的男子便从马车内钻了出来，衣摆上绣着的腊梅一看都是出自温婉的女子之手，只见他轻轻一跃便落到了地上，根本就没有用到他搬过来的脚凳。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “轩辕兄，后会有期！”只见长身玉立的男子对着马车内的人抱拳相对，白玉的发冠在阳光的照射下闪过一道光华，一看便知此玉质地非凡。车夫收回了自己的目光，而后便看到帘子再度被掀开，这次是一只稍显纤细修长的手指，就连手背都十分光滑，一看都知道是十分注重保养的，只听见手的主人也轻轻的说了四个字：“后会有期！”而后便放下了帘子示意马车可以继续行驶了。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 从马车上下来的邵姓男子，自然就是去岁上京赶考的邵轻扬，也就是扬州知府家的嫡长公子，邵依依一母同胞的亲哥哥。此次他能顺利回扬州，多亏了刚刚那位轩辕祁公子，轩辕家虽然世代经商，但却在整个金陵却有着非同一般的地位，他们家乃是今上亲口御赐的皇商之家，而他本人更是因为敏锐的商业头脑与被陛下所欣赏的满腹才学再加上俊逸的相貌，被称为“金陵四公子”，而且还高居首位。就连自己的表弟安胜宇都屈居于他之下成了第二位，而第三位则是贵妃母家郑国公府中的三公子郑瑾言，最末位的是轩辕家的二公子，也就是轩辕祁的胞弟轩辕澈。皇家之人因为身份，自然是不会出现在此等排名之中的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 摇了摇头，邵轻扬放下脑中那些思绪，赶紧回家才是正经。看着熟悉却有些陌生的邵府大门，还未等邵轻扬发出一丝终于归家的感慨，门房便直接小跑过来对着他行礼，“大少爷，您终于回来了！”于是，邵轻扬便被一堆人簇拥着往府内走去，“不用通报，我自去书房找父亲大人！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “回大少爷，”门房上的灰衣小厮有些躲躲闪闪的向邵轻扬讲述了老爷在二小姐所居住的“墨崖阁”的事情，末了还说了一句，“邵管家已经带着沈大夫过去了！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “什么？”邵轻扬的这一句似询问又是自问，他不在的这些日子他唯一的妹妹又出了什么事？他怎么对得起他故去的母亲。一瞬间，百种滋味涌上心头，千种念头闪过脑海，但他自己却是急步朝着“墨崖阁”走去。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 本来陪他一起的门房小厮到最后只能看到一抹月白的身影，无奈的摇了摇头只得转身回了门房上继续当差。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “二小姐的身子极度虚弱，这明显是因为营养不良造成的，”沈老大夫捋了捋花白的胡子，“再加上落水之后没有好好调理，还落下了体寒的病根，这若是不好好调养，以后于子嗣之上会非常艰难！”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405225&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405225&&novelId=17990'">下一章</div>
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
