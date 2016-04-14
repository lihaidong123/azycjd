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
    <title>（四十一）若曾相识白木槿 何曾见过火牡丹</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351954&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351954&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351954+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十一）若曾相识白木槿 何曾见过火牡丹]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351954')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351954 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351954,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第42章&nbsp;&nbsp;&nbsp;（四十一）若曾相识白木槿 何曾见过火牡丹
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			书绘音趁南宁呆愣之际倒了一杯温水递给她，南宁一晃神赶忙接过杯子，咕咚咕咚两口下肚，喉咙像是被清泉冲洗过一般清凉舒服。<p class='chapter_content_read_css'>南宁双手攥着茶杯良久，才开口道：“七圣珠，又集齐一颗了？”<p class='chapter_content_read_css'>书绘音轻轻“嗯”了一声，没再言语。<p class='chapter_content_read_css'>气氛莫名有些尴尬。<p class='chapter_content_read_css'>外面的乌云应该是散开了些，微弱的月光透过薄如蝉翼的窗纸刚刚好洒在书绘音的面颊上，恬淡如水的模样像是早已看透南宁内心的挣扎。<p class='chapter_content_read_css'>南宁面色一狠下定决心要将事情说与书绘音听，但刚刚吐出一个“我”字就被突然醒来的琴霜七一把抱住，后面的话被恶狠狠地憋了回去。<p class='chapter_content_read_css'>她看着一会儿抱紧自己，一会儿又松开摇摇，又哭又笑，连说话都语无伦次的琴霜七，心窝处瞬间柔软了一块，连琴霜七一时激动冒出的不雅词汇也没有在意。撑着轻笑任她随便摆弄。<p class='chapter_content_read_css'>一道黑影从窗外飞快掠过，漆黑的影子在书绘音面颊上转瞬而逝。<p class='chapter_content_read_css'>书绘音微微眯了眯眼琥珀色的双眼。<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>南宁本想着到明天再让琴霜七告诉大家她醒来的消息，却没想到琴霜七弄出的动静实在太大，直接把所有人都给招来了，第一个冲进门的就是住在隔壁院子的木梓，木梓看到南宁坐在床上激动的直接冲上去要抱住南宁，结果被反应迅速的琴霜七给一脚踹到地上。<p class='chapter_content_read_css'>南宁呆愣的眨眨眼，还没反应过来刚才发生了什么。<p class='chapter_content_read_css'>紧接着就是只披了一件白色外袍的顾白闯了进来，他脸上的紧张一览无余，看到南宁又面色瞬时一松，快步向前将南宁抱在了怀里，琴霜七不仅没像刚才对木梓那样，还主动闪到一旁，给顾白留下足够的空间。<p class='chapter_content_read_css'>琴霜七站在一旁，完全无视木梓怒怨的视线。<p class='chapter_content_read_css'>顾白俯下身将南宁圈在怀里，南宁僵硬地呆住不动，头埋在顾白胸口可以闻到他身上淡淡的木槿花香，南宁慢慢适应过来，只觉得顾白对她来说有种似曾相识的感觉，只是因为晏紫荆记忆的缘故吗？<p class='chapter_content_read_css'>南宁忽然想到了什么，一把推开顾白，自顾自的在床上摸索，终于找到了藏在枕头下的炭笔，打开包着的纸用食指尖蹭了一下炭笔，然后点在了自己左眼角。<p class='chapter_content_read_css'>“管家，可以借一下灯笼吗？”南宁轻声道。<p class='chapter_content_read_css'>“诺。”管家将手中的灯笼递给靠近门口的琴霜七，琴霜七又提着灯笼上前来，刚好可以让人看清南宁的面容。<p class='chapter_content_read_css'>左眼角用炭笔点上的一点，就如同痣一般。<p class='chapter_content_read_css'>琴霜七疑惑的歪着头，书绘音依旧是一副事不关己的淡漠模样，唯有顾白。<p class='chapter_content_read_css'>只有顾白神色大变，瞪大着双眼盯着南宁，嘴唇哆嗦了半天，一句话也没说出来。<p class='chapter_content_read_css'>南宁的目的瞬时就达到了，心里是止不住的酸涩，原来，顾白对自己的好并不是无缘无故的；原来，只不过是因为自己与故去顾王妃的容貌相似罢了。<p class='chapter_content_read_css'>有句话果然是真的，一个人永远不会无缘无故的对另一个人好。<p class='chapter_content_read_css'>就连他，也是那样。<p class='chapter_content_read_css'>南宁低头掩住眼中的落寞，一言不发的将炭笔慢慢包好，然后默默塞到枕头底下，一歪身子想要躺下，却被顾白一把抓住。<p class='chapter_content_read_css'>只听得顾白道。<p class='chapter_content_read_css'>“南宁，做我小妹可否？”<p class='chapter_content_read_css'>南宁僵硬的抬起头，有些呆滞的看着保持着俯身姿势没有动的顾白，清清楚楚的看到顾白眼中闪着的期冀，南宁终是轻轻地了点头。<p class='chapter_content_read_css'>“好，顾大哥。”<p class='chapter_content_read_css'>“能不能……唤我一声……哥哥？”顾白的声音竟有些微微发抖。<p class='chapter_content_read_css'>南宁面色一下子冷了下来，狠狠掰开顾白的手，语气也是有些阴冷，“不要。”<p class='chapter_content_read_css'>“世界上没有两个字比‘哥哥’更恶心的了。”<p class='chapter_content_read_css'>顾白还未展开的笑容瞬时凝结在脸上，眼中的期冀被敲打成碎片，一片一片扎在心口。所有人都静默着，唯有不解人意的寒风肆意敲打着门窗，发出扑哧扑哧的声响。<p class='chapter_content_read_css'>“顾王爷，你们在谈些什么？秦姑娘已经醒了？”南宫宁雪忽然挎着医箱走进门来，衣蓝在后面为他掌灯。<p class='chapter_content_read_css'>“没、没什么，”琴霜七一下子回过神来，打着马哈哈看着南宫宁雪，将灯往下放了放，“只是南宁刚醒，顾王竟然想要收南宁做义妹，南宁就一下子被吓到了，说不定是顾王的玩笑话呢，哈哈。”<p class='chapter_content_read_css'>听着琴霜七的干笑，顾白正了脸色，认真道：“本王没有开玩笑，而且，既然南宁肯唤我一声顾大哥，我就会认真把南宁当做亲生妹妹来看待。”<p class='chapter_content_read_css'>南宁微微抬头盯了琴霜七一眼，琴霜七立刻明白，清咳两声道：“虽然南宁醒来可喜可贺，但是都已经大半夜了，大家就先回去吧。有事明天再说吧。”<p class='chapter_content_read_css'>听琴霜七下了逐客令，顾白还想说些什么，被琴霜七赶忙拉起来推出门连带着南宫宁雪一起。书绘音就拉着木梓踱步到了院子。<p class='chapter_content_read_css'>琴霜七扬手便要把房门关上，一只手拦在她面前，只见南宫宁雪用另一只手从医箱里拿出一小截大拇指粗细的东西递给她。<p class='chapter_content_read_css'>“这是尘丁香，有疗养身体的功效，恰好秦姑娘刚刚醒来身子还很虚弱，用这香刚刚好。”<p class='chapter_content_read_css'>琴霜七点点头笑着接下，“这一个月来也多谢南宫对南宁的看照，多亏了南宫每天都来为南宁听诊。”<p class='chapter_content_read_css'>“客气了，无论怎样秦姑娘也算是在下的相识好友，这么做也是应该的。那明日在下再来叨扰。”<p class='chapter_content_read_css'>“嗯。”琴霜七语罢紧紧关上了房门。<p class='chapter_content_read_css'>一道冷冽的目光直射在南宫宁雪背上，他心里很是清楚那道目光是属于谁的，眼眸一沉。若是说之前他对书绘音的身份还抱有疑惑，但自从书绘音说穿他的身份时，他就笃定书绘音一定就是宫珀，他三叔叔的独子，他的堂兄。<p class='chapter_content_read_css'>书绘音一拢衣袖淡然离开，木梓一咬牙也不情不愿的离开了。<p class='chapter_content_read_css'>顾白出神的看着紧闭的门扉，南宫宁雪掩面轻咳一声，顾白倏尔回过神来，漫不经心地一抚额头以掩饰自己的失态。<p class='chapter_content_read_css'>“不知殿下深夜来小王的府邸有何贵干？难道只是为了送一小截香不成？”顾白语气里掩饰不住的不耐烦。<p class='chapter_content_read_css'>“呵，王爷说笑了，在下乃是南宫。”南宫宁雪保持一贯的温文尔雅，将医箱关好，小踱两步，“自然只是为了送这一小截尘丁香，秦姑娘的昏迷与在下……在下只是担心秦姑娘罢了。”<p class='chapter_content_read_css'>顾白听出他语气里的不对，眼眸一沉。<p class='chapter_content_read_css'>“没想到王爷竟然要收南宁为义妹，那么南宁可不就是郡主了？”<p class='chapter_content_read_css'>“南宁可没有那个福气。”顾白语气不善，眼眸愈发深沉，“南宫公子请回吧，足下对南宁的照顾本王他日必定会登门道谢。”<p class='chapter_content_read_css'>南宫宁雪此次来的目的便是看看南宁情况如何，南宁一切安好，他心中的不快也烟消云散。见顾白毫不客气的下了逐客令，也就只有作揖离开。<p class='chapter_content_read_css'>顾白一直送他出了顾王府，见他身影渐行渐远，直至衣蓝手中的灯光消失在茫茫夜色中，他才转身入门。<p class='chapter_content_read_css'>踩在青石板上，丝丝凉意顺着脚底透到了心坎，顾白这才发现他连鞋子都没有穿，不禁哑然，自从小妹出事之后他何曾如此失态过？<p class='chapter_content_read_css'>他定住脚步，抬头看着满天繁星，心中酸涩眼眶也有些发痛。<p class='chapter_content_read_css'>他曾听老人说过，人若死了便会化为天上繁星的一颗，光芒越强，就证明那人心中的牵挂越多，如果是他的没心没肺的小妹的话，他会找不到的吧，她一定不会记得他这个没有用的哥哥的。<p class='chapter_content_read_css'>“王爷，天气寒凉，快些回房吧。”管家心疼道，“秦姑娘刚刚醒来，您可不能再病倒啊。”<p class='chapter_content_read_css'>“是啊，本王可不能再病倒了。”顾白勉强一笑，将手负在身后，“当年一病害了父亲他们，若是现在真的病倒了，就又要后悔一辈子了。”<p class='chapter_content_read_css'>“王爷……”<p class='chapter_content_read_css'>“化叔，我知道您要说什么，”顾白突然改变了自称，“往事不可溯，如今南宁到了我身边，就算是错的，我也一定要把她牢牢留在身边，我真的——害怕了。”<p class='chapter_content_read_css'>害怕她就像父亲一样，母亲一样，小妹一样，若涵一样，就那样消失了，他无法容忍自己再犯下同样的错误了。<p class='chapter_content_read_css'>那是他永远无法跨越的心结。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>心结……<p class='chapter_content_read_css'>琴霜七关上门，一贯笑嘻嘻的神情也变得沉闷起来，踌躇良久还是到了南宁床前坐在床边上，拍了拍整个身子都藏在被子里的南宁。<p class='chapter_content_read_css'>“南宁你，心里是不是——”<p class='chapter_content_read_css'>“没有。”斩钉截铁的回答将琴霜七的话钉得死死的。<p class='chapter_content_read_css'>“阿阳哥他……”琴霜七猛然顿住，被角刚刚好从她脸颊划过，离她不过一拳的如同冷兵器一般的目光扎在她脸上，是火辣辣的疼。<p class='chapter_content_read_css'>南宁两手紧攥被褥，又腾地躺下，半张脸都埋在被褥里，两只眼睛瞪着琴霜七，里面写满了倔强。<p class='chapter_content_read_css'>琴霜七赶忙开始扯开话题，“南宫送来了药材香料，我帮你点上吧，哎，是不是放在这个香炉里面啊？”<p class='chapter_content_read_css'>南宁看了放在香案上的香炉一眼，闷闷“嗯”了一声。<p class='chapter_content_read_css'>琴霜七取了火折子点着香，扔进香炉里盖好炉盖，袅袅烟丝从香炉镂空处慢慢飘出，不多时，她就听到了南宁平稳的呼吸声。<p class='chapter_content_read_css'>果然还是阿阳的问题啊……<p class='chapter_content_read_css'>琴霜七竟然反常的低叹一声。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351954&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351954&&novelId=15670'">下一章</div>
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
