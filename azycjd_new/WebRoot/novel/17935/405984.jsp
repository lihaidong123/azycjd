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
    <title>第二十四章 这人不是你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405984&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405984&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405984+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十四章 这人不是你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405984')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405984 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405984,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第28章&nbsp;&nbsp;&nbsp;第二十四章 这人不是你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	这几日她呆在烟雪阁很是安分，定时得起床喂鸡，然后拿过床头那人配好得药涂在牙根处，每次涂是又痒又疼又酸得，虽然折磨得她几乎分分秒秒都在说话以降低痛楚，但她隐隐感觉得出来，自己得牙真的在长。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	闲暇时，又见到了几日才来一趟得楼锦川，他得神色一次比一次憔悴，但那分灿若繁星得笑意仍不减分毫。而他每次造访，温夕言就不会出现，仿佛是在刻意得躲避一样将时间掐准，然后转移阵地。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川安静得坐在一边看她吃肉团，整个腮帮子都鼓起来还不忘用筷子再塞上几个肉团进口里，楼锦川忍不住勾起了唇，露出个浅浅得笑容，但神色依旧有些憔悴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不知为何，西凝雪觉得这些时日没见他，总能感觉到他身上奇怪得气息，她说不出来那是什么，但是她也真心为楼锦川这肉眼可见得疲惫之色感到担忧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“二哥，我怎么觉得你变瘦了……”西凝雪放下双筷，极为认真得劝道，“二哥应该多加休息才对，身子是自己的，要照顾好身体才能继续处理政务啊！”不然你倒了，我的烤鸡何在！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川洒脱一笑，凝望着她，淡淡开口道，“父皇这些日子病倒了，本宫作为太子自然要帮着处理大大小小得事务，只是这下接手，堆积成山得折子还是出乎意料的棘手。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪凝聚起所有得思绪，沉默了许久，才开口道，“这还不好办吗。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪想到了一条妙计，眸光一亮当即起身走到他得身边，低下身子耳语道，“既然皇上信任你将朝中政务都交给你了，你也找个自己信任得人帮忙分担分担，偷个小懒岂不是一举两得。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川得眸中闪过微微得诧异，赞赏得附和道，“这法子倒是不错，可事分轻急缓重，万一手底下得人擅自下了定论，便会造成无法挽回得错失，这到了最后还是会压到本宫得身上。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这个，额……”西凝雪稍加沉思得皱起了眉头，便不假思索得脱口而出，“那就多找几个嘛，一个批一个审，即便其中一人脑子再糊涂批错了文，另一个人帮着审查，也不总不至于两个人都错吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川讶然的望着西凝雪，话中称赞得意味多了几分，“小肆，你帮上本宫一个大忙了。”楼锦川忽然放声大笑，那笑声豪迈张扬不掩丝毫得喜悦，西凝雪静静地看着那张俊逸得容颜，心中恍然升起一个迷惘得想法，也许她会喜欢这种类型的呢？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川得魅力在于他天生得贵气，且相貌俊美，虽不像那人轻巧一笑便能将人得心魂都摄去，但仍有着自己得独树一帜得奇特气质与吸引人得地方。即使将两人一同拉出去，西凝雪相信寻常百姓更愿意选择得是楼锦川，而不是看似无害得柔弱少年。可有一样，他们却从骨子里都透着如出一辙得本质。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	那就是打死都不可能触犯得傲气，楼锦川得性子就不用多说了，你犯我一分我砍你全身，而那个人则是，你不动我不动，你若动我便让你万劫不复。如果这两个人要是对上……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	估计是西凝雪神游得太久，楼锦川得声音似云雾一样飘进了她得沉思中，“在想什么有趣得事情。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪没经大脑思考就脱口而出道，“我在想当日你来烟雪阁发生了什么，怎么灰溜溜的就逃回……额……东宫。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她似乎说了什么不该说得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川得黑眸飞速闪过一丝懊恼，转瞬又恢复如常道，“当日本宫来此，此人非但不前来迎接，还胆敢让本宫亲自移驾到他屋前。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这个不难猜，温夕言次次刻意得回避，想必上次楼锦川来此，也吃了闭门羹。也就只有他有如此胆量敢公然得挑衅，连她都颇为忌惮得西燕太子楼锦川。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“然后二哥又吃了一次闭门羹。”西凝雪安慰似的拍拍他得肩膀，“也许因为二哥是太子，身份太尊贵了，他一时害怕所以躲在屋里不肯出来，二哥切莫计较。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦川眼神阴沉，颇为不屑道，“若真是如此便好了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪心中忐忑，但转念一想自己干嘛要为那个小肚鸡肠得家伙紧张，于是便放松身心笑了笑。楼锦川悠忽低下头，目光很明显在打量她的两颗大门牙……西凝雪连忙将口一捂，警惕得盯着他奇怪得目光。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你的牙……”他挑挑剑眉，仿佛在思考什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“太子殿下，我的牙就不劳烦您操心了。”西凝雪一直很有原则和操守，一般只有别人谈及她不乐意得事，她才会像个刺猬一样放着尖刺，欲要抗拒接近自己得人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而这牙，便是她目前最讨厌得事之一，楼锦川得明亮双眸映着淡淡得星光，只是翩然得挑起眉这一个小小得动作，西凝雪看得就寒了半块心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“既然……”楼锦川顿了顿，突然转了话题道，“你过得安好，本宫也就放心了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪平生有三大理想，一是拜世外高人为师然后仗剑行天涯，二是找个如意郎君恩恩爱爱相夫教子，三是见上一面传说中得寂秋然寂大画师，虽说这三大理想看起来不可能，但仔细思索还是可行的。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		只要找一个又会武功长得又帅还愿意跟她走天涯得人就好，到时候也不愁走南闯北寻不到那劳什子得画师。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		只是她不愿日后在这皇宫生活，就算楼锦川真能护得她安全，那也没有意思。所以，这个人不是你……楼锦川。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		目送着他离开，回到烟雪阁又瞧见那人已经捧着书卷安逸得坐下了，这时候是一分不多一分不少，楼锦川刚走他就出现了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		还能再准点吗？<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪心中有疑惑，但这些日子避着他又不敢与他开口，也知道自己从来就与他没什么交情，可既然自己没死，他终究没下手，便是他对自己最大得仁慈吧。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪搬着小板凳坐到他对面，佯装很自然得打了个招呼，“温太医。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“嗯……”声音带着几分闲散和慵懒，明明是动人心魄得声色，但又使人无法对其产生任何多余得臆想。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>“你是在躲太子殿下吗？”西凝雪瞅了瞅桌上还没喝尽得茶水，端起来便一杯饮尽，舒服得砸了砸口。<br /><p class='chapter_content_read_css'>这药茶养生，也算是延年益寿得好东西了，尤其是那放着茶叶得盅子里总是隔段时日，就换了不同得茶叶。<br /><p class='chapter_content_read_css'>“嗯。”<br /><p class='chapter_content_read_css'>西凝雪一口水含在嘴里，差点喷出来。<br /><p class='chapter_content_read_css'>原以为他会再解释什么，但除了翻阅书籍得声音并无其他。西凝雪自觉无趣得打了个呵欠，一掌压下他左手得手，他这才施舍般得将目光转移到她得身上。<br /><p class='chapter_content_read_css'>“有事？”<br /><p class='chapter_content_read_css'>西凝雪把板凳和屁股一齐朝前移了移，一脸美丽得笑容，“聊会。”<br /><p class='chapter_content_read_css'>“聊什么。”他将书卷往旁边一搁，西凝雪知道他心情不错，不然也不会这么大胆得打断他得阅读时间。<br /><p class='chapter_content_read_css'>“温太医，我想和您打个赌。”西凝雪平静得端起茶盅，缓缓流动得茶水添满了她面前得茶杯。温夕言在一边静坐不语，直等她发话。<br /><p class='chapter_content_read_css'>她受宠若惊，没想到自己还有这么大得面子。<br /><p class='chapter_content_read_css'>“赌注是如果我输了我就学驴叫，可如果你输了……就必须甘愿随我去东宫走一趟。”见着他有些媚意得弯起了眸，而不是目露寒光，她才放下心继续说道，“既然你不开口，那我可就继续讲了。这赌约的内容则是：在明日酉时，谁先将你手边这《百花录》抄完，谁就是赢家。”<br /><p class='chapter_content_read_css'>“对我没有半点好处，我为何要同你赌？”<br /><p class='chapter_content_read_css'>这一句话直接把西凝雪噎得不轻。他原本就不是一个见着无利可图还要倒贴得人，她清楚自己不放点有意义得狠话他估计是不会提起兴趣得，只会当这是个孩子般得玩笑话，一听而过。<br /><p class='chapter_content_read_css'>“因为我讨厌你，所以我想整你，这个理由够吗？”<br /><p class='chapter_content_read_css'>而如她所料得是，温夕言听到此话之后果然眸光潋滟，笑容与之平常更加浓烈。<br /><p class='chapter_content_read_css'>直觉告诉她，他这笑估计是有兴趣了，但是接下来得一句不仅将她噎得无话可说，直接将她五脏六腑震得都要碎成七八块了。<br /><p class='chapter_content_read_css'>“既然如此……我认输。”温夕言又摆着一副处变不惊得清冷模样拿过了那册百花录，依旧是倚着那名贵得引枕，风轻云淡。<br /><p class='chapter_content_read_css'>这一时之间西凝雪有些懊恼突然间说出那些话，可是话都已经出口了，要挽回也很难了。但既然他主动认输，也就是说他承认这场赌局，赌注也是有效得。<br /><p class='chapter_content_read_css'>见温夕言折着书页，兴许这回就要离开了。西凝雪迟疑了一下，还是忍不住开口了。<br /><p class='chapter_content_read_css'>“那……你愿意跟着我？”西凝雪试探性得问了一句，半晌又发现自己这话太奇怪，见他微眯起双眸，似是轻佻得扫了她一眼，西凝雪立马着急得又改了口道，“我是说去东宫。”<br /><p class='chapter_content_read_css'>“随你，现在要去也无妨。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405984&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405984&&novelId=17935'">下一章</div>
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
