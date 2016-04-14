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
    <title>（十九）喜讯传耳未觉喜 悲情只是无限淡</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351932&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351932&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351932+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十九）喜讯传耳未觉喜 悲情只是无限淡]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351932')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351932 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351932,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第20章&nbsp;&nbsp;&nbsp;（十九）喜讯传耳未觉喜 悲情只是无限淡
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			繁花若锦，苍事已尽。<p class='chapter_content_read_css'>狸啼若生，满目忆沁。<p class='chapter_content_read_css'>……昙现院……<p class='chapter_content_read_css'>“王妃，您没事吧？”巧儿扶起吐得一塌糊涂的木若涵，赶紧又遣了下人去请大夫。<p class='chapter_content_read_css'>木若涵坐到椅子上，肚子还有些微微不适，摆摆手，“无事，怕是吃了什么坏东西了，对了，王爷呢？”<p class='chapter_content_read_css'>“王妃忘了吗，王爷正在宴客厅招待太子殿下呢。”<p class='chapter_content_read_css'>她一扶额，“确实是，是本王妃糊涂了。”<p class='chapter_content_read_css'>“喂，你们刚才瞧见了没，太子殿下带来的那个舞姬好漂亮啊。”窗外有侍女窃窃私语。<p class='chapter_content_read_css'>“是啊，我刚才去送酒，顾王一直在盯着她看呢，连太子殿下敬的酒都没注意呢。”<p class='chapter_content_read_css'>“你说，最近顾王都不到昙现院来了，会不会……”<p class='chapter_content_read_css'>“是啊，顾王与王妃成婚多年，膝下都无一子嗣，俗话说啊，不孝有三无后为大。”<p class='chapter_content_read_css'>“王妃，要不要我去……”巧儿木若涵的陪嫁丫鬟，听到人家议论自家主子的是非，心中十分恼火。木若涵拦住她，叹了口气，“他们愿意说就让他们说去吧，反正也是事实。”没有孩子，一直是她心中过不去的坎，若是王爷喜欢，收来做小，也不是不可以，只要能为王爷诞下后嗣便可。<p class='chapter_content_read_css'>“王妃。”巧儿一赌气，她也想不明白，王妃嫁给顾王这么多年总是处处为顾王着想，像是欠了他什么人情似的，明明是顾王欠王妃人情不是吗？<p class='chapter_content_read_css'>“巧儿，去藏书阁拿《花本记》来。”<p class='chapter_content_read_css'>“是。”巧儿出了房门，狠狠瞪了那几个侍女一眼，“叫你们乱嚼舌根，还不快干活去！”<p class='chapter_content_read_css'>侍女慌忙散开，见巧儿走远，又聚起来跑到院子的一个小角落。<p class='chapter_content_read_css'>“管家。”	<p class='chapter_content_read_css'>满头白发的老者从袖筒中掏出一个钱袋递给其中一人，“这是给你们的赏钱。”说完抬腿就走。<p class='chapter_content_read_css'>“哎，管家，顾王为何要奴婢说这些？”其中一个侍女忍不住开口。<p class='chapter_content_read_css'>管家打了个噤声的手势，“有些事，要学会忘记，否则会招来杀身之祸的。”<p class='chapter_content_read_css'>侍女们不约而同的想到了顾王府被灭门的事，都打了个寒颤。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>宫雪斟了一杯酒，举起对顾白道：“顾王，这次可要多谢你了，若不是你，皇姐的病也不会好的这么快，本宫自是要敬你一杯。”<p class='chapter_content_read_css'>“这是小王该做的。”顾王一饮而尽。<p class='chapter_content_read_css'>“对了，顾王今年二十有八了吧。”<p class='chapter_content_read_css'>“是。”<p class='chapter_content_read_css'>“啊，顾王现在都膝下无子呢，本宫从各地寻来偏方今日便赠与顾王，希望顾王早得后嗣。”宫雪又饮了一杯，语气中带着些晦暗不明的意味。<p class='chapter_content_read_css'>“那就多谢殿下吉言了。”<p class='chapter_content_read_css'>“啊，还有呢，”宫雪把玩着酒杯，笑意不明的看着他，“父皇托我带话给你，说：若是王妃诞下男孩，满岁时便封为世子；若是女儿，便封为郡主。顾王觉得如何？”<p class='chapter_content_read_css'>“那小王就先谢过陛下了。”嘴里虽说着恭敬的话，但面色却不怎么好，抬眼便看见了正在跳舞的舞姬，再看向宫雪，便懂了他的意思，派人去唤管家，等到管家来到，对他耳语几番，又笑着对宫雪道，“不知舞姬如何称呼？”<p class='chapter_content_read_css'>“唤她水灵便可。”<p class='chapter_content_read_css'>“水灵，到本王这儿来。”<p class='chapter_content_read_css'>“诺。”水灵软软糯糯一声回答，无比妖媚的看着顾白，上前便毫无顾忌的坐到顾白腿上，双手攀上他的脖颈，“王爷~~”<p class='chapter_content_read_css'>“好，看来水灵很是喜爱顾王，不如便将水灵赠与顾王如何？”宫雪顺水推舟。<p class='chapter_content_read_css'>“那就多谢殿下了。”顾白眼神迷离，将手抚在水灵背上。宫雪见状起身告退。<p class='chapter_content_read_css'>“嘶——我鸡皮疙瘩都快起来了。”南宁听那水灵说话，抱了抱胳膊，又撞了撞书绘音，“你有没有瞧出些什么？”<p class='chapter_content_read_css'>“你觉得呢？”书绘音看着那水灵倒是有些眼熟。<p class='chapter_content_read_css'>“顾王肯定是被逼着收下那舞姬的，还有那宫雪，到底在搞什么鬼？郡主世子，怎么听都是一种恐吓的语气。”南宁也觉得十分古怪。<p class='chapter_content_read_css'>功高震主吗？又是个异姓王侯。不对吧……南宁微微眯眼。<p class='chapter_content_read_css'>“哦，你怎么知道他是被逼着收下那舞姬的，那舞姬长相确实极好，男人不都好色吗？”书绘音瞥向南宁。<p class='chapter_content_read_css'>“你没看到吗？那舞姬搂过去的时候，顾王整个人都僵硬了，这像是自愿的吗？”南宁一副“你眼长哪里了”的表情。<p class='chapter_content_read_css'>书绘音闭口不言，他其实是有心试探南宁，竟对那句话一点反应也没有吗……叹了一口气，再等等吧。<p class='chapter_content_read_css'>待宫雪离去，再看顾白却是将水灵一把推到地上，面若冰霜，站起身居高临下对她说：“你在这儿只管做好你的侍妾角色便好，其余的事，本王想，太子殿下应该已经教给你了吧。”<p class='chapter_content_read_css'>“那是自然，对了，不知顾王可将槿华苑赠予妾身住呢？”水灵悠悠起身，抚了抚有些褶皱的袖摆。<p class='chapter_content_read_css'>顾白冷冷一笑，将杯中酒尽数泼到她身上，“你莫要太高看自己，就连本王的王妃都没有进去的资格，你觉得，你会有吗？”<p class='chapter_content_read_css'>她竟毫不在意，笑的极其妖娆，柔声道：“果然，顾王的逆鳞就在这儿呢，就因为连王妃都没有资格住进，哦不，是踏进槿华苑，若是让妾身一个低贱的舞姬住进去，更能刺激王妃，不是吗？”<p class='chapter_content_read_css'>顾白眼眸一暗，咬牙沉声道：“好，本王便叫你住进去，但是你绝不能动那里的任何东西，本王自会布置别的，若是你敢动，就算你是太子的人，也休怪本王将你挫骨扬灰。”<p class='chapter_content_read_css'>“好，妾身有什么好动的呢？只不过是一个小娃……”顾白发冷的眼神一扫她，她立刻噤声，冷汗就下来了。一捂唇，糟糕，说错话了。<p class='chapter_content_read_css'>“哼，希望你在王妃面前可不要说错话才好。”说罢就立刻拂袖而去。<p class='chapter_content_read_css'>“不就是一个小娃娃的院子，有什么好珍贵的。”水灵自己也带了贴心人，便立刻找客房去换衣服。<p class='chapter_content_read_css'>槿华苑……南宁撑住下巴，觉得有些耳熟，还有小娃娃。<p class='chapter_content_read_css'>她曾听木若涵不止一次的说过顾白有一位小妹，唤为顾槿，便住在槿华苑，也只不过提到过这些，倒是听外人道顾白是爱妹如命，怕是这位顾槿就是死在那夜大火中了，怪不得听人一提到槿华苑，顾白就这么大反应……<p class='chapter_content_read_css'>书绘音见南宁出神思考，眼神一低。<p class='chapter_content_read_css'>大夫匆匆赶往昙现院，正与水灵擦肩而过，他一抬头，恰好闻见她身上一股奇特的香味，也没太注意，匆匆忙忙往昙现院赶去。<p class='chapter_content_read_css'>“见过王妃。”医者在东陆拥有着特殊的地位，就算见到皇帝也只是行躬礼，大夫微微躬身便算是行了礼，坐到木若涵正前方，望闻问切，一切做完后，捋捋下巴上的髯须，笑道：“恭喜王妃，王妃已有了二月有余的身孕，孕吐也是正常的，但王妃身子底子不太好，要多加注意平时的吃食，以免意外小产，老夫就为王妃开些安胎药，还有些一些要忌口的吃食。”<p class='chapter_content_read_css'>“真是麻烦您了，巧儿。”木若涵压抑住心中的激动，吩咐巧儿去拿些酬金给大夫，待大夫离开，才默默洒下两行清泪。慢慢抚上还是很平坦的小腹，两肩耸动。<p class='chapter_content_read_css'>“王妃，您怎么哭了？”巧儿刚送完大夫出去，回来就瞧见她哭着，心中猛然一动，“王妃，您这是喜极而泣，对不对？”<p class='chapter_content_read_css'>木若涵弯着眉眼，使劲点头。<p class='chapter_content_read_css'>等着她平静下来，巧儿才开口问道：“王妃，这个消息要不要告诉王爷？”<p class='chapter_content_read_css'>木若涵低眉想了想，摇摇头：“再过一月便是王爷的生辰，那时本王妃再亲自告诉他。”说着满脸幸福的抚着小腹。<p class='chapter_content_read_css'>“王妃是想给王爷一个惊喜。”巧儿也大胆的嘻哈起来，心中念叨：哼，叫你们乱嚼王妃舌根。<p class='chapter_content_read_css'>“好了，你也要守口如瓶呀。”木若涵点了一下她的额头。<p class='chapter_content_read_css'>“诺。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>槿华苑。<p class='chapter_content_read_css'>明明不是木槿花开放的时节，而槿华苑的木槿花却开得十分旺盛，层层叠叠的洁白花朵一朵盖过一朵，连枝叶都完全瞧不见。懒懒的阳光洒在上边，像是为花朵镀了一层金边，折射进眼中，点点光晕闪得人有些置身于梦境的错觉，还散发出浅浅的幽香。<p class='chapter_content_read_css'>这香味……水灵鼻子一动，便发现了破绽，这并非真正的木槿花香，她伸手想去碰那花朵，只是轻轻穿过，“果然，只是法阵罢了。”<p class='chapter_content_read_css'>早些年就听说顾王府中的木槿花娇美无比，可自从走水之后，这些没有完全死掉的木槿树便只抽长绿叶而不再开一朵花，一开始走进这院子还以为是人家谣传的，原来是真的，要不然为何要自欺欺人的摆这些法阵呢？当顾白的妹妹，就算死也是值了。<p class='chapter_content_read_css'>同水灵一起来的女孩名为幻云，幻云虽不过十四五岁的年纪，但却机敏无比，派她一起来也是怕水灵一时脑袋不灵光出错，她站在水灵身后，扯了扯她的衣服，轻声道：“莫要看花误了事。”<p class='chapter_content_read_css'>“好。”水灵一笑，仔细瞧着各个房间，问幻云，“你说，住哪间房好呢？”<p class='chapter_content_read_css'>幻云淡淡一扫，指着最左边的屋子，“你住这间，”又指向旁边的屋子，“我住这间。”<p class='chapter_content_read_css'>“好吧。”水灵推门进去，有些吃惊，坐到床上，拍拍床铺，“顾王府的下人动作真快，只不过换个衣服的空就换好了床铺，这被褥，是最新的宁州蚕丝被吧。”又跑到幻云的房间瞧瞧，与她房间的布置相差无几。<p class='chapter_content_read_css'>刚出幻云房门，就看到管家带着数位侍女来到槿华苑。<p class='chapter_content_read_css'>“灵侧妃，请您沐浴，晚间于王爷一同进膳。”管家恭敬地说道，一抬手，那些侍女便向她走来。<p class='chapter_content_read_css'>“等一下，这才未时末啊……”她额头冒出一滴冷汗，这也太早了吧，话音还未落就被那些侍女们“请”到了浴房。等到出来，她才明白为什么要这么早。<p class='chapter_content_read_css'>先是要泡半个时辰的花浴，再开始清洗身上，然后用不同的药膏洗三遍头发，接着熏一个时辰的香薰，换衣服，编发妆，戴象征品阶的玉石……忙到这时就已经是酉时末了，晚膳时间就在戌时二刻。<p class='chapter_content_read_css'>水灵整个人都像是被拆散了架，被幻云和侍女们半搀着到了饭厅，只看见了顾白一人，而不见木若涵。<p class='chapter_content_read_css'>她款款而坐，全然不见刚才的疲惫不堪，深情款款的看向顾白。<p class='chapter_content_read_css'>顾白一摸她犹若婴儿般滑润的脸蛋儿，笑道：“如何？做本王的侧妃，待遇好过做舞姬吧。”<p class='chapter_content_read_css'>水灵一诧，随即用余光瞥见了正往这走来的木若涵，顺势趴在顾白怀中，含情脉脉道：“那是自然，王爷既然将槿华苑让给妾身住，妾身自然感激啦~”说完还拖了一个软绵绵的尾音，声音不大不小，刚好可以让木若涵听到。<p class='chapter_content_read_css'>顾白悄悄抬起眼，想看看木若涵会有何反应。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351932&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351932&&novelId=15670'">下一章</div>
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
