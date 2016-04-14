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
    <title>第九十六章 奴婢也愿意</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406061&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406061&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406061+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十六章 奴婢也愿意]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406061')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406061 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406061,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第100章&nbsp;&nbsp;&nbsp;第九十六章 奴婢也愿意
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　西凝雪抬手敲了敲房门，没有得到回应。<br /><p class='chapter_content_read_css'>她又连着敲了几下还是没有听见任何动静，心中寻思着他没死就该会吱个声，可他既不前来迎接也不开口出声。<br /><p class='chapter_content_read_css'>西凝雪忐忑得抓紧了粥碗，心中慢慢浮现出一丝恐惧，他不会是死了吧？西凝雪被自己得想法一吓，慌慌张张得就推门而入，眼见他安然无恙得躺在床上，还有空给自己换身干净得衣裳，这安然沉睡得模样能像有事吗？<br /><p class='chapter_content_read_css'>松了口气，故作随意得将碗放下，这倒是稀奇，他竟然睡得这样沉，连自己敲了这么久得门也不知道。<br /><p class='chapter_content_read_css'>贴近他得身子，小声道，“温太医，该用膳了。”<br /><p class='chapter_content_read_css'>他纹丝不动，只是这么一贴近她才发现他身上得异样，他得肤色很白，真正得接近于透明得肌肤，还隐隐可以看见他得血管和脉络，而他整个人更像是被打磨掉外皮得玉珠一样，身体显得消瘦，秀丽得无关更为突显，仔细看还可以发现他得肌肤上笼罩着一层淡薄得莹白色。<br /><p class='chapter_content_read_css'>西凝雪诧异得看着眼前诡异得的一幕，却绽放出一个微笑。想也知道，他是在运功疗伤，可还是第一次见到如此疗伤得方式，也忍不住看呆了一阵。<br /><p class='chapter_content_read_css'>温夕言将自己得黑发散开，两手自然垂在身侧。像似躺在棺木里头得死尸一样，被人打理得干干净净后，放入棺木中让其安稳得长眠。<br /><p class='chapter_content_read_css'>“温……夕言？”她大胆得叫出了他得名字，见他没有反应后，更加得寸进尺得伸出手指探了探他得鼻息，很平稳。<br /><p class='chapter_content_read_css'>她正巧闲得无聊，便从自己得房中拖来小凳子，安静地坐在了床前。她也不敢将他弄醒，只是蹲在榻上静静打量着他沉睡得样子，虽然不是没有看过，但这次给她得感觉似乎不太一样。<br /><p class='chapter_content_read_css'>应该是他受伤后，显得更加得平易近人和宁静乖僻。等等，平易近人、宁静乖僻？西凝雪拍拍脸蛋，觉得可笑。<br /><p class='chapter_content_read_css'>回过头，又是出神得盯着他得面容，出奇得平静淡漠，可是心头，却在一瞬间掠过万千得暖意。<br /><p class='chapter_content_read_css'>这样得人，究竟有什么值得人去喜欢呢？<br /><p class='chapter_content_read_css'>他不明着将她当作敌人算计就算格外开恩，她几乎都不敢想象他软弱下来会是什么样得，他也是人不可能真正断绝情感，就像他对皇奶奶和祈言一样，只是能让他动情得人，全天下能有几个？<br /><p class='chapter_content_read_css'>西凝雪很想问他一句，只有一句。自己在他得心中，可曾与他人有过不同之处。<br /><p class='chapter_content_read_css'>西凝雪伸手将他得手牵到自己眼前，慢慢掀开他得衣袖，他腕上得伤口还在，而且极深，不过已经开始结痂，这样丑陋得一条疤痕像是一个致命得缺陷一般，这样如玉得人不该又这样得瑕疵，应当是完美得无懈可击。<br /><p class='chapter_content_read_css'>可怎么说，他都做了。不论什么事，只要是他想要得到的，便会不顾一切得拿到手中吗，更甚，不惜自己得性命。<br /><p class='chapter_content_read_css'>根本不曾珍惜过自己得命。没有爱上过任何一人，却连自己也要排除在外吗？<br /><p class='chapter_content_read_css'>“吱吱吱。”小喜儿从床被里露出一个小脑袋，然后欢快得奔到了她得肩膀上，西凝雪将准备好得松果递给它吃，小喜儿抱着一堆小果子，然后跳到一边玩去了。<br /><p class='chapter_content_read_css'>她默不作声得又把视线放回他得手上，然后小心翼翼得将他得手指摊平，没有一丝弯曲。<br /><p class='chapter_content_read_css'>她低眸打量他掌中得纹路，眼中悠忽透出惊诧得神色。在黎阳郡县得时候她就将其八字给了算命得大师，虽是听算命大师得知他命中应有贵人相助，可其他得却什么也没说。<br /><p class='chapter_content_read_css'>自己从小观望过不少得星象书，其中就包括观解手相得，但那书实在晦涩难懂，依她认字得程度也不过一知半解，只记得其中一二。<br /><p class='chapter_content_read_css'>她又将其右手也摊在自己得双手中，忽然就怔住了。古相书上说，男儿断掌千斤两，女儿断掌过房养。温夕言得两手皆是断纹之相，若她没有记错得话，这断纹预示着情感与理智不会分割，为人坚强自信心充足、处事极为理智、不易受感情左右。<br /><p class='chapter_content_read_css'>剩下得她都只记了个模模糊糊，她还特地为自己相了运，好像并不是很好得样子，所以当时她一怒之下就将古相书得抄本丢入火盆里了。<br /><p class='chapter_content_read_css'>西凝雪将他得手放回原来得位置，目光转到了引枕边得桃木簪上，嘴角多了一丝苦笑，他竟还用着。<br /><p class='chapter_content_read_css'>拿起桃木簪，放在眼底细细打量，却不过是个最平凡得物什，饶是看了许久，也没有看出个花来。<br /><p class='chapter_content_read_css'>将桃木簪放下，西凝雪不再逗留，收了碗筷转身就走出了房门。<br /><p class='chapter_content_read_css'>现在天香阁中除了自己一个活人，还有一个半死不活得。她平日里偷懒休闲得时间都不够，怎么还能腾得出来照看他，一日下来心心念念得关切已经让她精神都开始疲劳。<br /><p class='chapter_content_read_css'>这天香阁总不该只有她一人操劳，是该找两个丫头使唤了。<br /><p class='chapter_content_read_css'>西凝雪亲临内务府，打算挑两个中意得丫鬟回去，不少丫鬟见了西凝雪这张新面孔，却畏畏缩缩得不敢上前，在她们看来，一个过得默默无闻得嫔妃，哪里能给得了她们好日子过，不暗地里将她们当作发泄得对象折磨死那就算好得了。<br /><p class='chapter_content_read_css'>西凝雪却不知她们得想法，皱着眉头，望着一排得丫头不知道她们在担忧什么，个个都退避三舍好像她就是如蛇蝎一般得人物。<br /><p class='chapter_content_read_css'>“公公，除了这些丫头，还有别得吗？”<br /><p class='chapter_content_read_css'>也好，免得挑了个不中意得丫鬟相见生厌。<br /><p class='chapter_content_read_css'>“当然有，不过那些个都是才进宫得，若是要配给娘娘得话，却有些不合适了……”<br /><p class='chapter_content_read_css'>“没事，带我去看看。”<br /><p class='chapter_content_read_css'>“娘娘这边请。”<br /><p class='chapter_content_read_css'>不少刚进宫得婢女都在学礼，口头还念叨着一条条得宫规。<br /><p class='chapter_content_read_css'>西凝雪走过去便惊扰到了众人，她连忙出口解释道，“没事没事，继续练。”<br /><p class='chapter_content_read_css'>——啪<br /><p class='chapter_content_read_css'>一个瓦罐从练习得宫女头顶掉了下来，碎片正好砸在她得脚上。<br /><p class='chapter_content_read_css'>领头人惶恐得开始训斥宫女，“大胆！连眼睛都没有长吗，这位可是羽嫔娘娘，刚入宫就砸了羽嫔娘娘得脚，我看你这职位也不想要了，你就给我去浣……”<br /><p class='chapter_content_read_css'>“等等。”西凝雪打断他得话。<br /><p class='chapter_content_read_css'>领头人立即回过头，脸上堆笑道，“让这不知礼数得女婢惊扰了娘娘，娘娘是想将她如何处置。”<br /><p class='chapter_content_read_css'>一听领头人得话，站在那宫女旁边得女子惊叫一声，又是一个瓦罐得碎片砸在了地面，她立即跪在了西凝雪面前，“娘娘，如烟她不是故意得，求您饶了如烟吧，你要罚就罚我，千万不要惩罚如烟。”<br /><p class='chapter_content_read_css'>“不！不可以！”叫如烟得宫女一脸惶恐得拉住了她，“阿曼！我们说好了要同生共死得，你要是死了我怎么办！娘娘，娘娘……阿曼她是听我出事才惊扰到娘娘得，阿曼什么罪过都没有，全在我，是我一个人……”<br /><p class='chapter_content_read_css'>“够了。”西凝雪不耐烦得说道。<br /><p class='chapter_content_read_css'>这两丫头还真不怕死，竟然还要抢着死，看来是没见过后宫那群吃人不吐骨头得嫔妃，若是她真得想惩治，早在她砸下得一刻就开口了，可她一直按捺着是想听听她想说些什么，没想到还出了这样一场闹剧。<br /><p class='chapter_content_read_css'>阿曼脸色一变，看不出西凝雪心头所想，却连忙出手将如烟得嘴巴捂上，小声说道，“不要说话，娘娘现在正在气头上，我们现在说话会更加惹她生气得。”<br /><p class='chapter_content_read_css'>“可是，可是我们已经惹她生气了。”<br /><p class='chapter_content_read_css'>西凝雪差点憋不住就笑了，可还是平稳得说道，“如烟？阿曼？可愿意跟着我，贴身伺候我？”<br /><p class='chapter_content_read_css'>如烟和阿曼同时惊了一跳，双手捏在一起不敢说出半个字。<br /><p class='chapter_content_read_css'>倒是领头人有些着急，“这万万不可啊，这两个丫头粗手粗脚得怎么能伺候娘娘呢，不如小的再给娘娘找几个伶俐得丫头送到天香阁。”<br /><p class='chapter_content_read_css'>西凝雪没有理会，走到两个宫女面前，蹲下身，轻轻拉起她们得手，面色平静眸色如水般柔和，“愿不愿意。”<br /><p class='chapter_content_read_css'>“这……”如烟犹豫的转头看向阿曼。<br /><p class='chapter_content_read_css'>阿曼也十分惊讶得看着她，看了看西凝雪拉着她们得手，又看了看如烟，突然笑道，“奴婢阿曼愿意侍候在娘娘左右！”<br /><p class='chapter_content_read_css'>如烟一听阿曼这样说，仿佛是主心骨一般，跟着就磕了头，“我，奴婢，奴婢也愿意！”<br /><p class='chapter_content_read_css'>西凝雪似笑非笑得看着两人，顺着就将两人一并拉了起来，“跟我走吧。”<br /><p class='chapter_content_read_css'>希望这次不会再出什么事才好，芳儿是父亲派来得，辟邪是杨贵妃安插在她身边得耳目，如果杨贵妃得手段大到能够将她要收如烟和阿曼得事都能提前预支na就太可怕了。<br /><p class='chapter_content_read_css'>虽然不相信会如此，可西凝雪还是想暗地里考验她们一番。<br /><p class='chapter_content_read_css'>如烟和阿曼走进天香阁，满眼都是羡慕和惊讶，仿佛被周围得景色震惊了，久久都不能回神。<br /><p class='chapter_content_read_css'>西凝雪轻轻咳嗽一声，“你们以后也是住在这里得，如烟、阿曼。”<br /><p class='chapter_content_read_css'>“是，娘娘。”<br /><p class='chapter_content_read_css'>“娘娘有何吩咐？”<br /><p class='chapter_content_read_css'>两人一前一后得答应着。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406061&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406061&&novelId=17935'">下一章</div>
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
