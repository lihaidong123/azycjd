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
    <title>（二十四）地情险盲一樱山 危险重重遇打劫</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351937&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351937&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351937+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十四）地情险盲一樱山 危险重重遇打劫]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351937')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351937 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351937,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第25章&nbsp;&nbsp;&nbsp;（二十四）地情险盲一樱山 危险重重遇打劫
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  一樱山位于宁州和华州交界地带，又是从华州去往商州的捷径道路，此山又地处险要，山中又有常年茂密的树丛林，若不是熟悉此山地形的人，只要一旦进入山中，便会迷失在其中，再也无法出来。<p class='chapter_content_read_css'>  所以一樱寨便选在此处——打劫。<p class='chapter_content_read_css'>  南宁一行人赶了几天路便到了此处，路上木梓也说了原先被打劫的经过，一行人也是处处警惕，衣蓝也不再看顾顾叶，而由南宁一人在马车中照顾顾叶，让所有人都安心的是，顾叶很是乖巧从不乱哭乱闹。<p class='chapter_content_read_css'>  眼瞧着就快要过了这山，突然一个人从树丛林里窜出来，摔到道路中间，眼看着南宫宁雪的马就要踩到那人身上，他猛地拉住缰绳瞬间调转了马蹄方向，利索地下马查看。<p class='chapter_content_read_css'>  那人缓缓从地上爬起来，原来是个不过十一二岁的小女孩，穿着有些脏兮兮的粗布衣服，可怜兮兮地看向南宫宁雪。<p class='chapter_content_read_css'>  衣蓝紧随其后勒住马车缰绳，下车查看。<p class='chapter_content_read_css'>  南宫宁雪先为她检查伤势，只不过是几处擦伤，便让衣蓝去马车上拿擦伤药，自己细心询问。<p class='chapter_content_read_css'>  “你怎么会从那林子里窜出来？你家人呢？”<p class='chapter_content_read_css'>  女孩子支吾着不肯说话，眼泪吧嗒吧嗒落下来，见状，南宫宁雪也有些着急，他最害怕见小孩子流眼泪了，木梓帅气地跳下马，上前，安慰似的摸摸她的头，道：“怎么了？哥哥们可都不是坏人，是不是，你家人全都被这山匪打劫了？你一个人逃出来？”<p class='chapter_content_read_css'>  女孩子颤巍巍地点点头。<p class='chapter_content_read_css'>  在衣蓝猛然停住马车的时候，马车内的南宁抱着顾叶狠狠晃了一下，刚刚睡着的顾叶一下醒过来，迷糊地看着周围，咿咿呀呀几声，南宁向前倾身刚想撩开帘子，衣蓝便探身进来，翻出来擦伤药，南宁拦住他：“到底怎么回事？谁受了伤？”<p class='chapter_content_read_css'>  “是突然窜出来一个小姑娘，摔在公子马前，有些擦伤。”说罢便要出去，南宁拦住他示意他安静，将顾叶递给他，自己在窗帘上撩开一个缝，往外看了一会儿，笑笑拿过衣蓝手中的药膏，道：“你就在这里看着叶子，我不叫你，便不要出来。”<p class='chapter_content_read_css'>  衣蓝侧身让出空来，南宁慢步窜了出去。<p class='chapter_content_read_css'>  “南宫神医，你要的药拿来了。”南宁忽然改了称呼，木梓和南宫宁雪都回头看她。<p class='chapter_content_read_css'>  南宁温婉一笑，将药膏递给南宫宁雪，忽而盯向站在那里的女孩子，面色一变，药膏“砰”地一声掉在地上，那女孩子也用一双水汪汪的眼睛看着她，南宁拢住她的一只手，疑惑道：“你是，许家三娘？”<p class='chapter_content_read_css'>  女孩子惊诧地看着她，很明显是南宁喊对了。<p class='chapter_content_read_css'>  “三娘怎么不记得我了？我是婴家伯姬啊。”南宁蹲下身，环抱住她，“才几年不见，三娘就不认得我了，你当真和你母亲是一个模子刻出来的。”<p class='chapter_content_read_css'>  女孩子被她说的也有些糊涂，诺诺的不敢应声。<p class='chapter_content_read_css'>  南宫宁雪他们也是一脸茫然。<p class='chapter_content_read_css'>  什么情况？<p class='chapter_content_read_css'>  南宁站起来，拉着女孩子对他二人道：“这是原来与我同村的邻居家的孩子，排行老三，大家都喊她三娘。”<p class='chapter_content_read_css'>  “三娘？”木梓疑惑一喊。<p class='chapter_content_read_css'>  南宁朝他俩微微眯眼，又微微一歪头，南宫宁雪瞬间明白她的意思，作假。<p class='chapter_content_read_css'>  “辰兴大哥，连伯姬的路也劫吗？”南宁话音刚落，就听到树丛林中发出窸窸窣窣的声音，一个强壮男子走出来。<p class='chapter_content_read_css'>  男子不过三十出头，蓄着络腮胡，面呈麦色，也是粗布短衣，手拎双刀，一双鹰眼直勾勾地盯向南宁，开口声音洪亮：“你是伯姬？伯姬早已离开寨子数年，你又怎么证明你是伯姬？”<p class='chapter_content_read_css'>  南宁掩嘴一笑，道：“辰兴大哥竟还记得我已离开寨子数年，当年我不是忍受不了你们总是打打杀杀抢劫别人，若不是如此，许娘怎么会，唉——”话未说完便沉叹一声，紧紧攥住女孩子的小手，许娘便是女孩子的娘亲。<p class='chapter_content_read_css'>  男子听她这样说，也并不全信，继续问道：“确实没错，那你便说，你走时寨子中死伤各多少。”<p class='chapter_content_read_css'>  木梓和南宫宁雪忧心地看着她，怎么问的这种事？<p class='chapter_content_read_css'>  南宁忽而收敛笑容，冷言道：“过世的有三十九人，其中便有许娘、我爹爹和二弟；重伤的有一十二人；至于轻伤的则就数不清了，除了在寨子中的女人孩子大概多多少少都带些伤回来。怎么样？辰兴大哥现在还觉得我是不是伯姬呢？”<p class='chapter_content_read_css'>  男子粗狂一笑，又看向木梓他们：“伯姬啊，是大哥太过谨慎了，不过，他们又是何人？”<p class='chapter_content_read_css'>  南宁率先一步搂过木梓的胳膊，笑道：“大哥难道忘了，两年前我向寨子里通过信，说我要成亲了，这便是我的郎君，至于这位，”南宁看看南宫宁雪，又看看男子，“难道大哥不知？此人便是南宫神医啊。”<p class='chapter_content_read_css'>  “君玄观的南宫神医？”男子饶有兴趣地看着南宫宁雪，嘴唇一勾，“伯姬你来的当真好巧，寨中发了怪病，我们刚想去劫个大夫来，你便来了。”<p class='chapter_content_read_css'>  南宫宁雪心中一惊，面色平静的看向南宁，只看得她面上挂着浅笑，虽是笑容，却让他觉得极其不舒服，那笑假的很。<p class='chapter_content_read_css'>  木梓听他这么说便晓得了是什么意思，是无论如何也要他们留下了，刚想争辩，就觉得胳膊一痛，南宁微不可见的威胁状地瞥了他一眼，木梓立刻闭了嘴。<p class='chapter_content_read_css'>  “寨子中竟然发了怪病？那确实是巧，可是……”南宁故意为难的说到，“可是，我们此次便是送南宫神医到滦城去，这……”<p class='chapter_content_read_css'>  “大哥，这么多废话做什么，咱们什么人没劫过，害怕他一个小小的大夫，劫去就是了！”林子里又窜出来几个年纪不等的汉子，说话的那个年纪不大，应在十七八岁上下，手拎一口大刀，嘴角痞痞的上扬，眼里冒着狠光，上下打量着南宁他们。<p class='chapter_content_read_css'>  木梓最沉不住气，使劲挣开南宁的魔爪，上去就想给那小子一脚，小子身手矫健，冷冷一哼，一下子就把木梓撂在地上，伸腿就往木梓背上踹了一脚，痛的木梓一顿呲牙咧嘴，整个人摔在地上动弹不得。<p class='chapter_content_read_css'>  南宁敛了笑，看向辰兴，质问他：“大哥这是什么意思？这小子，又是谁？”<p class='chapter_content_read_css'>  “陆钦，这是伯姬，你几年前才入的寨子，没见过她，做出这样的事也情有可原。”看着被叫做陆钦的小子撤了脚，南宁向前几步缓缓将木梓扶起来，木梓整个人虚脱的靠在南宁身上，眼角有几块淤青。<p class='chapter_content_read_css'>  “不知寨中之人都害了什么病？”南宫宁雪忽然插话进来，还是一派温文尔雅的模样，“在下乃是医者，又怎会见死不救。”<p class='chapter_content_read_css'>  “还算你识相。”那小子轻蔑一哼，将刀背靠在肩上，快步向山上走去。<p class='chapter_content_read_css'>  “伯姬也一块上山吧。”辰兴一望行云的打扮便只是包围他们安全的侍卫，一指马车，“连马车也一块带回寨子，车上的人就先下来。”<p class='chapter_content_read_css'>  说完，马车上的衣蓝也没动静，南宁一看南宫宁雪，换了个眼神，道：“衣蓝，快些带着叶子下来，上山时路很颠簸，会伤了叶子。”<p class='chapter_content_read_css'>  “诺。”衣蓝便掀了马车帘子，行云下马先接过顾叶，衣蓝慢吞吞的下车，再接过顾叶，一副低眉顺眼的小侍模样。<p class='chapter_content_read_css'>  “那我们便上山了。”辰兴走在前面，南宫宁雪想要上前扶住木梓，被南宁拂开，他微微一皱眉，只听南宁对木梓道：“你自己爬上去。”说完便甩开手跟上辰兴的步子。木梓摇晃了几下，咬咬牙站稳，眼中闪着倔强。<p class='chapter_content_read_css'>  一行人就这样被“请”到了一樱寨。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  夜色微凉，清风拂面，南宁出了房门，独自一人寻着安静的地方在寨中闲逛，恰巧遇到南宫宁雪。现在正是四下无人。<p class='chapter_content_read_css'>  “梁少夫人。”南宫宁雪温和地打招呼。<p class='chapter_content_read_css'>  “南宫神医。”南宁一笑。<p class='chapter_content_read_css'>  梁少夫人正是她的假身份，小说她看的是不少，伪造起身份来也是得心应手，她用了读忆术看了他们的记忆，恰好有一个名叫伯姬的女子的空缺，便利用起来，至于木梓只好说成是自己几年前嫁的个夫君，名为梁昶。顾叶便直唤为叶子，是她的独子，行云是梁家的护卫，衣蓝是看顾顾叶的小侍。<p class='chapter_content_read_css'>  南宫宁雪一开始还有些疑虑南宁的做法，后来进山时看到躲在树丛林后少说也藏着五百人，若是他们敢反抗，怕是就灾祸难免了，再说便是山路崎岖多变，就如同迷阵一般，但身为君玄观大弟子的他，却实实在在知道，这并非迷阵而是自然天险。<p class='chapter_content_read_css'>  “若是我没记错，前面不远处应该有个亭子，我们便去那儿坐坐可否？”南宁偏头问相离自己有一步之遥的南宫宁雪。<p class='chapter_content_read_css'>  南宫宁雪答好，果然拐了个弯，几棵树后面就有一座亭子，亭子不大，上面也烙着岁月的痕迹，看起来有着一番历史。<p class='chapter_content_read_css'>  “少夫人是想问寨中的病况吗？”<p class='chapter_content_read_css'>  “当然还会有些担心，毕竟我是在这儿长大的，虽然后来离开了。”南宁故作忧伤地掩面。<p class='chapter_content_read_css'>  “少夫人莫要担心，寨中之病并非什么疑难杂症，只要坚持喝在下开的方子四五天左右，便会无碍了。”南宫宁雪犹豫一下，终是开口，“在下有个问题想问，为什么少夫人对梁少爷受伤会如此淡漠？”<p class='chapter_content_read_css'>  南宁敛了笑容，面色认真道：“我就是要他长个记性。”<p class='chapter_content_read_css'>  南宫宁雪神色复杂的看向她，认真思考她话里的真假，到底是演戏还是发自内心。<p class='chapter_content_read_css'>  “人永远都是这样，痛不在心坎上，是不会长记性的。”南宁勾勾唇角，“难道不是吗？”<p class='chapter_content_read_css'>  “是……啊……”南宫宁雪也学她勾起唇角，发觉有些怪异，又恢复到温文尔雅的笑容，动了动唇，没有发出声音。<p class='chapter_content_read_css'>  南宁难得调皮一笑，将中指竖在唇上，唇语道：秘密。<p class='chapter_content_read_css'>  秘密呀……南宫宁雪也弯了眉眼，温柔就柔柔的化进寂静的夜中。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351937&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351937&&novelId=15670'">下一章</div>
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
