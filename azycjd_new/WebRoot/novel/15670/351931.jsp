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
    <title>（十八）叶落归根为故乡 何曾相识木槿落</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351931&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351931&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351931+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十八）叶落归根为故乡 何曾相识木槿落]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351931')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351931 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351931,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第19章&nbsp;&nbsp;&nbsp;（十八）叶落归根为故乡 何曾相识木槿落
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			南宁蹲在地上良久才回过神来，他刚才那话是什么意思？说亲？不对吧，她跟他才认识多久啊，不对，是已经认识很久了，只是还是不是很熟罢了，呃，看他刚才的表情，一脸无事，很正常的，果然是自己多想了吧，他应该只是单纯的问问吧。<p class='chapter_content_read_css'>想到这儿，南宁拍拍脸颊，心绪才平稳下来，不禁嘲笑自己一下，真是爱做白日梦嘞，白马王子什么的，果然还是会有些憧憬啦，虽然从没见南宫宁雪骑过白马，但自己也不是什么公主，也不是什么运气好的灰姑娘，只是一个平平凡凡的小老百姓哎。<p class='chapter_content_read_css'>“呼，算了，还是去找书绘音去吧。”南宁望望周围没人，狠狠地伸了个懒腰，大步流星的向前走去，猛一顿，是这个方向吧，没错，是。<p class='chapter_content_read_css'>“书绘音。”南宁敲了两声门，没听到回应，就自径打开房门进去，却发现房内空无一人，只有凌乱的被褥证明曾经有人到来过。<p class='chapter_content_read_css'>“奇怪。”南宁诧异的看向打开的窗户，一个裂洞出现在南宁眼中，喃喃道，“是结界被破了……”<p class='chapter_content_read_css'>南宁捏着拳头微微眯眼，心中嗔念：又跑路了吗？书绘音，你真是够了。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>不久便到了临盆之日，正如南宫宁雪所料，木若涵血崩了。但所幸是因有得书绘音临走之前送予的护神丹，孩子才得以顺利出世，是一男婴。<p class='chapter_content_read_css'>木若涵身体虚空，连床也下不得，怕也撑不得多日，只能用药材吊着。因自古子女之名皆由其父或家中长者所取，故此孩子的名字只能耽搁下来。<p class='chapter_content_read_css'>等到孩子的身体稳定下来，已是十几天之后。木若涵便提议为孩子取名，但让人意外的是，木若涵喊来的却南宁，让她为孩子取名，木风也点头同意。<p class='chapter_content_read_css'>南宁不明白他们其中用意，心中当然明白，取名字这件事是多么的重要，这种事，交给她一个外人来办，到底用意何在？书绘音不在，她一时连一个商量的人都没有，这事若是交给七七来办，她一定会毫不犹豫的给他取名吧。<p class='chapter_content_read_css'>南宁思考了很久，终于决定去问问木若涵为什么。<p class='chapter_content_read_css'>“王妃为何要让我来取名字，这恐怕于理不合吧？”南宁坐在木若涵床前，想着拒绝。<p class='chapter_content_read_css'>“南宁，我唤你南宁，便是将你当做小妹，侄儿的名字由姑姑来取又有何不可？”木若涵面色苍白，说起话来也是中气不足。<p class='chapter_content_read_css'>“王妃，这……”南宁还是犹豫。<p class='chapter_content_read_css'>木若涵伸出手握住她的右手，眉间竟是多了一丝伤感，缓缓道：“南宁，你俯下身来好不好？”<p class='chapter_content_read_css'>南宁慢慢俯下身，恰好可以让木若涵勾住她的脖子。<p class='chapter_content_read_css'>木若涵从枕下掏出一支素色木槿钗，戴在南宁发间，嘴唇贴着南宁的耳朵，轻声道：“这东西就算是我谢谢你为这孩子取名字的礼物了。”<p class='chapter_content_read_css'>她见南宁上手要取下来，故作生气道：“南宁，你若再推脱，可真要伤我心了。”<p class='chapter_content_read_css'>南宁站起身来，仔仔细细地行了躬礼：“多谢王妃，我定会为他取个好名字的。”<p class='chapter_content_read_css'>“那好，就麻烦你了。”木若涵心情终于放松下来。<p class='chapter_content_read_css'>“叶落归根为故乡，就唤为叶如何？”南宁仔细一想，王妃自是希望他回到顾王身边，若是称为“故乡之处”也应当不错。<p class='chapter_content_read_css'>“顾叶，好，就唤为顾叶。”木若涵闭闭眼，果真想到她心中去了，叶落归根为故乡，王爷也会喜欢这个名字吧。<p class='chapter_content_read_css'>“那王妃，交易之事要何时开始？”早已过临盆之期，木若涵的身体也快支撑不住了，也不能如此耽搁下去了。<p class='chapter_content_read_css'>“那就，今晚戌时初吧。”木若涵淡淡道，书绘音早已告知她了，这次交易要付出的代价，但既便是如此，她也想知道，那几日，到底是怎么回事，到底是什么原因让顾白如此的想要杀掉这个孩子。<p class='chapter_content_read_css'>到了晚间，南宁便抱着九世转魂书，仔细查看其中法咒，那取珠用的法咒她也只在夏曼身上用过一次，又有很多日子没再查看，也记得不是很清楚，若是出了什么差错，那可就完了。等背的滚瓜烂熟，南宁躲开下人，潜到木若涵房中，这种事最怕有人打搅。南宁便在房间外布下阵法，才安心进去。<p class='chapter_content_read_css'>“王妃，我来了。”南宁意外地发现木若涵竟穿了一身素白，绾了个普通的妇人鬓，坐在床边，面色还有些红润。是回光返照了吗？南宁合上门，走到她面前，将不捧书的手放在她额前，“要开始了。”<p class='chapter_content_read_css'>忽然一阵强风从南宁耳边划过，伴随着什么东西破裂的声音，但房间中并没什么东西损毁，窗户被打开，书绘音撑窗跃进来，“秦南宁，有人在监听这个屋子，你都没发觉吗？”<p class='chapter_content_read_css'>“监听？”一滴冷汗从南宁额间滑落。<p class='chapter_content_read_css'>与此同时，另一边的房间中。<p class='chapter_content_read_css'>“公子，你没事吧？”衣蓝听到内室中传来瓷器炸裂的声音，心中感到不妙，连忙迎进去。<p class='chapter_content_read_css'>“是传音术被破了。”南宫宁雪额间冷汗直冒，不知是什么东西突然击碎了传音瓶，还刺伤了自己的手腕，那东西上面似乎还淬了毒，无论施什么法子都止不住血，血中还混着点点荧光。<p class='chapter_content_read_css'>“公子，快些将这药吃了吧，”衣蓝从医箱暗格里掏出一粒丹药，“还是君师父有先见之明，让公子带上这丹药。”<p class='chapter_content_read_css'>南宫宁雪抬手想取丹药，整个身体都陷入僵硬，一动不能都动，身体又猛然像刀割似的疼痛难忍，只能倒在床上，咬紧牙关忍耐。衣蓝见他无法自行吃药，拾起桌上的一个小茶壶，一掂有水，立刻将丹药投入壶中融化，扶起他半个身子，将药水灌给他。<p class='chapter_content_read_css'>将药水灌完，过了有一刻钟之久才好转起来，许是药的副作用大，南宫宁雪昏昏沉沉的睡着了，衣蓝脱掉他的外衣，收拾好被褥血迹才要退出去，被南宫宁雪一把抓住了袖角。<p class='chapter_content_read_css'>“娘……”他迷迷糊糊低喃一声。<p class='chapter_content_read_css'>衣蓝叹口气，一把将他的手扯下放回被子中，“公子。”<p class='chapter_content_read_css'>公子，你不是可以再依赖娘亲的孩子了，必须要狠下心来，否则，会被大公子那边的人吃的连骨头都不剩吧。虽然他也想让公子过的快乐些，但终归还是不现实的。<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>“监听？”南宁一惊，她确实是什么也没发觉到。<p class='chapter_content_read_css'>“还有这法阵，秦南宁，这一个多月下来，你倒真安心做个米虫了，法术不仅没长进倒还丢了个七八分，这法阵，也就只能挡住个普通人吧。”书绘音毫不留情的奚落她。<p class='chapter_content_read_css'>本来就是为了挡普通人的……南宁在心中反驳道。<p class='chapter_content_read_css'>“算了，你快些施法吧，希望这混饭吃的东西没丢。”几日不见，南宁觉得他的毒舌症好像更严重了，唉，毒舌不是病，病起来无药可医。<p class='chapter_content_read_css'>“你……”南宁为难的看向他。<p class='chapter_content_read_css'>“怎么，我在这儿你就不能施法吗？”书绘音冷冷的盯着她。<p class='chapter_content_read_css'>“好，”南宁忽然摆出官方的笑容，将手重新放到木若涵额前，轻启朱唇，法咒便顺畅而出，盈满整个屋子，一道强光从书中射出，缓缓将三人环住。<p class='chapter_content_read_css'>不过须臾之间，南宁就脚尖一重落了地，书绘音紧随其后，他看看周围，缓缓道：“这里应当就是顾王府了，木若涵的意识应该已经融入记忆中了。”<p class='chapter_content_read_css'>南宁点点头。<p class='chapter_content_read_css'>“其实，那夜顾家死的是九十九口人，而并非百口。”书绘音猛然说了一句不相关的话，南宁这才想起来，那夜应当是顾王府起火的那夜吧，不过提及此事是为何？<p class='chapter_content_read_css'>“走吧，算算这时辰，太子应当该到了。”书绘音径直向前走，让南宁跟在他身后，若是迷路可就误事了。<p class='chapter_content_read_css'>太子，宫雪，是他么……南宁心中一顿，若真是他又该如何？<p class='chapter_content_read_css'>“不必计较这么多，你与他毕竟相识不久，不是么？”书绘音总是能看透她的心思，“就算是他又如何，你来到这里，可与他无关。”<p class='chapter_content_read_css'>“嗯。”南宁点点头，紧跟于他。<p class='chapter_content_read_css'>拐了好几个弯，便到了宴客厅，巨大的盆栽挡住南宁的视线，竖起耳朵可以听见从厅里传来的清清楚楚的乐声，还有男子的谈笑声，心跳不禁加快，再走几步，主席上一身白衣的男子首先映入眼中，眼中带着无人能及的澄澈，忽而又混沌下来。<p class='chapter_content_read_css'>再侧头便可以瞧见客席上的太子宫雪，一袭次于玄色天子服的深色衣袍，头顶翡翠玄玉冠，再下一点儿，便可以瞧见面容……<p class='chapter_content_read_css'>你是谁……<p class='chapter_content_read_css'>啊——<p class='chapter_content_read_css'>面具……<p class='chapter_content_read_css'>南宁心跳猛一顿，咬牙切齿道：“混蛋，他怎么戴着面具啊！”这样怎么可以认出来是谁啊！<p class='chapter_content_read_css'>书绘音直勾勾的盯着宫雪，似是要将他的面具看穿。<p class='chapter_content_read_css'>宫雪自幼就有一个癖好，那便是无论见何人都要带着面具，就算偶尔上朝也不例外，这事人人都知，只是南宁没有提前打听罢了。<p class='chapter_content_read_css'>银色面具只是遮住面部的上半部，却也是认人最重要的部分，只留下一张薄唇，嘴角弯弯，几分威严，几分疏远，几分轻佻。<p class='chapter_content_read_css'>南宁见见不到他的面容，也撤了一口气，专心致志地听他们谈话。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351931&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351931&&novelId=15670'">下一章</div>
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
