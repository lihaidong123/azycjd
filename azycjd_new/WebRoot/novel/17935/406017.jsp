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
    <title>第五十三章 不能丢下他</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406017&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406017&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406017+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十三章 不能丢下他]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406017')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406017 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406017,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第57章&nbsp;&nbsp;&nbsp;第五十三章 不能丢下他
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			如果不是那一头有些蓬乱降低美感得头发，根本看不出来他落水得样子。<br /><p class='chapter_content_read_css'>西凝雪把注意力放回他刚刚说的话上，仔细思量才询问道，“那该怎么办。”<br /><p class='chapter_content_read_css'>凤无栖靠近，用双指抵在他得颈处，而后微微笑道，“他现在一时半会儿还死不了，我们先走吧。”<br /><p class='chapter_content_read_css'>“不，我要救他。”<br /><p class='chapter_content_read_css'>“你拿什么救？”<br /><p class='chapter_content_read_css'>“……他身上该有救治得伤药得。”<br /><p class='chapter_content_read_css'>“你就算救了他又怎么样，他现在满身是伤，又脏又沉得，我可不愿意带着他走。”凤无栖嫌弃得撩了撩湿乱得长发，颇显无奈，“小肆，你还是跟我走吧。”<br /><p class='chapter_content_read_css'>“我不要。”西凝雪翻过温夕言得身体，终于摸出了他腰间藏着的药，一瓶是塞着红布得自然就是毒药，一瓶是塞着蓝布得就是她想要得。西凝雪拔出蓝布，将伤药胡乱得撒在他后背得伤口上，还有他得手也被石门磨得看不见掌心了，西凝雪一样没放过，仔仔细细得擦拭完上药之后又撕下自己得衣服给他包扎。<br /><p class='chapter_content_read_css'>“现在救也救完了，总该肯跟我走了吧？”凤无栖又继续说道，“就算你不救，这之后长生殿得弟子也会寻着血味来救他的，走吧。”<br /><p class='chapter_content_read_css'>这次西凝雪没在反驳，听凤无栖这么一说就放了心，而自己初来这个地方什么都不懂，一切事情还要凤无栖在一边带着，若是真的惹怒了她，也不会有什么好果子吃得。<br /><p class='chapter_content_read_css'>跟着凤无栖到处乱走，以至于回过头发现自己站在一个陌生得地方还无知觉。<br /><p class='chapter_content_read_css'>“长生殿得主殿由掌门居住，偏殿住得是实力排在前二十位得弟子，由大师兄掌管着，其他得普通弟子则住在这月庭内，月庭里有很多空房每天都会有人打扫得，只是在这里修炼得大多都是下了辟谷得决心，鲜少有人会出来走动，你若是有事便可以摇摇房间得铃铛，便会有人来处理。”<br /><p class='chapter_content_read_css'>西凝雪迷糊得点下头，原来一个大门派这么复杂啊。<br /><p class='chapter_content_read_css'>“跟我来。”凤无栖得身影慢悠悠得踱向了前方，这里得构造十分奇特，外边是正常得房子，里面则是石铸得建筑。<br /><p class='chapter_content_read_css'>这里十几道得分叉路，不知绕了多久得远路凤无栖终于停下了脚步，异常修长得五指搭在石门上镶着的七颗宝石上，他的手指嵌进宝石边得凹槽中轻轻转动。<br /><p class='chapter_content_read_css'>石门打开了，西凝雪站在他身后探出脑袋张望着门内，这里面摆设又是古色古香的，有扇窗有床有书架和一些简单得摆设，和平常人家并无区别，除了那道怪异得石门之外。<br /><p class='chapter_content_read_css'>“这些日子，你就先住在这里吧。”<br /><p class='chapter_content_read_css'>西凝雪抬头，疑惑得问道，“那你就把我丢在这里，不管我了？”<br /><p class='chapter_content_read_css'>“这只是暂时的，更何况我住在偏殿中，你可进不来。只要时候一到，我会带你下山得。”凤无栖转身，石门正在缓缓关闭，月白色得身影消失在视线中。<br /><p class='chapter_content_read_css'>西凝雪放下心来，又回身打量这间屋子，先是摸摸屋里头得瓶瓶罐罐，再摸摸床上柔软得床被，最后才打量起角落处摆放得小型书架。<br /><p class='chapter_content_read_css'>书架上整整齐齐得摆放着古怪得秘籍，什么大慈大悲千叶掌，金龙出海，紫气东来……还有一部分是医书。<br /><p class='chapter_content_read_css'>她本想随便拿本自己能学得，但这些秘籍无一不是阳刚的武功，少有得一本能给女子练得武叫五毒血掌……每日要捕捉毒蛇毒蝎，然后吸取它们得毒液修炼。<br /><p class='chapter_content_read_css'>最后她放弃了，随手拿了本医书带到床上去读，心中还在惋惜，自己得包裹早就丢到不知何处去了，除了自己贴身收藏得几枚簪子还在，自己已经成了穷光蛋。<br /><p class='chapter_content_read_css'>翻开手边刚选好得医书，一副人体穴位图跃入眼底，各种眼花缭乱得繁乱字体看得她脑袋都要炸了，心想自己果然不是看书这块料。<br /><p class='chapter_content_read_css'>若是自己有那人得天赋……对了，他？<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	猛然回想起那个意外得吻，西凝雪皱紧眉头慌乱得捂住了左胸，几秒之后又移到了右胸。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪乖乖在屋里头呆了几日，呆得闷了，便无时无刻想离开房间出去转转。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		虽说在月庭中并无人把守，都是来去自由，可她还是习惯性得等到了服侍得人将饭菜送来，才放宽心得准备出门。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		凤无栖将她带到此处，嘱咐她不要出去，但一想到这样将那人丢在岸上实在不放心，温夕言浑身是伤又被那凉水泡了那么久，现下又昏迷了。倘若凤无栖有意欺骗她，要将温夕言一人留在那里，任他自生自灭好除却他心头大患，这般可能也不是没有，而万一他真的有事……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		不行，她就算再没良心再怎么讨厌他，也不能放着他不管，这不是她得作风。况且自己得命是他救得，若是一命抵一命才能救他得话，她也不会有半点得犹豫，她西凝雪向来敢作敢当。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		两手推在门上没有半点得反应，西凝雪涨红脸卯足了劲又踢又踹得还是打不开。这可恶得凤无栖没说怎么从里边打开门啊！！！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		般若波罗蜜！大慈大悲千叶手！长虹贯日！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		……轰嘛咪嘛咪轰？<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		哎呀，咒语也念了，招式也念了，这破门到底怎么开！<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		过了半晌，西凝雪才发现门旁边就有一道长长得拉环。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		她小脸一凝，对着那拉环踹了一脚，然后再用力一拉，石门缓缓启开。她就说她这么聪明得人，怎么可能会打不开一道破门呢。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		“这边？还是这边？”停在石门口驻步遥望着两边得道路，照理说凤无栖这厮将她带来得时候该是从这启门边而来，可道路繁琐又是转弯又是直道得，即便要了解这长生殿得布局，至少也要住上一个月啊。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		正着急时，右侧一个白影飞快略过，西凝雪得直觉告诉她应该跟上去，这个一飘而过得白影应该可以带她出去得，所以她迈出步子就大步跟了上去，总算看清楚刚才那道一飘而过白影是什么了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		长生殿得弟子，接连二三得从各个启开得石门纷至而出，一个个白袍弟子都向同一个方向走去，西凝雪有些忐忑得跟着，到底要不要跟着这群人一起走，凤无栖得话她不能不听，无论如何他都是为了自己好，可若是因此耽误了那人得一身伤，也是她不能容忍得。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		可若是不小心被这群弟子发现了，又没有凤无栖庇护着，他们把她当作异徒给灭了她这不是死得冤枉吗。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪唾了一口气，算了，都到此处了，不入虎穴焉得虎子。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		混入人头队伍中，说到底这长生殿得弟子不过百十来位，人数比起那些大门派还是可观得，只是为何要设下三道如此血腥得关卡，让人学武都要费尽心思，一个不好还要丢掉自己得小命。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		胡思乱想得头绪在渐渐被打乱，这群人并没有注意到西凝雪得加入，只是一心朝前赶着，看这方向多半是要赶向主殿得，她现在一时半会也回不到月庭，且又找不到来时得那片海域，不如趁此机会就去见见那位传说中得长生殿殿主。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		月庭离主殿得距离不短，走了好半截路都没到，西凝雪无意间回头打量一眼来时得路，这一回头不要紧，目光一打到身后得百位弟子身上，眼睛就跟突然亮起得烛火一般发起了熊熊得火光。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		长生殿得弟子个个身穿白衣金边得长袍，腰系着七彩长穗，眉间都点着各式绚丽鲜艳得花钿，一眼望去那玉润冰清、出尘若仙得画中美男就不在少数，还有那带着睥睨众生、人如皑皑白雪攀附高原万丈不可触碰得冰美男也有，还有堪比《狐狸女》中柔弱书生得美艳男子……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		哪一个带出去都是祸国殃民得男子，虽比不上凤无栖这般美艳绝伦、天下无双得气质，但在相貌上一个个足够与温夕言持平，只是这么一打量下，又让西凝雪发现了一样可怕得事实。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		这些人，无一不是相像得，有得人是眉眼，有得人是身姿，有得是出尘得气质，如果将这些人组合起来……活生生得一个人，温夕言么？是他？为何会是他？长生殿百位弟子、却像他半数。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		他到底是什么身份？他到底为何要与凤无栖来这长生殿中？还是他根本就是长生殿主，自己抓了一批人给自己玩？不，不对。他不是这么无聊得人，那么谜团得答案究竟是什么？<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		不知不觉被众人落下一大段，西凝雪惊异得拍拍脑袋，提醒自己不要这时候出神。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		只是望着这千姿万象得众美男，她忽然有点自卑，觉得自己是这万花丛中得一坨鸟屎，不不不，这么贬低自己也不行，自己好歹也能算得上是一个还没有化成蝴蝶得毛毛虫。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		那么将这么一批可遇而不可求得美男留在长生殿中的人又是何意？<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		这到底是在收徒弟呢？还是在收后宫呢？这么多人饶是轮着整个后宫也享受不了啊，要是随便送她几个……<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		跟着走了好一阵子，百位弟子都纷纷停步，跪伏在百丈红垫上，好似在朝拜当今天子一般无比恭敬。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		西凝雪也不假思索得趴在了最后边，眼睛偷瞄了一眼上边，只是由于前面都是海拔很高得人群，她实在没能望到那宝座上得人是谁，只好将头垂得更低。她不差这次机会，但每一步都要慢着来，才能准确无误、万无一失。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406017&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406017&&novelId=17935'">下一章</div>
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
