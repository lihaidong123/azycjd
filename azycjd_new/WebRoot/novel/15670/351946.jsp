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
    <title>（三十三）寺院求安遇贵人 孚城之岛来新人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351946&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351946&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351946+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十三）寺院求安遇贵人 孚城之岛来新人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351946')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351946 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351946,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第34章&nbsp;&nbsp;&nbsp;（三十三）寺院求安遇贵人 孚城之岛来新人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			出事第二天楚萱雨见琴霜七还是愁眉不展，就自告奋勇带她到就近的玉泉寺庙求安。<p class='chapter_content_read_css'>“七七姐，书公子不是说过了吗，南宁一定会没事的，而且南宫公子不是也确诊过了的确没事。不要再担心了嘛。”楚萱雨尽力安慰琴霜七，但效果是——一点儿也没效果。琴霜七被她搂着胳膊往玉泉寺庙走去，脸上依然是怏怏不快，走路也是拖着步子，十分沉重。<p class='chapter_content_read_css'>琴霜七完全没听到楚萱雨在跟她说什么，只觉得像是犯了耳鸣两只耳朵里都只有嗡嗡嗡嗡的声音，眼前的景象也是模糊一片，要不是她摸了摸眼睛，还以为是没戴隐形眼镜而造成的。头顶上也像是顶了一大片乌云，浑身都阴湿湿的很不舒服。<p class='chapter_content_read_css'>“啊，到了。”楚萱雨定睛看着寺庙里人来人往，玉泉寺庙门口立了一尊一丈多高的佛像，她们从一边绕过进入寺院中，琴霜七心中一震，回头看着那尊佛像，佛像很普通，就跟她在T市的寺庙里见到的一样，只不过这里是放在了门口。<p class='chapter_content_read_css'>琴霜七一笑，说不定来这里求安真的来对了。她心里立即放了晴，嚷嚷着让楚萱雨带自己去求安。<p class='chapter_content_read_css'>楚萱雨见她精神起来高兴一笑，搂着她的胳膊往内院走去，越往内院人就越多。<p class='chapter_content_read_css'>“这里的平安符很灵验的，之前我有给风清求过一个，怎么样，你给南宁求一个也会灵验的。”楚萱雨一边和琴霜七排着队，一边讲着话。<p class='chapter_content_read_css'>“嗯，”琴霜七点点头，很突然的打了个喷嚏，困惑地揉揉鼻子，“啊，不会是有人在说我坏话吧？”<p class='chapter_content_read_css'>“怎么会呢？”<p class='chapter_content_read_css'>“啊，也说不定。”琴霜七不以为意的摆摆手，“说不定是琴晓阮那个臭小子在说我，那个臭小子。”<p class='chapter_content_read_css'>楚萱雨歪歪头，琴晓阮是谁？不过和七七姐是一个姓吗？秦？琴？<p class='chapter_content_read_css'>“真的是好漫长啊——”琴霜七忍不住吐槽一句，严格来说她从来没排过这么长时间的队，买票什么的直接网上解决。<p class='chapter_content_read_css'>慢慢毒辣的阳光改变了方向，大喇喇地射在她们身上，她们随着队伍不断向前，阳光就像是长了眼睛一直跟着她们，两人背上都落满了密密麻麻的汗珠，楚萱雨用帕子擦拭脸上的汗水，而琴霜七则大大咧咧的用袖子直接擦掉。<p class='chapter_content_read_css'>忽然一大片阴凉直直落在二人头顶，两人都诧异地一抬头。原是一把油纸伞撑在头顶，再看那撑伞之人，一副侍卫打扮，面色冷清，腰间配一把长剑。<p class='chapter_content_read_css'>“姑娘如是不介意就请接下这把伞，这是吾家王……公子的一番心意。”他说着将伞递给楚萱雨。<p class='chapter_content_read_css'>“谢谢。”楚萱雨话音刚落，他就不见了踪影，琴霜七张望着脑袋终于在队尾看到了送伞之人，正毕恭毕敬的和旁边的华服男子讲话。她立刻指给楚萱雨看。<p class='chapter_content_read_css'>楚萱雨虽是看清了那华服男子的模样，但想了好久也不记得见过这个人。<p class='chapter_content_read_css'>琴霜七拍拍她的肩膀，笑道：“你今天是犯桃花也说不定哈，人家既然肯送伞给你，有缘的话还可以再见面的。”<p class='chapter_content_read_css'>又等了一刻钟两人才进了堂里面，堂里面的布置很简单，中央是一尊象征平安的佛像，周围是雪莲花和唐菖蒲，当然只是假花，但却散发着阵阵清香。左边，也就是她们正站在的地方，是一位僧人拿着凶吉签问她们佩戴平安符人的生辰八字。<p class='chapter_content_read_css'>这下可问倒了琴霜七，她可不知道什么生辰八字啊。不过幸好有楚萱雨，楚萱雨利索的回答出来南宁的生辰八字，那僧人手一顿，还是把凶吉签递给琴霜七。<p class='chapter_content_read_css'>两人摇了签往右边走去，按照指示把签扔进四方的井里，通常来说井口都应该是圆形的并且是建在室外院中，但这口井井口不仅是四方形的还建在室内，连周围都刻着奇奇怪怪的花纹。琴霜七不禁多看了几眼，还想伸手去摸摸，幸亏被楚萱雨拦住了。<p class='chapter_content_read_css'>制平安符的僧人将平安符递给琴霜七，眼神很有深意的看了她一眼。<p class='chapter_content_read_css'>琴霜七以为是刚才自己的小动作被看见了，爽朗的咧嘴一笑，“谢谢您了。”<p class='chapter_content_read_css'>两人搂着胳膊往外走去，琴霜七好奇地问道：“萱雨你怎么知道南宁的生辰八字的？我都从来没听说过。”<p class='chapter_content_read_css'>“是出门前王爷告诉我的。”<p class='chapter_content_read_css'>“顾白？”琴霜七眉头一皱，摸着下巴道，“他怎么会知道的？难道是书绘音告诉他的？不对啊，书绘音不像是会说这事的人，还有，顾白对南宁也太好了吧，虽然看着他没动什么野心思，但总觉得哪里怪怪的。”<p class='chapter_content_read_css'>“会不会是王爷把南宁当做妹妹看啊？”楚萱雨不知道什么时候买了两串糖葫芦，递给琴霜七一串，自己拿着一串小口吃起来。<p class='chapter_content_read_css'>“就算是当做妹妹来看，又怎么会宠成那个样？”琴霜七冲着糖葫芦就咬了一大口。<p class='chapter_content_read_css'>“嗳，七七姐你不知道吗？王爷他可是有名的宠妹妹，我是从风清那里知道的，虽然那是只是听说，但稍微老一辈的都知道。”楚萱雨想了想，又道，“七七姐你住在王府总该知道槿华苑吧，那就是王爷妹妹的院子，自从走水后就开始重建，听说是完全按照旧王府的样子建造的，还在相同的地方种植了木槿，尤其是槿华苑的木槿最多了，王爷还不允许任何人进到里面。尤其说明了他对妹妹的宠爱。”<p class='chapter_content_read_css'>“顾白的妹妹？”琴霜七沉思一会儿，想起来确实听说过，“是叫顾槿没错吧？是在走水的时候死掉的？”<p class='chapter_content_read_css'>“嗯，听说死的时候才只有三四岁吧，”楚萱雨慢慢凑近琴霜七压低声音道，“而且，她好像还是个哑巴，在找出她尸体的时候，王爷抱着她的尸首哭了整整三天，连嗓子都哑了，弄的半年都不能说话。”<p class='chapter_content_read_css'>“这么严重。”<p class='chapter_content_read_css'>“那时候王爷才只有十五六岁，现在都过去了十二三年了，王爷还是忘不了，现在又出现南宁，南宁和她年龄相差无几，王爷自然是要把感情全部寄托到南宁身上了。”楚萱雨说的头头是道，其实都是之前听公孙风清说的。<p class='chapter_content_read_css'>“这样啊……”琴霜七又咬了口糖葫芦，心口也像是被糖丝缠住，总觉得有哪里不对，楚萱雨和南宁年龄也差不多，为什么顾白只单单对南宁那么好呢？明明南宁来历不明不是吗？只是当做妹妹的替身么……<p class='chapter_content_read_css'>两人边吃糖葫芦边聊着天回到顾王府，两人一起扔掉竹签，琴霜七才想起来那把伞，又让楚萱雨打开转了两圈伞，终于在伞沿上发现了一个很小的“孚”字。<p class='chapter_content_read_css'>楚萱雨想了想，道。<p class='chapter_content_read_css'>“或许是孚城岛的人吧。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>坐了几天的船，晏紫荆终于到了孚城岛，在渡口买了两匹马立刻快马加鞭赶回家中，晏紫荆怎么也没想到文弱的小身板的阿南也会骑马，本想着买一匹马和阿南共乘，但看着阿南有些不好意思就多花点钱买了两匹。<p class='chapter_content_read_css'>两人骑了大概有半个时辰才到了城门口，两人下马牵马走进城中，城中小摊小贩大小店铺的老板都与晏紫荆是旧识，晏紫荆与他们谈笑风生，还买来不少东西，让阿南帮着拿一些。<p class='chapter_content_read_css'>等回到家时，一位妇人早就在大厅等候，看见她忙是上前查看，问东问西，晏紫荆也是一一回答。<p class='chapter_content_read_css'>“我爹呢？”晏紫荆到处望望也没看见她爹的身影。<p class='chapter_content_read_css'>“是西渡口刚进来一批货，你爹他带着你大哥去查货了，要到傍晚才能回来。”妇人这才注意到站在门口的阿南，“你是泠玉？快进来。”<p class='chapter_content_read_css'>“啊，忘了说了，”晏紫荆一拍脑门，“这位是我娘。”<p class='chapter_content_read_css'>“夫、夫人好。”阿南一直低着头，声音是一贯的诺诺。<p class='chapter_content_read_css'>晏紫荆把她牵进门，“这是我在一樱山救的阿南，我一开始也把她认成师姐了。娘，阿南家乡闹灾，亲人都去世了，我想让她留在我们家好不好？”<p class='chapter_content_read_css'>妇人温柔的摸摸阿南的头，道：“可怜的孩子，就住在我们家好了，就把这当成自己家就好了，顺便再教教紫荆怎么做个女孩子，紫荆整天都大大咧咧的，唉，到时候要怎么嫁出去啊，就算有她哥哥也不能养她一辈子啊……”<p class='chapter_content_read_css'>妇人很是发愁的歪头托住下巴，深深的看着晏紫荆。<p class='chapter_content_read_css'>晏紫荆被她看得很是发毛，大声嚷嚷道：‘哎呀，娘！你又说这件事！我怎么就嫁不出去了！就算嫁不出去我自己养活自己还不行嘛！”<p class='chapter_content_read_css'>“哎呀呀，是紫荆回来了啊，我就说嘛今天宅子里怎么这么吵，原来是紫荆这个大嗓门回来了啊。”男子慢慢悠悠地踱进大厅里，穿着一身青色的衣裳，胸前衣襟大开露出白皙的胸膛。<p class='chapter_content_read_css'>阿南微微抬头刚好看见，立刻臊红着脸低下头。<p class='chapter_content_read_css'>“二哥！”晏紫荆嗔视他一眼，每次都这样，都说她大嗓门，还总是一副轻薄模样，她上前伸手合上二哥的衣襟，“你没看见还有别人啊！”<p class='chapter_content_read_css'>“哎呀呀，是我失礼了。”二哥看见一旁沉默的阿南立刻拍开晏紫荆的手，一副彬彬有礼的模样走到阿南面前，阿南向后退退被二哥抓住了一只手，一时羞愤难当，不知该怎么办，“哎呀呀，姑娘和泠玉可真是一个模样刻出来的，只是你比泠玉可多了几分温婉，不知姑娘芳名，婚配可否，我——哎呦！”<p class='chapter_content_read_css'>“哼！”晏紫荆扬了扬刚才敲打二哥后脑的拳头。<p class='chapter_content_read_css'>“小姐，有您的一封信。”仆人匆匆跑来将信交给晏紫荆。<p class='chapter_content_read_css'>晏紫荆奇怪的看了看信封，没有署名。<p class='chapter_content_read_css'>慢慢打开信封……<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351946&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351946&&novelId=15670'">下一章</div>
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
