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
    <title>第六章 赶不上杀猪大会</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405618&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405618&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405618+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六章 赶不上杀猪大会]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405618')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405618 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405618,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第10章&nbsp;&nbsp;&nbsp;第六章 赶不上杀猪大会
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	景秀阁的一角，女官开了门那屋里头的霉味瞬间就扑了过来，女官嫌恶的捂住了嘴，朝后道，“你们两个给我进来。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这么臭啊……”西凝雪有些受不了的跨进门，那臭味出乎意料的封闭在整个屋子里，熏的人头晕脑胀的只想迅速的从这破地方逃出去。但她屏住气，还是努力的压抑住了想要逃走的冲动。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁刚进来也是大力的扇着鼻间的味，顺带起那一阵灰尘的飘飞。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正当两人好奇的打量这个破破烂烂、散着霉味的房间，女官偷偷的将门锁一扣，听到后方的声音两人不约而同的转头，门已经关上了，西凝雪慌神的敲了敲，果然已经上了锁而且除了房门四处已经没有其他的出路了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官冷笑着把钥匙一收，盛气凌人道，“你们两个小丫头不好好惩戒惩戒真不知道这景秀阁是什么地方……对了，忘了告诉你们，这屋里头从前可死过好几个人，个个都是在那梁上吊死的，冤魂不得其所，你们啊就好好给我在这屋里头呆上一夜陪着那些冤魂吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这个死老丑婆，竟敢耍我们，可恶！”西凝雪又踹了几脚房门，女官在门外哼了哼，悠闲着迈着步子离开了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁知道暂时是出不去了，便从房里搜罗来一条还算干净的布擦了擦布满灰尘桌子和凳子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	两人一同挨边坐下，西凝雪懊恼得抓了抓脑袋。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这下好了，她的计划都被打乱了，但转念一想这未尝也不是一件好事，如果因此正巧逃过一劫也好……正在心中思索着新的计划，云沁垂头丧气的叹了口气，西凝雪朝她望去，她神色忧郁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小雪……这可怎么办，刚来就被锁在了这种鬼地方，万一耽误了什么事，见不到皇上……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这都什么时候了，你还在担心能不能见到皇上？不是我说啊，皇帝有什么好见得，不过就是七老八十得老头子，我对他才没兴趣。”西凝雪也跟着抑郁起来，她的症结就在此，如果不被一道圣旨宣到景秀阁中，她也不必如此费尽心思得想破脑袋。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“老头子就老头子呗，可如果被他看中了，没准当上皇后成为后宫之主执掌凤印也是可能的呀……”云沁神色憧憬的托腮，“没准皇上这次就是选皇后来的呢……小雪，依你的容貌想要谋个妃位确是不难，不过你当真对皇上不感兴趣？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“怎么，还觉着我骗你不成，咱们关系这么铁的两姐妹，就算有一日我飞上枝头变凤凰成了皇后，我也会将这位置让给我最亲爱的沁儿。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不就是个破后位吗，谁稀罕就给谁，反正她西凝雪不稀罕，做大事的人怎么可能会被后位束缚着呢，沁儿也真傻，一入皇宫深似海，更别提当上了皇后那就更加会被后宫的三千妃子算计着，时时刻刻都不的安稳，真不明白沁儿怎么会喜欢在皇宫勾心斗角得，与其在此耗费青春，还不如出宫好好潇洒一场呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁脸红的扭过了头，憋不住的激动道，“那可说不准，你被皇上看重也是理所应当的啊，怕只怕……身份没封上，反倒守着冷宫过一辈子，那多委屈啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那如果真是这样，我们俩就逃走好了，逃到天涯海角去。”西凝雪没打算真的劝动云沁跟自己走遍天下去，她只是说出了自己心中的期望，离开这里，独自一人得旅程，惊喜不断的路途。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你想的也太远了吧。”云沁好笑道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪努努嘴什么都没说，忽然又想起了关于皇后的事，早年这事就在这宫内传遍了，西凝雪也是从多嘴的宫女口里听来的，西燕经过多年得征战，换了好几代的皇帝，最后皇帝的位置落到了慕容永的手里，原属于西燕的鲜卑族人已经人丁稀薄，慕容永下定决心与汉族相通，学习了汉族得繁文缛节兴复了西燕的繁荣。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	之后慕容永也有了自己汉人的名字：楼随月。只是在慕容永未成为皇帝的时候，就对鲜卑皇族得清河公主慕容欢心存爱念，慕容欢是当时西燕长公主地位自然非同一般，不过两人情投意合，慕容欢毫不顾忌的与他成亲，还生下了一个男婴，也就是现如今的皇子楼锦川。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	慕容永登上帝位，下令绞杀慕容皇族得遗孤，唯独留下了慕容欢一人在自己得身边。两人本是郎情妾意、你侬我侬，偏偏慕容欢不巧听闻了自己侄子，也就是当时得西燕太子被慕容永抓住，知道自己挽救不了侄子的死亡，当即大病一场任由太医院百般救治也无力回天，于是在仇恨与爱情的痛苦中最后选择了含泪而终。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但皇上对这位慕容欢可谓是喜爱至极，安帝慕容忠被将军刁云所杀，推举慕容永为帝，慕容永登基之后就下令举国吊唁，并追封慕容欢为容萱皇后，将这位容萱皇后的儿子立为了太子，这前朝后史中可没一人有他这么猴急的就把皇位候选人给订好了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	要说这慕容欢也是可怜，偏偏跟着自己的仇人。换作是她，肯定也会接受不了现实含泪归去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪沉默得和云沁坐在一块，寂静之下她第一个防不住得趴在桌上睡着了。半夜西凝雪被窗户上那碗口大的洞里吹来的冷风给吹醒了，她立即联想到是鬼风，倒不是有多害怕，这年头鬼都没有人心可怕，更别提是悬梁自尽含冤而终的鬼，迷迷糊糊的打量着四周，但是屋里头什么都没有发生，又趴下接着睡觉了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一夜美梦，醒来时天光已亮，刚一睁眼，黄昏的第一束光线就照进了眼里，一时受不住又侧过头抬手挡住了光。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿，沁儿，沁儿醒一醒啊。”西凝雪推了推身边的人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁也迷迷糊糊的醒来，脸上还印着衣褶子的红印。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	两人都从朦胧中清醒，才意识到一个问题。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“都这个时辰了，那薛翠花怎么还不来。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“她这是打算是把我们关到选秀结束吧。”西凝雪忽然就有了这么个想法，但如果真的是，那可就是太妙了！用不着她亲自动手，那薛翠花就替她解决了心腹大患，她回到府里之后改天还要设宴好好款待一下这位好心的女官才是。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁沉思了一会儿，走到门前用劲拍了拍，“有人没！救命啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“傻沁儿，别白费力气了，要是早能喊到人的话，那老丑婆就不会把我们带到离主屋这么远的破地方。不过我倒是无所谓在这呆上十天半个月的，但最起码给本姑娘送点吃得来啊，都快饿死了……”肚子饿得不行的西凝雪不满的捶了几下桌子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小雪，我们怎么能坐以待毙眼睁睁的看着选秀结束呢，不行，我们必须要出去！”云沁坚持不懈的在房间到处乱翻着，这里虽然是废弃的小屋，但毕竟经过那么多冤魂在屋里悬梁自尽，始终没有人敢来收拾房间，这些东西都保存的完好，这么一顿狂翻之下，倒还真被云沁找到了出去的法子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	就在床侧的那一堵墙上，云沁惊喜的招手道，“小雪，你快来看啊，这里的砖块松塌的很，或许我们可以通过这个洞口钻出去！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪本想告诉她我不感兴趣，我宁愿静静地坐着然后坐以待毙的看看星星看看月亮再欣赏一下夜里的美景，等着选秀结束爹娘来接她回家快乐潇洒去，可是盛情难却啊。云沁把那片砖块挪开腾出一个盆口大的洞，她怎可让云沁一个人以身试险呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁爬了出去，然后在墙外叫唤着让她快点出来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪最后扫了一眼房间，要是哪天想离开这里出宫游玩，这个房间的确是个不错的通道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	外边是直通景秀阁来时的大道，而西凝雪刚出去就听见王公公那标志性的细尖嗓，“薛女官，赶紧的让这群秀女都去浴池里好好洗一趟，切勿有半点不净，规矩你可是明白的……待会温太医会来检查她们身子的情况。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“温太医这次是要亲自来景秀阁？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“可不是嘛，太医院得长老们都为了调理皇上身体地旧疾忙得抽不开身。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“既然是这样，那我这就去……”女官喜悦的转身进阁中去通知秀女沐浴了，西凝雪和云沁装作没事人一样满身灰尘的跟着踱进了景秀阁，侍卫只是多疑的看了云沁一眼腰间挂着的秀女牌子，便不再阻挠。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪和云沁才刚走几步，便被女官察觉，女官回头见着两人，神情古怪得打量两人，“你们两个……是人是鬼。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“薛嬷嬷，你胆子何时这么小了。既敢将我们送进鬼屋，还怕我们变成那些个冤魂来索你的命吗？”西凝雪打趣得说道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“少贫嘴。”女官像突然吃了一斤苹果一样红彤彤的脸上柔和不少，“既然你们出来了，那我就先放你们一马，快些去浴池洗洗身子，洗完之后必须要穿上白衣，身上不准携带任何首饰，脸上也不许打妆，听到没有！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“听到了听到了。”西凝雪翻翻白眼，这也不许那也不许的，不就是去给太医检查个身子吗，又不是去侍寝，真是的……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	回到房间，刘淑妙早就去浴池了所以还留了门，云沁倒是听吩咐的将首饰都放进了的锦盒中，西凝雪也自觉的把自己的蝴蝶玉佩和小首饰都小心翼翼的摆进了包袱里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	正好又在包袱里看见小梅给自己收拾的毛笔和花汁，忽然灵犀一点，这明摆着不就是正好的机会吗！只要趁着这次检查身子把自己得了病的消息告诉太医，说不准就可以趁此机会离开景秀阁了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	偷笑着把东西往袖子里一塞，然后和云沁一道去浴池里泡澡了，两个房间那么大的浴池，水面还漂浮着玫瑰的花瓣，整个浴池一眼望去，雾气升腾都看不清人形了，耳畔隐隐约约的传来一群女子嬉戏打闹泼水的声音。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪刚下了水就与云沁失散，她也懒得移动身子，就着身边这片没人的地方扎进了水里，眯着眼惬意的享受了一番，还没到半个时辰呢，女官就进来催促着大家。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	所有得秀女都为了能够抢到第一个位置，都争先恐后的出去了，生怕晚了点赶不上杀猪大会。西凝雪才不愿意这么早起身，一个人又在池子里逗留了会儿，心想这太医检查身子也没这么快，所以就好好的搓洗了一番，顺便将刚才弄脏的脸也洗了好几把。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	闻闻自己的味，已经被千步香熏的从头到脚都是，如果不是还有衣服盖着，真不知道这股味儿能散多远。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	默默叹了口气，从水里站起身，然后去铜镜前收拾了自己湿漉漉的头发，接着又用毛笔在下半张脸上点了无数个小红点，确认都弄好了以后把自己早就带在身上的面纱一别，顺手把柜中的白衣一披，信心十足的对着铜镜摸了摸下巴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	温太医是吧？我倒要看看你能检出些什么来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪去的时候，正好轮到最后一名秀女出来，女官着急的让她快点进去，西凝雪依旧慢悠悠的走着，进了屋只见一道白帘纱隔在了她的眼前，而她脚边就搁着一张凳子，她当然不客气的一屁股坐在了上面。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她想这温太医挺会装腔作势，不过不知道他能不能忍受的了自己给他准备的惊喜。西凝雪眉目一敛，为了自己的大计娇滴滴的把握了一番嗓音，才开口道，“温太医，请问这隔着帘子怎么检查身子啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“把手伸出来。”西凝雪从未听过如此细腻温和的语气，倒和伏婳姐姐那诱人的音有着异曲同工之妙。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	看来还是个不经人事的年轻太医，所以根本没有放在心上的西凝雪伸出了手，心想着恐怕一会儿这年轻太医就要害怕的从这里逃走吧，一想到这副光景，西凝雪嘴角就憋不住的笑意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	抬眼，还以为他要出来了，没想到却是一道从白帘纱中飞射而出的银线，准确点说是拴着铜板又缠在她腕上的银线。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪忽然警惕起来，这悬丝诊脉她也只在医书上看过，若不是对自己的医术有把握，且在脉象上的知识学有所成的话是绝对不可能用上这高超的悬丝诊脉。不过皇宫中只有太医院的长老们才可使用金线，这是对皇室中人的尊重，看来他并不是御医，只是一个普通的太医而已。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	可今日却难得一见这悬丝诊脉，看来这太医还来头不小，西凝雪极快的阻止了胡思乱想，然后努力的凝神屏气，这样做的结果就是导致脉象紊乱，当然，如果是一个正常的大夫，是绝对诊不出来半分脉象的，但如果他真的那么变态……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪才憋上那么几口气，还没打算开始长久战争，就听帘子里传来云淡风轻得言语。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“姑娘，有什么事不要为难在下，在下只是个大夫。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	依旧好听，似乎不管有多燥怒的人只要听了这清淡的话语，就能平心静气下来。但西凝雪只是被这声音迷惑了几瞬间，仍是狠下心往死里吸气，然后直快的开口，“温太医，小女现如今都这样了，哪里还敢为难您呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	帘中之人并未开口，似乎在等着她接上下面的话，西凝雪不负他的意思，便续道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“其实小女子早就患上了不治之症……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哦？”上扬的音调。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“太医请看。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪一副悲壮的揭开面纱，那满脸的红点要是让平常人看了绝对渗心，万幸的是她自己看不见。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“呜呜呜……我家祖上就有患上天花的病例，到了我这，却不曾想在这重要的日子突然发作，现在恐怕已没人再肯要我了，我这辈子也算是毁了，我不求能够凭着这副样子还能让皇上喜欢，只怕身边得人都要对我避之不及，还望太医给个出路……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	为了能出这景秀阁，西凝雪头一次哭的这么梨花带雨，还带着几分楚楚可怜的捏紧小手帕，但暗地里却在阻止泪水划下，怕因此会弄脏了自己精心画好的天花痘。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“既然如此，我这里正好也有个方子可让你痊愈。”这位神秘太医沉思片刻，才道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“呜呜呜……我这病是不治之症，哪里有什么方子可以治好，温太医你不要和小女开玩笑了。”而且他要是真能治好，就不会到现在还只是一个小小的太医。她笃定自己的主意，也笃定接下来的结果。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“清水二斤，若是姑娘觉得还不够，可以再配上点去燥气的金银花和滋润肌肤的珍珠粉。”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405618&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405618&&novelId=17935'">下一章</div>
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
