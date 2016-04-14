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
    <title>（十一）茶楼之中遇棋手 一朝棋子定钟情</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351924&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351924&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351924+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十一）茶楼之中遇棋手 一朝棋子定钟情]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351924')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351924 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351924,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第12章&nbsp;&nbsp;&nbsp;（十一）茶楼之中遇棋手 一朝棋子定钟情
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  沈言梳洗罢，卧在床上，心中思绪万千，从枕下拿出血迹斑斑的银铃铛，反复摩挲着，沉沉的叹了一口气，忽然想到约定之期便是今天，忙的挑起衣物穿戴起来，动作却渐渐慢了下来，终是静坐到床上，不再有动作。<p class='chapter_content_read_css'>  想了良久，又重新将衣物脱下来，下定决心般的躺回床上，裹着被子，紧闭着眼，心中不断催眠自己，不要再想了，是她背叛了自己，自己也有了家室，就这样断了就好了，了断了就好了。<p class='chapter_content_read_css'>  “呼。”他长出了一口气。<p class='chapter_content_read_css'>  “你在骗自己。”忽然一个声音在他耳边响起，他猛地惊醒，刚想大喊，却发现自己根本发不出声音，他坐起身，看向声源，有些吃惊。<p class='chapter_content_read_css'>  “我是谁并不重要，重要的是你在欺骗自己，你根本忘不了她，娶洛瑾冉不过是趋于你父亲的威胁罢了，怎么，我有说错吗？”书绘音正平静地坐在一旁的凳子上。<p class='chapter_content_read_css'>  “呐，当年的事么？成亲当天你看到夏曼修书一封推掉婚约，在晚间又看到她与人无媒苟合……”他看着沈言的脸一寸寸变得铁青，又继续说道，“其实，那时夏曼的尸骨早在枯井里躺着了，只是所有人都不知道罢了，夏家主仆十一口一夜之间全都消失不见，还有那些财产，你们也都是以为夏家羞于见人而逃开了吧，可是谁又知道呢？他其实是去了一个你们都看不到的地方。说不定，你现在就踩在他们身上呢。”<p class='chapter_content_read_css'>沈言难以置信地看着他，身体止不住的颤抖，手中紧紧攥着那铃铛。<p class='chapter_content_read_css'>  “至于他们为什么会死，你还是不要知道的好，但夏曼却实实在在为你而死。”书绘音站起身推开窗，“瞧瞧，子时三刻已经到了呢。”<p class='chapter_content_read_css'>  沈言赶忙穿戴衣物，书绘音不再看他，从窗户跳走。<p class='chapter_content_read_css'>  书绘音贴在墙边，柔和的月光洒在他身上，眼神低沉。<p class='chapter_content_read_css'>  他不是个喜欢说话的人，今日能与沈言说这么多，也是看在南宁的份上。<p class='chapter_content_read_css'>  他心中暗道：南宁，我可是只能帮你到这儿了。<p class='chapter_content_read_css'>  “曼儿。”沈言无声地念着，眼眶里的泪水终是静静滑落。<p class='chapter_content_read_css'>  沈言刚穿戴好衣物，就听到敲门声，还有安叔的声音：“二公子，洛大小姐来访，人在花厅。”<p class='chapter_content_read_css'>  沈言一皱眉，这么晚了，她来做什么？试着咳了一声，发觉有声，便道：“我要睡了，麻烦她明日再来。”<p class='chapter_content_read_css'>  “可是，洛大小姐说有重要的事。”<p class='chapter_content_read_css'>  “啧，算了。”沈言推开门无奈地向花厅走去，心道，要快些完事。<p class='chapter_content_read_css'>  “呀，妹夫，这么晚还要打扰你，真是抱歉。是华裩郡的一些药商出了动乱。”洛瑾香拿出一纸名单，指着上面的几个名字道，“就是这几家出了动乱。”<p class='chapter_content_read_css'>  沈言闻言也屏住神，仔细听她讲，洛瑾香见状，便开始侃侃而谈。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  夜风萧瑟，狐裘不暖。<p class='chapter_content_read_css'>  梦里看花，世事忧欢。<p class='chapter_content_read_css'>  时间一分一秒的溜走，南宁冷的打了个哆嗦，但见夏曼倚在庭柱上，一身大红的衣装显得极其萧瑟。<p class='chapter_content_read_css'>  “秦姑娘，可知为何我会一身红妆？”南宁还未开口，夏曼先一步缓缓吐语。<p class='chapter_content_read_css'>  “这是嫁衣，可惜，他见不到了。”像是喃喃自语，她背对这南宁，看不清表情，但南宁却可以想象出她会是如何一副萧然模样。<p class='chapter_content_read_css'>  “遇到他，是我一辈子最不后悔的一件事，却又是我最后悔的一件事……”<p class='chapter_content_read_css'>  南宁屏息听她缓缓道出往事。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  泽成夏沈两家背景截然不同，夏家乃是官宦世家，在朝官职大小不等但也是三代官家，这一代的夏父便是第三代官家，为泽成郡守；而沈家则是世代商贾，古制有商贾子弟不得入朝为官，这两家本应无所交集，而命运却让两家有了纠缠不清的牵扯瓜葛。<p class='chapter_content_read_css'>  夏父为官之前也曾闯荡过江湖，与同样意气风发的沈父结为异性兄弟，知晓对方身份后，而不仅没有间隙反而更加亲密起来，而后夏父走上仕途，做了泽成郡守，对沈家更是扶持照顾，由此，沈家的商贾之路也更加顺利，逐步开始将商铺扩至全国。<p class='chapter_content_read_css'>  十八年前，夏母坐胎，两家便结下约定，若是男儿，便与沈言结为兄弟，若为女儿，便嫁与沈言，两家结为秦晋之好。同年，夏母诞下一女婴，唤为曼儿。那一年，沈言八岁。<p class='chapter_content_read_css'>  再过两年，夏父被远调它地，两家也渐渐断了联系。<p class='chapter_content_read_css'>  直至十三年后，夏母回泽成省亲，夏父退官，夏家才得以回泽成，那时两家才又有了联系，至于沈言与夏曼，这时还未认识对方。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “啊啊啊啊！混蛋！”茶楼里突然爆出一声怒吼，惹得路人都震了两震，虽是如此，但绝没人敢往里望几眼，都脚步匆匆地闪离开来。<p class='chapter_content_read_css'>  “你个混蛋，竟然敢偷换本小姐的棋！看本小姐不打死你！”女孩不过十四五岁的年纪，脾气却不小，抽了桌上的剑，掀了棋盘，就往对面少年刺去，那小少爷打扮的少年吓得定在原地不敢动弹，眼瞅着剑就要刺到身上，突然有个东西打到剑上，偏了位，只擦了一下那人的衣角。<p class='chapter_content_read_css'>  女孩朝楼上望去，只见一位青衣男子朝这边看来，身边站着一位小侍，那“凶器”筷子便是那小侍掷出的，她柳眉一横，用剑指向那男子，“你干嘛多事！”<p class='chapter_content_read_css'>  一旁的少年一瞧见男子，立马喜上眉梢，“表哥！”<p class='chapter_content_read_css'>  女孩轻啧一声，原来是亲戚，怪不得帮他出头。<p class='chapter_content_read_css'>  男子看了女孩一眼，他在这茶楼好几日了，就看见她一连几日都在同一个位置上摆棋盘，找人下棋，一开始还有人应和着和她下棋，大约是女孩棋力太好，竟没有一人能够赢她，还有输者耍赖，被女孩打的屁滚尿流，自此这女孩凶暴的行径传的人尽皆知，也很少有人敢同她下棋。<p class='chapter_content_read_css'>  正好倒巧，他表弟刚从婶婶家回来，闲不住偷溜出来玩，竟是到了茶楼来和她下棋，棋技不如人家，还敢偷换棋子。<p class='chapter_content_read_css'>  不过一会儿，男子就下楼来，看着女孩，温文而道：“是舍弟冒犯了姑娘，还请姑娘原谅。”<p class='chapter_content_read_css'>  “表哥！我……”少年还想辩解什么，被男子冷眼一扫，噤声。<p class='chapter_content_read_css'>  “还敢狡辩，我在楼上可是看的一清二楚，你竟然趁人家不注意之时偷换棋子，曲先生教你的君子之道你都抛哪儿去了！真是丢尽了沈家的脸！若是让叔叔知道了，你……”一听到他提“叔叔”二字，少年立马耸拉着脸求饶，“表哥，你可千万别告诉我爹，否则他可是要打死我的，表哥……”<p class='chapter_content_read_css'>  “好，”男子看向她，“若是不想让叔叔知道，就向这位姑娘道歉，若姑娘原谅你，我便不再提此事。”<p class='chapter_content_read_css'>  少年耸拉着脑袋，低声道：“对不起。”<p class='chapter_content_read_css'>  “大声点。”男子眼神一扫他。<p class='chapter_content_read_css'>  “对不起！是我错了，我不该偷换姑娘的棋子，做如此小人行径，还请姑娘海涵。”越说，声音越小。<p class='chapter_content_read_css'>  女孩见他的窘样，扑哧一笑，又立刻轻咳一声，装作很正经的样子道，“好，让本小姐原谅你也行，那就……嗯……”忽然指向男子，“你陪我下一盘棋，你赢了，我就原谅他。”<p class='chapter_content_read_css'>  “好。”男子一笑，吩咐小二重新收拾一盘棋。<p class='chapter_content_read_css'>  “表哥，你可要赢她啊……”少年看向他，冒着星星眼。<p class='chapter_content_read_css'>  “姑娘先请。”<p class='chapter_content_read_css'>  “好。”她也不推脱，执子而落。整个茶楼里回响着叮叮咚咚的落子声。<p class='chapter_content_read_css'>  少年紧张兮兮的盯着棋盘，每落一子，心里就打一下鼓。男子倒还好沉默着十分认真地对付女孩的每一步棋。<p class='chapter_content_read_css'>  两刻钟后，女孩一擦满头大汗，落子一顿，道：“我输了。”<p class='chapter_content_read_css'>  “姑娘承让。”男子也瞧出她棋力不弱，他也只是险胜她半子而已，“姑娘这下可以原谅舍弟了吧？”<p class='chapter_content_read_css'>  “自然，本小姐可是一言九鼎，大人不记小人过，原谅他了。”她忙喝了一口水。<p class='chapter_content_read_css'>  “多谢姑娘原谅。”少年这才松了一口气儿，“真是多亏了表哥。”<p class='chapter_content_read_css'>  男子训斥着少年转身离去。<p class='chapter_content_read_css'>  女孩一顿，赶忙大喊：“敢问公子尊姓大名？”<p class='chapter_content_read_css'>  他微微侧头。<p class='chapter_content_read_css'>  “免贵姓沈，单名一个言字。”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351924&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351924&&novelId=15670'">下一章</div>
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
