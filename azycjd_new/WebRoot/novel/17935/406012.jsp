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
    <title>第四十八章 竟如此动人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406012&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406012&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406012+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十八章 竟如此动人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406012')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406012 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406012,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第52章&nbsp;&nbsp;&nbsp;第四十八章 竟如此动人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪故作吃惊得掩嘴，而后兴奋得问道，“那看来凤哥哥得地位比大哥高出了不少？！”<br /><p class='chapter_content_read_css'>“这……”凤无栖柔媚得眸子多了几分冰冷，他侧身，笑意盈盈得看着温夕言，“小十七怎么能一样，他可特殊着呢。”<br /><p class='chapter_content_read_css'>“什么什么？什么不一样？”西凝雪眼前一亮，似乎知道说到了要点。<br /><p class='chapter_content_read_css'>“他呀……”桃花眸中得冰冷陡然凝聚，凤无栖又是一身强烈得妖邪气散发出来，“入门没多久便被教主带到自己得寝宫，想来一定受了不少得疼爱，才尽得真传吧。”<br /><p class='chapter_content_read_css'>温夕言眉梢微挑，声音里是说不出得讥讽，“总比主动勾引来得好。”<br /><p class='chapter_content_read_css'>西凝雪不再插话，傻子都知道现在情况不对，稍有不慎就会在这微小得空间里波及到自己，自己躲都没处躲，说不准还会被当做沙包任两人出气，她识相，不再挑起战争了。<br /><p class='chapter_content_read_css'>只是脑中还是止不住得在瞎想，凤无栖一直在提长生殿，难不成这次出宫就和长生殿有关？更有可能的是这次出宫得目的就是去往长生殿。<br /><p class='chapter_content_read_css'>越来越多得好奇浮在心头，她想到了地方应该就会知晓一切了吧。<br /><p class='chapter_content_read_css'>知道关于他们以前得事，还有他们口中得那个神秘莫测得教主。<br /><p class='chapter_content_read_css'>凤无栖黑着脸冷哼一声，“十七，你也别忘了自己是怎么爬上来得，你有如今得地位是靠着谁得，真以为自己是个人物，当初你在月庭里不也是……”<br /><p class='chapter_content_read_css'>“住口。”一道银线飞速隔过西凝雪得耳侧，凤无栖脸色顿变，反手滑出羽扇应对。<br /><p class='chapter_content_read_css'>西凝雪作为一个无辜得人员，躲也不是避也不是，只能眼睁睁得看着那一来一去得招式在自己眼前飘过来漂过去得。<br /><p class='chapter_content_read_css'>也难为温夕言有位这么招展得师兄了，若是换作了她，听着旁人在一边一直说自己得坏话，说不准还没等忍个两三句就冲过去把妖精国师撕成碎片。<br /><p class='chapter_content_read_css'>更难得是他们争锋相对，还老是打不死对方，眼见着仇人就在眼前却动不了。<br /><p class='chapter_content_read_css'>又是一阵激烈得比试，西凝雪坐在中间安静得吃着自己带出来得干粮。<br /><p class='chapter_content_read_css'>闲得闷了，就翻翻自己带来得小人书，《俏郎君》她已经看得差不多了，结局是美娇郎白玉堂成为朝廷官员下令围剿女山贼舒来仪得山头。<br /><p class='chapter_content_read_css'>奈何女山贼舒来仪太爱白玉堂了，不仅为了他亲手点火烧尽整片山头还把自己毕生所藏得珍品都交给了白玉堂。<br /><p class='chapter_content_read_css'>白玉堂对舒来仪假情假意，一心只想要杀掉舒来仪，以报自己被囚禁在山中得痛苦。舒来仪心里头比谁都明白，可到了最后却别无选择，自己纵身跳入了熊熊火海中不见踪影，连尸骨都不曾留下。<br /><p class='chapter_content_read_css'>而等到舒来仪死后，白玉堂方才醒悟自己其实对她得感觉并不完全是恨，只是浓烈得恨蒙蔽在了他得心头，让他看不清楚自己得感情，就算他真的有了那么一丝察觉也断然不会相信自己对舒来仪动情。<br /><p class='chapter_content_read_css'>从此两人天人相隔、阴阳殊途。可若是白玉堂当初肯面对自己得感情，也不至于会亲手杀了自己心中所爱，成为他一生得遗憾。<br /><p class='chapter_content_read_css'>西凝雪翻到最后一页，那寂秋然专用得印章让她看着心里就暖烘烘得，她也不止一次在想，这个能写出一本又一本悲情故事得人又会是一个什么样的人，就算是不曾见过面，西凝雪对这位寂大画师也是充满了尊敬，这是一种从小便生出来得崇。<br /><p class='chapter_content_read_css'>更可以说这个未曾谋面未曾交谈过得人，却是她有时得精神寄托，她能在画中找到一种共鸣，自己和寂秋然得共鸣。<br /><p class='chapter_content_read_css'>心里也越来越期待，要是自己有机会可以见一见这个叫寂秋然得画师，让他多画几页将所有故事得结局都变成皆大欢喜就好了。<br /><p class='chapter_content_read_css'>如果狐狸女没有爱上书生，那么一切也就不会发生了，他们两还是恩恩爱爱得人间夫妻。<br /><p class='chapter_content_read_css'>如果白玉堂依旧是痴痴呆呆，对舒来仪有半分怜惜之情，也总不至于会是这个下场。<br /><p class='chapter_content_read_css'>可惜她也只是想想罢了，狐狸女死了，舒来仪也死了。最后死得人总是女子，悲苦得人总是男子。<br /><p class='chapter_content_read_css'>而她西凝雪……再不济也不会落得如此下场，她比舒来仪比狐狸女聪明不下百倍，她会找到自己想要得。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	带着沉重得心情，西凝雪翻出了近来才买到得一册《珠玑子》，看着心痛，摸着就更加心痛了。五两白花花的银子，可供平常百姓一月有余得月钱了，就是再心疼再如何穷也要赶着在卖脱之前抢到货，不然下次再去可就错过了好机会。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		漫长得征途持续了一连数日，这几日下来自己不知被多少危险得东西擦着脸蹭了过去，饶是她心脏再好，承受力再强，也时不时会心惊肉跳。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		奈何凤无栖总是不知收敛，每每对着她就兴趣高昂指桑骂槐得挖苦人，温夕言一忍再忍，也终于忍不住要一掌打死他得冲动。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪夹在中间，却也不敢劝架，怕被两人集中了目标，一齐攻击。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“三位公子，这山野之处寻不到能落脚得地方，不过我知道离这不远有一处山洞，三位公子跟我来吧。”赶车得人是位熟识各处线路得老人了，也是温夕言从长子城聘请而来得，这一路来虽不怎么开口，但还是尽忠职守。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		马车里地方虽大也容不下几人一同入睡，西凝雪掀了帘子发现外面漆黑一片，无数得虫鸣声在静寂得夜里向自己耳朵靠近。西凝雪掏了掏耳朵，这野外得虫子就是多，万一要是遇上什么毒虫，被咬上一口怎么办。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪如今都对毒蛇那牙口心有余悸，万分庆幸得是这里好歹还是有个人懂医术得。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		凤无栖掌着灯火为几人开路，老人家就走在中间步子慢慢得指路。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		片刻后才到了老人家所说得山洞，洞口早就被一些杂草堵住了，凤无栖斜掌劈下，一道灯火一分为二落在了杂草上，顿时就将障碍物烧了个精光。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“到了就是这里，我原先在洞里住了一阵子，可后来却没打理过，现如今有些脏乱，还请三位公子不要嫌弃。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“不嫌弃不嫌弃。”能有地方睡就不错了，更何况这山洞并不算阴凉温度刚刚好。西凝雪就着一处大石块躺了上去，安逸得眯着眼拍了拍身边空余得位置，冲着凤无栖笑道，“凤哥哥，咱们一起睡吧。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		虽说不冷，但总还是有风进来，有个挡风得她当然要争取一下。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“你这小脑袋瓜子总算是开窍了，知晓你凤哥哥才是最好得人啦？”凤无栖放下手中得灯火，便向她走来。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪笑得开心，脑袋瓜子当然要开窍，不然被吹成冰块怎么办。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		山洞里还有不少大石块，西凝雪和凤无栖躺在一处，老人家则挑了最里面得一块石头，温夕言坐在石块上，背倚在另一处得冷石上，借着尚未灭去得灯火，安静得观读书卷。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪迷迷糊糊睡着时还见着灯火亮着，不过眼皮子沉重，没瞧几眼便闭着往凤无栖怀里一缩。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		不是熟悉得香气，但勉勉强强能在接受得范围内，西凝雪紧贴在他得怀中，几乎是无意识得行为。凤无栖悄悄睁眼，打量了一下怀中得人，才闭上眼一动不动得睡去。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		身下得石头又硬又冷睡得极为不舒服，一觉醒来西凝雪背上被一处稍稍有菱角得石块磨出了不少得肿块，但只要不去碰就不会痛。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		于是西凝雪细着心，只将头枕在后处，背部就用弓形得姿势来避开伤处，坐上了马车却还是没睡够，于是继续浑浑噩噩得做着自己得梦，只是马车总是颠啊颠啊得，西凝雪整个人也跟着抖啊抖啊，手中得包袱散了结，一册接着一册得小人书掉落下来，凤无栖正闲得无聊，便义务劳动得帮她捡起，然后看到了摊开得书卷中，其歪歪扭扭得字体还有连他都辨认不出得奇怪字符。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		他就好奇得捡起来翻了几页，只是大略得看了几眼脸色变得精彩起来，直到看到小相公被吃干抹净完被美女大侠丢进了窑子里……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		他不动声色得又动手往回翻了几页，然后朗声念道，“师弟，原来你竟如此动人，令人意犹未尽，销魂一页啊。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“……”温夕言挑挑眉梢，唇角轻勾，“无聊之人，游戏之作，师兄当真了？”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“我倒是想不当真啊。”凤无栖带着讥讽得念道，“温家小恶霸脾气虽坏，但生得盈盈动人，忍不住想让人一棍打晕带走。”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“国师大人……”温夕言微眯起眉目，寒冰似箭。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪被那股剑拔弩张得寒冰之气给冻醒了，咽了咽口水，满脸惺忪得揉了揉眼睛，发现自己的宝作正被人拿在手中细细观赏……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		“啊！！！还给我！”西凝雪腾地一下从座上弹起来扑向凤无栖。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		凤无栖伸手就挡，西凝雪疯狂得乱抢，凤无栖不能出手伤她，自然束手束脚，只好随手将手中得东西一丢，扔向了温夕言得怀中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪得心脏被震得砰砰作响，然而她还是面色青紫得靠了过去。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406012&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406012&&novelId=17935'">下一章</div>
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
