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
    <title>第六十一章 这就去找死</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406026&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406026&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406026+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十一章 这就去找死]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406026')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406026 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406026,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第65章&nbsp;&nbsp;&nbsp;第六十一章 这就去找死
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			祈言蹲在园子里撒着药种，清晨薄雾初晓，寥寥得白雾腾升在园子四周，西凝雪便就着这阵子的雾气抓了根大蒲叶当扇子在四处狂扇，这白雾着实顽固，扇了一盏茶时间都没见散去半分。<br /><p class='chapter_content_read_css'>有些累了的西凝雪将大蒲叶一转，对着自己摇了摇。<br /><p class='chapter_content_read_css'>这园子比起她昔日得府邸一般大小，不过大抵得土地都用来种那劳什子得草药，有的奇形怪状闻所未闻，有的却是再平常不过的花朵，西凝雪观望了一阵，心思全被树木上那缠着得一片草叶吸引住了。<br /><p class='chapter_content_read_css'>她倒没见过还能爬着树长得草叶，不由内心底惊奇得走了过去。叶子倒与普通得叶子没有一点区别，可是它究竟是怎么长得呢。西凝雪伸手就要去扒那草叶得根部。<br /><p class='chapter_content_read_css'>“且慢。”祈言一展袖便将她拦到了后处，“这藤有毒。”<br /><p class='chapter_content_read_css'>“藤？”不是普普通通得草叶吗？<br /><p class='chapter_content_read_css'>见她不解，些许也是对这草药感兴趣，祈言好性子得解释道。<br /><p class='chapter_content_read_css'>“这血蛇藤得汁液能入药，毒性极强，用以毒攻毒之法使用，不过血蛇藤得毒性会残留在体内，多少会让人身体不适，有时还会痛不欲生。我虽种了它，但只用了一次现下那人病好了，我本想翻了这土种些别的，但这血蛇藤早已扎根至土底，枝叶攀附在树木上难以根除。”<br /><p class='chapter_content_read_css'>“哪人？”<br /><p class='chapter_content_read_css'>祈言似有些惊讶得问道，“怎么，你与十七处了不少日子，他未曾告诉你，你也没有发现吗？”<br /><p class='chapter_content_read_css'>哟，他原来还有秘密瞒着她，不过他整日神出鬼没的，要见他时也是一副端正闲雅得模样，哪里看的出来有什么异样。<br /><p class='chapter_content_read_css'>“这，师父与我鲜少见面，在宫中时也只是三两日才望上一面。师兄，不如你告诉我吧！”<br /><p class='chapter_content_read_css'>祈言微笑得摇了摇头，温声开口道，“这事对十七很重要，我不方便说。”<br /><p class='chapter_content_read_css'>哪有说话只说一半的，不行，改日她一定要套出这个秘密，说不准就此可以用来威胁他，更说不准万一是什么天大得秘密，关于哪处还没有被挖出得宝贝，什么绝世兵器在某处等着她。<br /><p class='chapter_content_read_css'>西凝雪咽了咽口水，实在忍不住得干咳了几声，“那啥，师兄……我先回屋了，你慢慢种。”<br /><p class='chapter_content_read_css'>“好。”<br /><p class='chapter_content_read_css'>单字刚落下口，一袭紫衣潇洒得凤无栖满面春风步履轻快得……额，从天上飞下来。<br /><p class='chapter_content_read_css'>祈言也是同样盯着来人，不过眼神清明平静。<br /><p class='chapter_content_read_css'>“我没锁园门，你这一飞倒要伤了我多少药材。”<br /><p class='chapter_content_read_css'>凤无栖轻扬起脑袋，眼中带着风情万种得笑意。<br /><p class='chapter_content_read_css'>“难得我来一次，师兄还要赶我走不成？”<br /><p class='chapter_content_read_css'>这死妖精国师，那会儿在主殿时不来瞧她，现在这园子跑得倒是勤快。<br /><p class='chapter_content_read_css'>似乎感觉到西凝雪阴森森得目光，凤无栖露出一副妖媚得风骨，端着手中得紫扇子就摇啊摇得走到她身边绕了一圈，而后站定，歪过头伸出手轻轻抚弄了一下她得乱发，温润得嘴唇靠近。<br /><p class='chapter_content_read_css'>“那会儿你到底存得什么心思，真要我死？”<br /><p class='chapter_content_read_css'>哪会儿？哪会？我不知道……嗯……我不记得了。<br /><p class='chapter_content_read_css'>但是斜眼瞄到他眼神有了寒光，西凝雪哆嗦了一下，便老实开口道，“凤哥哥，您是人中龙凤天生得美色，我这种扔土堆里也找不出人样得丑女怎么能入得了你的眼呢。”<br /><p class='chapter_content_read_css'>“是啊，你这甜嘴得德性倒是没变。”凤无栖对着她眉尖一点，一股刺痛逐渐散在她得额头，她哇哇大叫一声抱着祈言的衣袖就开始叫唤，“死妖精，你乱点什么。”<br /><p class='chapter_content_read_css'>凤无栖眯眯眼，寒气刚要发作，被祈言止住了。<br /><p class='chapter_content_read_css'>“闹什么，人家姑娘清白不愿意给你，还要强要不成。”<br /><p class='chapter_content_read_css'>西凝雪一听，立马差点没感动得热泪盈眶下来，这才是师兄，好师兄！<br /><p class='chapter_content_read_css'>碍于祈言得面子，凤无栖这才收敛得哼了哼，这家伙其实心肠也很歹毒，记仇得程度丝毫不小于温夕言，闹起来也是明目张胆的，如若他真打算暗地里朝她送个不知名的毒针以报媚药之仇，指不定她现在就是怎么死的呢。<br /><p class='chapter_content_read_css'>“师兄，我这次可是有事找你。”<br /><p class='chapter_content_read_css'>祈言将她送回了屋中，安置妥当了才回药草园里和凤无栖讨论，西凝雪本就闲得无聊，哪里能错过这么好得偷听机会，当即又贴在门边开了条缝隙，细细得观望。<br /><p class='chapter_content_read_css'>“师兄，教主得事你打算怎么办。”<br /><p class='chapter_content_read_css'>“教主她心思澄明不比我差上多少，她可以自行斟酌不需我来操心。如今我只是担心十七还要倔着性子违背教主，教主要他知痛可心中只怕也是着急的，可如今我连自己都顾不上，哪里能管得了其他的事。”<br /><p class='chapter_content_read_css'>“呵，十七十七，又是十七。他不过就是教主膝下得一个得宠面首，他现在可算都爬到你头上来了，师兄还不早些防备，竟还要为了他着想，这么些年你护他不少，但他可有在教主面前维护你半分过，他这样冷血心肠得人根本不值得师兄费心思。”凤无栖冷冷哼一声，嫌恶之情溢于言表。<br /><p class='chapter_content_read_css'>西凝雪心中喟然，她不是不知道温夕言与他结怨已久，都是一山不容二虎你敢碰我我就弄死你得危险性格，但没想到他们之间得渊源原来这么深，不仅仅是两人之间，还牵扯上了祈言。<br /><p class='chapter_content_read_css'>祈言微勾起嘴角，宛如秋水如沐清风得柔软眸子似乎都溢出了忧伤得溢彩，那种伤情叫人不由得一痛。<br /><p class='chapter_content_read_css'>“我可以放弃长生殿的一切，可以放弃出山的自由，可饶是如此，也换不来她……”<br /><p class='chapter_content_read_css'>西凝雪听不到下面的话，祈言说得很轻很轻，再怎么支起耳朵也听不出半个字。<br /><p class='chapter_content_read_css'>不过听了一半仍让她气血上涌，克制不住得激动。祈言说得他是谁？照字面意思看来他是喜欢谁的，只是她想不出在这长生殿里还有人值得他这样位高权重得人暗许芳心，甘之如饴得留在这鸟不拉屎的地方。<br /><p class='chapter_content_read_css'>首先第一个应该排除的是狠毒的萧怜月，她这么欺负他还经常不给他面子让他难堪，他总不会自找没趣喜欢上她吧。第二个排除的应该就是自己了，他断然不可能为了自己就放弃自由留在这里，可是整个长生殿除了两个母的，全是公的啊。<br /><p class='chapter_content_read_css'>难不成他……啊啊啊啊啊啊……<br /><p class='chapter_content_read_css'>难不成他，喜欢男的？是男的他？不不不，祈言一看就是很正常的人，总不会寂寞了那么久，就不顾常伦找上同类了。<br /><p class='chapter_content_read_css'>后来凤无栖离去之前，还打算与她聊聊，西凝雪刚骂完他死妖精，怎么可能真的以为他只是聊聊，当即把门锁的死死的，任是王锁匠来了，也绝对开不开。<br /><p class='chapter_content_read_css'>只是待他无计可施时，自己却忘记怎么穿得锁链，连锁链得头端在哪里都找不到……<br /><p class='chapter_content_read_css'>“死妖精，我不放你进来，你还不让我出去！”<br /><p class='chapter_content_read_css'>“……我可没锁门。”<br /><p class='chapter_content_read_css'>“那我怎么出不去！不是你锁的是谁锁的，你要是真没锁，那就把门给我打开！”<br /><p class='chapter_content_read_css'>“这有何难。”原是还担心着这是祈言的地盘，不敢破坏这道门，不过经她一说，凤无栖当即底气十足得一掌轰了过去，西凝雪欢喜得拍拍手，捡起地上碎的稀巴烂的锁链，丢到了一边。<br /><p class='chapter_content_read_css'>凤无栖咬了咬牙，不满得怨道，“你竟然……”<br /><p class='chapter_content_read_css'>西凝雪笑嘻嘻得冲他做了个鬼脸，“凤哥哥好手段，连锁链都轰断了。不过我忘了告诉你，这锁链是我从园子里圈药地的地方取下来的，我还没来得及告诉祈言师兄呢，正巧你来了，那你就亲自和师兄说说吧。”<br /><p class='chapter_content_read_css'>凤无栖脸色一青，作势又要对她弹个飞指。已经吃过亏得西凝雪哪里还能容得下他第二次偷袭，当即头一歪，反避到了他的身后，拉扯住他的衣袖，右手飞快得朝他后背一指。<br /><p class='chapter_content_read_css'>以彼之道还之彼身。<br /><p class='chapter_content_read_css'>姑奶奶我好歹也是看过医书的，略懂穴位。<br /><p class='chapter_content_read_css'>不过她也不敢真的下重手，如果不是凤无栖有意留手，没有用足功力对付她，她早就被他一指给点成尸体了。<br /><p class='chapter_content_read_css'>凤无栖哼了哼，眉眼一勾，妖娆万分得转身，万千青丝随之飘舞包裹着手中得紫扇。<br /><p class='chapter_content_read_css'>“想点我的穴你还不够格，小肆……这些时日让你留在长生殿，你就学了点这么得三脚猫功夫就想与我比划？”<br /><p class='chapter_content_read_css'>西凝雪故作正色的咳了咳，“哪里哪里，我就是指着玩玩的，看看是不是真的有用。”<br /><p class='chapter_content_read_css'>凤无栖笑得愈发灿烂妖媚，下一瞬间自己便被他单手勾到了怀里，西凝雪顿时鸡皮疙瘩狂起得扭身，死妖精死妖精你要做什么，姑娘我还是清白得，你可不能这样强迫我。<br /><p class='chapter_content_read_css'>凤无栖垂下脑袋，散乱得青丝挡住了她的视线，只模糊听见他轻轻地“嘘”了一声。<br /><p class='chapter_content_read_css'>随后园子里便有了大的动静，园子大门被打开得一瞬间，西凝雪被他拖到了门后避着，她恼火得张口咬了他一下，凤无栖反手就捏在她的脸上，扯出好大一片皮肤，疼的呲牙咧嘴得西凝雪哀怨得盯了他一眼，然后一瞬不瞬得盯向门口处。<br /><p class='chapter_content_read_css'>萧怜月。<br /><p class='chapter_content_read_css'>祈言体贴得替她褪了繁重得毛皮衣，而后两人一前一后走回了屋子。<br /><p class='chapter_content_read_css'>西凝雪再想跟过去瞄几眼，却被凤无栖拉了个正紧。<br /><p class='chapter_content_read_css'>“等等，你就这么去找死么。”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406026&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406026&&novelId=17935'">下一章</div>
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
