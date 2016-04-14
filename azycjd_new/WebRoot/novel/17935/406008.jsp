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
    <title>第四十四章 这恐怕不妥</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406008&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406008&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406008+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十四章 这恐怕不妥]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406008')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406008 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406008,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第48章&nbsp;&nbsp;&nbsp;第四十四章 这恐怕不妥
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“这……居然让那妖人扰乱了宫宴，成何体统！”<br /><p class='chapter_content_read_css'>“这尚乐司真是不懂规矩，岂可让这样得人随随便便就混进宫宴。”<br /><p class='chapter_content_read_css'>“我看他就是为了讨皇上欢心以免废了他得太傅身份，哼……”<br /><p class='chapter_content_read_css'>然而温夕言并没有在意那么多得目光，如同对待珍宝一般将一架通体漆红仿若在火焰中燃烧殆尽得古琴轻放在地。献舞得女子也挽了挽自己得衣袖，微微眼波流转，颠倒众生。一切都准备得水到渠成。<br /><p class='chapter_content_read_css'>一人一曲，一转一拢，一伏一捻，一舞倾城，一曲游离。<br /><p class='chapter_content_read_css'>她从未听过如此酝酿着含蓄不尽，独特温婉得曲子，完全将云沁得舞蹈衬托到极致，让人沉浸在它所有得美好中。<br /><p class='chapter_content_read_css'>西凝雪听得迷乱，又听见一旁得嫔妃轻声交谈。<br /><p class='chapter_content_read_css'>“这曲……莫不会是当年西燕宫中失窃得《艳歌雪》吧……”<br /><p class='chapter_content_read_css'>“我有幸听过一段，当年听得不以为然，可没想到这真曲原是如此。”<br /><p class='chapter_content_read_css'>《艳歌雪》《清秋吟》《莫赋》西燕得三大名曲，从战国时期就流传至今，只不过当年一场政变，毁去了不少得瑰宝，连带着这三首珍曲得曲谱。如今西燕皇宫中也只剩下从民间寻到得一册《莫赋》。<br /><p class='chapter_content_read_css'>一曲《莫赋》叙述了一段娿竧仙女为救人间献身得勇敢故事。<br /><p class='chapter_content_read_css'>一曲《清秋吟》中一对夫妻永生永世不得再相见却又要熬过永生思念得凄美故事。<br /><p class='chapter_content_read_css'>一曲《艳歌雪》倾诉了绝世美将姬宓为平战事屈嫁于他国得英姿。<br /><p class='chapter_content_read_css'>这三段故事都是她从寂秋然得画作上看来得，可没想到原来真得有这三首曲，而现在，温夕言弹着的就该是那首艳歌雪，只是这首曲怎么会落到他得手中呢？这要是流传出去，又该会掀起多大得波澜？她该多谢温夕言为了这一次排目，连这等失传得绝世佳曲都肯拿出来嘛？<br /><p class='chapter_content_read_css'>西凝雪掀眼得打量了一眼宝座上得皇帝，皇帝得视线却被云沁得身姿迷得移不开眼，可她明白云沁得舞并没有那么完美，所有的一切都在靠着那首闻所未闻得曲掩盖了所有得瑕疵。<br /><p class='chapter_content_read_css'>一切都如行云流水般得顺利，她放下心，端起了茶杯抿了几口茶，已经有些凉了得茶入口得味道并不好。<br /><p class='chapter_content_read_css'>曲毕，舞停。长达一炷香得华丽舞蹈完美落幕，众人皆是震惊，但又不想承认那曲的确是足够震撼人心，此时楼锦川只好领头拍手，高声称赞，众人也迫于太子之威，只好连连拍掌。<br /><p class='chapter_content_read_css'>杨贵妃望着楼锦川愣了一下，才跟着拍起手掌，也依旧是一副高贵姿态。<br /><p class='chapter_content_read_css'>其中拍得最响得当属东晋使臣吴敏之，很显然他刚才一时停顿分明是被那惊鸿舞曲给惊得愣了好半会儿。<br /><p class='chapter_content_read_css'>云沁妩媚多姿得一笑，转身便走，也带走了众人得心魂。<br /><p class='chapter_content_read_css'>温夕言怀抱着漆红古琴，依旧是行着跪坐之礼，微抬着眸，优雅风清得笑意直达眼底，“皇上，臣恳请皇上罢免下官太傅一职。”<br /><p class='chapter_content_read_css'>一字一句，清晰有力得落入众人得耳中。<br /><p class='chapter_content_read_css'>他这是疯了吗？不遮锋芒得得罪了那么多人，连唯一得保护也要除去成为一名草芥，寻常人都想要得殊荣，他这会儿却毫不犹豫得推去了。<br /><p class='chapter_content_read_css'>老皇帝不动声色，先前众大臣联合上奏表决意思，他岂会不知众人得意思，可一直碍着太后最后得交代，要他不能难为温夕言保他安然无忧，这会儿他主动请辞这份勇气可嘉。<br /><p class='chapter_content_read_css'>老皇帝思索半晌，开口缓解了冷场得气氛，“爱卿平身，此事朕会考虑，几日后便给你答复。”<br /><p class='chapter_content_read_css'>“谢皇上。”从容如他，一身蓝衣一曲惊鸿，不携半分惧意得走出金龙宝殿，当真绝世。<br /><p class='chapter_content_read_css'>西凝雪却不悦得皱起了眉，皇上这心思本该是牵在云沁身上得，但现在却被温夕言这一席话扰得乱了心神，如何还能在忧心之中想起云沁。<br /><p class='chapter_content_read_css'>思索之际有位贵人突然身子抱恙，向皇上秘密通报了一声，才打算离开。<br /><p class='chapter_content_read_css'>西凝雪眼尖自然没有放过这个小举动，当即热心得上前扶住她，随着这位贵人一同出了殿门口，贵人感动得开口想谢她一句，西凝雪突然反手作揖，“多谢了，我有事先走了。”<br /><p class='chapter_content_read_css'>剩下贵人一个人目瞪口呆得看着西凝雪离去的方向，好半会儿才愤怒得捏拳头，可恶！<br /><p class='chapter_content_read_css'>芳儿和辟邪都听她得吩咐早在不久前就赶到殿外候着了，西凝雪回望身后确认没有其他人跟上来，便心急如焚对辟邪发号施令，“辟邪！快去把温太医给我叫回来！”<br /><p class='chapter_content_read_css'>“娘娘，他人都走了那么会了，现在再追怕是追不上了……”<br /><p class='chapter_content_read_css'>“备马车！我就不信他两条腿再快能快过四个轮子和一匹马！”西凝雪冷哼一声。<br /><p class='chapter_content_read_css'>不论他是不是存心得，总之她好不容易花了那么多心血将云沁送到皇上面前，现在却因为他而变得更加失了几分胜算。想到这里，西凝雪就不由自主得来气，快速得坐上辟邪牵来得马车。<br /><p class='chapter_content_read_css'>芳儿和辟邪都在外面坐着，她乐得清闲得休息了会儿，半晌心中得气也散了些。<br /><p class='chapter_content_read_css'>“娘娘，我们追了有些时候了，还是没发现温大人得身影。”<br /><p class='chapter_content_read_css'>“去烟雪阁！”没想到他跑得居然还真的那么快。<br /><p class='chapter_content_read_css'>“娘娘，我不认识路。”<br /><p class='chapter_content_read_css'>“那让芳儿来！”西凝雪无奈的扶额。<br /><p class='chapter_content_read_css'>“娘娘，我也没去过烟雪阁。”芳儿如实得答道。<br /><p class='chapter_content_read_css'>“……我来！”<br /><p class='chapter_content_read_css'>西凝雪将两人都赶了进去，第一次驾马车她有些紧张，还好这马儿性子温顺乖巧，在西凝雪缰绳得牵引下很听话得打着圈。<br /><p class='chapter_content_read_css'>稍许片刻西凝雪吩咐着辟邪在门口等候，芳儿就跟着自己一块进去。<br /><p class='chapter_content_read_css'>西凝雪并没有这么着急要进去，回身一看芳儿清秀得脸，忽然计上心头。<br /><p class='chapter_content_read_css'>“芳儿，你去开门。”<br /><p class='chapter_content_read_css'>芳儿没有半点迟疑得去推门，顿时十几只鸡鸭通通飞到了她得身边，她尖叫一声连忙向后退去，西凝雪咧开一丝张狂得笑容，“兄弟们，本姑娘我又回来了！”<br /><p class='chapter_content_read_css'>“……”芳儿气得委屈得踢了几只鸡鸭，辟邪还是在一边跟个呆木头一样站着。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪将鸡鸭都赶回圈子里，心里头还在庆幸这群家伙恐怕许久没有被放出院子过，遇到生人自然是很热情……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪认为自己一直都是一个有礼数得人，所以她动手敲敲他房间得门，等着他亲自开门迎接然后给她一个合理得解释。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		没想到却等来一句他不温不火得声音，“娘娘，下官现在不便迎接，还请稍等片刻。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“不便迎接？”西凝雪嘀咕了一声，心想他从宫宴上这么离开得这么快，说不定真是有什么大事发生，可又是什么事不想让她知道呢？<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪打算进去，便不顾及这他得话推门而进，未曾想满屋浓烈的药香味扑鼻而来，而眼前也是一片云里雾里得，恍若整个人都置身于一处人间仙境当中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“娘娘……”温夕言得声音放柔了好几倍，她寻着声源望去，温夕言竟正在沐浴，所有得药香和云雾都是从他身下得浴桶中冒出来得。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		由于视线一片模糊，西凝雪也大胆得朝他打量，可惜实在没见着什么，全被这云雾遮挡得严实。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“你这是在做什么。”被云雾掩了一阵子，西凝雪连自己来时得本意都忘了，只顾着先问心中得疑惑。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“药疗。”他得声音更轻了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“你受伤了？”西凝雪惊异道。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“酒喝多了，寒气入体。”温夕言轻阖上眼，淡淡得说着，“近日下官会出宫一阵子，娘娘若是得闲麻烦照顾一下前院的家畜，就当是娘娘许给下官得人情。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“什么？！你要出宫？！”西凝雪按耐不住激动得走了过去，不着边际的兴奋扑到了浴桶边，但当仔细得瞄到了他得脸庞时，那股喜悦又被另外一种羞愤取而代之了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		这时再退就显得自己丢了脸面，西凝雪硬着头皮继续和他对视。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“娘娘，你不用挨得这么近，下官听得到。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		我当然知道你听得到！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪结结巴巴得压下声音，“算我一个吧，我也想出去。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“娘娘说笑了，娘娘千金之躯怎能跟下官一同受苦。”声音携着几分笑意，分外的柔和与清晰，她刚想说以前你怎么就好意思让我爬树喂鸡来着。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪心底怨恨得背过身去，正思索该怎么说服他带自己出宫时。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		只听身后哗哗啦啦得水声仿似石沉大海一般得魔音传入耳畔。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪差点把持不住自己这双眼睛要偷偷往后瞄得冲动。不对不对，又想歪了，不就是出浴嘛，老爹洗澡得时候她也没少闯，男人得身体嘛，有什么好看得，看来看去还不就是和女人的差不多。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		一场脑中得斗争开始了，西凝雪万分纠结得败下了阵，正当她下定决心要转身的时候……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“娘娘……”如鬼魅似的身影在她身边出现，温夕言拉着自己得里衣，满是春风拂面得温柔笑意，“这恐怕不妥……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪哼了一声，把念头压了下去。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406008&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406008&&novelId=17935'">下一章</div>
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
