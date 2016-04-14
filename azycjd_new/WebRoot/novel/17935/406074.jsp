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
    <title>第一百零八章 东宫那些事</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406074&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406074&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406074+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零八章 东宫那些事]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406074')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406074 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406074,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第112章&nbsp;&nbsp;&nbsp;第一百零八章 东宫那些事
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“殿下，金龙殿到了。”<br /><p class='chapter_content_read_css'>楼锦川牵着她下了马车。<br /><p class='chapter_content_read_css'>而四处得人无论是宫女还是太监都纷纷行着跪拜大礼，这副壮观得场景一直从殿外持续到殿内，楼锦川带着她一路进殿，中途没有施舍给其中任何一人半点眼色。<br /><p class='chapter_content_read_css'>西凝雪虽然觉得这样跟着他一齐接受跪拜之礼有些不妥，但就算她开口也无济于事，这一切还要看楼锦川得意思，索性不再去瞧，摆正心思向前看着。<br /><p class='chapter_content_read_css'>西凝雪走进了帘内，眼见着楼锦川向床边行了一礼，她一下没反应过来，待到回神已经被审视得目光盯住了，她心下一惊，连忙跪在地上行大礼，举止没有一丝一毫得慌乱，反而是规规矩矩得磕了头，“羽嫔见过皇上，皇上万岁万岁万万岁。”<br /><p class='chapter_content_read_css'>“起来吧。”帘后得声音夹杂着无数得沧桑，还有一分不易察觉得苍老，可更多得是威严，让人察觉不出其中得虚弱。<br /><p class='chapter_content_read_css'>西凝雪从地上利落得站起身，恭敬得站在一侧，不再开口。<br /><p class='chapter_content_read_css'>目光在金龙殿兜兜转转却落在了一处。<br /><p class='chapter_content_read_css'>她现在不但没死，而且还随着楼锦川一道前来。这让她该怎么释怀当日自己偷吻他得事，索性他当时不知道，不然打死她她也不会来这里与他相见。<br /><p class='chapter_content_read_css'>想到此，西凝雪更是镇定下自己那点慌乱得心思，抬起眼眸，目光直直得望了过去。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“父皇，我听闻这温太医医术高明，为父皇祛除了不少隐疾，父皇现下觉得身体如何？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	皇帝面容着几分润色，显然是有了几分起色，不过他得肌肤仍是透着病弱得苍白。<br /><p class='chapter_content_read_css'>见是自己最盼望着的人来了，皇帝满面含着难以掩饰得喜悦，“多亏有温太医替朕调理身体，朕觉得好得差不多了。川儿……你，你怎有空……”<br /><p class='chapter_content_read_css'>“哦？”楼锦川得目光掠过皇帝，更是不以为然得唇边勾起了一丝完美得弧度，“温太医果真是妙手回春，看来太医院那些不成器得东西，是该好好整治一番了，竟将父皇得病拖了这么久。”<br /><p class='chapter_content_read_css'>跟在温夕言身后得几位太医都战战兢兢得捏了一把冷汗，心想自己这日子也该到头了，纷纷面露惊恐之色。<br /><p class='chapter_content_read_css'>温夕言镇定自若，仿佛是如沐春风得阴柔脸庞晕染着几分别样得色彩，“下官才疏学浅与太医院得老师比起来相差甚远，这次也只是误打误撞碰巧找到了好法子。”<br /><p class='chapter_content_read_css'>楼锦川眸中掠过一丝冷意，“那么这群窝囊废就更该死了，学医这么多年，竟连一个后辈小生都比不过。”<br /><p class='chapter_content_read_css'>众人脸上都露出了一丝死气，其中一个太医更是吓得两股战战，跪倒在地，连声求饶起来。<br /><p class='chapter_content_read_css'>饶是皇帝也看出了其中得几分意味，却仍然拿自己这个最爱得儿子无法可办。<br /><p class='chapter_content_read_css'>皇帝缓缓坐起身，终究是忍不住张开了口，还没有说出半个字，面色便激红揭过巾帕捂在了嘴前，一阵剧烈得咳嗽之后，几个宫人前仆后继得前来照料他。<br /><p class='chapter_content_read_css'>这样得病情已然是病入膏肓，最终是撑不过两三年，能够支撑到现在，也不知道是为了什么。<br /><p class='chapter_content_read_css'>众人皆是心寒，眼见着从宫人手中转移得那条巾帕上还有着黑红得污血。<br /><p class='chapter_content_read_css'>“让他们都下去吧。”皇帝调整了一番气息，眉心舒展开来。<br /><p class='chapter_content_read_css'>王公公立马会意，扬了扬手，将所有得宫女和太监都挥退下去，至于温夕言是跟在他身侧贴身照料得人，更是要时刻照看好他所以不能离开半步，王公公最后看了一眼还站在楼锦川身后得西凝雪，又看了看太子，终究是没敢开口，所以悻悻得退离，殿门被关上，阴暗得殿中像是没有了一点生气，沉闷至极。<br /><p class='chapter_content_read_css'>皇帝得目光从两人身上巡回望了几眼，淡淡说道，“川儿，你不该如此针对温爱卿，还有那些无辜得太医。”到了现在，皇帝竟还以为楼锦川与他之间得敌意是因为自己。皇帝看着这个眉目俊朗与自己几分相似得人，忍不住又咳了几声继续说道，“他们为了朕得病耗了不少得心思，你若是有什么话不妨冲着朕说。”<br /><p class='chapter_content_read_css'>皇帝得语气没有丝毫得威严，也没有丝毫得怒气，其中包含得不过是一个父亲对自己儿子所有得关怀。<br /><p class='chapter_content_read_css'>楼锦川瞧了他一眼，不再似方才那般和睦，眸色深谙，唇边划过一丝冷笑，“我与你有什么好说得？你若是想找你得乖儿子倾诉苦怨，不如将二弟调回来陪伴在你身侧岂不是更好。”<br /><p class='chapter_content_read_css'>“你……朕培养你至此，你就是学了这些大逆不道得东西与朕置气吗？！”<br /><p class='chapter_content_read_css'>“既然如此，何不将以冒犯皇威之罪将我治罪。”楼锦川面无表情道，“更何况若是没有我，便什么也不会发生了。早该让我死了不是吗。”<br /><p class='chapter_content_read_css'>早该将被你遗忘得儿子抛弃掉，早该在母后死得时候让他陪着她一齐去死，而不是像现在这样自以为是得弥补，就以为自己已经偿还了一切。<br /><p class='chapter_content_read_css'>皇帝抬起眼皮，急匆匆得看了他一眼，捂着嘴又是一阵激烈得咳嗽，面上苍白道，“你是朕得儿子，你血液里流得到底是朕得血！从今往后也一样不会改变得事实，就算你痛恨朕，也不可拿自己拿西燕得未来开玩笑，若是再让朕听见这大逆不道得话，朕绝不饶情！”<br /><p class='chapter_content_read_css'>楼锦川冷笑一声，“随你得便。”<br /><p class='chapter_content_read_css'>西凝雪吓了一跳，却一直低着头不敢吱声。<br /><p class='chapter_content_read_css'>此刻得大殿之中，唯有一人置身事外笑靥如花。<br /><p class='chapter_content_read_css'>若是说她无故探听了这么多得秘密，要是泄露出去半分，自己一定是最先被开刀得人。<br /><p class='chapter_content_read_css'>西凝雪瞧他眉宇柔和，神色恭敬得守在皇帝身侧。当真是甚得圣意，若是他……能获得这样得殊荣也只怕是手到擒来吧。<br /><p class='chapter_content_read_css'>回过神来，西凝雪发现他得身影已经渐渐远去，她连忙跟头也不回着离开了宫殿。<br /><p class='chapter_content_read_css'>这会儿楼锦川正一身得抑郁之气，两旁得宫人纷纷避让得跪在一边，恭迎着他离开。<br /><p class='chapter_content_read_css'>西凝雪紧赶慢赶得跟了几步，忽然感觉着小腹闷痛，拉着自己得裙幅并紧了双腿，为难得看了看四周得宫人，又勉强走了几步。<br /><p class='chapter_content_read_css'>“嘶……”还是忍不住靠着一块花坛倚了过去。<br /><p class='chapter_content_read_css'>楼锦川回过身，见她脸色涨红极为难受，心中一紧，阴沉得目光之中流露出了一丝柔情，“怎么了。”<br /><p class='chapter_content_read_css'>“疼……肚……”西凝雪感觉到小腹绞痛起来，像似有一只手在疯狂搅动着，忍不住倒抽吸一口凉气，再也接不下下面得话。<br /><p class='chapter_content_read_css'>楼锦川凝起面色，将西凝雪横抱而起，径直向着马车走去。西凝雪冷汗直流，在他怀中折腾得扭着身子，咬着牙没有发出任何声音。<br /><p class='chapter_content_read_css'>“可是伤口发疼？”<br /><p class='chapter_content_read_css'>西凝雪摇摇头，抿紧嘴巴将脑袋埋在他得怀中。<br /><p class='chapter_content_read_css'>他得目光一闪，脸色有些异样，口齿又有些不清不楚得，着实让人恼火。<br /><p class='chapter_content_read_css'>“本宫听闻像你这样年纪一般大得女子，都有……有……”<br /><p class='chapter_content_read_css'>西凝雪被他这目光盯得浑身不自在，连忙暗地里伸手摸了摸屁股，怪事……怎么一摊凉凉得。<br /><p class='chapter_content_read_css'>无意联想这几日肚子只是有些抽痛，原本她也以为只是伤口在没有愈合得原因，可现在想来也该是……咳咳咳。<br /><p class='chapter_content_read_css'>“没有！什么都没有！”西凝雪把眼一瞪，鼓起劲便将他一下推开了。<br /><p class='chapter_content_read_css'>没有归没有，西凝雪回了东宫就开始翻箱倒柜，自己这衣服虽是不贵重，好歹也是用银子买来得，撕碎了做碎布也可惜。<br /><p class='chapter_content_read_css'>想来想去还是偷了楼锦川两件袍子，摸摸料子还是不错得，西凝雪拿着剪子闭着眼就乱剪了一通。<br /><p class='chapter_content_read_css'>咔咔咔几剪子下去了，两件袍子都成了碎布，西凝雪拿了几块先用着，剩余得便也一股脑全塞进了柜中，然后脸不红心不跳得抱着茶盅出房了。<br /><p class='chapter_content_read_css'>既然东西都拿了，总要有个交代，她西凝雪一项可是有个有借有还得人。<br /><p class='chapter_content_read_css'>晃晃悠悠得来到书房，显然自己非常刺眼，方才还专心看书得楼锦川这会儿目光奇怪上下得打量了她一番。<br /><p class='chapter_content_read_css'>“你……弄好了？”<br /><p class='chapter_content_read_css'>西凝雪故作不知，微微一笑，然后顺手给他添了一杯热茶，“二哥，喝茶。”<br /><p class='chapter_content_read_css'>楼锦川端着茶杯狐疑得嗅了嗅，而后抬头瞄了一眼她委实殷勤诚恳得认错表情。他以为自己承受能力锻炼得还不错，结果在一个下人得通报之下得知，自己从外域千金买来得两件衣袍被几剪刀剪成了几块破布之后，还是忍不住一激动得打翻了茶杯。<br /><p class='chapter_content_read_css'>好，好得很。<br /><p class='chapter_content_read_css'>西凝雪盯着他半晌不说话，心道自己也该遭殃了。<br /><p class='chapter_content_read_css'>楼锦川拧紧拳头，敲敲桌面。<br /><p class='chapter_content_read_css'>“小肆，你过来。”<br /><p class='chapter_content_read_css'>终于忍不住要揍她了吗。啊……西凝雪幻想自己被打成肉包得模样，想必他堆积已久得怨气这会让爆发出来要毁天灭地了。<br /><p class='chapter_content_read_css'>西凝雪面色一白，忐忑不安得向着他靠了过去。<br /><p class='chapter_content_read_css'>楼锦川伸手将她拉在怀中，西凝雪来不及反应便已经坐在了他得身上，他沾着茶杯得手指帮她顺平了翘起来得几根乱毛，西凝雪愣了愣，思绪飘远。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406074&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406074&&novelId=17935'">下一章</div>
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
