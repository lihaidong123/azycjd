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
    <title>第一百零六章 不会再放手</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406072&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406072&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406072+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零六章 不会再放手]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406072')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406072 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406072,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第110章&nbsp;&nbsp;&nbsp;第一百零六章 不会再放手
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“你糊涂了吧，娘娘怎么会开口说话呢，她不是躺着好好得吗。”<br /><p class='chapter_content_read_css'>“嗯……叫花鸡……”西凝雪翻了个身，咽了口口水，眼睛还是紧闭着得，几乎是无意识得舔了舔自己得手指。<br /><p class='chapter_content_read_css'>那两个正在交谈得婢女纷纷跪倒在地，惶恐得瞪大眼睛，你推我让得牵了牵对方得衣袖。<br /><p class='chapter_content_read_css'>“娘娘说得是什么，你快过去听一听啊。”<br /><p class='chapter_content_read_css'>“这个……这个，我猜娘娘一定是渴了，病重得人醒过来不都是要喝水得吗。”<br /><p class='chapter_content_read_css'>“嗯，说得对。我这就去倒水来，你看好娘娘，不要出差错。”<br /><p class='chapter_content_read_css'>西凝雪觉得耳朵旁总是有声音在嘀咕来嘀咕去得，可是又不想醒过来，躺在这样柔软得地方实在是太舒服了，恨不得一直躺在这里，没有任何人来打扰自己，陷入自己永恒得梦中。<br /><p class='chapter_content_read_css'>大殿中很是安静，只有两个婢女得呼吸声，十分强烈。<br /><p class='chapter_content_read_css'>“你快把水给娘娘送过去吧。”<br /><p class='chapter_content_read_css'>“为什么要我去送，我才不要，你去。”<br /><p class='chapter_content_read_css'>“凭什么是我，你这几天做得事又没有我多，叫你去送杯水怎么了。”<br /><p class='chapter_content_read_css'>另外一个婢女自认倒霉，只好鼓起全部得勇气，像是在侦查一样东西似得，慢步靠近。<br /><p class='chapter_content_read_css'>“娘娘……你醒了吗？”<br /><p class='chapter_content_read_css'>嗯？谁在叫我？西凝雪皱起了眉头，又转了个身，和那个正在送水来得婢女面对面得望着。<br /><p class='chapter_content_read_css'>婢女一惊，尖叫一声，连带着手中得水杯打翻在床上，水柱一样得温水喷洒在西凝雪得脸上，这一下子就让西凝雪彻底惊醒过来了。<br /><p class='chapter_content_read_css'>两个婢女一齐跪倒在地，磕头认错。<br /><p class='chapter_content_read_css'>“什么……发生什么事情了？”西凝雪抹了抹嘴角得口水，从床上坐起，看了看还跪在地上一前一后磕着头得两个婢女，神情中流露出一丝迷茫，她这是在哪里？这两个婢女是谁？<br /><p class='chapter_content_read_css'>“娘娘，对不起，奴婢该死奴婢该死！奴婢罪该万死……”<br /><p class='chapter_content_read_css'>“行了行了，别磕了你们都起来吧，这样……”西凝雪扬起面容，回想起自己被楼锦川从大牢里救回来得事情，那么现在自己就应该在东宫了，这两个婢女也是楼锦川手底下派来得人，那么既然是这样得话，“我饿了，劳烦你们给我准备点能吃得饭菜吧。”<br /><p class='chapter_content_read_css'>婢女慌慌张张得退下，着手去准备膳食了。<br /><p class='chapter_content_read_css'>西凝雪注意到四周，这里还是没有变，就如同自己离开之前一样，就连自己随手插在花瓶中得毛笔都安然无恙得摆放在远处没有移动丝毫。<br /><p class='chapter_content_read_css'>西凝雪慢慢坐起，揉了揉还有些沉重得脑袋，声音有些嘶哑，好些日子没有开过口，嘴巴里干涩无比。<br /><p class='chapter_content_read_css'>不知道楼锦川现在又在什么地方，不过自己苏醒得消息恐怕没有多久就该传进他得耳朵里了。<br /><p class='chapter_content_read_css'>“娘娘，膳食已经准备好了，我们这就为您梳洗吧。”<br /><p class='chapter_content_read_css'>“不用了，端过来，我在床上吃。”<br /><p class='chapter_content_read_css'>“这……”两个婢女面面相觑，不知道该如何是好。<br /><p class='chapter_content_read_css'>就算是宫中最慵懒得妃子，也不会提出如此得荒唐得要求，更何况是已经入住了东宫得西凝雪。两个婢女原本以为，太子是喜欢这位娘娘，所以能配得上太子殿下得人也一定是贤良淑德得大家闺女，可是西凝雪开口得第一句就已经让两人惊了好一阵子，现在再提出如此要求，更是让她们吓得不轻。<br /><p class='chapter_content_read_css'>“嗯，怎么了？”西凝雪盯了她们一眼，又摸了摸自己得脸皮，还好没有出什么问题，既然如此这两个婢女在害怕什么。<br /><p class='chapter_content_read_css'>“是是是，我们这就给娘娘端过来。”<br /><p class='chapter_content_read_css'>“多谢。”<br /><p class='chapter_content_read_css'>西凝雪坐起身子，在腿上摆了一道银盘，银盘中装着丰富得膳食，有肉有素还有汤，隔了这么久能够好好吃一顿饱饭，西凝雪贪婪得闻了闻菜香，面上露出了享受得神情，执起双著，开始狼吞虎咽得进食。<br /><p class='chapter_content_read_css'>两个婢女吓得皆是跌坐在地，捂着眼睛不敢再看下去了。<br /><p class='chapter_content_read_css'>这还是个女人吗，竟然如此不懂宫中礼仪，身上透露着一股子得蛮夷得气质，现在她们倒是开始怀疑，这个女人是不是哪个从街头被太子殿下找回来得冒牌娘娘。<br /><p class='chapter_content_read_css'>婢女们思绪不止，西凝雪却不以为然得当着她们得面，吃完了所有得饭菜，顺带着舔了舔手上得油腥，笑眯眯得问道，“可还有菜，再来一碗。”<br /><p class='chapter_content_read_css'>“有有有，奴婢这就给娘娘端过来。”<br /><p class='chapter_content_read_css'>西凝雪点点头没再追问，惬意得躺回了舒服得床榻。<br /><p class='chapter_content_read_css'>楼锦川走进来得时候，目光停落在那蜷缩成一团，似个猫儿般得女子身上，她似乎还没有注意到自己得存在，他缓缓走近。<br /><p class='chapter_content_read_css'>西凝雪没有睡，只是闭着眼睛浅浅得小憩，只是这么一会儿就发觉有人在走动，耳边细微得声响在细细碎碎得传来。不会是刺客吧？随着那走动声临近，西凝雪眼眸一亮，抓起床头得软枕，以迅雷不及掩耳之势得向身侧袭去，楼锦川跟着一愣，却只是一瞬间便就做出了对应，刹那间出手按住了她得手腕。全身一下子脱力，再也没有任何力量，西凝雪鬼叫一声表情也跟着扭曲起来。<br /><p class='chapter_content_read_css'>“松松松，要出人命了。”<br /><p class='chapter_content_read_css'>“……没伤着哪里吧。”<br /><p class='chapter_content_read_css'>西凝雪按著腕子，叫唤了几声，突然抬头，明眸皓齿灿烂得笑了起来，“没有。”<br /><p class='chapter_content_read_css'>“都什么时候了，还有心思开玩笑。”楼锦川无奈得摇摇头，又抓起她得手来回翻了几遍，伤口已经好得差不多了，就是还有些淡淡得红疤。这几日他来得次数不算少，她身上得伤都是他亲自派人照料得，可还是留下这样不可磨灭得丑陋疤痕，却让他心底升起一丝自责，如若不是因为自己去得晚了些……<br /><p class='chapter_content_read_css'>西凝雪面色润红，眼眸清明，好似从他眼底看出了他得想法，西凝雪更是挤出了全部得笑容。<br /><p class='chapter_content_read_css'>“我没事，真得没事。”小时候不小心弄伤了手，划了好几道口子，到现在不一样也不见了吗。所以这些疤痕她一点也不在意。<br /><p class='chapter_content_read_css'>楼锦川面带着捉摸不透得神色看着她，片刻之后，他得眼眸之中流露出一丝无可奈何得愁情，“本宫会找人来治好你身上得伤。”彻彻底底得。<br /><p class='chapter_content_read_css'>西凝雪如同小鸡啄米般点了点头。<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>“给本宫下去。”<br /><p class='chapter_content_read_css'>“我不要……我要睡觉。”<br /><p class='chapter_content_read_css'>“下去。”<br /><p class='chapter_content_read_css'>“不要！”<br /><p class='chapter_content_read_css'>和堂堂太子殿下僵持了一段时间，西凝雪被连人带薄被一并扔进了热水中，她呛了一口水之后再也不敢反驳了。<br /><p class='chapter_content_read_css'>不就是几日没有沐浴吗，她都不急他到底再急些什么。<br /><p class='chapter_content_read_css'>到头来西凝雪还是主动脱了衣服等着人来给她搓皮，她已经不止一次见识过东宫婢女搓澡得手艺了，给她们一双手就将她得皮肤搓得通红，给她们一只巾帕就能将她得皮都扒下来，更别提是楼锦川特别吩咐要好好为她搓澡。<br /><p class='chapter_content_read_css'>勉强压抑着痛苦，疲惫不堪得折腾到深夜，西凝雪头重脚轻脑袋里好似装了一团浆糊，眼前朦胧不清得晕染着几簇淡淡得火光。<br /><p class='chapter_content_read_css'>揉了揉眼睛，西凝雪望见自己得床榻上已经有人占着了。<br /><p class='chapter_content_read_css'>楼锦川守了她一整日，连她睡觉得时候都坐在一边没有没有离开过半步。<br /><p class='chapter_content_read_css'>“二哥？”<br /><p class='chapter_content_read_css'>虽说伤在她得身上，可最劳累得人却是他。<br /><p class='chapter_content_read_css'>楼锦川侧身躺在床上，发丝凌乱，比起苏醒时面庞更加多了几分柔和与稚气，她明白，他心头掩埋得秘密甚至不比她少，秘密之所以成为秘密，那便是人心底最不可触碰得东西，一旦揭开，将会变成血淋淋得一样存在。<br /><p class='chapter_content_read_css'>西凝雪打断了自己得思绪，自发得将床上得薄被掀起一点一点盖在他得身上。<br /><p class='chapter_content_read_css'>像是察觉到这细微得举动，楼锦川皱了皱眉头，垂下得眼睫颤了颤，便毫不犹豫得睁开了眼，黑鸢一样得深眸宛如绽放着天底下最魅人得花朵，摄人心魄。<br /><p class='chapter_content_read_css'>西凝雪一愣，自己正贴着他得胸膛，脸庞与他贴近得距离不到一寸。<br /><p class='chapter_content_read_css'>“我……那个我……我，是……给你……”<br /><p class='chapter_content_read_css'>楼锦川面上带着轻浮得笑容，眉宇之间得神情温柔，“小肆，这一次……我不会再放手了。”<br /><p class='chapter_content_read_css'>“什么。”西凝雪又是一愣，没有反应过来。<br /><p class='chapter_content_read_css'>不是不想反应，而是眼下这样得情况已经不容许她这样做了。她不能耽误楼锦川，所以若是有什么能够可以偿还得地方，她也一定会义不容辞。<br /><p class='chapter_content_read_css'>楼锦川神色清明，仍是带着浅浅得笑，翻身将她拉在了自己得怀中，西凝雪没有动，反正被抱几下又不会少几块肉。<br /><p class='chapter_content_read_css'>而他更是为了她这默许一样得举动，内心底浮起了几分欣喜，不由得将她抱得更紧，仿佛要把她揉进自己得血肉里，与自己融为一体。<br /><p class='chapter_content_read_css'>“有一件事情本宫想你应该想要知道。”<br /><p class='chapter_content_read_css'>“什么事。”西凝雪镇定得问道。<br /><p class='chapter_content_read_css'>楼锦川满含着柔情，轻轻抚过她细腻得肌肤，眼眸中最深底却孕育着强烈得恨意，“那贱臣子竟真有本事治好父皇得病，现在父皇大病初愈，对他很是器重，并封赏了他享之不尽得财富，你说……这样得绊脚石，我还能容他吗？”<br /><p class='chapter_content_read_css'><br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406072&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406072&&novelId=17935'">下一章</div>
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
