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
    <title>（八）半生缘起半生落 岁事浮沉已成烟</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351921&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351921&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351921+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（八）半生缘起半生落 岁事浮沉已成烟]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351921')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351921 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351921,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第9章&nbsp;&nbsp;&nbsp;（八）半生缘起半生落 岁事浮沉已成烟
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  洛家姐姐？<p class='chapter_content_read_css'>  南宁微微吃惊的看向沈言，明明看起来就是沈言比洛瑾香大好多，怎么还会喊她姐姐？<p class='chapter_content_read_css'>  再看旁人的反应，一听是沈言带来的人便都了然的躲开视线，当做什么都没发生似的。<p class='chapter_content_read_css'>  洛瑾香也没想到沈言会忽然开口，她原先的准备是让书绘音，或者是南宫宁雪替她解围，却忘了一个与她不和的沈言。只是愣了一瞬，就笑笑道：“我怎么会知道是妹夫带来的人呢？不然，我自然也不会说那样的话了，不是吗？”<p class='chapter_content_read_css'>  原来是妹夫，沈言有家室？那夏曼，又是怎么一回事？<p class='chapter_content_read_css'>  南宁见洛瑾香的注意力转到了沈言那里，不由得放松下来，手指一动，便碰到了银质的小铃铛，松了松，又紧了紧。<p class='chapter_content_read_css'>  沈言冷笑一声，“怕是洛家姐姐是故意针对沈某吧？瑾冉若是像姐姐一般，我沈家怕是要不得安宁了，还好瑾冉是个温婉性子。”<p class='chapter_content_read_css'>  洛瑾香听懂他的讥讽，笑着说：“确实是呢，我妹妹就是性子好，不像我，那妹夫可要好好待我妹妹，过几日，我得了空便去看看瑾冉，我约莫着她也很想我这个姐姐吧？你说呢？妹夫？”<p class='chapter_content_read_css'>  沈言冷了脸，不再与她搭话。<p class='chapter_content_read_css'>  南宁见他面色不善，就觉得里面一定有很大的故事，怕是沈言与那什么瑾冉的感情也不会好到哪去。<p class='chapter_content_read_css'>  南宫宁雪早就听闻中辰洛家与泽成沈家结姻，只是没想到联姻的竟是两家不算很出名的小辈，沈家的商业算是遍布整个南苧国，洛家的势力在商州也是数一数二，这两家联姻自是有利有弊，若是夫妻二人和美无恙，对两家都有好处，又或者是，就像现在这样，洛瑾香与沈言针锋相对，就算洛瑾香是一介女子，但洛家直系无男丁，洛瑾香便象征着洛家；沈言是沈家正室长子，便代表了沈家。如果这两家将关系撕破，怕是只有弊无利。<p class='chapter_content_read_css'>  “咳咳，接下来就该评选花项了，请诸位安静。”洛家主恰好插话，打破了这诡异的气氛。<p class='chapter_content_read_css'>所有小声议论的人都瞬时安静下来，只听得洛家主徐徐宣布花项各位千金的评分，最终的获胜者不言而喻，自然是洛瑾香。<p class='chapter_content_read_css'>  只是……南宁缓缓看向书绘音，只见他眼中的寒冰又深了几重，让她想起了最不该想那人，狠狠地打了个冷颤，心中也觉察到那奖品多么重要，哦，不，是对书绘音多么重要。<p class='chapter_content_read_css'>  只听得洛家主宣布酒项无胜者，所有人都心存疑惑的看向洛家主，洛家主看到众人疑惑的视线，眼神不经意的瞥向书绘音，徐徐道：“众人应当比洛某更了解酒项获胜的条件吧？酒项不同于花项，花项是积分多者为胜，而酒项却是满分才可获胜，刚才公子虽然其他项都是满分，这采酒却是失了一分，自然算不上胜。”<p class='chapter_content_read_css'>  “洛家主，不知评测人是何人？竟说我哪里失了一分？”书绘音将茶杯掷于脚下，上好的青瓷茶杯瞬时变得尸骨无存，茶水洒在脚下，却未湿了衣袍半分。<p class='chapter_content_read_css'>  南宁有些吃惊，书绘音在她眼中总是冷冰冰，十分淡定的样子，从见过他如此动怒，怕是洛家主的做法触犯了他的底线了。<p class='chapter_content_read_css'>  “这采酒的酒方正是三十八年前那位酒项胜者的姑娘留下的方子，还有那须臾花，就是被四大家所扣下的，四大家难道是想一直将须臾花占为己有吗？当年姑娘想要将须臾花带走却被你们寻了个莫须有的名头扣下，姑娘用竹酒换花，却差点落了个亡命的下场，这就是你们中辰的四大家！”书绘音声音越发冷冽，冰冷的眼神扫了一下四大家的人，所有人都打了几个寒颤，僵硬的坐在位子上，只有屏风后的洛瑾香似有似无的勾了勾唇角。<p class='chapter_content_read_css'>  普通席上的南宁等人也都安然无恙，只是所有人都没了笑意，四大家中有知道三十八年前事的人，都有些恐惧的看着书绘音。<p class='chapter_content_read_css'>  洛当家也沉了眼眸，虽然被他的眼神震了一下，但立刻又恢复了平常，三十八年前的事他也听上一任家主，也就是他的父亲提起过。当年，中辰来了位极其古怪的人，混入船中参加才情会，所有人都认为他是哪家的公子，琴棋书画酒竟都得了满分，让所有人都惊艳不已。<p class='chapter_content_read_css'>  后来便到了花项，那位公子竟也掺了一脚，当年的主事人前柳家主拦住了他，向他讲了规则，他扯了发冠，长发散在肩头，原来，此她非彼他，这位公子竟是位女儿家。<p class='chapter_content_read_css'>  她将会中所有的花卉认出，绣了一幅百里忘川，还有，便是现在才情会酒项的奖品，一种很漂亮的神奇的花。当年四大家起了贪心，便出了个主意将那花占为己有。她说什么也不肯，提出条件，拿另一样东西来换，便是竹酒。<p class='chapter_content_read_css'>  虽是让她拿走了花，四大家又派人劫了她抢走花，她武功并不是很高，四大家的人也起了杀心，便想除掉她，却不料从她袖筒窜出一只雪狐，将她救走，从此，中辰再未出现过这么一个人，似乎所有人也都快要忘了有过这么一件事，可是，如今却出现这么一个人。<p class='chapter_content_read_css'>  洛家主目光深沉的看向书绘音，这件事决不能让他人知道，否则，四大家族的名誉将会荡然无存。<p class='chapter_content_read_css'>  “咳，这位公子在说什么话？我们四大家怎么会做出那样的事呢？”就在所有人愣神的时候，洛瑾香悠悠从屏风后走出来，“既然这位公子对奖品势在必得，那瑾香便出一题，若是公子答对，不仅拿奖品，就连夜凝花也一同赠与公子，如何？”<p class='chapter_content_read_css'>  果然是真的夜凝花，书绘音盯着洛瑾香的眼睛，在考量她说话的用意，半晌，沉声道：“好。”<p class='chapter_content_read_css'>  洛瑾香见父亲想要拦住她，只是抬了一下手，眼睛扫过洛家主，洛家主一怵，哑了言。<p class='chapter_content_read_css'>  她接着便说：“我只想问公子一个很简单的问题，”眼神瞥过南宁，“公子想要那花的理由。”<p class='chapter_content_read_css'>  书绘音也没想到她会问这个问题，沉默在原地，心中自是不想说出来，顿了顿，刚想开口，就听洛瑾香插了一句。<p class='chapter_content_read_css'>  “公子千万不要说谎，机会，可只有一次。”他望向她的眼睛，她眼中有很多情绪，轻松，伤感，沉默，期待……却都只是伪装，完全不是一个才二八年华的少女该有的神情，仿佛能轻易看到人的心底。<p class='chapter_content_read_css'>  洛瑾香也回望他，嘴边噙着笑，一副“我可以看出你的谎话”的样子。<p class='chapter_content_read_css'>  顿了半晌，书绘音终是开口，神情也恢复到了那种冷淡的样子。<p class='chapter_content_read_css'>  “为了一个人。”<p class='chapter_content_read_css'>  不知怎的，南宁心中猛一震，不过，她还没有自恋到认为书绘音是为了自己，或许是师父的任务也说不准。但心中还是涌起一股异样的情绪，哀伤中带着些淡淡的喜悦，晃神之中似乎看到了一位绝美的女子怀中抱着雪狐，眉宇间是掩饰不住的喜悦。<p class='chapter_content_read_css'>  使劲掐了一下手心，好让自己回过神来。<p class='chapter_content_read_css'>  只见洛瑾香招了一下手，便有小侍抱了一个花盆出来，花盆上罩了一块黑色的轻纱布遮住了花盆内的光景，自从花盆露出一个小角，书绘音便目不转睛的看着那花盆，即使脸上很是平淡，他眼中的波动也是出卖了他心中的欣喜。<p class='chapter_content_read_css'>  所有人都屏住呼吸，期待着那花的样子，只有南宁，紧紧攥着袖中的衣物，胸口一阵刺痛，那花离得越近，心口越是疼痛，眼皮一点点下沉，只隐隐约约看到黑布被轻轻扯开，一道蓝光刺进眼中，终是撑不住，“咚”的一声倒在了南宫宁雪身上。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351921&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351921&&novelId=15670'">下一章</div>
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
