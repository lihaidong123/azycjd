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
    <title>第二十二章 不敢得罪你</title>
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
	<script language="javascript">var novelId='17935';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405982&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405982&&novelId=17935";
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
					window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405982+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十二章 不敢得罪你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405982')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935.jsp'">江湖险恶医女求生记</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:瓶盖币</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405982 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405982,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第26章&nbsp;&nbsp;&nbsp;第二十二章 不敢得罪你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪深沉的吸了口气，那笑脸不要命的往外送。<br /><p class='chapter_content_read_css'>“你身为大夫不救死扶伤，那你是学来干嘛的呢，温太医？”西凝雪捏紧拳头加重了最后两个字。<br /><p class='chapter_content_read_css'>猎户听他们一来二去的对话，也多少听出了点意思。那个男的不肯出手救，而这个好心的女子却在相劝，感动之际，却只能叹着气摇头。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“唉，姑娘……别白费心思了，我弟弟这病本就是天生的，虽拖着总不见好，但我已知足了，这世上又怎么可能会有人治好他的病呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	猎户的眼中流露的真情让西凝雪差点没忍住，要跟着一同唉声叹气，但温夕言脾气不好惹想要他出手唯有……<br /><p class='chapter_content_read_css'>撩撩还有些湿漉漉的长发，西凝雪的明眸中映着眼前火堆的灼热，但嘴角却是勾勒出一片沐如春风的微笑。<br /><p class='chapter_content_read_css'>“温太医，您就算为了自己我也不会再说什么了，但是这荒郊野岭的小喜儿可就危险了，你瞧它饿得都成这样了，你不会……连它都不救吧，嗯？”<br /><p class='chapter_content_read_css'>温夕言的眸中闪过微妙的眸光，只一瞬间，笑颜绽放的如同百花齐放得盛景，绮丽得让人移不开眼，但他的眸底却如寒天彻底得冰锥，刺着人畏惧得不敢多看半晌。<br /><p class='chapter_content_read_css'>然后西凝雪听他没有丝毫怒气，淡淡得话语，“宁公子对这件事看来是势在必得了？”<br /><p class='chapter_content_read_css'>西凝雪几乎是下意识得收敛起自己得气势，淡淡说道，“我是不敢得罪你，只是这救死扶伤本就是你们大夫做的事情，我只是提醒一下温太医得身份罢了。况且小喜儿得事我也只是顺便一提，不过不出两个时辰它绝对会被饿死，温太医，您确认要拿小喜儿的命来赌吗？”<br /><p class='chapter_content_read_css'>话至此，温夕言得眼神已是变得变化莫测扑所迷离，如黑洞一样让人望上几眼便沉溺其中，她更加像个焉白菜一样失去了自信心，嗫嚅道，“我猜……你不会。”<br /><p class='chapter_content_read_css'>温夕言眸光微闪，起身便向里屋走去。<br /><p class='chapter_content_read_css'>西凝雪松了口气，抱起还在抽搐得小喜儿，心情愉悦得对猎户说道，“我虽然不能保证，一定可以治好你弟弟得病，但是至少让他恢复个一两成是没问题的。”<br /><p class='chapter_content_read_css'>少女诚挚一笑，明眸皓齿得容貌更加动人。原本西凝雪就不丑，只是长久以来看着一个比自己好看得人，便潜移默化得将意识里的自己丑化了。猎户沉浸在她那笑颜中片刻，才呆愣的回神。<br /><p class='chapter_content_read_css'>“姑娘真是热心肠，这份恩情我都不知该如何报答。”<br /><p class='chapter_content_read_css'>“大夫是他不是我，不过恩情还是要还的，就麻烦你帮我找些能吃的果子，给那位大夫得爱宠填饱肚子。”西凝雪笑容灿烂得把小喜儿亮出来。<br /><p class='chapter_content_read_css'>猎户一直没瞧见除了两人之外，还有个特殊的生物。他定睛一看，也分辨不出西凝雪手上是什么动物，望了几眼就立即起身寻来水果，小喜儿虚弱得用小爪子抱着水果，但两腮嚼动的速度丝毫不弱于滴水得速度，西凝雪忽然也很想学着那人得动作，便伸出手指戳戳小喜儿柔软多毛的肚皮。<br /><p class='chapter_content_read_css'>小喜儿“叽叽”一叫，张口咬在了她的食指上。<br /><p class='chapter_content_read_css'>西凝雪吃痛，立即收回了手，心有不甘的把小喜儿逮在手里握了一把，恶狠狠得冲它竖起眉头，道，“好呀你个小东西，你现在落到我手里，看你主人还怎么救你，捏死你捏死你……”<br /><p class='chapter_content_read_css'>“吱吱吱”小喜儿激动的挣扎，好像在怪她刚才用它做为筹码，去要挟温夕言来着。<br /><p class='chapter_content_read_css'>这事不也是迫不得已得吗，更何况谁叫小喜儿是他最宝贝得正堂夫人，他可不歹乖乖就范任劳任怨去救死扶伤了。<br /><p class='chapter_content_read_css'>倘若还有这么一次，她也绝不敢用小喜儿来要挟他了，方才他眼神那么危险，如果不是真的在乎小喜儿，她都以为他会直接出手杀了她这个口出狂言得胆大女子。<br /><p class='chapter_content_read_css'>而那种寒冷，她也不想再领教第二次了。<br /><p class='chapter_content_read_css'>猎户从里屋转了一圈回来，望见少女怀抱着白色生物，神色郁结，他犹豫了一下才上前搭话，“姑娘在这里坐了许久，都怪我照料不周，望了给姑娘倒水了，我这就去给姑娘倒杯水吧。”<br /><p class='chapter_content_read_css'>“嗯……”西凝雪想也不想的就答应了，从上山至此，她滴水未进过，现在口中的确是干燥无比。<br /><p class='chapter_content_read_css'>猎户出了屋不消片刻就将茶水倒来了，西凝雪想起身去拿，但两条腿跪坐得时间太久，她只好支着身子以笑来掩饰酸痛得感觉。<br /><p class='chapter_content_read_css'>笑眯眯得接过茶杯，然后暗叹没有胡椅就是不舒服，但胡椅并未在西燕普及，算起来也是西凉国传来得东西，只有在皇宫给那些身份尊贵得人用，寻常百姓家还保持着铺垫跪坐得方式。<br /><p class='chapter_content_read_css'>西凝雪接过了茶水，不经意间望到猎户得笑脸。不知道是不是她得错觉，这个猎户总是在不停得盯着她看，目光没有移开过半分。<br /><p class='chapter_content_read_css'>“姑娘怎么了，是这茶水不好喝吗？”<br /><p class='chapter_content_read_css'>“不是。”西凝雪品尝了一下杯中得茶水，入口是清甜甘香，带着一股自然气息很是好闻。说不定就是从山中采回来得新鲜茶叶，又忍不住端着茶盅倒了几杯品尝。<br /><p class='chapter_content_read_css'>抬眸间，望见温夕言从里屋出来，她倒好清茶正待起身，但整条腿酸麻得乏力感已经超出了她的想象，西凝雪踉跄得歪了步子，毫无征兆得扑了过去。<br /><p class='chapter_content_read_css'>他停住脚步，她一个照面直接倒在地面，杯中得茶水四处飞溅，一滴不露得洒在他如墨得发丝上，一滴滴打落，滑落至温润得优美唇形上，湿发贴在线条流畅得轮廓上，更加模糊了那种惊艳得美色。<br /><p class='chapter_content_read_css'>西凝雪这会没心思欣赏美色，赶紧咬着牙从地上爬起来，心如死灰如遭雷击般瞪着眼睛，看着由自己打造得恐怖场景，而随着他发丝滴落下得清水，西凝雪又是想笑又心生恐惧，但最后还是坚定得伸出手捂住肚子。<br /><p class='chapter_content_read_css'>“我不是故意的……我错了，温太医……哈哈哈……”<br /><p class='chapter_content_read_css'>白皙得五指拂过狼狈得脸庞，温夕言微微张开了口，西凝雪把笑容及时一收，又爬回自己得位置乖乖坐着。<br /><p class='chapter_content_read_css'>而他的目光却不是如料想那般得震怒，而是别有意味得扫了一眼正在倒茶得猎户，猎户将温热的茶杯递到了他的身前，“这位小哥得医术真是高明，如照小哥所说幼弟得病就会好，此恩我李安没齿难忘！”<br /><p class='chapter_content_read_css'>“不必。”温夕言推拒着避开了那杯热茶。<br /><p class='chapter_content_read_css'>李安顿时又有些急切得跟近道，“难不成小哥嫌这杯茶水不入眼？”<br /><p class='chapter_content_read_css'>西凝雪很想开口告诉这位猎户，他只喝药茶，这种寻常得茶水他肯定都不愿意碰一下，但刚想开口悠忽涌上一股强烈得眩晕感，西凝雪口齿不清得呢喃了几声，片刻便支着沉重得脑袋倒在了地上。<br /><p class='chapter_content_read_css'>直到晕前她才反应过来，那茶盅里有蒙汗药，至于那个李安为什么要这么做，其目的尚未得知。<br /><p class='chapter_content_read_css'>眼见西凝雪一倒，李安猛地出手擒住了温夕言得手腕，欲要将其打晕，但手还未抬起，眨眼之际自己胸口上挨上了一掌，自己被震出了二、三米开外，李安面露恐惧得倒抽了口气。<br /><p class='chapter_content_read_css'>他没有意料到眼前得男子虽一副貌美，但下起手来却是狠毒残酷，光是动了动身体，自己得骨头便痛得宛如碎裂了一般。<br /><p class='chapter_content_read_css'>温夕言依旧站在原地，清冷得眸中在轻蹙得眉梢下显得深邃无比，更如不可触碰得神祗般，透着似云似雾得氤氲寒气。<br /><p class='chapter_content_read_css'>“你家中尚有亲人要赡养，所以我并未废了你，这断骨之痛不过会持续一月，在这之后，莫要再动这种歪心思了。”<br /><p class='chapter_content_read_css'>李安愤恨得咬着牙，却不由自主得为这人清冷得口气感到莫名其妙得惧意，但内心又强打起勇气，促狭得喊出了口，“何必一副正人君子得模样，我看这女人模样姣好，你若能下得了手早就动手了，现下有如此得机会，不如你我二人共同享受此番云雨之乐，岂不更好！”<br /><p class='chapter_content_read_css'>温夕言扬起眉梢，嘴角勾着柔和散淡的笑容，从喉中溢出了几声低笑，好似在嘲笑却又带着讥诮得意味。李安隐隐感到自己得话彻底惹怒了此人，更是害怕得连忙向西凝雪身边爬去，随即伸着两只颤抖得手，紧紧得抓在西凝雪得脖子上。<br /><p class='chapter_content_read_css'>“你要杀了我，她也没得……”<br /><p class='chapter_content_read_css'>话未断，刹那间凌厉得惨叫声已然划破天空，李安不可置信得看着穿透自己胸口得一枚铜钱，随着那轻微得抖动，夹在那指间得银线猛地抽回，李安浑身一颤，倒地不起。<br /><p class='chapter_content_read_css'>手握着染血得铜钱，温夕言微抬起下颌，一如既往得优美轮廓，不沾半分凡尘，眉目妖冶笑意散漫又温雅。<br /><p class='chapter_content_read_css'>小喜儿突然从一边跳到他得肩头，用小爪子挠了挠他的衣襟，他敛神，神情浮现出难得的温和，回神望了一眼还倒在地上睡觉得西凝雪，她无意识得抱紧身子轻咳了几声。<br /><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“二哥，我想吃如意糕……”西凝雪抬手在空中划了几下，忽然翻过身从青石台上滚落，登时剧痛逼迫着她只能从满大桌得菜洋中苏醒。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		她揉揉自己得屁股，迷迷糊糊得打量眼前。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		漆黑一片得山洞，摇曳着得烛火，还有……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405982&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405982&&novelId=17935'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')"/>
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
