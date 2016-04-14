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
    <title>（七）阴司之花开才情 才情会上惹是非</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351920&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351920&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351920+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七）阴司之花开才情 才情会上惹是非]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351920')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351920 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351920,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第8章&nbsp;&nbsp;&nbsp;（七）阴司之花开才情 才情会上惹是非
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  “还有奖品？”<p class='chapter_content_read_css'>  “那是自然，说是独特，不过是盆花而已，说是普通，唉，沈某也说不清楚，只是这奖品一直由中辰的四大家族轮流照顾，除了四大家族的人和四十几年前才情会上的人，怕是无人见过，又怎能说清楚呢？”<p class='chapter_content_read_css'>  “今年是轮到洛家？”南宫宁雪抬眼看向不起眼的屏风后。<p class='chapter_content_read_css'>  “正是。”沈言不禁也怔了一下，想到洛家的作风，怕是很难让那位公子获胜。果然不出所料，测评人故意推后比赛结果，先进行“花”项。<p class='chapter_content_read_css'>  紧接着是各式各样的奇花异草被罗列而出，南宁霎时眼前一花，再定睛看去，里面只有几种是她认识的，说不定和她那里的花名还大不相同，所以就识趣的看那些以纱遮面的大家闺秀们在会场走来走去，在纸上悄然落笔。<p class='chapter_content_read_css'>  只有一人引得众人注意，会场中的大户小姐们大都是着粉衣、黄衣、白衣如此诸类清新淡雅的襦裙罗衫，只有一个女子着大红色的短衫配玄色的腰带和赤色的流苏，头上也只钗了一支血玉簪，绕上去的头发从一侧落下，虽是如此张扬的衣着，女子的面容却出奇的温顺良和，俨然是大户小姐应有的气质。<p class='chapter_content_read_css'>  “这位就是洛家大小姐，洛瑾香？”南宫宁雪看了一眼那女子，便问道。<p class='chapter_content_read_css'>  “正是。这洛家大小姐在中辰可是出了名的‘世家子女’。”沈言嘴里竟有些不屑。<p class='chapter_content_read_css'>  南宁听他的语气，便知道这“世家子女”定然不是什么好词。她也是看过不少小说的人，自然知道在古代这些世家子弟大都娇生惯养，蛮横傲慢，能有所作为的又有几人，更别说这些女子了。<p class='chapter_content_read_css'>  过了大约一刻钟，第二轮“花”项，斗花才开始。<p class='chapter_content_read_css'>  这一轮，在场所有不参赛的人都是测评人，每人都发了一张纸和笔，来写下场上自己觉得最稀有神奇的花卉的名字，当然，所有人也都不知道哪盆是谁的花，这样也最为公平。<p class='chapter_content_read_css'>  南宁盯着那些花卉看了半天，觉得都差不多，抬眼看看沈言和南宫宁雪都在写什么，结果他们二人都遮得很严实，导致南宁什么也没看到，刚想叹口气，又忽而看到书绘音一直盯着一盆紫黑色的花看，仔细看了两眼也没看出什么奇特之处，想了想，又提笔写下。<p class='chapter_content_read_css'>  等到纸和笔都被收走，沈言和南宫宁雪很是默契的打开合拢的左掌，都赫然写着“夜凝”二字。<p class='chapter_content_read_css'>  南宁挑了一下眉，“你们怎么也写的这个花？”真是怪了，那黑乎乎的花有什么稀奇好看的。<p class='chapter_content_read_css'>  “秦姑娘也写的这个吗？”沈言用手帕蘸了些水擦掉手上的墨字。<p class='chapter_content_read_css'>  南宁点了点头。<p class='chapter_content_read_css'>  “没想到秦姑娘也认识这夜凝花。这可是西陆苍国的国花，听说只有苍国王宫才存活着四株，没想到在这见到了，倒也不枉此行。”南宫宁雪眼神热切的看着那株紫黑色的夜凝花。<p class='chapter_content_read_css'>  “原来这么珍贵啊。”南宁干笑两声。<p class='chapter_content_read_css'>  抬头，再见却是书绘音有些不对劲的眼神。<p class='chapter_content_read_css'>  书绘音自看见那夜凝花开始，心里便在不断沸腾，当年，他明明毁掉了所有的夜凝花，除了苍国王宫里那四株由圣雪水灌溉的玄夜凝花，玄夜凝花是至纯的黑色，绝不会有紫色的脉络，除非，那是真正的夜凝花，那，又到底是谁，偷藏了夜凝花。<p class='chapter_content_read_css'>  目光幽幽转向夜凝花的主人，洛瑾香。她就在原本南宫宁雪注视的屏风后，只能隐隐看见一个影子，也弥漫着书绘音完全陌生的气息，难道，只是意外吗？他眯了眯眼，原本冷漠的面容似乎又凝了几层冰霜。<p class='chapter_content_read_css'>  他也感觉到了对面凝视的目光，便抬起头回望过去，只瞧见南宁慌忙的躲开视线，似乎还打了个寒颤，他凝了凝神，现在最重要的任务是得到须臾花，至于别的，得了空再好好调查一下。<p class='chapter_content_read_css'>  想着就又将注意力转到会场上。	<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  南宁见书绘音突然看向她，竟心虚的逃开视线，只是想到书绘音冷冰冰的脸就情不自禁地打了个冷颤，像是被人扔到了冰窟似的。下意识的攥紧了手中的热茶杯，好一会儿才缓回来。<p class='chapter_content_read_css'>  就她缓的这一会儿，各位世家小姐就各自摆好了绣品，她们自然绣不那么快，都是提前准备好的，不然，要是现场绣那要等到何时。<p class='chapter_content_read_css'>  众人循着看去，都发出一阵疑惑的惊叹声，那洛瑾香却是拿了一张手帕大小的素丝绸，干干净净的什么也没有。<p class='chapter_content_read_css'>  “她这是要拿一张空白丝绸比赛吗？”南宁有些疑虑的问道，“难道这小姐的绣艺很差吗？”<p class='chapter_content_read_css'>  “也不是吧？洛小姐的绣艺……”沈言的话还没说完，就听到洛瑾香站在台上大声说道。<p class='chapter_content_read_css'>  “今日，瑾香便变变这绣花的传统，往昔这绣花都是由各位小姐从家中带来的成品绣样，这样，似乎对所有人都不太公平，谁又知道这绣品是不是各位亲自绣的呢？是吧？”<p class='chapter_content_read_css'>  她这话刚落，便有几位世家小姐皱了皱眉，看来是被言中了。南宁松了松攥杯子的手，也注视着台上的洛瑾香，漫不经心的似乎被她盯了一眼，南宁心脏猛一顿，有种说不出来的难受，但当她的目光移开时，刚才的难过感似乎又只是错觉。<p class='chapter_content_read_css'>  注意力又再次回到台上。<p class='chapter_content_read_css'>  “数日之前，瑾香便向才情会提出了将绣花改到主船上来，大家就各凭本事，现场秀出好的绣品，好让大家心服口服。当然，各位也可以带半成品上来，那样也可以节约时间不是吗？今日，瑾香便先做一个表率，先在这主船上刺绣了。”说着就拿好了绣具跪坐在绣台前，穿针引线，绣了起来。<p class='chapter_content_read_css'>  整个会场寂静的连根针掉落的声音似乎都可以听到，所有人都目不转睛的望着洛瑾香，也都回味着这话中的意味。<p class='chapter_content_read_css'>  南宫宁雪扣了一下手指，嘴角虽挂着温文尔雅的笑容，心里却在独自思量，这一趟中辰之行倒是让他有了不少的收获和不少疑惑。终于见到了梦寐以求的夜凝花便已是最大的收获，抬眼看了看南宁和书绘音，这女子来历奇怪，又懂得不少巫术，银发男子又和过世多年的宫珀有何关系？还有……母亲的死因……还有，舅舅，又跑去了哪里？<p class='chapter_content_read_css'>  南宫宁雪在心里闷叹一声，似乎疑问又多了不少，这时候，竟又开始想念师父，好想听他答疑解惑。<p class='chapter_content_read_css'>看着沙漏里的沙子渐渐漏完，洛瑾香也停下了针，面若含笑，让小厮将绣品展开立起来，众多人都倒吸了一口凉气，赞叹声此起彼伏。<p class='chapter_content_read_css'>  “在场的诸位应当认得此花，此乃忘川河岸阴司之花，名为忘川花，在阴年阴月阴日阴时阴刻盛开在忘川河岸，此花可保人起死回生，尸身不腐，但，那也只出现在传说之中，今日，瑾香便绣九九八十一朵忘川花，来夺得这才情会的头牌。”她语气轻柔，但最后一句已让众人没有不判她获胜的理由。<p class='chapter_content_read_css'>  南宁盯着那花看了半晌，明明就跟自己卧室里养的那两盆曼珠沙华一模一样，在这里却是叫什么忘川花，忘川河么？似乎有听以前的那些客人说过，那花只生长在忘川河的左岸，右岸则是和集市般的城镇很像的地方。<p class='chapter_content_read_css'>  或许等自己百年之后就可以见到了吧。南宁自嘲般的笑了笑，只是这一笑却被洛瑾香恰好看到。<p class='chapter_content_read_css'> “不知这位姑娘笑是何意？难道是瑾香绣的不够好么？”<p class='chapter_content_read_css'>  南宁猛地收敛了笑容：“我，我并无此意只是在想些私事罢了，小姐的绣艺算是顶好的了，我又怎么有如此意思呢？”<p class='chapter_content_read_css'>  “哦，这样啊，对了，刚才似乎没有看见姑娘你的绣品和花卉呢，是忘记了么？”洛瑾香故意将“忘记了吗”四个字咬得重音。<p class='chapter_content_read_css'>  “没有忘记，我只是没有参加罢了。”南宁看着她解释道。<p class='chapter_content_read_css'>  “可是，才情会的规矩可是所有出席的人，除了有家室的不用参加以外，别人都是必须参加的，姑娘这不是坏了我们的规矩嘛。”洛瑾香轻声细语，但字字咄咄逼人。<p class='chapter_content_read_css'>  “这……”南宁也听出了她口中的针对意味，不由得无语，真是倒了八辈子霉了，摊上这种事，“这确实是我的疏忽，我从外乡来，自是不晓得中辰的规矩，还望小姐见谅了。”<p class='chapter_content_read_css'>  “见谅自是好说，只是，这才情会一向是各世族之间才有请帖，不知，姑娘的请帖从何而来？”她这一句才是戳到了重点上。若是南宁没有请帖就混了进来，势必会被各世家排挤打压。<p class='chapter_content_read_css'>  南宁一顿，手便探进了袖筒中，刚想将名帖拿出，忽然看了南宫宁雪一眼，心里有些犹豫，名帖应该只有一张，而且邀请的也并非是自己，如果自己拿出这一张来，那南宫公子该怎么办，是他赠于自己的名帖，总不能拖人家下水吧？<p class='chapter_content_read_css'>  不过犹豫一阵，便让洛瑾香钻了空子，她含笑的看向南宁：“姑娘你不会是没有名帖吧？就算是与朋友一同来的也好啊。”目光从书绘音面前一闪。<p class='chapter_content_read_css'>  南宁情不自禁的看向书绘音，他也回望着她，只是目光幽冷，南宁心中不由得恼了恼，又瞬时想到了什么，脸色变得异常惨白，微微低了眼帘，说不出话来。<p class='chapter_content_read_css'>  南宫宁雪见她窘迫，又考量到说到底都是自己那一张名帖的缘故，刚想开口，就听到沈言幽幽开口道：“洛家姐姐何必要如此刁难沈某带来的人呢？”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351920&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351920&&novelId=15670'">下一章</div>
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
