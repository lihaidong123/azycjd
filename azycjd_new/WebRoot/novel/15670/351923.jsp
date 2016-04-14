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
    <title>（十）萤湖凉亭铃铛下 故人之情愁奈何</title>
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
	<script language="javascript">var novelId='15670';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351923&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351923&&novelId=15670";
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
					window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351923+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十）萤湖凉亭铃铛下 故人之情愁奈何]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351923')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'">公子，请上钩</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:官秋月</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351923 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351923,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第11章&nbsp;&nbsp;&nbsp;（十）萤湖凉亭铃铛下 故人之情愁奈何
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  流湘从南厨房讨了些酒来，准备着晚上和南宁一起喝点儿，看着天已经完全黑下来，就匆匆忙忙的赶回院子，就看到屋内烛火通明，暗道秦姑娘一定回来了，提了酒迈进门框，只见一紫衣男子立在卧室门口，和另一男子攀谈着，等扫过那男子，赶忙把酒藏在身后，道：“沈老板好。”<p class='chapter_content_read_css'>  沈言扫过她，顺带着看见了她藏在身后的酒，没有多言，只是说道：“秦姑娘害了病，就麻烦你多加照顾了。”说罢，向紫衣男子告辞，抬脚离去。<p class='chapter_content_read_css'>  “害，害了病？”流湘一愣，将酒放到桌子上，推门进到南宁屋里，见到南宁躺在床上，脸色有些苍白，她皱了皱眉，摸上南宁额头，“出门的时候还好好的，怎么才过了一天就成了这样？”<p class='chapter_content_read_css'>  紫衣男子忽然开口：“秦姑娘是突发旧疾，不知这位姑娘可曾听秦姑娘说起过旧疾？”<p class='chapter_content_read_css'>  “不曾。”流湘摇摇头，“我与她不过相识半月，怎么会知道这种事呢？”<p class='chapter_content_read_css'>  紫衣男子沉默了一会儿，想说什么，又觉不妥，又言道：“秦姑娘的病现在倒也无大碍，就麻烦姑娘叮嘱秦姑娘好生休养，莫要再做害身之事。”<p class='chapter_content_read_css'>  说罢，又走上前，给南宁号脉，脉相无异，心情稍稍松快了些，正准备将袖里的方子交予流湘，手还未从南宁手腕上离开，反被南宁死死抓住。<p class='chapter_content_read_css'>  “不要走。”南宁睫毛微颤，一脸痛苦之色，似是陷入噩梦。<p class='chapter_content_read_css'>  “不……要……走……”他微微回握了她的手，她忽然一松，他赶忙想抽离手，却不料南宁提前缠住他的手，有些泄恨似的用指甲狠掐他的手背，有血丝缓缓渗出，他剑眉一挑，忍住了。<p class='chapter_content_read_css'>  流湘见此，赶忙去扯南宁的手，又要小心不要碰到他，他躲过流湘的手，看着南宁，道：“就让秦姑娘抓着好了，反正也不是什么重伤。”<p class='chapter_content_read_css'>  流湘顿了顿，心道：谁在意这个了，重要的是，男女授受不亲，男女授受不亲啊。<p class='chapter_content_read_css'>  他忽然伸手撤掉了南宁头发上的一个细珠簪，扎到南宁手腕上，挑出一滴血珠，南宁眼皮一动缓缓醒转，手上力道也轻了不少，他便趁机若无其事的抽离手，隐在宽袖之中。<p class='chapter_content_read_css'>  “流……流湘，南……南宫……公子……”南宁缓缓回过神来，看了良久才认清眼前之人，扶着床帮慢慢坐起身。<p class='chapter_content_read_css'>  “先喝口水再说。”流湘赶忙倒了杯温白水递给她，被南宫宁雪挡住，“秦姑娘现在还是勿喝水的好，不知姑娘患何旧疾，竟是在下从未听闻所见到过的。”<p class='chapter_content_read_css'>  “旧、疾？”南宁一皱眉，“你在胡说什么，我哪有旧疾！？”<p class='chapter_content_read_css'>  “肯定不会弄错！”流湘忽然开口，瞥了一眼他，自从南宁喊他南宫公子，外界又传南宫喜紫衣，便知道了他是谁，“南宫公子可是东陆第一神医，怎么会胡说？”<p class='chapter_content_read_css'>  “第一，神医？”南宁定睛看了他一会儿，是了，她原来的那一身伤不就是他治好的吗？只是那时怎么没问有什么旧疾，反而这个时候问起来了。<p class='chapter_content_read_css'>  “那是外界谬赞了，在下怎么能担当得起。”南宫宁雪又搭上南宁的手腕，停留了双倍时间，自己眼中也闪出了一丝困惑，“脉象确实并无不妥，应是在下当时瞧错脉了，当真万分抱歉。”<p class='chapter_content_read_css'>  “或许是当时南宫公子太心急了也说不定，至于我晕倒，应该是受外界影响罢了，还要多谢南宫公子送我回来。”南宁虚虚往流湘身后瞟了一眼，“既然现在我已无大碍，就不麻烦南宫公子了，还请流湘送南宫公子出去了。”说完竟虚咳了一声。<p class='chapter_content_read_css'>  流湘早想请他出去了，就算他是神医但究根追底还是个男子，夜半三更的一直呆在人家闺房算怎么回事。等南宁话音刚落，就一打手势，请南宫宁雪出去。<p class='chapter_content_read_css'>  南宫宁雪自知不好一直待在这儿，看了南宁一眼就告礼离开了。<p class='chapter_content_read_css'>  南宁见二人都离开，才开口道：“夏姑娘，离子时还有多长时间？”说着就下了床，脚下虚步一晃，还好及时扶住了床帮才未摔到地上。<p class='chapter_content_read_css'>  “还差一刻钟，秦姑娘你身体……还好吗？”夏曼见她面色发白，身影不稳，有些担心。<p class='chapter_content_read_css'>  “没事，自然不会失了约。”南宁理好衣裙，轻轻打开门，蹑手蹑脚的偷溜出去，走到无人之处才恢复常态，随手捏了个诀，手中出现一盏五角红灯笼，便是能使亡魂现于常人眼中的鸣魂灯，南宁将灯递到夏曼手中，“这灯笼会让普通人看见你，也包括，沈言。”<p class='chapter_content_read_css'>  果然，夏曼紧紧的抓住了灯杆，嘴角也溢出笑容。<p class='chapter_content_read_css'>  “但是，这盏灯只能维持到太阳升起之前，在那之前，你必须躲过阳光，将你指引给魂者，他会把你渡到到忘川河，否则，灯灭，魂灭，将永世不可轮回。”南宁认真地说道。<p class='chapter_content_read_css'>  “嗯嗯。”夏曼点点头。<p class='chapter_content_read_css'>  南宁也不再多说什么，看她的样子怕是就没往心里去，有着执念的灵魂，可是会不顾一切的。<p class='chapter_content_read_css'>  “走吧。”夏曼提了灯笼走在前面，南宁跟在几步之后。<p class='chapter_content_read_css'>  夜风袭冷，南宁呵了几口热气，望望四周空旷，完全不晓得到了哪里，只隐隐瞧见前方有荧光点点，还传来清亮的铃铛声，叮叮当当，有些凌乱。<p class='chapter_content_read_css'>  “就是这里了。”夏曼定住脚，南宁定睛看去才知道到底是怎样一幅场景。<p class='chapter_content_read_css'>  一片湖泊中满是星光点点，约莫着是某种浮游生物，夜空也挂满星辰，月光柔和，她们所在的地方正是一座凉亭，凉亭中挂满了银色大小不一的铃铛，恰有微风袭来，发出阵阵铃声。<p class='chapter_content_read_css'>  “我倒是从未听他人说过有这么一座凉亭。”南宁也有些诧异，当初她也向流湘问过中辰有什么好玩特殊的地方，也从未提过有这么一个地方。<p class='chapter_content_read_css'>  “呵呵，这是当然了，这块地方可是属于泽成沈家的，哪有人敢打听说道呢？”夏曼坐到石凳上，手中依然握着灯杆，语气中还带着些许怀念。<p class='chapter_content_read_css'>  “哦，子时快到了呢。”南宁坐到她对面，手伸到袖中，摸到了那个瓷瓶，心中有些犹豫，为什么书绘音会让她封印夏曼？还不能看她的记忆？难道是记忆里面有什么秘密吗？会不会是关于他的呢？想着便将手伸向夏曼，夏曼背对着她，忽然猛一回头，她惊吓的缩回手，心中岔岔念叨：反正记忆迟早都是我的，干嘛那么急呢？<p class='chapter_content_read_css'>  “怎么了？秦姑娘？”<p class='chapter_content_read_css'>  “没什么，能和我讲讲你们之间的事么？沈言好像对你有误会。”<p class='chapter_content_read_css'>  “啊，”她一顿，“自然是了，他该怨恨我的，当年是我负了他，我也是有难言之隐的啊，我也不想的。我和言哥哥是娃娃亲，我们两家也算是世交，不过，我同他在笄礼之前是从未见过面的。我和他的相遇，完全是命运捉弄罢了。”<p class='chapter_content_read_css'>  她停住，不再往下说去。南宁梗了一下，心中好奇，却又不好意思再问下去。<p class='chapter_content_read_css'>  “秦姑娘知道忘川花吗？”她忽然问道。<p class='chapter_content_read_css'>  南宁点点头，不就是曼珠沙华吗？<p class='chapter_content_read_css'>  “忘川花生长在忘川河岸，只有亡魂才可以见到，但它却有无比强大的能力，传说可以让人死而复生，治愈一切疾病，忘却一切烦恼之事，”又像是喃喃自语，声音低沉，“可是我见到了，在那个时候，那个人带来的。”<p class='chapter_content_read_css'>  “那个人？”南宁反问一句。<p class='chapter_content_read_css'>  “啊？”她一愣，“啊啊，抱歉，我走神了，刚才说到哪里了？”<p class='chapter_content_read_css'>  南宁看她的表情也不像作假，怕是记忆开始出现混乱了，抬头望望天，“子时三刻，到了。”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351923&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351923&&novelId=15670'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')"/>
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
