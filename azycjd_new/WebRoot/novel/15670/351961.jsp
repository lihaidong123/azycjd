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
    <title>番外之告白（4）</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351961&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351961&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351961+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外之告白（4）]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351961')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351961 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351961,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第49章&nbsp;&nbsp;&nbsp;番外之告白（4）
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  “师父，你看，我就是学不会这一招，你教教我啊。”<p class='chapter_content_read_css'>  “放松一点儿，右脚向后一点儿，手腕要转不能全部靠胳膊，好，就是这样……”<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  “师父师父，你干嘛要一直戴着面具啊，我想看看你的样子。”<p class='chapter_content_read_css'>  “师父很丑的，会吓到你的。”<p class='chapter_content_read_css'>  “不会啦，师父绝对会是个绝世美男子！”<p class='chapter_content_read_css'>  “呵。”	<p class='chapter_content_read_css'>  “哎呀，因为师父可是我行云的师父啊，行云最喜欢师父了！”<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  “师父快吃，可好吃了，我们府里可好了，天天都有芙蓉糕吃呢。”<p class='chapter_content_read_css'>  “真好吃，行云真好。”<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  “不许你们说衣管事的坏话！看我不打死你们！”<p class='chapter_content_read_css'>  “哎呀！南宫府的衣管事就是个倌！他可是喜欢男人的！说不定就跟什么公子，哎呦！你这个小混蛋！你这个有娘生没娘养的小狗崽子！”<p class='chapter_content_read_css'>  “让你说衣管事的坏话！我打死你！打到你亲娘也认不出来你！”<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  “夫君，你在想什么？快喝合欢酒啊。”<p class='chapter_content_read_css'>  “啊，好，好。”<p class='chapter_content_read_css'>  “夫君，你是不是心里有了别人？”<p class='chapter_content_read_css'>  “你胡说什么，我哪有别的姑娘走得近。”<p class='chapter_content_read_css'>  “可是……”<p class='chapter_content_read_css'>  ……<p class='chapter_content_read_css'>  行云晕晕乎乎的醒过来，才发现自己竟然在池边靠着树睡了一夜，一件狐裘披风从肩头滑落，他定睛看了良久，不可置信的张大了嘴，这分明就是衣蓝的披风，莫非，衣蓝全都想起来了！还没来得及高兴，就听到了衣蓝的声音响在耳边。<p class='chapter_content_read_css'>  “你醒了，在这里睡着会生病的，令夫人故去，还请节哀。”衣蓝弯腰想要捡起自己的披风，但行云就是死死抓住不肯松手。<p class='chapter_content_read_css'>  衣蓝见他咬着唇死死瞪着自己，心中一阵诧异，松开手又笑道：“既然你这么喜欢这件披风，那就送你好了，记住下次可不能再在外面睡觉了。”<p class='chapter_content_read_css'>  “衣管事，你，还记不记得我是谁？”<p class='chapter_content_read_css'>  “啊？就算我昨天不小心没想起你，可我今天就记住了，你是行云，府里的侍卫。”衣蓝看他快要哭出来的样子，心里揪了一下，掏出自己的帕子递给他，而行云却一把拉住他的手将自己埋进他的怀里，他环着衣蓝的腰，大哭出声。<p class='chapter_content_read_css'>  有不少侍女仆从闻声而来，一看是他们二人，立刻又一溜烟跑走了，只有几个胆大的站在那里一个劲的瞧着。<p class='chapter_content_read_css'>  衣蓝无奈只能轻拍他的背，跪在那里等他平静下来。<p class='chapter_content_read_css'>  等着行云哭声小了下去，衣蓝还没开口就被行云大力推倒在地上，他抬头看着居高临下用一双红肿的眼睛盯着他的行云，眉头一皱。<p class='chapter_content_read_css'>  行云盯了他良久最后竟是一吸鼻子扭脸跑了。<p class='chapter_content_read_css'>  衣蓝慢慢站起来拍拍身上的脏东西，将地上的披风捡起来，一掏袖筒，他的手帕，是不是被那小子给顺走了？<p class='chapter_content_read_css'>  接下来，无论他走到哪里总能看见行云的身影。<p class='chapter_content_read_css'>  行云抱了一包糕点塞到他怀里就跑了，他打开一看，竟然是芙蓉糕，他抿唇站在那里良久，看到田儿走过来随手就塞给了他。<p class='chapter_content_read_css'>  “田儿拿去和泥儿一块儿吃吧。”<p class='chapter_content_read_css'>  然后就是……<p class='chapter_content_read_css'>  “衣管事，我和泥儿实再在不想吃了，您还是去送给别人吧……”田儿说完撒开脚丫子就跑了。衣蓝扶额，他倒是有些头痛了，这行云也不知道是不是故意的，天天都给他送芙蓉糕，难道他不知道自己最讨厌吃甜食吗？一定要带逮到机会好好跟他说说。<p class='chapter_content_read_css'>  还未逮到机会，行云就改送咸饼给他了，正是他最爱的那家李记的咸饼，这次送的东西还可以，晚饭他就就着咸饼喝了一碗米汤。<p class='chapter_content_read_css'>  已经入了二更天，行云终于忍不住偷偷溜到衣蓝房门口，本以为只能戳个小洞偷看两眼，没想到房门却开了一条小小的缝，小心翼翼的不让门板发出声音的开了门，他猫着腰潜进去，还好障碍物并不多，他很容易就到了衣蓝的床前。<p class='chapter_content_read_css'>  夜色漆黑，他只能模模糊糊看见衣蓝的脸的轮廓，慢慢靠近蜻蜓点水般的在他脸颊一吻，再抬起头眼泪就措不及防的掉落下来，衣蓝忽然睁开眼，眼泪就落在了衣蓝眼里，然后慢慢流出，分不清是谁的泪水。<p class='chapter_content_read_css'>  衣蓝的眼睛紧紧盯着行云，行云慌忙的想要解释，却笨拙的咬到了舌头，痛的呲牙咧嘴。<p class='chapter_content_read_css'>  衣蓝不由分说地将手伸向他，行云害怕的闭上眼睛，想象中的巴掌并没落下来，身体却是一轻，就躺在了衣蓝床上，紧接着衣蓝就欺身而上，两只胳膊撑在自己脑袋两边，一条腿压制住了自己的膝盖。<p class='chapter_content_read_css'>  行云抬了一下眼皮又迅速阖上，只觉得脸上有什么温湿的东西在蠕动，等反应过来是什么，猛地睁开眼睛，恰好对上衣蓝含着笑意的眼眸。<p class='chapter_content_read_css'>  衣蓝低着头一点点舔着行云挂在脸颊上的泪珠。<p class='chapter_content_read_css'>  他还想说些什么，衣蓝的舌头已经到了他的唇上，密密麻麻的吻就落了下来，他微微张开的牙缝给了衣蓝空隙，他的舌头灵巧的窜进去，轻轻舔舐着他受伤的舌尖，竟然还可以口齿清晰的问他痛不痛。<p class='chapter_content_read_css'>  他委屈的点点头，又摇摇头。<p class='chapter_content_read_css'>  衣蓝稍稍放过他的唇，微微抬头对上他的眼睛，话语里是隐藏不住的欣喜。<p class='chapter_content_read_css'>  “终于等到你了。”<p class='chapter_content_read_css'>  衣蓝紧紧抱住他，像是要将他揉进自己的身体里，行云吸了吸鼻子，口齿不清道。<p class='chapter_content_read_css'>  “我喜欢你。”<p class='chapter_content_read_css'>  “可我不喜欢你了。”行云被他的一句话给吓住了，惊恐的看着他。衣蓝好笑的继续深吻他，直到把他吻得迷迷糊糊，才贴在他耳边，轻轻一语。<p class='chapter_content_read_css'>  衣蓝的手所到之处都像是被点着了一把火，像是要把他燃烧殆尽，他真的，真的……<p class='chapter_content_read_css'>  他不安的呻吟着，他的呻吟一点点挠在衣蓝心里，衣蓝强忍着泪水没有流下来，慢慢加重在他身上的吻。<p class='chapter_content_read_css'>  他明明是想放弃的，恰好又撞到了头，那就来一场失忆好了。<p class='chapter_content_read_css'>  就像徐管事说的那样，求仁得仁罢了。<p class='chapter_content_read_css'>  可是啊，当看到他在树下睡着还呼唤着“师父“的时候，他就要装不下去了。<p class='chapter_content_read_css'>可是，如果真像徐管事说的那样，他只是为了报恩的话，还不如就这样彻底断了吧。<p class='chapter_content_read_css'>  他当初吃芙蓉糕只是因为是他给他的，可现在，他却要忍住刨心的痛给田儿。<p class='chapter_content_read_css'>  他偷偷看着行云讨好徐管事才知道他喜欢吃咸饼，他将咸饼小心翼翼的从怀里掏出来，放在桌子上又拿起来放到床头上，又拿起来放到了桌子上，又找了宣纸盖了好几层才满心忐忑的离开。<p class='chapter_content_read_css'>  而今晚，他偷偷留了一条门缝，没想到他真的来了。<p class='chapter_content_read_css'>  看着他哭的时候他也红了眼眶，酸了鼻头。<p class='chapter_content_read_css'>  果然还是放不下啊……<p class='chapter_content_read_css'>  衣蓝将浑身是汗的行云环在怀里，亲昵的亲亲他的额头。<p class='chapter_content_read_css'>  行云猛然抬头看向他。<p class='chapter_content_read_css'>  眼里闪着星烁，一如初见的模样。<p class='chapter_content_read_css'>  “不对！”行云突然将额头抵上他的额头，眼里冒着怒火。<p class='chapter_content_read_css'>  “你骗我！你根本就没失忆！我的芙蓉糕啊！你赔我你赔我你赔我你赔我……”<p class='chapter_content_read_css'>  衣蓝干笑两声，“看来，你还有力气啊，我们继续好了……”<p class='chapter_content_read_css'>  “不要啊！！！！”行云哀嚎一声，很快被衣蓝的吻给憋回肚子里。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “可我不喜欢你了……<p class='chapter_content_read_css'>  是爱你啊。”<p class='chapter_content_read_css'>“那我也不喜欢你了，爱你好了。”<p class='chapter_content_read_css'>真的，真的，好爱你。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351961&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351961&&novelId=15670'">下一章</div>
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
