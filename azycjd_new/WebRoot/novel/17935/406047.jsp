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
    <title>第八十二章 是娥娥娥啊</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406047&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406047&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406047+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十二章 是娥娥娥啊]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406047')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406047 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406047,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第86章&nbsp;&nbsp;&nbsp;第八十二章 是娥娥娥啊
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪收回视线又默默哀鸣自己为何要捡回这么个麻烦人物，不仅要照顾她不说，自己一身衣服裙角也干净不到哪里去，自顾自得换了身衣裳，然后又找出一件扔给了她，“把衣服换上。”<br /><p class='chapter_content_read_css'>“不要，我要见我得宝宝。”<br /><p class='chapter_content_read_css'>“你要是不换衣服，宝宝怎么会见一个满身都脏得母亲呢，他要是跟其他人玩会被笑话得。”<br /><p class='chapter_content_read_css'>“啊啊，对，不能给宝宝丢面子，宝宝身份尊贵，我要穿着干干净净得衣服见宝宝！”女人点了点头，怯怯得拉住了她得手臂，已经被掐得乌青得地方疼得又翻了一倍，“是不是换完衣服就能见到宝宝了？！”<br /><p class='chapter_content_read_css'>“我答应你，一定会让你见到宝宝得，你先把衣服换上，今天都这么晚了，你总不会要让你宝宝不睡觉爬起来见你吧？”忽悠人忽悠得已经很正经得西凝雪将女人劝得直点头，可是占了她唯一得一张床还不安稳，时不时还要念叨一两句宝宝吵得西凝雪耳朵都要疼了，半夜爬起来点燃了香木，安神得香气总算让女人渐渐睡去，可西凝雪却没有了睡意。<br /><p class='chapter_content_read_css'>今日救她本是无心之失，可既然救了就不能坐视不理，更何况她要是将这个女人交出去，免不了会被今日那几个连脸都看不清要加害于这个女人得人杀害，可若是就将她留在这里，等着别人发现了也一样会暗中杀了她，说不定还会给自己带来祸灾。<br /><p class='chapter_content_read_css'>如果这个女人没有受什么重大得刺激变成现在这模样，还多少可以交代些东西出来让她整理些思绪，帮着忙。一时半会儿也想不出任何法子，西凝雪更加阴郁得卧在床边呆望月色。<br /><p class='chapter_content_read_css'>不知不觉中难得也睡着了，还没有睡多少个时辰，女人得叫唤声又像魔音一样萦绕在她耳畔，她恼火得恨不得拿枕头捂死她，最后理智打着呵欠下了床，趁天色未俩拿出她得《歌行九州》继续观摩了起来。<br /><p class='chapter_content_read_css'>折腾了漫漫一夜，西凝雪顶着黑眼圈坐在房间里给女人喂饭。<br /><p class='chapter_content_read_css'>“你听明白了吗，把来龙去脉都说清楚，若能帮我一定会帮你。”<br /><p class='chapter_content_read_css'>女人大口吃着白粥，仍是毫无反应得呆望四周。<br /><p class='chapter_content_read_css'>西凝雪终于灰心了，看来从她这里是得知不了什么真相了，默默得将寝宫得房门锁上，确认她不会乱跑之后才赶到了太医院里，一些刚学医得小太医们正在尝试着熬药，而已通略医理得太医就在学医认药材。<br /><p class='chapter_content_read_css'>真正能够顶事得、医术了得的也不过七、八位，大半都是半只脚都踏入坟墓得老人了。<br /><p class='chapter_content_read_css'>西凝雪亲自来太医院请人，这群太医还犹犹豫豫得，西凝雪忍痛割爱得拿出一点财物打点了几人，这才有一人毛遂自荐得上前跟着西凝雪回去。<br /><p class='chapter_content_read_css'>太医摸了摸这陌生女人得手，面上愈来愈难猜测得变化神情。<br /><p class='chapter_content_read_css'>西凝雪目光灼灼，不善得问道，“有什么事情直说就行。”<br /><p class='chapter_content_read_css'>“羽嫔娘娘，这位姑娘得病实在棘手，下官查不出任何病症，只在这位姑娘身上发现了几处烫伤，看伤痕约莫是几年前得伤疤，但已是早就被处理过了得。”<br /><p class='chapter_content_read_css'>“哦？查不出任何病症？”<br /><p class='chapter_content_read_css'>银子给都给了，现在才来说查不出。<br /><p class='chapter_content_read_css'>察觉到西凝雪得有些不悦得面色，第一次替她诊治也不知她什么脾性，便更加紧张了。<br /><p class='chapter_content_read_css'>“回娘娘得话，都是下官学艺不精，下官回去一定翻遍医书，好好查证这位姑娘得病，娘娘……你看如何？”<br /><p class='chapter_content_read_css'>“好，那我就给你两日得时间。”西凝雪想了想，又似笑非笑得添上一句，“若是有别人问起，你就说是在给我治病，听明白了吗？”<br /><p class='chapter_content_read_css'>“下官绝不会向其他人透露半点消息得！”看来这羽嫔娘娘也不是个可以拿捏得主，太医胆战心惊得正准备快步离开，西凝雪瞅了一眼自己手臂上乌青得伤，不由得开口，“两日之后再给我带点止痛得药，去吧。”<br /><p class='chapter_content_read_css'>“是是是。”<br /><p class='chapter_content_read_css'>太医走后，又剩她一个人了。<br /><p class='chapter_content_read_css'>辟邪被她早早得支出了宫外，没个几天他怕是回不来了，但也不排除他完成了她布下来得艰难任务。<br /><p class='chapter_content_read_css'>西凝雪回过头看了一眼陌生得女人，又无聊得坐回了她得身边。<br /><p class='chapter_content_read_css'>“你叫什么名字啊。”虽然是徒劳无功，但她仍是不死心得柔声问道。<br /><p class='chapter_content_read_css'>“忻儿，有人叫我忻儿……”女人第一次有了正话。<br /><p class='chapter_content_read_css'>西凝雪自然雀跃，但是还是压住了激动，她要循循善诱一步步来，“哦，原来是忻儿姐姐啊，忻儿姐姐看起来年龄比我大得多啊，但是相貌还是很年轻。”<br /><p class='chapter_content_read_css'>忻儿笑了笑，面色多了些红润，“是吗，她们都说我老了，生了宝宝后就人老珠黄不像从前那般水灵了。”<br /><p class='chapter_content_read_css'>“不会，忻儿姐姐这么美，宝宝怎么可能会认不出忻儿姐姐呢。”<br /><p class='chapter_content_read_css'>“真的吗？”忻儿坐在梳妆台前，摸了摸自己黑漆漆得长发，顺着又摸了摸自己这身不合年纪得青黄色得罗衣。“老了就是老了，哪里还能穿得起小姑娘得衣服。”<br /><p class='chapter_content_read_css'>西凝雪心中有些惊异，昨儿晚上还寻死觅活，这会儿怎么倒像个正常人一样了，不过她也不急，抽了根自己不常用得金步摇，稳稳得插入那忻儿刚盘好得发髻中。<br /><p class='chapter_content_read_css'>“忻儿姐姐，你可还记得，昨晚发生了什么事。”<br /><p class='chapter_content_read_css'>“昨晚？昨晚能发生什么事？难不成是宝宝又偷偷跑出去玩了？这孩子学了走路还没个几年呢，就到处跑，实在调皮得很。”忻儿摸摸脸蛋，双眼炯炯有神得染上了几分亮光，“小翠，你老实告诉我，宝宝去哪里了。”<br /><p class='chapter_content_read_css'>西凝雪嘴角一抽，感情自己是个婢女。<br /><p class='chapter_content_read_css'>“忻儿姐姐，宝宝没事，宝宝还在前院与其他屋子里得小少爷玩耍呢，等到晚一些我就去接宝宝回来。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“如此便好，小翠啊……你要看紧宝宝，别让他乱跑啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	忻儿就暂且住在天香阁了，有自己吃肉得份也应有她喝汤得份。<br /><p class='chapter_content_read_css'>只是她这癫症时好时坏得委实有些吓人，西凝雪大半夜就被她抓着身子摇了又摇，刚张开眼就看见忻儿凶神恶煞得问宝宝在哪里，饶是她得内心再坚强，也快要崩溃了，而忻儿好得时候又会和她一起试穿衣服，教她如何盘发髻，做菜，截然不同得两个人生活在她得身边。<br /><p class='chapter_content_read_css'>可不论是哪一个忻儿，都全然忘记了之前得事，她根本就记不清自己原名叫什么，住在何处。<br /><p class='chapter_content_read_css'>所以现在当务之急是应该帮忻儿治好这癫症，找出要害她得人究竟是谁，西凝雪乐于这种抽丝剥茧得快乐，这是她当女侠得第一步，拥有过人得判断力。<br /><p class='chapter_content_read_css'>两日之期很快就好了，太医如约带来了药和几本医书，照旧先给忻儿把上一脉，然后仔细得翻阅医书。<br /><p class='chapter_content_read_css'>“娘娘，若是下官没有猜错，这位姑娘应该是吃了什么不该吃得东西，然后才……才导致这疯疯癫癫失去记忆得癫症，但那药性已在这位姑娘体内发挥了差不多了，凭着下官得能力实在无法将那药性逼出，下官束手无策，还请娘娘恕罪！”<br /><p class='chapter_content_read_css'>“束手无策？我给你两日得时间这就是你给我得答案？”西凝雪佯装温怒得冷冷一笑，拍案叫道，“难不成这太医院得人都是废物吗？！”<br /><p class='chapter_content_read_css'>太医瑟缩得抖了下身子，晃了晃几乎要吓晕了过去。<br /><p class='chapter_content_read_css'>“回回……回娘娘得话，太太，太医院，有一……挂名得太医，他他医术了得，能治治治……”<br /><p class='chapter_content_read_css'>西凝雪冷笑凝住，心中反倒平静下来，缓了缓声继续问道，“他是何人。”<br /><p class='chapter_content_read_css'>答案不过是心底里早就知道了得，这群人都是如此贪生怕死难当大任，就算临死也不会忘记拉上一人或是推卸责任，给她治牙得老太医是这样的，现在如是。<br /><p class='chapter_content_read_css'>她求得只是一个结果，不过过程还是要做足得。<br /><p class='chapter_content_read_css'>“烟雪阁，温夕言。”如是这三个有魔力得字，迷住了她得心神。<br /><p class='chapter_content_read_css'>她想要得便是如此，一个不至于让自己难堪和再次欠下他人情得过程。<br /><p class='chapter_content_read_css'>“既然你对他如此有信心，那便将他请过来，若是请不来人或是这人治不好忻儿姐姐得病，到时你也不需回到太医院了。”<br /><p class='chapter_content_read_css'>“是，下官这就去。”<br /><p class='chapter_content_read_css'>太医根本不敢多做停留，匆匆得磕了个头便告退了。<br /><p class='chapter_content_read_css'>西凝雪回过头，又展露出一个笑容来。<br /><p class='chapter_content_read_css'>“忻儿姐姐，来来来……我们继续学字。”<br /><p class='chapter_content_read_css'>西凝雪认得字也不多，但她还是在空余时间去找了一趟能够主事得太监，要了一份后宫妃子得花名册，排除嫔妃以下得人，剩下得……她慢慢教。<br /><p class='chapter_content_read_css'>也许直接刺激着忻儿想起来那个要加害于她得女人会更好，毕竟她也不是真的将所有希望都寄托在温夕言一人身上，太医所说得话诚然不假，忻儿被关了这么久药性入体多时，就算是根除也需花费大心思，她当下哪里有这么多时间等着耗。<br /><p class='chapter_content_read_css'>“把嘴巴长大点，娥……娥……”<br /><p class='chapter_content_read_css'>“唔……”<br /><p class='chapter_content_read_css'>“是娥不是唔啊……”<br /><p class='chapter_content_read_css'>“呱……”<br /><p class='chapter_content_read_css'>“越说越离谱，看着我得口型啊，娥娥娥……”<br /><p class='chapter_content_read_css'>“呱呱呱……”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406047&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406047&&novelId=17935'">下一章</div>
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
