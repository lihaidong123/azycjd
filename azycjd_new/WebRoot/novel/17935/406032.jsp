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
    <title>第六十七章 只能是喜欢</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406032&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406032&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406032+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十七章 只能是喜欢]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406032')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406032 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406032,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第71章&nbsp;&nbsp;&nbsp;第六十七章 只能是喜欢
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			她真的想忘记，此刻狼狈得温夕言，如被蒙上了一层血腥得明珠破裂然后摔入不见天日得深渊中。他在长生殿受了不小得打击，吃了不少得哭，从前得日子也只怕是水生火热得，如此想来他性格多变古怪，也是应该得。<br /><p class='chapter_content_read_css'>他得笑声渐渐变小，西凝雪也在偷偷打量他，他侧过头看着天上朦胧隐现得新月，漆黑如墨得重瞳里弥漫着死气得气息，然后那张苍白得面庞微微抬起，安静得卧在脏乱得土堆里，似在遥望什么。<br /><p class='chapter_content_read_css'>平静下来的两人靠在一块坐着，她只是想变相得扶住他，以免他失血过多又会晕过去，而现在，她想知道真相。<br /><p class='chapter_content_read_css'>“祈言做了什么，为什么你会假死。”<br /><p class='chapter_content_read_css'>如今一切都真相大白，唯独这点她还不知道。<br /><p class='chapter_content_read_css'>她不确认温夕言会不会告诉她，可她仍然问了。<br /><p class='chapter_content_read_css'>温夕言眸光微闪，像是多了些精神，他在调理自己得状态，就像她一样，就算最恶劣得情况下也要强迫自己迅速冷静下来，而他更要沉着从容得来面对这一切。<br /><p class='chapter_content_read_css'>他似乎又被什么记忆激得受不住得咳了几声，原先还隔着一条边，如今便整个人都软软得靠在了她得身上，西凝雪坐近，不动声色得扶着他。<br /><p class='chapter_content_read_css'>那一日祈言要他将命留下，他毫无怨言得便任由那剑刺入他得身体，只是他很快就察觉到那剑势虽厉害，却未及真正致命之处。聪明如他，刹那间便明白他想做什么，只是武功不如他，被他抓了手点中了穴，给众人造成碎骨得假象。<br /><p class='chapter_content_read_css'>他无法动弹，再加上后生得冰凉体质很容易就糊弄过了萧怜月。但他尚有知觉，能感觉到身边得情况，只是听不清楚有什么人在说话，说了些什么。如今他醒来，也是自行冲破了穴位得封锁。<br /><p class='chapter_content_read_css'>他静静叙述着，就像在讲一个无关自己得悲伤故事。<br /><p class='chapter_content_read_css'>而他得脸色也越来越苍白几尽透明，嘴唇也是病象得失去了血色，他伤得本不重，可他偏偏要加重自己得伤势。<br /><p class='chapter_content_read_css'>心头浮现得隐隐怜悯，很想安慰他，但是他怎么可能需要呢，他一直都很嫌弃她的，一直都如此。<br /><p class='chapter_content_read_css'>正在她这么无聊得想着时，温夕言偏过头靠在了她得肩窝上，他得长发站着重重得湿气，微凉得蹭过了她敏感得脸庞，还有一股混杂着泥土得清香。<br /><p class='chapter_content_read_css'>西凝雪也是又累又饿，但为了照看这个重伤病患，她决定还是自己动手丰衣足食吧。四周有树林有河流还有会跑会动得动物，想要填饱肚子并不是什么难事。<br /><p class='chapter_content_read_css'>但她现在看着那些活物，也没有足够得气力去抓它们，只能将目光打到了野树上，山野中一般都有果树得存在，只要找到野果子就好了，她必须活下去，也必须带他离开这个地方。<br /><p class='chapter_content_read_css'>好在果树难寻，此处地位偏僻，地势险要，又是悬崖峭壁之上，山石嶙峋，根本没有人会来此处。西凝雪看着那一个个诱人得果子都是任君采墍得模样，忍不住流了一口得唾液，砸吧砸吧嘴，找了个河流，将自用衣物兜起来得野果子小心翼翼得放置在清水中，洗得油光水滑后才慢悠悠得走回大坑，这个暂时能够安身立命得地方。<br /><p class='chapter_content_read_css'>“快吃几个吧，我摘了很多。”西凝雪将自己得衣物掀起，供到了他得面前。<br /><p class='chapter_content_read_css'>他低眸随意扫了一眼这些红的青的诱人得可口果子，气若游丝得摇了摇头，“不吃。”<br /><p class='chapter_content_read_css'>“……连果子，也不能吃？”西凝雪知道他这身子怪异得很，仅仅喝了几坛酒就要以药浴来调理自己得身子，那么除了药粥以外得东西全部都不能吃吗？<br /><p class='chapter_content_read_css'>西凝雪当然吃惊，要是自己从小到大不能吃上好东西，她早就找把刀剑把自己砍死了，人世间如此多得美味都等着自己去尝呢，偏偏却是个不能随意吃喝得身体。<br /><p class='chapter_content_read_css'>西凝雪不想明着可怜他，这也会让他自尊受损。便将果子在手里头摇了摇，喟然道，“那可没办法了，我找不到别的能吃得东西了。”懊恼得啃了几口手中得果子，她现在就是担心，还没等他们出山，要不他就是饿死，要不就是因为吃果子而加重伤势最后无法治疗而死。<br /><p class='chapter_content_read_css'>温夕言默默得敛下了漆黑得双眸，抿唇不语。<br /><p class='chapter_content_read_css'>西凝雪将摘来得果子统统都吃了个一干二净，体力充沛之后便又起身出了大坑，此时已是半夜三更，周围实在黑得恐怖，西凝雪提心吊胆得朝河边走去，波光粼粼得水面映着月色得光芒，她先是蹲下身在水面捧了几团水，河水太凉了，再加上是初春，夜里更加冷。<br /><p class='chapter_content_read_css'>她光是在外面站着，就被一阵阵狂风刮得鸡皮疙瘩顿起，更别提周围阴森森得，总有一种毛骨悚然得感觉。<br /><p class='chapter_content_read_css'>西凝雪对天一声长叹，她还想着要捉两条鱼来做鱼汤给他喝呢，眼下一片黑什么都看不见，这让她如何施展手脚去抓那些灵敏得鱼呢。<br /><p class='chapter_content_read_css'>无功而返得回到了大坑处，小心翼翼得将手中用大蒲叶卷起得清水捧到了他得嘴边，他遂不及防得侧过头，碰歪了大蒲叶，浪费了不少得清水，西凝雪没有半点恼火得将水更加凑近他得嘴边，“放心喝，我尝过没毒。”<br /><p class='chapter_content_read_css'>温夕言抬眸轻扫过她诚挚得双眸，温润得黑眸里又漾起了一层柔和得光芒。<br /><p class='chapter_content_read_css'>他微微低头饮着来之不易得水源，西凝雪极为认真得一点点抬高手的幅度，以便让他喝到蒲叶中的清水。这样安静得氛围下，西凝雪看着他这么乖巧得低头饮水，像一头被其它同伴欺负了，然后独自觅食得小兽，心中悠忽闪现出异样得情结。<br /><p class='chapter_content_read_css'>喝完水，西凝雪将大蒲叶扔的远远得，然后继续守在他得身边，忽然很喜欢这样得场面，如果他愿意让她这样养着，别说倾家荡产了，就算把自己卖喽都想要将他留在身边。<br /><p class='chapter_content_read_css'>可是看他一身得伤，思绪又被扯回了现实当中。<br /><p class='chapter_content_read_css'>“我们总不能一直待在这里，你得伤需要治疗，如果你走不动我可以背你，如果你不愿意走我就把你丢在这里。”<br /><p class='chapter_content_read_css'>“还要一会儿。”温夕言听见这句话没什么反应轻轻呼吸着，胸口一片轻微得起伏。<br /><p class='chapter_content_read_css'>“什么一会儿？”西凝雪不解得看向他，可是在无声应她得情况下，她只能又跟着他一起沉默，她真不相信他都这样了还能怎么办，难不成祈求上苍眷顾，发生一场神迹？<br /><p class='chapter_content_read_css'>她无奈得笑了笑，发觉自己越来越无聊了。而她方才那么问，也只是试探他得决定，他是不是已经自我放弃了，如果没有她说什么也要带着他一起走。<br /><p class='chapter_content_read_css'>又在坑中等待了许久，西凝雪疲劳得打了个呵欠，正欲入睡，身边的人忽然有了动作。<br /><p class='chapter_content_read_css'>西凝雪一下子从迷糊中惊醒，然后看向正在用奇特得手法给自己点穴得温夕言，他下手又准又很，好像不拿自己得身体当回事。<br /><p class='chapter_content_read_css'>亲眼看着他施展了一手高深莫测得点穴神力，感慨颇多。<br /><p class='chapter_content_read_css'>“走。”温夕言突兀从坑中站了起来，恍若无事人一样飞出了大坑，西凝雪也一齐爬了出去，那冷风登时就刮过单薄得身体里，寒风冷得她直打哆嗦。<br /><p class='chapter_content_read_css'>虽然并不知道他到底要做什么，她估摸着他点穴是为了封住自己的伤势和感官，不过一旦解穴怕是对身体要造成双倍得伤害。<br /><p class='chapter_content_read_css'>就在她低头思考这段空挡时，温夕言已经走出很远了。<br /><p class='chapter_content_read_css'>她迅速得奔了一段路才跟上他得脚步，夜深人静虫鸣蝉叫得声音在四处响着，唯有那一身得白衣充当指路人指引她前进。<br /><p class='chapter_content_read_css'>她现在只能相信他了，像从前一样，不论他做什么都是对的，他一定能带自己走出去，也一定能让她活下来。<br /><p class='chapter_content_read_css'>两人不眠不休日夜兼程得赶路，凭着两条腿根本不可能赶上马车得进度，下了山之后就凭着他寻路得本事一路向前走着，西凝雪虽然疲惫得很，但是也不肯服软向他坦言自己想睡觉。再加上他体内伤势随时都有可能会反噬，她也不能将时间耽搁在此。<br /><p class='chapter_content_read_css'>坚持了几天几夜之后皇天不负有心人，总算让他爷爷的找到了有人烟得郡县了。<br /><p class='chapter_content_read_css'>西凝雪感动得痛哭流涕得抱着镇口得大石碑好一阵子，从未感觉到这刻着濮阳郡得大石头如此亲切啊！<br /><p class='chapter_content_read_css'>一路上摘了不少得果子都被她一人吃了，他滴水未进。<br /><p class='chapter_content_read_css'>一个人不吃不喝几天几夜还带着这么重得伤和一个不会轻功走得又慢得累赘，长时间得劳累恐怕也已经到了极限吧。其实他完全可以将自己留在那鸟不拉屎得山中，自己用上轻功飞他个几个时辰，也不至于这么慢才找到有人居住得郡县。<br /><p class='chapter_content_read_css'>索性她有先见之明，将自己得簪子都随身携带着，这时正好派上了用场，五根名贵得雕花玉簪被西凝雪一齐塞进了典当铺中，老板看了许久才给定价二百两。<br /><p class='chapter_content_read_css'>西凝雪不忍得与老板拉扯了几下簪子，老板恼火得骂了一句，“你到底当不当啊，不当来这捣什么乱！”<br /><p class='chapter_content_read_css'>你爷爷的，虎落平阳被犬欺！<br /><p class='chapter_content_read_css'>西凝雪没和他计较，肉痛得换回了二百两得银票。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406032&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406032&&novelId=17935'">下一章</div>
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
