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
    <title>（七十五）一魂一魄命相融 南宫终醒诉衷肠</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406176&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406176&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406176+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七十五）一魂一魄命相融 南宫终醒诉衷肠]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406176')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406176 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406176,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第80章&nbsp;&nbsp;&nbsp;（七十五）一魂一魄命相融 南宫终醒诉衷肠
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“此女为祸，有违天道。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你这妖怪，不要跟我们一起玩！快点离开！”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “嘿嘿，身为凡人，却拥有这么强大的灵力，不如，就先孝敬孝敬我们吧……”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “南宁姐姐，你为什么要害我！”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “阿南，你为什么没有好好照顾梦儿和雪，为什么？为什么你要害我晏家！”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “阿宁，你若不愿接受我，直说便是，何必要如此伤害我呢？我们还是永远不要见面了吧……”南宫宁雪惨白的脸猛然消失，南宁大叫一声，惊醒过来。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她粗喘着气，瞪了床顶半晌才回过神来，这看清原来自己躺着的床边还站着一个人，南宁张了张嘴，却一句话也没说出来。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “秦姑娘，你昏睡了已经七日了，先喝口水，再说话。”许连城见她醒来，大大松了一口气儿，赶忙倒了一杯温水。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁想要坐起来，却发现自己的双手一点知觉也没有，被裹成了两个大粽子，一想昏迷前的事，不禁苦笑。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 没想到，她还能保住这条小命。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “秦姑娘，我扶你起来。”许连城放下茶杯，将南宁扶着坐起来，又拿了一个靠枕给她靠着，再将茶杯递过去，见她没接，尴尬道，“对不起，秦姑娘，还是我喂你吧。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁微微张开嘴，喝了两口水，试着咳了两声，发觉差不多了，便问道：“南宫公子怎么样了？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城早就打听了南宁同南宫宁雪的事，心下黯然，但面上还是扬起一个笑容：“师父已经用玄天石控制住了大师兄的病症，应当是无事了，只是身体还虚弱，要等上几日方可醒来。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁松了一口气，面色也柔和起来，微微弯起了唇角，淡淡道：“那就好，只要他没事就好。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城将茶杯放回桌上，坐到床边凳子上，犹豫开口：“可是，秦姑娘你的手……”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁抬起胳膊晃了晃并没有知觉的手，笑道：“不就是一双手嘛，有什么大不了的，我可是欠了南宫公子好几条命了呢，值了。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城还未来得及露出失落的表情，君安就推门进来。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 君安对着许连城吩咐道：“十二，你先出去吧，为师有话要跟丫头讲。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “是，师父。”许连城顺从的退出去，留恋的看了南宁一眼，之后带上了门。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 君安捋着胡子坐在凳子上，细细的看着南宁。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 看的南宁心里有些发毛。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “君师父，我脸上有什么东西吗？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “没有，老夫有一件事想问你，你可要诚实的回答老夫。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “嗯。”南宁点点头。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “老夫想知道你的心意。”君安看见南宁不自然的一眨眼，继续道，“你对阿雪的心意，到底是如何的？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “我，我……也不知道……”南宁重重的垂下头，“我不知道是什么感情，我不知道什么是爱，我，我……我分不清楚，是对他的愧疚还是，别的。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “那你在听到阿雪成了风府的座上宾时，心里怎么想的？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “啊，就是，那个，啊，”南宁结巴了半天，噘嘴道，“生气，觉得他很讨厌。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 君安哈哈笑了两声，“你们两个人啊，真是，都吃的哪门子飞醋啊？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “什、什么飞醋啊？”南宁抬头不解地看着君安。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “几个月前，阿雪给老夫来了信，说什么这一段时间心绪不稳，莫名其妙的去讨厌一个人，心里默默诅咒人家，还对一个小姑娘有了什么非分之想，想让老夫给他瞧瞧，是不是入了魔障。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁在听到“什么非分之想”的时候，一下子红了脸，像是一只被丢进油锅的虾子，慌张不安。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “还有你这个小丫头，非要死鸭子嘴硬吗？”君安用手指点了点南宁的额头，弄得南宁是更不好意思。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “好了，老夫已经能够知道你的心意了，有件事就要告诉你，你可要做好心理准备。”君安忽然面色严肃，弄得南宁心里一慌。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 君安伏在南宁耳边慢慢说着，南宁慢慢瞪大眼睛，然后又沉默了一会儿，道：“我愿意，若是能够救他，就算舍了这一魂一魄又如何？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你可要晓得，做这魂锁可是会痛苦非常。”君安严肃的看着她。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁扬起一个笑容，认真的点点头，“放心，君师父，我，不会后悔的。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “那好，三日后子时，你一人到药房来，这几日老夫会为你配上几味减轻痛苦的药，你可要每日按时吃药。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁犹豫一下，还是点了点头，然后问道：“可不可以，不要那么苦？放点儿红糖可以吧？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 君安无奈一笑，“你这丫头，当真是怕苦，好，老夫给你多放些味甜的药材。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “谢谢君师父。”南宁灿烂一笑。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “王爷！王爷！书公子和七七姑娘回来了！”还是那个送信的小侍，慌慌张张的跑进正堂。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白面露喜色，腾地站起来，一不小心带倒了刚倒上滚烫茶水的茶杯，茶水湿了一衣袍。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 管家立刻上前为顾白擦拭水渍，顾白拉开管家道：“这点小事无碍，化叔，快些将他们请进来！”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “诺。”管家也是面露喜色，快步去迎书绘音琴霜七二人进来。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白一把拽住了书绘音，急切地问道：“南宁呢？她有没有跟你们在一起？她有没有出事？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 书绘音甩开他的手，手指在空中一舞，一封书信就落在了他手掌中，然后递给顾白，淡淡道：“这是南宁的信件，自己看。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白赶忙撕开了信封，拿出信纸赶忙看起来，南宁娟秀的字体映入眼帘。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	顾大哥：<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 对不起，让你担心了，我现在很好，和南宫公子一起住在君玄观里，只是南宫公子出了些事，我们暂时还不能回去，年前我们一定会回去的，请放心。等回去之后，我有件事，嗯，一件很重要很重要很重要的事要跟你说，如果七七回到了府里，请代我说声对不起，请她原谅。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 义妹，南宁。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 知道了南宁没事，顾白心中的一块石头终于落地，露出一丝微笑，但一想到南宁要说的那件非常重要的事，心里就有些不舒服。大概是他的错觉吧。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白看见七七很是反常的一直沉默不语还深深低着头，便道：“七七，南宁有些话想要我转告给你，她说‘对不起，请你原谅’，虽然我不知道你们之间发生了什么，但你们一直是好姐妹不是吗？所以，就不要再怪南宁了，好吗？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 琴霜七抬头揉揉眼，低声道：“该说对不起的是我才对。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁在阳光下仔细瞅瞅似乎有些畸形的手指，那天晚上做什么魂锁可真是疼死她了，不过魂锁做好之后，她的双手却奇迹般地恢复了知觉，当然是疼的要死啊，不过，君师父的药可真好用，才用了有一个星期吧，她就能提笔写字了，这个时候，顾大哥应该已经收到了她的信了吧。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁的双手像是被剥了好几层皮，红彤彤的，连血管都清晰可见，左手中指还有些微微弯曲。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁微微叹了一口气，喃喃自语：“不过能保全这双手就不错了，还能奢求什么呢？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 身后的房门忽然被打开，南宁一皱眉，缓缓向后看去。君师父和许公子都出去了，莫不是风……？<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁呆呆的站起来，一下子带倒了凳子，目不转睛的看着眼前的人，很快湿了眼眶，哽咽道：“阿雪，你、你哇啊啊啊啊啊——”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宫宁雪身形不稳的抱住扑在他怀里大哭的南宁，一时有些慌神，脚下有些虚浮，只能将大半边身子靠在门框上。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁是一次性紧紧抱着南宫宁雪哭了个够，哭的是上气不接下气，差点儿晕了过去。等彻底哭够了，才抬头对南宫宁雪道：“外面有风，先到屋里去。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宫宁雪被南宁扶到床上坐下，眼神一扫很是锐利的看到了南宁藏在袖子下面但不小心露出一点儿的手指，他立刻抓过她的手，没能让她躲开的掀开了袖子，他倒吸了一口冷气，“阿宁，你的手，是怎么回事？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁尴尬的挣脱开，把手藏回袖筒里，背在身后，小声道：“没什么啦，就是有点难看，还没有废掉啦。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 两人陷入了齐齐的沉默。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 最终，南宫宁雪率先开口，“阿——秦姑娘，你我二人……”他还没说完，就看到南宁眼眶里又溢满了泪水，立刻哽住。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁站在那里抽搭着哭泣，也不拿手去擦，就像个小孩子一样呆站在那里哭泣。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “我就知道，阿雪，呜呜呜，阿雪一定会嫌弃我，呜呜呜呜，我就知道，君师父骗人，哇啊啊，阿雪就是讨厌我了，早知道还不如剁了这两只手好了，省的阿雪嫌弃我了，哇啊啊啊——”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宫宁雪心里一抽，按耐住想要抱住南宁的冲动，强装镇定道：“秦姑娘这是在说什么话，在下并没有嫌弃秦姑娘，只是，我们二人既然再无可能，那么，还是保持些距离的好，以免污了姑娘的名声。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁的哭声戛然而止，瞪着两只红灯笼似的眼睛看着他，然后眼珠僵硬地动了一下，腾地倒在地上，没了动静。<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宫宁雪慌张地跪在地上抱起南宁，将她使劲揉在怀里，“阿宁，阿宁，你醒醒，对不起，我只是，我只是……”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你只是什么？”南宁突然一把搂住他的脖子，睁开眼认真的看着他的眼睛，笑道，“你只是什么？说！老实交代！”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宫宁雪扯起一个微笑，情不自禁的贴上了她的双唇，然后抱住她，哽咽道：“我只是害怕你先拒绝我。”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁紧紧环住他的脖颈，开心地笑道：“你就这么不相信我吗？”<span></span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'>t:12.0pt;mso-char-indent-count:<p class='chapter_content_read_css'>1.0'&gt;许连城霎时湿润了眼眶，“秦姑娘，你忍忍，我一定会想法子……”<p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“不，不用了，我什么情况，我自己知道，我，右手，袖子里，有一个，锦，袋，那里面有，有玄天石，去交给，给君师父……”南宁彻底瘫软在他怀里，昏迷不醒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“秦姑娘！”许连城惊呼一声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	一阵冷风忽然从身后刮来，观门应声而开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城向后看去，只见君安捋着胡须，叹息道：“真是一群不省心的孩子，唉，可惜了，丫头的一双巧手……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“师父……”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406176&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406176&&novelId=15670'">下一章</div>
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
