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
    <title>第十七章【那厮对妹妹不怀好意！】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405575&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405575&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405575+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十七章【那厮对妹妹不怀好意！】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405575')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405575 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405575,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第17章&nbsp;&nbsp;&nbsp;第十七章【那厮对妹妹不怀好意！】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; “谁说全都发卖出去的，”邵依依抬头看了张氏一眼，多选几个，不就将你的眼线选进来了，好不容易才将那一院子的奴才打发出去，而后似笑非笑的继续说着，“这四个，加上我院中留下的三个够了。依依在此谢过夫人关心！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>说来也怪，邵依依不管如何称呼张氏夫人，张氏在人前都能毫不生气的开口闭口“母亲”如何如何，这点真的很让邵依依佩服！看着邵依依挑好了丫头，邵渊戎训诫了几位丫头一番，无非就是上心小姐的衣食起居，院子中的洒扫工作都有专门的洒扫丫头打扫，不用她们多加费心。然后又转头对着张氏道，“‘墨崖阁’内尽快设立一个小厨房，这样依依用餐就较为方便了！”邵渊戎对于他刚回府那日发生的事情一直耿耿于怀，自己心爱的女儿怎么能用那么简陋的吃食，一点营养都没有，还怎么长身体。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“是！”张氏垂首应道。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“恭送父亲！”看着邵渊戎起身朝着院门走去，邵依依急忙屈膝行礼，或许是因为有张氏在侧，这次邵渊戎只是笑着点了点头直接去了外书房。张氏一看邵渊戎已走远，面上的笑容就淡了几分，应该是因为邵轻扬从未给过她好脸色，这会也不装的那般贤良淑德了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>张氏也不愿自讨没趣，带着一众下人又浩浩荡荡的离开了。虽然她一直掩饰的很好，但近身伺候她的锦玥还是看到张氏眼底的狠毒，看来，这个二小姐要遭殃了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>邵轻扬猛然想起昨日轩辕祈的一席话，又跟邵依依打了招呼离开了。邵轻扬直奔自己父亲的书房。在书房门外垂首朗声：“父亲可有空闲？儿子有事回禀！”邵渊戎的书房一般不允许下人入内，除了一直伺候在侧的顺伯，只是这会顺伯还有其他事情要办，书房门外只有一个小厮在守着，故而邵轻扬直接开口。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“进来吧！”里间传来邵渊戎的声音，邵轻扬便推开门直接入内。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“父亲！”邵轻扬垂首行礼，邵渊戎挥挥手示意他坐下说话。邵轻扬想了想还是觉得那件事提早禀告父亲的好，“父亲，儿子昨日陪着妹妹巡视娘亲留给她的嫁妆铺子，遇到了轩辕家的长公子。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“是在路上救了你的轩辕长公子？”邵渊戎若有所思的开口，他派人出去查探邵轻扬在路途遭遇暗杀一事，到现在是一点头绪也无，如若真是张氏派人所为，那张家可就不是一个扬州地方官那么简单了。看着邵轻扬点了点头，邵渊戎继续道，“找个时间请他过府一叙，为父要好好答谢于他！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“父亲，据儿子观察，”邵轻扬总觉得这些话由他之口说出来有些不太合适，但也不能步提前告知父亲，如若轩辕祈直接递帖子上门，到时候直接向父亲开口，那可就不太妙了。让张氏知道的话一定会借机生事，“轩辕长公子好似有些喜欢妹妹，他说不日会前来拜会？”邵轻扬说完之后，还小心翼翼的看了邵渊戎一眼，他带着妹妹与外男一同吃饭，虽然扬州不似盛京那般男女大防，但他们都毕竟是未婚男女，轩辕祈于妹妹来说，是名副其实的外男。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>此时，回到“怡玥阁”的张氏，将手中的帕子绞成一团，这个可恶的邵依依，里面添了那么多自己安排的人，她竟然一个也没挑中，还让卿卿被老爷训斥一顿，越发的不讨老爷欢心了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“夫人息怒！”唐妈妈伺候着张氏从小长大，自然看出了对方心情烦躁的样子，于是挥了挥手示意一众小丫头全都退下，自己走到张氏身后为她捏了捏肩膀，开口轻劝，“且看她一时得意，还能一世得意？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“话虽如此，”张氏揉了揉眉心，嘴角露出一丝狠厉的笑，精致的妆容衬得她更加的狰狞，“可是妈妈你瞧瞧，自打落水后，我这儿就没一件顺心的事情。先是安氏那个短命鬼的嫁妆全都到了那个贱人手中，如今，将我在‘墨崖阁’安排的一众人全都换掉了，你说她会不会知道了落水一事的真相？所以如今才处处防备？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“那件事完全是‘意外’，夫人您就放心吧！”唐妈妈说着说着就低下头俯在张氏的耳边轻声道，“那件事情是老奴亲自为之，任何人都瞧不出问题。再者说了，二小姐当初落水，身边可是一个我们的人都没有啊！想来也不会出什么岔子的！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“妈妈说的对，”张氏叹了口气，突然间又变得哀哀戚戚起来，“自打老爷这次回府，竟然都不来我这院子啊，这不是明晃晃的打我的脸么！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“夫人，老爷他或许只是公务太过繁忙而已，”主母房中之事，即便唐妈妈作为张氏的奶娘也是不便多言的，于是她只是含糊其辞，“兴许等忙过这阵子，老爷就回后院了。您看，最近老爷一直宿在前院，两位姨娘那里也未曾踏进半步呢！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>被那二人谈论的老爷邵渊戎此刻只是抬眼看了邵轻扬一眼，连话也未曾说出口，就叫邵轻扬觉得身上冷飕飕的，急忙垂首继续道，“儿子本想带着妹妹品尝‘绝味斋’的美食，妹妹她太瘦了，只是巧遇了轩辕公子，因着他是儿子的救命恩人，故而儿子只是礼貌性的邀请了一番！”谁知，他就直接同意了，邵轻扬也无奈极了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“算了。”邵渊戎摇了摇头，让邵轻扬先行退下。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“媛儿，”邵渊戎从抽屉中取出了一副画像，展开之后轻轻地抚摸画中人的面颊，声音温柔的能够滴出水来，“扬儿说，祈儿好似喜欢上了依依，你说，这是福是祸？”邵渊戎温柔的看着画中之人，虽然知道她不会回应自己，但他还是忍不住继续开口，“我很想你，非常想你，你为何不入我梦？你是不是恨我将依依交给张氏抚养？”邵渊戎长叹一口气，将眼中的泪水掩去，久久回不过神来。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405575&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405575&&novelId=17990'">下一章</div>
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
