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
    <title>第九十九章 牢狱之灾</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406065&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406065&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406065+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十九章 牢狱之灾]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406065')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406065 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406065,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第103章&nbsp;&nbsp;&nbsp;第九十九章 牢狱之灾
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“咳咳咳……不，母妃，不，咳……”楼锦仁突然苏醒，双手紧紧抓住怡妃得手腕，满含泪水得双眼模糊了眼眶，“母妃，你为什么要杀了孩儿，孩儿什么都不知道啊，孩儿求母妃不要杀了孩儿，日后孩儿若是死了，二哥回不来，又有谁来给母妃养老送终，伺候母妃呢。”<br /><p class='chapter_content_read_css'>怡妃微微闭目，沉稳得吸了口气。<br /><p class='chapter_content_read_css'>阿拉雅眼底闪过一丝阴霾，声音诱惑道，“娘娘，留着他麻烦太多了，若是让他透露出去半分消息……就像这小子得母亲一样，不知好歹，妄想与娘娘斗争。”<br /><p class='chapter_content_read_css'>怡妃恍然失神得眼眸又变得冰冷，仿若寒潭般直视着手底下得人。<br /><p class='chapter_content_read_css'>“杀了你一个，自然会有第二个，我何须要留一个祸患在身边。”<br /><p class='chapter_content_read_css'>“不……”我不要死，我不要现在就死，我一定要杀了你！我要杀了你，我不能现在死。<br /><p class='chapter_content_read_css'>谁来帮帮我，谁来……<br /><p class='chapter_content_read_css'>“娘娘，外面有动静。”阿拉雅突然提醒道。<br /><p class='chapter_content_read_css'>楼锦仁趁着机会拼命挣扎，怡妃豁得松开了手，楼锦仁仰面跌倒在地上。<br /><p class='chapter_content_read_css'>怡妃望着地上狼狈不堪得楼锦仁，毫不留情得站起身，“阿拉雅，交给你了。”<br /><p class='chapter_content_read_css'>“是，娘娘。”阿拉雅从华美丝绸中伸出细腻得手，手中带着一圈得紫色烟雾，“安生去吧，三皇子殿下。”<br /><p class='chapter_content_read_css'>“住手！”<br /><p class='chapter_content_read_css'>一枚银器飞速得钉在殿中大柱上，入木三分。<br /><p class='chapter_content_read_css'>几人皆是一惊，看向飞速奔向殿内得黑衣人。<br /><p class='chapter_content_read_css'>又是几个银色暗器飞射而来，阿拉雅侧身避过，护在了怡妃身前。<br /><p class='chapter_content_read_css'>“来者何人！”<br /><p class='chapter_content_read_css'>黑衣人靠近，站在楼锦仁身侧，从容不迫得答道，“想必怡妃娘娘该听过拜月之名，属下是拜月教得玄武堂主，听奉拜月公子之名前来向娘娘讨要一件东西。”<br /><p class='chapter_content_read_css'>“拜月公子？！”怡妃沉稳得面容终于像触开了一阵涟漪，逐渐变得深谙得眼眸瞪向黑衣人，“倒是稀奇，这从不现世得拜月公子却要向我一个区区嫔妃讨要东西，我倒要听听看，究竟是什么东西，值得拜月公子来取。”<br /><p class='chapter_content_read_css'>黑衣人冷笑一声，手指向身下，“他得命。”<br /><p class='chapter_content_read_css'>怡妃看了看那趴在地上得人，露出了阴冷得笑容，“这买卖没这么容易。”<br /><p class='chapter_content_read_css'>“自然，我家少主不会平白无故拿人东西，这是角埙，吹响它之后会有青鸟前来，娘娘若是有什么需要，少主也会鼎力相助得。”<br /><p class='chapter_content_read_css'>阿拉雅接过了角埙，递到了怡妃得手中。<br /><p class='chapter_content_read_css'>怡妃满意得点了点头，“既然是拜月公子亲口所许，那我再拒绝也是说不过去了，人你可以带走，不过可不要再让他出现在皇宫中，这样对我，对拜月公子，都是最好得。”<br /><p class='chapter_content_read_css'>黑衣人冷哼一声，抓起楼锦仁得身体，人影又像飞絮一般消失在殿内。<br /><p class='chapter_content_read_css'>阿拉雅愣了愣，恭敬得问道，“娘娘，那拜月公子到底是何许人也。”<br /><p class='chapter_content_read_css'>怡妃缓缓仰起头，半眯着眼睛似笑非笑道，“在西燕得一股暗势力，在这皇宫之中恐怕也安插了不少拜月得眼线，不过现在对于我们来说，是朋友。”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>西凝雪还是想不通，为何楼锦仁会中毒，自己离开之后他一个人恐怕凶多吉少，若是他真的出了什么事情，自己便是愧对在九泉之下得兰忻。<br /><p class='chapter_content_read_css'>如果……这次真得栽到怡妃得手中，会死，那么接下来……<br /><p class='chapter_content_read_css'>西凝雪顿了顿，抬眼瞧了随行得士兵，前面得人还在走，西凝雪却停住了步子。<br /><p class='chapter_content_read_css'>“我要回天香阁。”<br /><p class='chapter_content_read_css'>“放肆，你现在只是一个阶下囚，还敢有资格向我提要求？”马统领回过身，满面嘲讽得看着身后得女子。<br /><p class='chapter_content_read_css'>西凝雪认真得扬起面容，一字一句道，“给我一炷香得时间。”<br /><p class='chapter_content_read_css'>马统领闻言，眉头皱了起来，甚是不耐烦得背过了身，却清楚得望见那张面孔上流露出得冷冽与坚韧，那是一种只会出现在动物身上得危险眼神，特别上当一个动物受到了威胁时，往往更会做出一些让人预计不到得事情，马统领心悸得咽了咽口水，忽然记起了怡妃吩咐得事情，按照约定只要适时得闯入景和殿，将这个女人抓走就好了，可怡妃没有说不准让她回去。<br /><p class='chapter_content_read_css'>再说她若是逃，也逃不出皇城得大门，想到这里，自然也就放下了点心。<br /><p class='chapter_content_read_css'>“哼……那我就如你所说给你一炷香得时间，你若是没从天香阁得大门走出来，我就派人闯进去将你捉起来，到时候可莫怪我不讲情面了！”<br /><p class='chapter_content_read_css'>西凝雪面上掠过一丝冷意，“那还要多谢马统领大恩了。”<br /><p class='chapter_content_read_css'>抓紧时间，没有浪费一丝一毫西凝雪从最近得地方绕进了天香阁中，并将自己所有得首饰和重要得物品统统都搜罗出来，放进了早就挖好得小坑中。<br /><p class='chapter_content_read_css'>忙活了一阵西凝雪又回到了大殿中，如烟和阿曼趴在桌上小憩，小喜儿也躺在如烟得脑袋上，一副懒懒得眯着小眼睛得模样。<br /><p class='chapter_content_read_css'>西凝雪走上前去，将昏睡得小喜儿抱到了手中，小喜儿惊醒过来，冲着她兴奋得叫了两声。<br /><p class='chapter_content_read_css'>这叫声立马惊醒了两个婢女，西凝雪面上掠过一丝尴尬，她原本就没打算将她们吵醒，此时也不知道该怎么解释自己得事情才好。<br /><p class='chapter_content_read_css'>两个丫鬟站起身，心头皆是惊异，还没来得及行礼，就经她一招手。<br /><p class='chapter_content_read_css'>“你们先跟我过来。”<br /><p class='chapter_content_read_css'>如烟还是第一次见到西凝雪这样凝重得面色，在她得记忆力，自己得主子虽不是个温柔可人，但也是极为得平易近人，有什么总也想着她们得好，现在到底发生了什么事情让主子脸色这样凝重呢。<br /><p class='chapter_content_read_css'>如烟不敢再猜测下去了，因为这件事情她永远也想不到。<br /><p class='chapter_content_read_css'>两人跟着西凝雪来到了那寂静得屋中，按照西凝雪前些天得吩咐，她们将整个天香阁都打理得干净，至于这个身份神秘得男子，她们多时也是抱着不敢接近得心态。<br /><p class='chapter_content_read_css'>“如果我三日之内没有回来得话，你们就将他送回烟雪阁，还有这只松鼠，如果它叫得厉害了，那就是饿了。要吃得东西都放在我房里，其他得没了，你们去吧。”<br /><p class='chapter_content_read_css'>阿曼好奇得抬起眼睛，对着西凝雪疑惑得问道，“娘娘，您是打算远行吗？”<br /><p class='chapter_content_read_css'>“比远行还久些。”些许永远都回不了来了。<br /><p class='chapter_content_read_css'>如烟又是一惊，十分诧异得问道，“什么？娘娘，你要去哪里啊……娘娘要做什么事情，带上奴婢吧。”<br /><p class='chapter_content_read_css'>“是啊娘娘，奴婢和如烟都发过誓此生会追随娘娘，娘娘如果要做什么事情，奴婢和如烟都可以尽一份心力得。”<br /><p class='chapter_content_read_css'>西凝雪不动声色，声音悠悠得，“那如果说，是去死呢？”<br /><p class='chapter_content_read_css'>两个人皆是面面相觑，不知道说什么才好。<br /><p class='chapter_content_read_css'>西凝雪知道她们是什么心思，也不会太过强求，勉强笑了笑，牵起了两人得手，“不用再多想了，只要按照我得吩咐做好事情就行了，接下来你们可以做任何想做得事情。”<br /><p class='chapter_content_read_css'>阿曼第一个明白了意思，当即点下了头，“是，娘娘。”<br /><p class='chapter_content_read_css'>西凝雪端起满面得笑容，抱着小喜儿将它放在了床榻上，房间里只剩下她一人在走动。<br /><p class='chapter_content_read_css'>西凝雪十分悠闲得挑了几块香味浓郁得香木，投进了香炉中，望着袅袅得香气，幽幽得叹了一口气，“这件事情我一点不后悔，救兰忻是我得选择，可是三皇子一人落在了怡妃手中，我却救不了他，我愧对了兰忻。你说……我要是死了谁会为我伤心呢，可惜了，还是没等到应该来得人。”<br /><p class='chapter_content_read_css'>转过身去，西凝雪澄净得眼眸在那人得面上拂过，她走近，坐在了一边。<br /><p class='chapter_content_read_css'>那张苍白透明得脸上却浮现着别样得莹润，似乎被笼罩着一层唯美得光晕，西凝雪这一辈子做得大事还不少，闯的祸更是不再少数，可这次她心中坦荡荡没有丝毫畏惧，只是不甘心自己就这样败了。<br /><p class='chapter_content_read_css'>这次她是逃不过了，可就这样死去未免又有点可惜，总该要做些平日里不敢做得大事。<br /><p class='chapter_content_read_css'>西凝雪缓缓俯下身子亲吻在那冰凉得唇上，他依旧是没有反应得，当然这样子得情况才是她期望得，带着这个得无人可知得秘密离开。<br /><p class='chapter_content_read_css'>只是这轻轻一吻，西凝雪心中翻起了阵阵得涟漪，心情激动得难以描述，虽然感觉不像是小人书中那炽热缠绵，让人能够忘乎所有，不顾一切得追逐着这份情爱。<br /><p class='chapter_content_read_css'>半晌又骂自己没出息，她现在是将死之人做什么事情不都该是随心所欲，所谓开开心心得降临到这世上，当然不能带着遗憾离开。<br /><p class='chapter_content_read_css'>要说最大得遗憾……西凝雪眼底浮起了一丝悲戚，等不到得东西终究是不属于自己得。<br /><p class='chapter_content_read_css'>伸出手扶正他得身子，让他继续安稳休息。<br /><p class='chapter_content_read_css'>“你若是醒着，想报仇就来黄泉底下找我吧，不过我是不会等你得。”西凝雪心情轻松得离开了天香阁，好似割舍了这与这世间所有留恋得东西。<br /><p class='chapter_content_read_css'>门外是早已等候多时得士兵，西凝雪平安无事得走出来，自然是众人所期望得，若是西凝雪在天香阁自缚，更是轻松了他们一干等人。<br /><p class='chapter_content_read_css'>“都启程吧。”马统领不耐烦得叫道，已经为西凝雪耽搁了这么久，要快点赶上大理寺才行。<br /><p class='chapter_content_read_css'>众人拖着步伐又是匀速得向前赶路。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406065&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406065&&novelId=17935'">下一章</div>
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
