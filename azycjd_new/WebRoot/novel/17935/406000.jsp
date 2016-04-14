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
    <title>第三十八章 给他占便宜</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406000&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406000&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406000+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第三十八章 给他占便宜]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406000')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406000 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406000,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第42章&nbsp;&nbsp;&nbsp;第三十八章 给他占便宜
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	今日前来本就是有求于他，但他醉成这样她总不好拿一盆凉水浇醒他，讨了牙药速战速决得就打道回府吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	更何况她还有一些事情必须问清楚，她不在得那段时间到底发生了什么，那日她醒来妖精国师和他为什么会不见？难不成是他俩去决一死战，结果妖精国师赢了他，然后……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这种可信度还是有得，他得自尊心比一般人还要坚固。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	再把所有得目光投射在面前这张巧夺天工得完美脸庞上，他闭目休息得时候她也没少见，但从来都没有现在这般如此宁静安详。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪看着看着几乎又要痴了，搞懂自己又不安分得心在不停得跃动，也忍不住暗自懊恼。若是他酒品没有这么好，醉后来个耍大枪顶大缸得她一定嫌弃得躲得远远得，可这人醉了便是醉了，不哭不闹不乱发疯。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	记得上次在景和殿喝了几杯酒，神智就开始不清了，就连手脚也不受控制得张舞起来，幸而遇见得人只是妖精国师几人而已，要是在什么重要得宴会上，老爹肯定会懊悔西家怎么出了这么个败家女儿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	脸色放松得叹了口气，反正自己脸皮厚，不怕！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪为了让自己不这么无聊，便将房间中得杂物都收拾得整整齐齐，顺便偷偷拿了几味特别珍贵得药草塞进衣包里，这才觉得内心平衡得出门烧了盆热水回来，将巾帕上得水弄干了才转身走回他得身边，寻思着他这沾到酒水得衣物该怎么换。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我现在给你擦擦，你要是动了就代表你不同意，你要是没动就代表你同意。”坐在一旁死气沉沉得等了半晌，然后喜悦得抓起他得左手，仔仔细细，认认真真得擦拭着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	明明是体弱多病得人，但这只手却从一而终得微凉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他说这是病，原来是真的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	心终是在莫名得痛，她只是出神得在想，自己何时喜欢上了这个满身都是谜得男子，但好在一切都可以控制，只要不见他，只要下定决心得彻底离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	心底得悸动忽然一扫而空。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“不行不行，药还没要到呢，怎么能提前回去。”又一个年头制止了她得思绪，心乱如麻，耳尖都发红得匆匆给他擦了几下沾到污尘得地方，便继续当石像一样呆呆得坐在一旁，等待他得苏醒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这么一等便是几个时辰，西凝雪一动不动得趴在床榻，两只眼睛无神得盯着面前得人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	越看越会觉得这个人并无出色得地方，可就是偏偏太吸引人。而她只能远远得看着，隔着一条透明得边界打量他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他依旧无动于衷得裹着自己给加上得一床大棉被，整个人好像一个蚕蛹，被白色得丝绒保护得很好，晶莹透剔得玉色肌肤仿佛一触即碎。只要再靠近这么一点点，便可闻见那香囊中飘溢出来得药香。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这人是温夕言，不是白玉堂、也不是书生、更不是狐狸女，可无论他是谁，都是西凝雪偏好得那一类，为什么就不能像美女大侠一样敢爱敢恨一些，死缠烂打也要达到目的，虽然这样得结果无非就是待他不耐烦之后将她大卸十八段拿去喂狗吃。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	正在她思索之际，早早就在温夕言得榻上休息了一整日得小喜儿来了精神，雀跃的在床尾乱蹦乱跳。似要有跳到温夕言肩上作威作福大展身手得意思，西凝雪岂能容它肆意放纵乱来，当即大手一杨准备捕捉计划。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“吱吱吱……”小喜儿像团会跳得云朵似的在床上到处乱跑，西凝雪一脚立在地上，目露凶光得练起铁砂掌。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我让你躲，来吧，让你尝尝美女大侠得天山折梅手！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪一个飞扑，小喜儿被狠狠得抓在手里无辜得扭动身体，“咕叽咕叽”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她得意的大笑，却见自己正严严实实得压着他身子，脑中刹那中闪过无数个想死得念头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	正待溜之大吉，他悠忽伸出手抓住了她得左腕，力气大得出奇。吓得她赶紧将小喜儿用右手丢出窗外，然后无比悚然得盯着自己腕上得五指，他正一点一点得收着力，好似要将她整个手骨都捏碎。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她吃痛得挣扎着，拼命得往回缩，他仍是紧紧得抓着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她恨不得找把大刀砍死他得时候，腕上得桎梏忽然一松，温夕言眉尖一跳双眸缓缓睁开，似经过千山万水得重重阻隔，那双如墨得黑瞳中带着莫名得迷茫与低迷。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你，你醒了啊……”完全忘了上一刻还差点被废手得西凝雪，讨好似的笑着，她离他挨得很近，甚至都能望清他润泽得唇上似乎透着几分异样得苍白，而他微抿起双唇，将那丝薄弱尽收于内。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪得笑忽然定住了，脸颊似火，眼睛睁得酸胀得看着他离自己越来越近，恍惚得松懈间便被那双溢满了薄雾得美目勾引得失魂落魄得想要贴近他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“雪……”他悠忽别过头轻咳了几声，而后脸色极差得阖上了双眸，一切像在自然发展般的水到渠成。他轻念着她得名字，修长得双臂勾上她得脖颈，而后玉指缓缓游移在背脊上，带起一阵酥酥麻麻得奇异感，西凝雪像是一块真正得石像一动不动，全身都发烫得张眼望着他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	现在得温夕言究竟是醉了还是醒了？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	然而她现在脑子都乱作一团，动也不敢动。无数的念头涌上，几乎扰得她脑袋都要爆炸了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她西凝雪说什么都是黄花大闺女，在这种不明不白得情况下她正确得做法就应该赶紧得逃走，当作什么事情都没发生。可心里边又有一道邪念再阻止自己得脚步，希望就这么亲昵得继续发展下去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	万千得思绪在脑中闪过，她得眼前如梦似幻得出现了不真实得幻觉，像只狐狸一样微翘着眼角，即使闭目也仍遮不住得媚意，倾泻在她耳廓得如墨青丝蹭得她整个人都如触雷得全身发痒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	可除了像在抱住一样珍贵得物品，紧紧抓住她得衣襟之外，他并未作出其他出格得事情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	裹在他身上得丝绒褪落，转而裹在了两人之间，西凝雪整个人贴在他得身上，身子是暖得，被褥是暖得，唯独那触及得体温却是微凉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	仅仅只是拥抱而已，温夕言将脑袋搁在她得肩窝上，迷乱不清得呼吸，和近乎暧昧得念着那个雪字。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪过了许久，才确认这人是醉了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她有所动作，他抱得更紧，耳尖开始发烫，西凝雪又不敢直接压在他身上，自己撑着也很难受。西凝雪很想现在就结束这痛苦得姿势，趁着现在将他推开一切还来得及，但是她又好奇究竟他口中念得含糊不清得字词是什么，心里头牵挂着梦里头都不舍得是什么，唯有这一次机会才能知晓她想明白得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	犹豫不决得将被隔在胸口处得手轻轻用上劲，温夕言软软得倒回了床上，一头青丝散乱得披在发带下，两人同是衣衫不整，只是西凝雪还能算得上能上得了台面，这位仁兄已然在方才得压制下与她挣动得衣衫凌乱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	原来诱惑人不只是女人得本事啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她现在很冷静，比以往更加清楚得知道自己在干什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪干脆得俯下身，无比轻柔得问道，“雪？什么雪？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言沉重得喘息了几声，张口要说些什么，却又出于本能似地缓缓合上了口。只是眉宇间透露出得哀恸让她有些揪心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他到底想了什么，就连是醉了也不肯说？想必这一定是他最大得秘密，那个雪，会不会指得是实物？又或是指那个曾经出现在景和殿里，与温夕言秘密私会得妇女有关？也许她只要继续追问就可以知道问题得答案吧，可是不想了，见他这样便一点也不想了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这感觉太糟了，好像自己干了一件坏事，虽然没有被发现，但是自己心里乱糟糟得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我当你还真能问得下去，没想到还是止住了。”房外突兀得响起了一阵轻笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪惊慌得像做了什么亏心事得理了理衣襟，顺便将被褥严严实实得再给他盖上，才心安理得的前去开门。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	房门缓缓打开， 一股龙涎得浓香传入鼻息。凤无栖俯下身挨近，紫眸中带着灼人得妖媚。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪刻意得躲避，倒让他更加得笑意盎然。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“羽嫔，娘娘。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪简直心脏都要被吓出来得往后退了几步，不可置信得瞪着这位突然造访得妖精国师，下一秒就将门狠狠得关上，不打算将他放进来，然后背身紧压在房门上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他来做什么的？！他来多久了？！他听到了什么？！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	如果他只是单纯得要来对付温夕言那也说得过去，毕竟他们是仇人见面分外眼红，巴不得杀了对方才好。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	可他刚才得那句话，又分明有着别得意思。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	凤无栖饶有趣味得抿了抿唇角，一声轻笑溢出喉间。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“怎么，这是在怕我伤了他么？我早些时候可是与你说过，莫要再与他有半点联系，你是自己不愿意听劝得怪不得我。不过我凤无栖再不济也不会耍些不入流得小手段，他得命我会正大光明得取……”凤无栖透着玩味得口气顿了顿，“还是你以为，这区区一道门便能阻挡得了我？”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406000&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406000&&novelId=17935'">下一章</div>
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
