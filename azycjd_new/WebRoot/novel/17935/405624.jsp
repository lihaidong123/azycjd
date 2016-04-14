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
    <title>第十二章 吾得大门牙</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405624&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405624&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405624+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十二章 吾得大门牙]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405624')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405624 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405624,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第16章&nbsp;&nbsp;&nbsp;第十二章 吾得大门牙
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪堆满笑脸的冲了进去，案桌边没有他的人影，思索一下便加快步子向深处走去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川果然在，不过却不是如她所想在翻阅卷册，而是在和什么人谈着话，两人窃窃私语的交谈声隐隐约约的传入耳畔。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪没有想打扰的意思，下意识的要回退几步，不料踩中了地上的纸团，她下意识得为了掩藏自己得到来，不惊动两人，所以悲壮的往书架子上一扑，整个人随着书架倒向地面，接二连三的巨响下，几千册的书籍都纷纷掉落，压出一片灰尘。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	此场面如此壮观，让人想不瞩目都难啊！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪就趴在乱七八糟的书册中，脑中又是混乱又是空白的想象着自己被楼锦川发现时的丢脸模样。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	再睁眼时，就看见楼锦川慌慌张张的抱住了她，一旁的官员目瞪口呆的看着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪原想翻翻白眼直接厥死过去，以此来换取那些好吃的糕点，但她猛然尝到自己口中的血味，以为自己是被这一摔摔的都吐血了，但身体却是没有一点伤痛，除了……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“二锅，吾大门牙掉了……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪把嘴一张，满口的鲜血汇聚在牙根处，她还用舌头舔了舔缺失的两颗大门牙，露出一个自以为很美的笑容。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川不动声色的将她拥起像抱布匹似的，轻松的把她往床上一丢，面上完全看不出半点为她悲痛的表情，反而有些微颤的肩膀出卖了他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“来人……快，快请太医……”楼锦川背着西凝雪招手，实际上却不得不为了压抑笑的痛苦按住了小腹。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪光是看着就知道，楼锦川因为她那副滑稽的模样憋得有多难受，但她不在乎，不就两颗门牙吗，把那满汉全席摆上她一样可以畅快的照吃！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正在脑中回想各种美好的食物，耳边传来了声音。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“公子，来……张口。”又是上次那个老掉牙的大夫，给她配了那么多的中药，不仅苦到要吐，不喝还吃不到她最喜欢的糖糕。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪把脸一转，轻蔑的高昂起下巴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	想又趁机给我开方子喝苦药是吧？想得美！我就不开口，看你怎么办。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“乖，张口。”还是楼锦川这贼人懂她的心，从宫女手里端来一盘子的肉丸，西凝雪开开心心的张口准备吃掉他特地送来的肉丸，还没到口呢，楼锦川以迅雷不及掩耳之势的点在了她的脖子上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪保持着夸张的姿势，斜睨了一下楼锦川，然后瞪眼，好你个楼锦川，还敢对我动粗，差评！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	老大夫对着她一口血肉模糊的牙盯了半晌，而后摸摸白花花的胡须，表情颇为奇怪道，“这牙口并无大恙，不过这两颗牙怕是无法生长了，依老夫之见，恐怕只有……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川用着威慑的眼神，瞪了一眼老大夫道，“有什么就直说。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	老大夫神色焦虑道，“恐怕只有请烟雪阁的温太医出手，宁公子的牙方有恢复的可能。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪的心中猛地一声落地雷狂炸方圆百里，如黄河滚滚万马奔腾之震惊的她久久不能闭口，虽说她根本就动不了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“别无他法？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“禀太子殿下，倘若此事交给老夫来，需要费些年头替这位公子医治。但那温太医年纪轻轻医术就登峰造极，老夫自问医术了得却也未曾如温太医那般通晓百家医理，若将宁公子得牙交由他来治疗，势必更加稳妥。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“也好，本宫就去会会这人。”楼锦川随手解了她的穴，然后又随手把那盘肉丸子带走了，要不怎么说有心机、城府深呢，走就走还要夺人心头所爱，这就是变相的欺辱！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪留在殿中，听老太医的吩咐，用浓茶漱完口以后，又要在牙根处抹药散，口里残存的血腥气还是让她不爽的回想起自己摔跤把两颗大门牙给摔没了的丢脸大事。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这简直就是她人生中的败笔，这年头当女侠那也是要有姿色的，不然她这一开口就是龃龉的样子，说不准还没动手呢坏人就笑死了，日后再落得一个“龃龉女侠”的名声，可就遗臭万年了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过现在楼锦川去和那小肚鸡肠脾气不好没心没肺的瘟神交谈，依他堂堂太子殿下的身份肯定能把这个瘟神请过来，到时候她就不愁报不了银针这笔账了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正在她美滋滋的想着如何如何报仇的时候，楼锦川快步走来，两旁的太监哆哆嗦嗦的跟在身后。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川沉着一张俊脸，恼怒的凝起拳头砸在无辜的桌面上，脸庞上挂着比起发现他的紫玉流苏被她斩断后更加阴霾低沉的面色。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	理智告诉西凝雪，楼锦川不但没有把那个瘟神请回来，而且还被狠狠的摆了一道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	且此人现在印堂发黑估计不好惹，但手已经控制不住的拍了过去，随之笑得不可开交的发出“嚯嚯嚯”的笑声，“二锅，吾支支你，去哈了内个瘟神！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪根本没有经过大脑思考就说了出来，她一心只想赶紧把那大逆不道的死瘟神拖出去斩成十八段，不过……仔细想来自己和他算起来实际上却没有多大的仇怨，无非就是她毁去他一件衣裳他恼怒之下顺便赏了她一根银针，若是真的因她随口一言楼锦川将他斩了，那么从此往后就再也看不到那么中意的脸了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	趁着楼锦川还未开口，西凝雪登时激烈的拍桌，“先，把他关几啦！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	对，直接关起来，不仅天天能欣赏到还能解气。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	转念一想又恼思不对……一代女侠怎么能有这么邪恶的想法呢？！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川面色凝重的望了一眼表情古怪的西凝雪，又转向了桌上因刚才大力一拍而从杯中抖出来的水。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“本宫的确拿他无法可办，不若……你亲自去的话就不一样了。”楼锦川说到此，西凝雪比刚才还要激烈的拍桌，疯狂的呐喊道，“表！吾表油狗窝！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他竟然要将她送到那龙潭虎穴之地，这要是真的应承了就不是两颗牙而是整个人都要血肉模糊的痛苦了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“他又不是会吃人的妖精，你怕些什么。”楼锦川莫名其妙的发笑，把她拉到旁边的凳子上安分的坐着，“这人性情虽古怪，但据我所知绝不会滥下杀手，你与他无冤无仇若是多加恳求，他多半会施手替你医治的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪顿时把头摇的跟拨浪鼓差不多。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	开什么玩笑，要是无冤无仇他用银针定了本姑娘一晚上？害得她到现在都记忆犹新的回忆起什么叫身如千斤重。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川眉尖一挑，将口气转为了试探性道，“莫非你真与他有什么过节？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪讪笑，过节是肯定有的，但一旦告知原委，自然也会暴露出自己是秀女西凝雪的身份，保不准楼锦川突然发什么疯把她举报就不妙了，最后肯定是笑着摇头，“当然没有。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	回过头用手偷偷拍了一下嘴，怎么这嘴比大脑反应还快就招了呢。难不成她在心里头就已经被那个瘟神给降服得不敢与他再相触半分了？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那便好，明日本宫就安排手下人将你送过去。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪抖了抖身子笑的僵硬，她怎么会觉得楼锦川那意思分明就是把她打包起来直接送给瘟神呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	仔细衬度半天，她这才发现起楼锦川的好，虽然的确是个容易惹恼又危险的角色，但仍能理智的听他人辩解再做出应有的对策，且凡事好说话为人在某些方面煞是阔气，倘若他长得再如自己中意的美一点，没有那么阳刚的外表，她说不准就会被这样的人吸引了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过楼锦川要是做起皇帝凭着自己一副俊逸的外表，肯定显得威武无比霸气侧漏，迷死万千少女。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	清风徐徐吹来，两个身影并肩走在皎洁的月光下，柔和的光华照耀着整片天地，包括那两个相行的人影。两旁谢落的花瓣轻轻飞舞，似寻着香气的动物缓缓飞至两人的肩头，但转瞬间却又兀自落下。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪将古琴放在红亭中，离自己三两步之遥坐着一人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪知道明天去烟雪阁去定了，索性放开了心狂欢，便向楼锦川讨了把乐器，但转念一想自己一个人狂欢似乎不太好，就将楼锦川拉出来陪着她坐在亭子里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	难得太子殿下豪爽的贡献出一把古琴，西凝雪虽不懂琴，但在乱拨一通之后听到音色还是明白此物非凡。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而她的脑袋中还在思索着这段时间重要的事情，想着想着便回忆起那日楼锦川同自己吵架，但他并没有再提到关于那场无谓的对话，他似乎还是做回了楼小二，她自然也是一成不变的宁小肆。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	如果现在重新给她一次机会，她还是会选择拒绝。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	有些事西凝雪不愿去自找苦果，所以装傻充愣是最好的方法。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她不喜欢带着难过的心思，也不想因为过去的事牵绊着自己现在的生活，若是到了迫不得已危及自身的情况下，她自然会做出连自己都意想不到的对策。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但西凝雪永远都是西凝雪，励志要做惩奸除恶、仗义行救的大侠，这才是她所憧憬的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	所以说嘛……有时候连自己也搞不懂自己到底在想什么，随心所欲的做出那么多根本未经思考的事。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	少女一直在埋头思索着什么神情纠结，楼锦川却目光专注的盯着这个出神的少女，嘴角不由自主露出了浅浅的笑意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这古琴的琴弦韧性十足，太过用力会伤到手的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	听到声音西凝雪才打断思绪的将头抬起，与楼锦川满含笑意和柔情的双眸对望，一尺之遥。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那我看看我和它到底谁厉害。”西凝雪不自觉的大笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	话出了口又觉得这段时间和楼锦川呆的太久，似乎说话都太随意了，这样不好。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405624&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405624&&novelId=17935'">下一章</div>
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
