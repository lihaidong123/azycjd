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
    <title>第四章 我跟你不熟</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405580&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405580&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405580+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四章 我跟你不熟]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405580')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405580 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405580,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第8章&nbsp;&nbsp;&nbsp;第四章 我跟你不熟
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪苏醒时已经是日上三竿了，头还沉着，身子还酸痛着，勉强睁开眼便看见了一脸焦急的伏婳，她想坐起来打招呼，但身子乏力得紧，努力了半天只能乖乖躺着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“雪儿！雪儿你总算是醒了……”伏婳惊喜的敛了愁容，蝉露秋枝的可怜表情让西凝雪无端端升起一股暖意，真好，自己还有人疼、有人爱，多久了啊……自从锦纤哥哥去驻守，慕容瑶渺无音信的消失。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姐姐你去哪了，等一晚都没见到你人。”原本想多说几句，但喉咙处如火烧一样干哑难受。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“本来昨日我是要早些回来的，但货物丢在了邻镇，我不得不折回去，却没想到让你担心了这么久，还好楼公子寻来大夫给你看病，这会儿啊……还在隔间忙着给你熬药呢。”说这话时，伏婳的面庞露出了少有的羞赧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪看的明白，楼小二虽然不是她喜欢的类型，但楼小二为她又熬药又不眠不休的陪了她一夜的体贴，肯定是把姐姐吸引住了，也好，如果是楼小二的话，她还能勉勉强强接受，把伏婳交到他的手中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪想了一会儿，苍白虚弱的面上挤出一丝笑，“那姐姐替我谢谢他吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	二哥啊二哥，现在你可是把我伏婳姐姐的心都勾走了，你又要拿什么来赔呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	伏婳轻轻开口道，“这是自然，你也要早些养好你的病，不然啊，姐姐新学的菜式你可就尝不到了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪乖巧的点头，放心得的闭上了眼休养生息。伏婳把她的手脚也一并掖进了被中，然后打算出门让西凝雪休息，正巧楼小二刚熬好药，两人相视一笑，仅在门口擦肩而过。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼小二走到床榻前，便紧锁住眉头。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“肆弟？”他用手抚过她的额前，一片滚烫。西凝雪直想着休息，便由着他碰了几下，楼小二却苦于该怎么喂药。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	早上好不容易才喂了点，西凝雪觉得口中苦涩便吐了出来，反反复复多次才喂进一点，若这回也是如此，她的病可好不了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正在迟疑楼小二在做什么，西凝雪还是从万难中睁开了眼，楼小二含着药靠近的动作停下了，一张俊美的脸庞就这么毫无防备的映入了西凝雪的眼帘。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	两人同时一怔，先是西凝雪回过神苦笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“二哥……你做什么。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“醒了？”楼小二笑道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她原想是休息得，可现下已经睁眼，也不好不承认了，“早就醒了，不过脑子还发热就又休息了会。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“先把药喝了吧。”楼小二神色自然的将黑黄的汤药匙凑到了她没有半点血色的嘴边，西凝雪任性的扭头，“我打小就不喝苦药，你也不用喂了，这点小病小痛对我没有影响得。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那也不行。”楼小二紧蹙的剑眉映着几分责备的意味，“这有病不吃药怎行，早吃早点好。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪皱紧眉头，心里头诅咒他祖上十八代。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这就是她讨厌楼小二的地方，她都说了不想喝，楼小二却执着的要命。好似在看待一个可以任他摆布的人偶一样，她对这种人向来都是厌烦的，尤其是楼小二这种猜不透心思，反而有时候还会被他无意的目光盯的浑身都不自在，都是她悚然的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过本姑娘现如今没力气跟你争辩，喝就喝吧……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼小二见她不再还嘴，乖巧的一口一口喝着他喂的汤药，不禁有了几分欣喜，像是对待珍宝一般动作轻柔的拂去西凝雪嘴角湛下的一滴药汁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我睡了。”西凝雪翻过身，面向墙盖好了被子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼小二将瓷碗向台上一搁，本还想查探一下她的情况，西凝雪用被子把自己捂得紧紧的，他则是无奈的叹了口气，一言不发的坐在了榻上，嘴唇轻抿着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	想不到他竟为一个男子如此耗费心神，更甚，这男子偏偏还不知道好歹的推三阻四，这叫人怎不恼心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但想想普天之下又有谁敢如此对他，他现在觉得期待的是，如果宁小肆知道了他的真实身份又会有何不同，是一如往常的怀着三分戒备与他相处，还是如那样阿谀奉承老一套的宫人一样。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	又在吟风楼里躺了两三日，西凝雪的温病这才好得差不多，穿上了外衣，执起了白扇，又变回了风流倜傥、玉树临风的宁公子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼小二也似个闲人一般陪着她一起干耗着，她躺着他就坐着，她坐着他就站着，偶尔起床气犯了就朝他怒骂一句，那张比城墙还厚、比花朵还美丽的俊脸依旧带着笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	艳阳天、艳阳天，今个儿又是艳阳天啊……一边在心底嘀咕着，一边走出了吟风楼，躺的快要发霉的身体总算接触到暖暖的日光，就像她此刻的心情，从阴郁转成了舒畅，这是多久没有接触到阳光了啊，感觉一日不出门头上就要长草，两日不出门身子变成了大树，三日就直接变成了腐朽的树干，幸好没有第四日，不然她就算冒着病犯也要出门晒太阳一趟。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“想什么呢。”楼小二从后方踱来，在她身侧停住。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我在想今日要回府的事，今日一别，日后恐怕不能再与二哥闲逛了。”西凝雪已经打定主意要回去了，也就意味着要和楼小二分别，也许以后都不会再相见了，在她看来，的确如此。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她可没什么想跟人称兄道弟的情谊，于自己的非美勿扰的原则是肯定看不上他这样虽然俊朗但是海拔很高的男子，于姐妹的情分楼小二还是伏婳姐姐预备着的优良夫婿，她就更加不能招惹了。总的来说千言万语汇成一句话：楼小二，我跟你不熟，还有，男女有别。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	出乎意料的是楼小二并没有因此而有什么惋惜的表情，只是弯眸，眸中透着捉摸不透的深意，“也好，我正巧也要回去一趟。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那肆弟就在此别过了。”西凝雪以手作揖就转身回房了，临走之前向伏婳姐姐辞行还是必要的，伏婳一见到她来就露出担忧的神情，“雪儿，你身子好些了么，怎么这就起来了啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我都在吟风楼休息几天了，再没好就该变成瘟病了……而且我修养得这些日子，爹娘都该在府中等急了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“也是，你该早点回去别让府中的人担心才是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪赞同得点了点头，然后转到了伏婳的身边，“姐姐，我替你打探了一番，这人的确挺好，既不爱酒也不爱赌，像这种打着灯笼都难找的，姐姐早些收了才是正道。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“开什么玩笑呢。”伏婳羞涩垂首，依旧不温不火的，“我与楼公子之事又不是你情我愿，就算如当我对他有了意思，可……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“没关系，来日方长……他日后做客吟风楼还愁没机会勾搭吗。”调笑的向伏婳眨眨眼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	伏婳又是好笑又是怨道，“少多嘴，回你的府去。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪洒脱一笑，行了个作揖的礼就出了房间，她知道伏婳姐姐会在窗口站着目送她出吟风楼，但她也不能生出半点留恋，不然一心软又和伏婳姐姐呆上一天，回去可就不好交代了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	至于楼小二，刚才那番离别辞后就不见了踪影，估计是家中真的发生了什么大事，不过既然是楼小二的事，她西凝雪自然也不会庸人自扰的把问题撇在自己身上思考，当下的问题应该是回府之后该用什么样的理由交代，记得上次好像用的是风筝掉到了宫外，追风筝追了几天几夜……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这次……烦躁的搓弄了一下自己的头发，“不管了，走一步看一步。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	任你水淹开封，我兵来将挡水来土掩，到时候随机应变一点总会想出办法的，抱着破罐子破摔的心思，用皇奶奶给的令牌，畅通无阻的回到了府内，不出她意料的是，二老也是一贯的等在大堂，西凝雪凝神屏气，然后挤出一张笑脸，“爹、娘你们回来了？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	更加让她惊奇的是二老只是默默的叹气，那两双无神的眸中映着深深的悲痛，西凝雪又开口叫了声，却没人应声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	隐隐约约觉得发生了什么大事，且一定涉及到她的大事。可是她最近的确什么坏事也没干啊，除了前些日子又去药园子里踩了几脚和不小心用石头砸到一窝鸟，可这些小事她是万万不会说的，爹娘又怎么会知道呢？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	万般无奈之下又违心的上前，傻笑着摇了摇老爹的袖子，“爹爹？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	老爹如同看到自己的银票被人丢进河里，然后又被人打了十巴掌一样的痛苦，却又立即转开了身子，沉闷的叹气，“唉……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“娘？”西凝雪拉了拉娘亲的袖子，结果娘亲什么话都没说，就着椅子往后一倒，掩嘴呜咽。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这到底是怎么了，谁死了啊，个个都一副丧气样。照理说她们西家亲戚那么少，把七大姑八大姨算齐了也不过就是十几个人罢了，可她的七大姑八大姨远在民间，和她们八竿子打不着一块，爹娘应该不会准备突然告诉她，她其实还有个哥哥弟弟什么的，然后那位哥哥弟弟如今回来了，然后要继承西家？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	思量无果之下问爹娘肯定是问不出什么了，灰心丧气的往屋里一坐，把小梅叫进了屋里，唾气问道，“府里出什么事情了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	小梅犹犹豫豫、吞吞吐吐，终是在她眼神威慑下招了，“今日老爷夫人刚从外边回来，就领到了圣旨，圣旨上说……皇宫选秀，凡是朝中十五以上且没有婚嫁的女子都要进宫。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“什么？你的意思是我也要去参加那个什么什么选秀？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嗯。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	怪不得爹娘这副悲痛的表情，感情他们辛辛苦苦养大的崽就要送进老皇帝的口中，能不悲痛能不像被银票扔进河里然后又被抽了十巴掌的痛苦吗，既然如此她可要想想法子逃脱掉秀女的份。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	坐在梳妆台前，思考许久的摸了摸下巴，终于想出了可行得办法，你欣喜得又将小梅叫了过来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小梅，把院子里的玫瑰和紫罗兰取几朵，还有给我找一只毛笔来，切记千万不要让别人发现了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“是。”小梅肩负重任的出门了，约莫一盏茶的时候，小梅焦急的把东西都堆在了桌上，好奇的问，“小姐，要这些做什么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“别多嘴。”西凝雪捻起了几片花瓣放进了茶杯里捣碎，然后用毛笔蘸取玫瑰的汁液，似繁星一样将其点在了洁白的脸上，然后又蘸了点紫罗兰的汁液，再点上了一层。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	眼见大功告成，西凝雪满意的将其擦掉了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“很好，到时候我就不信这宫里头的人还敢要我，哈哈哈……”西凝雪内心怅然的放声大笑，小梅以为她突然患上了失心疯，吓得直哭的拉了拉她，“小姐，您这是怎么了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哈哈哈，我高兴不成啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“呜呜呜，我怕啊……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪调整到正常得表情，白了小梅一眼，“我没事，你先出去，让我再好好考虑一下……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她一定要想一个万全之策，光是这一个办法，万一在还没有进宫的时候就被拆穿了，难免前功尽弃。所以她要想想该怎么面对自己计策失败后的结果。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405580&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405580&&novelId=17935'">下一章</div>
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
