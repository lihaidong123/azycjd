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
    <title>（二十六）最为温柔的回忆 最为苦涩的回忆</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351939&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351939&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351939+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十六）最为温柔的回忆 最为苦涩的回忆]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351939')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351939 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351939,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第27章&nbsp;&nbsp;&nbsp;（二十六）最为温柔的回忆 最为苦涩的回忆
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			记忆回到南宁十四岁那年的初夏季节。<p class='chapter_content_read_css'>记忆中的夏日野草缠绵，缠绵进眼中；夏水肆意，溢进心中；阳光毒辣，刺得人心麻木。<p class='chapter_content_read_css'>琴霜七为了准备高考冷落南宁很长时间，南宁虽然很体谅，但心中还是会有些寂寞，还让南宁欣慰的是，琴霜七的父母出差，自己又没空照顾琴晓阮，就托付给她照顾。<p class='chapter_content_read_css'>琴晓阮极其听南宁的话，南宁照顾起他来也是得心应手。<p class='chapter_content_read_css'>但有一点的是，南宁要一星期陪琴晓阮去一次游乐园，当然，除了一些高危游戏，别的游戏南宁还是很乐意陪着玩的，她也很享受的。<p class='chapter_content_read_css'>但是，琴晓阮非要玩什么新开的鬼屋游戏，南宁除了可以看到别人的记忆也可以看到鬼什么的，所以她并不怕这游戏，只是怕他会吓坏。<p class='chapter_content_read_css'>南宁就是在鬼屋内碰到阿阳的。<p class='chapter_content_read_css'>“南宁姐姐，这些真是鬼吗？好可怕啊，比贞子还吓人……啊……”琴晓阮的双手紧紧攥住南宁的衣服，身子有些发抖，即使这样，还是瞪大着眼睛看着那些已经出现或者突然出现的“鬼怪”。<p class='chapter_content_read_css'>南宁心里偷笑他，怕还看。<p class='chapter_content_read_css'>“啊！！！！！”南宁刚闭了一下眼，就听到他的大声尖叫，紧接着就是身上一重。<p class='chapter_content_read_css'>南宁睁开眼，眼前突然出现一双赤红的眼瞳，吓得她心脏一顿，紧紧搂住吓昏的琴晓阮。<p class='chapter_content_read_css'>“姑娘没事吧？”眼睛的主人缓缓从黑暗处走出来，是个二十岁上下的男人，手里牵着一个跟琴晓阮差不多大的小女孩。<p class='chapter_content_read_css'>男人脸上挂着温和的笑容，小女孩的表情则和书绘音的冰块脸有过之而不及。<p class='chapter_content_read_css'>“没、没事，就是，晓阮他有点惊吓过度了。”南宁脑袋一卡，也没注意男人用词的怪异。<p class='chapter_content_read_css'>“原来我这么吓人啊，”男人弯下腰，一手牵着女孩，一手指指背上，“我背他出去吧。”<p class='chapter_content_read_css'>南宁帮着把琴晓阮移到他背上，发觉小女孩一直盯着她看，脖子瑟缩了一下。赶忙跟着男人从应急通道里离开。<p class='chapter_content_read_css'>休息室里的人并不多，只有零零散散的几个人，正好空出了一张双人沙发，男子便弯腰把琴晓阮放到沙发上。<p class='chapter_content_read_css'>南宁顺着也倒了一杯温水候在旁边，不经意看向女孩，看到她还在盯着自己，心里有些发疑。男子也注意到这一点，摸摸女孩的脑袋，对南宁笑道：“我妹妹还从来没这样注视过别人，看来，我妹妹很喜欢你呢。”<p class='chapter_content_read_css'>“啊？这、这样啊。”南宁不好意思的挠挠头，看着琴晓阮还没有醒来的迹象，有些慌了神。<p class='chapter_content_read_css'>男人看见她的慌神，蹲下身查看他，正好他的背挡住了南宁的视线，让南宁完全看不到他在干什么。<p class='chapter_content_read_css'>“怎、怎么、怎么样了？”<p class='chapter_content_read_css'>“并无大碍，确实是惊吓过度了，看来要多睡会儿了。”看着男人温柔的笑容，南宁也平和下来，安稳的坐在旁边位置。<p class='chapter_content_read_css'>“姐姐。”女孩忽然开口，男人猛地站起来，蹲下身扶住女孩的肩膀，语气有些激动：“葵儿，你刚才说什么？你终于开口了。”<p class='chapter_content_read_css'>南宁侧脸迎上被唤为葵儿的女孩的目光，她的眼睛很漂亮，就像闪着流光的黑曜石，睫毛弯弯长长，唇瓣微动，凉凉的声音倾泻而出：“姐姐。”<p class='chapter_content_read_css'>是在喊她？南宁眨眨眼，除了琴晓阮还没有第二个人喊她姐姐，而且听他的口气，语气惊异道：“你妹妹是——失语者？”<p class='chapter_content_read_css'>男子背对着她点点头，声音已经恢复到温柔的声线：“葵儿从小就不会说话，这还是她第一次说话，虽然不是喊哥哥，但我也很高兴了。”<p class='chapter_content_read_css'>“这样啊。”南宁心情有些复杂，神色也跟着复杂起来。<p class='chapter_content_read_css'>男人站起身，拉着女孩，转过身来，笑道：“既然我妹妹跟你这么有缘，大可朋友一场了，我叫阿阳，你呢？”<p class='chapter_content_read_css'>“啊？”南宁握握杯子，努力笑笑，“我叫秦南宁，我可以喊你阿阳哥哥吗？”<p class='chapter_content_read_css'>“好，那我就喊你阿南好了，怎么样？”男人伸手摸摸南宁的头。<p class='chapter_content_read_css'>女孩微微低头，笑了笑。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>自那以后三人就熟络起来，琴霜七也终于考完试领到了中意的大学的录取通知书，整个人就懒散下来，整天泡在南宁家里做设计稿。<p class='chapter_content_read_css'>她第一次见到阿阳的时候，也被惊艳了一把，要不是有南宁拦着，怕是她要扑到人家身上了，她可是有花痴症，还有，南宁一扶额，看向摆弄葵儿琴霜七，还有——萝莉症。<p class='chapter_content_read_css'>琴霜七不止一次的跟南宁抱怨过问什么当年她妈妈怎么不生个萝莉妹妹给她玩，而是个弟弟，虽然她弟弟也很可爱，但是她对正太不感冒啊。<p class='chapter_content_read_css'>那段温柔的时间恍然而过十分短暂。<p class='chapter_content_read_css'>在认识阿阳一年后，秦泽生终于决定将小店交给南宁打理，还将九世转魂书交给南宁，自己外出了。他走之前还将工作流程全部教给南宁，南宁理解力强只是一遍就记住了，但是实践起来还是会有些担心。<p class='chapter_content_read_css'>自从接了工作后，南宁也变得忙碌起来，有自动到她这儿来取忆存忆的人，也有迷迷糊糊闯到她这儿来的鬼魂，她还要时不时上邻郊的墓地看看，工作的大部分时间还是在晚上。<p class='chapter_content_read_css'>她这才明白为什么秦泽生要她自小练眼，原来是为了对付以后对付这工作啊！还有那些奇奇怪怪的法咒，无一不能派上用场。<p class='chapter_content_read_css'>这样一来，南宁的整个生活作息就颠倒过来，看她一直这样，琴霜七还以为她是为了半夜追剧呢，苦苦劝了好久也无果，只好经常买些水果什么的给她补补。<p class='chapter_content_read_css'>阿阳也有工作，并不很频繁的来找她，有时只是送来葵儿和琴晓阮玩，一来就带上很多甜品吃食，据说是他家的小厨房做的，私家甜品。无论怎样，反正她们吃得很开心。<p class='chapter_content_read_css'>阿阳有空时就待在南宁家中给南宁她们讲故事，讲一些神仙异志，还讲得头头是道，就如同他亲身经历过一般，南宁看得见游魂厉鬼，对他讲的故事也听得十分入迷，长久以来，南宁有些口吃的毛病竟是渐渐改了过来。<p class='chapter_content_read_css'>南宁的性格慢慢变得开朗起来，也能和阿阳、琴霜七闹开来，阿阳也没什么大人架子，总是把她和琴霜七当做小妹妹一样看待。<p class='chapter_content_read_css'>南宁也真心把阿阳当做哥哥来看待。<p class='chapter_content_read_css'>大约又过了三四个月，刚给琴晓阮过完生日，他父母出差顺带着也把他带走了，阿阳又像往常一样把葵儿送来南宁店里，自己要工作就打了声招呼走了。但琴晓阮不在也不能陪葵儿玩，南宁只好放下工作，陪着葵儿。<p class='chapter_content_read_css'>趁着南宁做饭的空，葵儿无聊自己在房子里转，不久就消失在南宁视线内，南宁停下火，到处找她，终于在二楼的拐角处的一个破门前找到了她。<p class='chapter_content_read_css'>拉起她的手起步就想走，南宁没想到葵儿的力气会这么大，差一点就带倒了她。<p class='chapter_content_read_css'>“怎么了？葵儿？”南宁弯下身子，询问道。<p class='chapter_content_read_css'>葵儿闪着眼睛，一指那门，甜甜道：“姐姐，进去。”<p class='chapter_content_read_css'>“进去？”南宁站直身子，仔细看着那破烂门，她记得师父曾经说过，二楼拐角画着符的门绝对不能进去，符？这门上哪有符？师父他也经常开些玩笑话，会不会是骗她呢？<p class='chapter_content_read_css'>“姐姐，进去。”葵儿扯住她的手，拖着她进去，手轻轻一推，那门便“啪”的一声摔在地上，南宁不可置信的看着，嘴角抽搐，这门也太不结实了吧，怕是一阵稍强的风就能刮倒吧？师父当真是在骗人吧。<p class='chapter_content_read_css'>走进去一看，真是家徒四壁，啥也没有。<p class='chapter_content_read_css'>这有什么危险的？<p class='chapter_content_read_css'>南宁摸摸葵儿的头，笑笑道：“你看，这儿什么也没有，咱们走吧。”<p class='chapter_content_read_css'>“不。”葵儿拍开南宁的手，眼睛里却露出笑意。<p class='chapter_content_read_css'>“啊！！！！！！！”南宁一声尖叫倒在地上，不省人事。<p class='chapter_content_read_css'>隐隐约约中只觉得有一只凉凉的手抚摸过自己的脸庞，丝丝凉意透入心扉。<p class='chapter_content_read_css'>再醒来，入目便是一双赤色的眼瞳。<p class='chapter_content_read_css'>南宁晕乎乎地站起来，手上有些黏糊糊的，抬手一看，便彻底清醒起来，是血，到处都是血，地板上，身上，手上……<p class='chapter_content_read_css'>南宁身体颤抖，僵硬的看向面色冰冷的，浑身都散发着死气的阿阳，南宁抖得更厉害，那种恐惧是她从未拥有过的，甚至连腿也软了下去，阿阳狠狠地搂住她的腰，防止她倒下去。<p class='chapter_content_read_css'>“我知道，阿南，你是忆者，专门搜集人鬼魂的记忆来增长自己的灵力，但是，我没想到，你竟然可以杀了葵儿，来夺了她的记忆助你增长灵力，”他身上的死气越来越重，慢慢渗进南宁身体里，“我对你，太失望了。”<p class='chapter_content_read_css'>南宁腰上一松，整个人摔在地上，身体止不住得发抖，终于还是爬起来，追上阿阳快走的步伐，结结巴巴的想要解释，却紧张的一句话也说不出。<p class='chapter_content_read_css'>南宁不知追了他多长时间，他终于停下脚步，语气温柔：“阿南，你想说什么？”<p class='chapter_content_read_css'>“我、我、我没有，我不知道怎么回事，我没有害葵儿，阿阳哥哥，我我。”南宁急的都快要哭出来了。<p class='chapter_content_read_css'>阿阳没有回头，语气温柔似水：“好啊，我相信你呢。”手下动作却一点不含糊，只是轻轻一动手腕，南宁就被迫松开手向后倒去。<p class='chapter_content_read_css'>一阵刺耳的刹车声在耳边响起，南宁睁大了眼睛还是看到阿阳的身影消失在人群中，原来，这里是马路啊……<p class='chapter_content_read_css'>“南宁！”<p class='chapter_content_read_css'>“南宁姐姐！”<p class='chapter_content_read_css'>“快打120啊！”<p class='chapter_content_read_css'>“怎么回事啊？这么多血……”<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>再后来呢，就是南宁醒来发现日历由八月份到了次年二月份，琴晓阮顺利过了英语五级的考试，琴霜七的跆拳道由黑带四段晋升为黑带五段。<p class='chapter_content_read_css'>还有就是，世界上忽然少了两个人，阿阳和葵儿。<p class='chapter_content_read_css'>最后是，自己额角多了一道二指长的伤疤。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351939&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351939&&novelId=15670'">下一章</div>
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
