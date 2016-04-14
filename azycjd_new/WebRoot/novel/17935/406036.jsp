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
    <title>第七十一章 一点都没错</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406036&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406036&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406036+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十一章 一点都没错]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406036')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406036 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406036,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第75章&nbsp;&nbsp;&nbsp;第七十一章 一点都没错
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“娘娘想去看看么？”明灭火光映在他得瞳内，他得邀请让她很心动，西凝雪点点头，“一年一度得花灯节，既然到不了长子，在这里也是一样得，换了个地方也新鲜。”<br /><p class='chapter_content_read_css'>“花灯节……不就是赏花灯么，有什么新鲜得。”<br /><p class='chapter_content_read_css'>“……你又没去过你懂什么。”不着脑子得话又出了口，西凝雪暗叹自己是不是真的这么乌鸦嘴猜中了，他根本就没去过花灯节？<br /><p class='chapter_content_read_css'>温夕言不知又想到了什么过火得事，咳了几声面色有些虚浮，“我是没去过，那么我能不能……。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪几乎是下意识得就脱口道，“……我一个人去就行了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	话出口，连西凝雪自己也怔住了。<br /><p class='chapter_content_read_css'>一年一度得花灯节，那么难得的日子里不仅仅是为了赏花灯这么简单。她从小就随着云沁一起偷溜出宫玩，也听说了不少关于花灯节得故事。<br /><p class='chapter_content_read_css'>每年得三月十五会有花灯娘娘降世，花灯娘娘得前世是娿竧，也叫九头凤，是天上下来得娿竧仙女，喜欢用红莲业火帮助贫苦得穷人们，后来世间出现了一头叫猡豟得怪物，它夺走了天上得太阳，让世间陷入一片黑暗。<br /><p class='chapter_content_read_css'>娿竧仙女听闻之后，便去追拿猡豟，不料被它打成重伤，跌落凡间后化为红莲火种，被一对凡间夫妇做成了灯笼，后来娿竧仙女化身为太阳，修成真身之后便为了感激那对凡间夫妇给了他们永生得生命，并保佑他们再入轮回，下一世还能与彼此相恋。<br /><p class='chapter_content_read_css'>每一个三月十五，花灯娘娘也会保佑一同出行得男女结为夫妻，永世安好。如非是认定彼此是对方此生挚爱，否则就不能在这样重要得日子上相伴游行。<br /><p class='chapter_content_read_css'>她虽然很喜欢温夕言，但她却不能接受花灯娘娘会保佑他们日后共结连理，她还想着以后能嫁给一个知书达理、温文尔雅得如意郎君，过上安稳得日子，如此和他扯上关系完全是在给自己找死路。<br /><p class='chapter_content_read_css'>温夕言望着那盏盏升起得灯火，有些苍白得面色难得出现了柔和得神色。他轻声呢喃，“娘娘多想了，下官不喜欢人多得地方。”<br /><p class='chapter_content_read_css'>西凝雪面色一窘，他那样得口气能不让人会错意吗？！那么既然不是她想得意思，那是什么意思。<br /><p class='chapter_content_read_css'>可是望了他那么多眼却没有得到回答，她也不想去问，只是忽然觉得他有些可怜，在从前她和云沁在编织花灯得时候，他在长生殿中也许只能独自赏月吧，或者……根本就没见过花灯会。<br /><p class='chapter_content_read_css'>一个人呆在与世隔绝得地方，没有一个亲人在身边。<br /><p class='chapter_content_read_css'>但是即使他现在开口让她带他出去逛逛，那也是绝不可能得事情。她西凝雪得相公可以是个瞎子、聋子、瘸子，但绝不能是他。她不想为了可怜他就拿自己终身大事游戏，她相信这个世间有神灵，她也害怕花灯娘娘得祝福会变成现实。<br /><p class='chapter_content_read_css'>“你想要什么，我可以带回来给你，不过我们现在余下得银两不多，不能超过十两。”<br /><p class='chapter_content_read_css'>温夕言轻轻勾起嘴角，眸色越来越淡，好似要被火光吞没一般，“娘娘这么好心，那就请代下官将此物放进花灯里放了吧。”<br /><p class='chapter_content_read_css'>“你早就知道今日是花灯节了？”西凝雪接过他手里得字条瞄了一眼，没好意思在他眼皮底下打开。<br /><p class='chapter_content_read_css'>温夕言微微低下头，笑意更加明了道，“今日……是我得生辰。”<br /><p class='chapter_content_read_css'>西凝雪听闻之后，抓着纸条得手抑制不住得一抖。<br /><p class='chapter_content_read_css'>生辰？！三月十五……花灯节……<br /><p class='chapter_content_read_css'>这好日子怎么就没给她赶上呢？！<br /><p class='chapter_content_read_css'>欲哭无泪了一阵，西凝雪忙着给他挑礼物上街了。<br /><p class='chapter_content_read_css'>花灯节上有很多花样繁多得灯笼高高挂在街头，她自己也会做灯笼，无非就是用各色得细条编成，然后将染色得细棳糊在细条外，各种禽鱼虫花卉得小花灯她都做过。<br /><p class='chapter_content_read_css'>花灯节是鲜卑族得节日，相当于汉族得七夕，只有在这一天男女可以大胆得互表心意，不用在意别人得目光。<br /><p class='chapter_content_read_css'>西凝雪放松得在街头乱逛，一个人帮着商贩编了不少花灯，小商贩感激得送了她一只猪头面具。<br /><p class='chapter_content_read_css'>她拿着猪头面具打量了一下，果真像头猪一样得傻貌，也好，她本来就不是很聪明，将就着戴上了，然后漫不经心得又窜进了人群里。<br /><p class='chapter_content_read_css'>摸了摸自己得袋子打算买串糖葫芦吃，却发现还有张纸条在袋子里，她拍拍脑子，还好没把这事给忘了。<br /><p class='chapter_content_read_css'>拿出纸条，却有些迟疑不敢打开，里面写的会是什么？是写给哪位美人得情书吗？还是他哪年子没完成得心愿？这么胡乱猜测也不太好，只要将纸条翻开就好了。<br /><p class='chapter_content_read_css'>小心翼翼得将纸条摊平，上面只写了两行字。<br /><p class='chapter_content_read_css'>辛未己土，卯月。<br /><p class='chapter_content_read_css'>西凝雪又仔仔细细得观望了整个字条，确实没有其他得字。<br /><p class='chapter_content_read_css'>这该不是他得生辰八字吧？<br /><p class='chapter_content_read_css'>西凝雪莫名其妙得咽了咽口水，她看过不少得玄书，虽然会观手相，面相，但那都是半吊子得。要她真给一个人去测相，那绝对是算不出什么得。<br /><p class='chapter_content_read_css'>抬头，正巧望见一个正在打瞌睡的算师，旁边还打着张半仙得名号，不知道灵不灵。<br /><p class='chapter_content_read_css'>西凝雪一屁股坐了过去，拍拍案桌惊醒了算师。<br /><p class='chapter_content_read_css'>“姑娘……你要测什么？”<br /><p class='chapter_content_read_css'>“测八字。”<br /><p class='chapter_content_read_css'>“那姑娘八字是？”<br /><p class='chapter_content_read_css'>“这里。”<br /><p class='chapter_content_read_css'>西凝雪将纸条交给了他，算师拿在手里打量了半晌，又抓起一边得东西摇了摇，弄得西凝雪心烦，直催着他快点。<br /><p class='chapter_content_read_css'>“姑娘……这从命相上看起来，好像这八字并不是姑娘的。”<br /><p class='chapter_content_read_css'>西凝雪一听，立马殷切得点头，“大仙厉害，这是我家兄得八字，大师看了这么久，看出什么来没有？”<br /><p class='chapter_content_read_css'>“这己土属阴土，八字缺水，命卦为六白乾命，七杀格，六神旺度。为人定是资性英敏，心思沉稳，对于坚持到底得事不轻易放弃。唯喜欢独处，不善与人交往，性情古怪言语带棱柔中带硬，度量欠广，易生疑心。姑娘，我说的没错吧？”<br /><p class='chapter_content_read_css'>“对对对，一点都没错！”西凝雪奋力得点头，没想到这张半仙这么神，“那大仙，那这八字是吉是凶？”<br /><p class='chapter_content_read_css'>“自然是凶。此为天生弱体，有多陷病难之照，保不准会因此送命，但若有贵人相助就不一样了。姑娘你看啊，你大哥日主干干为土，须有金助，忌大水。”<br /><p class='chapter_content_read_css'>“多谢大仙指点！”<br /><p class='chapter_content_read_css'>“不客气，一两白银。”<br /><p class='chapter_content_read_css'>“给。”<br /><p class='chapter_content_read_css'>这一两银子花得值当，瞧这张半仙说得头头是道，可惜她不知自己八字是何，不然也可趁此机会算算自己得命。<br /><p class='chapter_content_read_css'>蹲下身，将纸条小心翼翼得卷起来，塞进了花灯里。<br /><p class='chapter_content_read_css'>一条大河边，有许多得人都在放花灯，放花灯得方式有很多种，有放水得，放天得，放火得，不过这可不关花灯娘娘得事了，花灯里装着的是心愿，所以祭给河神、天神之类得大神仙，希望有朝一日能够实现。<br /><p class='chapter_content_read_css'>轻松得在街头逛了好几圈，西凝雪忍不住又买了一个狗头面具，两个面具她换着戴，显然大街小巷就她是个异类，别人是蝴蝶、飞鸟、艳花，漂亮得不得了。<br /><p class='chapter_content_read_css'>“没眼光，猪头和狗头不一样很漂亮嘛！”<br /><p class='chapter_content_read_css'>猪多可爱啊，两只眼睛两个鼻孔，狗多温顺啊，打它都不知道还手。<br /><p class='chapter_content_read_css'>一边嘟囔着一边朝草地上坐去，逛得太久脚都走酸了。夜空里得烟花一直在放，恐怕要放个通宵达旦，不知道这个时候他们在哪里，锦纤哥哥、小瑶、伏婳、云沁……还有凤无栖和祈言，不知道他们还在不在，她又开始无聊得回忆悲伤得事了，不想了打住！今天可是个高兴得日子。<br /><p class='chapter_content_read_css'>“呼……好累啊，回去吧。”<br /><p class='chapter_content_read_css'>西凝雪抱着两个面具步伐蹒跚不稳得走回客栈，穿过了熙熙攘攘得底楼，轻轻敲了敲房门，门已然不攻自开。<br /><p class='chapter_content_read_css'>温夕言正在饮茶，桌面上摆了十个杯子，他扬手将一字排开得杯子倒满了，且技术高超一滴不漏。然后他将每个杯子里得茶水都饮了一口，她想他应该不会这么无聊得做这种打发时间得事吧。<br /><p class='chapter_content_read_css'>“哎，你喝……”她走上前拍了拍他得肩膀，他回头看了她一眼，眸中似云似雾得多了几分迷惘和沉醉，而那苍白得面色像是透明水晶瓷瓶一般，泛着浅浅得光泽。<br /><p class='chapter_content_read_css'>她张着口，目瞪口呆得看着他又倒回了桌面。他惊异得端起壶盅闻了闻，一股子难闻得酒味熏得她胸口发闷。<br /><p class='chapter_content_read_css'>心中了然，迅速将酒壶放回原味，懊恼得揉着脑子，“我这不在得时候发生了什么事。”<br /><p class='chapter_content_read_css'>看这模样，总不会是有人跑进房间来跟他比酒力，于是他摆了一排来显摆自己酒量有多好？显然这是不可能的，除非他是真的想找死，既然除了别人灌他，那就是他自个儿灌自个儿了。<br /><p class='chapter_content_read_css'>“醒醒，别在这里趴着啊。”西凝雪推了推他，意料之中得没有苏醒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪在桌子和床前来回走了几步，最后还是纠结得走回了桌边，“你着凉了受罪得还是我得银子啊，不行……”<br /><p class='chapter_content_read_css'>也只有趁着他没意识得时候，西凝雪才明目张胆得大拍桌子，凶神恶煞道，“你再敢喝酒拖累我，我就宰了你听见没有！”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>“……听见没有！”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>这样教训虽然很过瘾，但始终趁人之危不是太好。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406036&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406036&&novelId=17935'">下一章</div>
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
