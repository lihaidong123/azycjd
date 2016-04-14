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
    <title>第二十章【将军威仪】</title>
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
	<script language="javascript">var novelId='17990';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405914&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405914&&novelId=17990";
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
					window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405914+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十章【将军威仪】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405914')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'">公子万劫不复之嫡女撩人</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:苏易尘</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405914 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405914,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第22章&nbsp;&nbsp;&nbsp;第二十章【将军威仪】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; “住手！”邵渊戎冷哼一声，厉声开口，于是，跟着张氏前来的几人全都跪在了地上，严厉的邵渊戎还是让人心有余悸的，犹记当初安氏夫人殁了的时候，那个时候老爷还是西北驻军的统帅，回来的时候安氏夫人已经下葬，他大发雷霆，就连当时还在世的老夫人都劝说不住，后来他像疯了一般用双手刨土，似乎想要用双手将那坟墓刨开，所有人都吓坏了，后来还是年仅十岁的大少爷站在他面前，冷冷的开口，“父亲还是不要打扰娘亲休息了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许是大少爷脸上的表情太过冰冷，还是将军的老爷一下子给愣了，然后便泪流满面。后来，大少爷便拽着身穿戎装的老爷回了府，在后来大少爷就被老爷带去西北自己教授，而大小姐被老妇人养在了身边，二小姐就陪着三小姐养在了现在的夫人身边。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “老爷，卿卿还小，”张氏不敢动作，只能陪着女儿跪在地上，看着发怒的邵渊戎垂首哭泣，“她一定是被有心人鼓动的，老爷，卿卿她一定不是故意的，求老爷先让她起来！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “明年都该及笈了，还小？”邵渊戎坐在一旁的椅子上，看着地上跪着的众人，怒火中烧，直接拿起桌子上放着的茶盏摔在了张氏与邵卿卿面前，杯中的茶水已经凉了下来，所以溅在张氏与邵卿卿的身上她们也没什么感觉，只是杯中的茶叶沾到了邵卿卿的脸上，邵卿卿“啊”的喊了一声，但看到邵渊戎饱含怒意的双眸后又消了声，只听到邵渊戎继续道，“你平日就是这般教育女儿的吗？好好的闺女都被你惯成什么样了？让外人知道了还不得笑话死咱们邵府！依依眼看着就及笈了，及笈之后就要开始议亲，这让外人知道了，我们邵府的女儿还要不要嫁人了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “邵依依，邵依依”原本邵卿卿还算平静，即便被父亲这样训斥，她也没有什么大的抵触，但一听到邵渊戎的口中说出“邵依依”三个字，邵卿卿整个人都不能平静了。原来，自己这样做会耽误邵依依议亲，难道今日那个俊俏的郎君，是父亲给邵依依寻的夫君吗？一时间心绪难平，邵卿卿也顾不得其他，直接跪在了地上，“父亲怎可如此偏心？心中就只有二姐姐一个女儿吗？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 所幸这次邵卿卿未口出不敬，没有说邵依依那个贱人，但是就只有这些话都让张氏心惊胆颤，更别说已经面色乌黑的邵渊戎了，张氏急忙扭转上半身，直接给了邵卿卿一个响亮的耳光，邵卿卿不可置信的睁大了双眼，半晌之后才反映过来捂住已经肿起来的左脸，尖叫一声，“娘亲，你打我？你竟然打我？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依被邵轻扬撺掇的也来到了前院看好戏，反正现在父亲已经安排人把守住了前后，今日也不会在待客了，所以她也没戴那劳什子的帷帽，直接跟在邵轻扬的身后前来了。刚一踏入前院便看到了这么精彩的一幕，他们两人的入内自然引起了院内众人的侧目，邵卿卿更是被怒火糊了双眼，“邵依依，你……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “哼！”邵渊戎重重的冷哼了一声，好似给怒火中烧的邵卿卿兜头交了一盆凉水，邵卿卿也顾不得怒视邵依依，直接匍匐在地。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “儿子（女儿）给父亲请安！”邵依依随着邵轻扬对着邵渊戎行了一礼，而后转身看了张氏一眼，两人也转身朝着还跪地求情的张氏行了一礼。只是，张氏低头垂眸，让人看不清她脸上的表情。但是张氏能够想象出邵依依嘴角的嘲笑，张氏险些咬碎了一口银牙！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许是因为晚辈太多，邵渊戎不想太过折了张氏的脸面，黑着一张脸朝着张氏说了句，“起来吧，跪在地上成何样子！”张氏听了赶紧起身，急急说了句，“妾身谢过老爷！”话刚落地就听到邵渊戎有些暴怒的声音，“孽女，跪下！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏扭头一看，邵卿卿又“扑通”一声跪在地上。邵依依嘴角抽了抽只觉得膝盖好疼，抬眸一看，果然，邵卿卿的脸色异常难看，只见她疼的五官都皱到了一起。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏的脸色也变了，自然是心疼的，毕竟是她身上掉下来的一块肉，声音中透着哀泣，朝着邵渊戎轻轻的唤了句，“老爷……”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “禁足一月，&lt;&lt;女戒&gt;&gt;抄上百遍！”而后邵渊戎朝着张氏冷哼一声，“带回去好好管教管教！”说完一甩袖子竟自走了。看了一场好戏的兄妹二人也准备离去，却听得身后邵卿卿的喊声，“邵依依，你……”&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依知道她肯定又要说“贱人”二字，却不曾想身后传来“啪”的一声，转头却看到邵卿卿一脸懵逼的样子，而后一手捂着左脸。她本不欲理会这个脑残的三小姐，却不曾想邵轻扬却是转身走了过去，居高临下的看着那母女二人，“夫人何必阻拦，让三妹妹将话说完才是，”而后略微转了转头看向邵卿卿，“三妹妹有话直说便是！”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依看不见邵轻扬的表情，却看到邵卿卿一脸恐惧的朝张氏后面躲了躲，吓得一丝声音也无，让邵依依升起了一股强烈的好奇心，想要看看邵轻扬脸上的表情。若说邵轻扬此刻的表情，却是面无表情，但就是让邵卿卿心中升起一股惧怕之意，或许是小时候的印象太过深刻了吧。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 记得她小时候经常欺负邵依依，她每次都默默的忍了，毕竟她住在自家娘亲的院子，自然要夹起尾巴做人。但有一次自己命人在她的房中放了一条毒蛇，想着将她咬死一了百了。但谁曾想那日已经搬去外院读书的邵轻扬却偷偷摸摸的进了内院藏在她的房中，于是那条毒蛇就被他抓住了。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 翌日邵轻扬抓着那条毒蛇来到自己面前，面无表情的将毒蛇扔到了自己身上，当时她就吓得晕了过去。等到后来她醒来后，母亲告诉她，幸亏那条蛇的毒牙被人拔了，她才会平安无事的。她想将事情的经过告诉母亲，但一想到邵轻扬面无表情扔蛇的样子，她就含糊的告诉母亲是蛇突然从草丛中窜出来咬了自己一口。虽然她没有受到实质性的伤害，但从此却怕上了这样的邵轻扬。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 放下自回了“墨芽阁”的兄妹二人不提。张氏带着低眉垂眼的邵卿卿回了“怡玥阁”，进了主屋之后就让除过雪莹之外的所有下人都出去了，唐妈妈自然知道她们母女有话要说，且是不能让别人知道了，只是有些怜惜的看了地上的雪莹一眼，这孩子怕是以后就看不到了吧。但主子之间的事情并不是她一个下人能够插手的，她只是将门带上，在稍微远一点的地方坐下摇了摇头。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 今日是每个季度底下的铺子庄子上的掌柜前来对账的日子，所以今日具体发生了什么事，邵卿卿又是为何惹怒邵渊戎的她也不甚清楚。刚刚雪莹这丫头来请她的时候她才令那些掌柜的下去，再说这死丫头语焉不详的也没说清楚。坐在桌边的张氏拿起桌上放置的汝窑烧的青花瓷的盖碗，重重的往桌上一放，用眼尾扫了跪在地上的雪莹一眼，而后才抬头看了站在一侧的邵卿卿一眼，语气中也带了些许怒火，“今日到底怎么回事？”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵卿卿从未见过自家母亲发这么大的脾气，一时间心乱如麻竟然双膝一软就跪了下来。张氏心疼自己女儿，又看她较弱的模样，一时心软又将她扶了起来安顿在一旁的凳子上。得了自家母亲的信号，邵卿卿加油添醋的将她在外院看到的事情以及遭遇的对待向着张氏哭诉了一番。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏心下一转就明白事情肯定不像自家女儿说的那般简单，这件事情还是需要她好好打探一番才能下决心，才能知道下步棋该怎么走。但对于女儿擅自跑到外院见外男这件事情还是不能沽息的，张氏还是狠狠的将邵卿卿训斥了一顿。但是对于雪莹却只是扬声唤了唐妈妈进来，叫人将她拖下去关在了暗室之内。现在处死她，自然是要落人口舌的，她既然知道了那么多事情，发卖出去自然也是不行的，谁知道她会不会将今日之事宣扬出去。故而张氏只是吩咐每日一碗水两碗粥的给她喂着，别把人一下子的给弄死了。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 唐妈妈招了两个婆子进来直接拖走了，没有人理会一开始哭得撕心裂肺后来被堵住嘴巴的雪莹。这会儿的邵卿卿却是有些不舍了，毕竟是打小伺候在她身边的丫头。看得她哭得梨花带雨的模样，邵卿卿突然良心发现是因为自己一意孤行她才会得此下场，想要帮她向自家母亲求求情，只是刚刚开了个口，“娘亲，雪莹她……”<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “住口！”没曾想到刚刚开了个口就直接被张氏厉声拒绝了。邵卿卿垂首不语，神情恹恹的模样，倒不是因为没能留下雪莹而是因为一向疼她宠她的母亲今日一再的打了她巴掌，现在还在呵斥自己。<br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;<br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许是因为母女连心吧，张氏呵斥完之后就将邵卿卿揽到了怀中，伸手轻轻抚上她的面颊，如花的俏颜硬生生的被自己掌掴出了掌印，红彤彤的都肿了起来。张氏怎么可能不心疼，且看她眼中忍不住留下的泪水就知道了，然后将手挪到了邵卿卿的膝盖上，只轻轻一碰就听到她“嘶嘶”的抽气声。张氏抬眼朝着西北方向邵依依的院子看了一眼，狠戾自是不用提的。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405914&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405914&&novelId=17990'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')"/>
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
