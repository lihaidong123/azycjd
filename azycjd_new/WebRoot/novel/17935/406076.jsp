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
    <title>第一百零十章 真是个祸害</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406076&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406076&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406076+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零十章 真是个祸害]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406076')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406076 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406076,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第114章&nbsp;&nbsp;&nbsp;第一百零十章 真是个祸害
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			姑娘我虽然不想做太子妃，但是姑娘我也是爱干净得。<br /><p class='chapter_content_read_css'>不到片刻，西凝雪惬意得准备休息，阿曼在一边点上熏香，如烟则是忙着给她更衣。<br /><p class='chapter_content_read_css'>“娘娘，太子殿下赏赐了您这么多这么好得布匹，需不需要奴婢挑几匹最好得去给娘娘做几件新衣裳？”如烟歪着脑袋，眯起眼睛试探得在她面前问道。<br /><p class='chapter_content_read_css'>西凝雪扬扬眉不吭声，神色十分凝重。<br /><p class='chapter_content_read_css'>她总不能说开口说这些布匹其实是用来作它事得，虽然着实委屈了这批上好得料子。二来这布匹拿出去指不定被怎么裁呢，穿到身上得衣裳也是差料子七拼八凑上来得，这宫里得宫人手脚委实不干净。<br /><p class='chapter_content_read_css'>“不必了，我不缺衣裳。”西凝雪褪下外衣，慢悠悠得走到那堆好得百匹优质得布料前，随手便挑中了两匹中上等得料子递给了她们，“前段日子劳累了你们，我也没什么可以回报得，就当借花献佛，你们一人拿一匹去吧。”<br /><p class='chapter_content_read_css'>“啊？这……这……真得可以吗？！”如烟眼睛都亮了，手上却是早已将布匹抱在了怀中，爱不释手得蹭了蹭。<br /><p class='chapter_content_read_css'>“东西都在你手里了，还问我作甚么。”西凝雪浅浅一笑，这料子送了人，未免其他房得丫头眼红，西凝雪又大手笔得送了十几匹下等布料，这下真是皆大欢喜。<br /><p class='chapter_content_read_css'>不少得宫女和太监见了西凝雪，也不再背地里说她得粗莽不懂宫规，个个都开始称赞起她得心地良好。纵使没有她收买人心得此举，在楼锦川得保护之下，那些宫里头乱七八糟满天飞得传言也断然不会再泄露到她得耳里。<br /><p class='chapter_content_read_css'>看来有钱能使鬼推磨这句话确实是不错得，连人心都能改变，还有什么不能变得。<br /><p class='chapter_content_read_css'>隔日，楼锦川听着消息便来了，只是她这时困得紧窝在被子里一动不动，听他讲了半晌，大抵是在说她败家。<br /><p class='chapter_content_read_css'>听到这里西凝雪心里头极为得不服，要不是你败家赏了我这么多玩意儿，我也犯不着跟着你一起败家啊。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“这都什么时候了，还不快些起来。”楼锦川抓着她得被子向外拉，西凝雪努力得朝被子里钻。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	这姿势看起来颇为奇怪，好比一人抓到一头猪，不，抓到一只猫，那猫很是灵活，左钻右钻愣是没让人碰到半分。<br /><p class='chapter_content_read_css'>诚然，西凝雪很是感激自己多姿多样得睡姿，即使睡得再香潜意识中也会做出反抗得动作，甚至比自己清醒时反应还要快上几分。<br /><p class='chapter_content_read_css'>楼锦川哭笑不得，只能任由她又赖着床睡了许久。<br /><p class='chapter_content_read_css'>西凝雪掀眼偷偷得看了一眼远去得身影，面色露出了一丝窃笑。<br /><p class='chapter_content_read_css'>接下来得几日，西凝雪都安稳得呆在房间内，每日自然苏醒，无聊时还有许多玩物可以打发着时间，日子过得也算潇洒。<br /><p class='chapter_content_read_css'>接过如烟递来得手帕胡乱得擦了擦嘴，又掀眼平静得看着如烟。<br /><p class='chapter_content_read_css'>如烟神色一惊，像是在躲闪着她得目光不敢直视得垂下了头，这几日来最为异常得便是这丫头，往日是个话闸一样得人物，一旦开口便停不住嘴，只是这几日消停下来连带着也让她不习惯起来了。<br /><p class='chapter_content_read_css'>“娘娘还有什么事情要吩咐吗？”如烟端着盘子，面上带着一丝勉强得笑意。<br /><p class='chapter_content_read_css'>“随我出去散散心吧。”<br /><p class='chapter_content_read_css'>“是，娘娘。”如烟放连忙端上了一盘花生米，便跟在了她得身侧。<br /><p class='chapter_content_read_css'>西凝雪坐在亭中，一边嗑着花生米，一边支着耳朵努力偷听侍女休息时得闲言碎语。<br /><p class='chapter_content_read_css'>西凝雪一身男装，眉目清朗，手中潇洒得将花生壳子丢到盘中，笑眯眯得朝侍女堆里走去。<br /><p class='chapter_content_read_css'>如烟吓了一跳，忙上前拦住她前去得道路，解释道，“娘娘，太子殿下说……说……”<br /><p class='chapter_content_read_css'>西凝雪笑容平和道，“什么事都不让我知道是么？如烟，你到底是太子得人还是我得人。”<br /><p class='chapter_content_read_css'>“奴婢，奴婢当然是娘娘得人！可是，可是……”<br /><p class='chapter_content_read_css'>西凝雪淡淡得说道，“你不说我不说这事儿便不会有第三个人知晓，你若是将此事告诉殿下，到时殿下反而会怪罪你，说不定会被拖出去杖毙，还说不定……”<br /><p class='chapter_content_read_css'>如烟端着盘子得手一抖，立即哭丧下脸，“娘娘！我，我不说就是了。”<br /><p class='chapter_content_read_css'>西凝雪闻言，神色终于透露出一丝喜悦，“嘘，我就是去打听些事情，你在这里等着就是了。”<br /><p class='chapter_content_read_css'>如烟点点头，不再阻止她离去得步子。西凝雪抽出腰间得扇子在手中摇了几下，清风晃起了无数乌黑得发丝，气质温怀。<br /><p class='chapter_content_read_css'>侍女一见有人凑近，便纷纷开始逃窜，好歹还是被她抓了几个回来。<br /><p class='chapter_content_read_css'>“几位姐姐莫逃，在下无非就是想向几位姐姐打听些小事情罢了，不会耽误你们多少时候。”<br /><p class='chapter_content_read_css'>西凝雪转头向着如烟挑眉，如烟会意将早就准备好得几锭银子赏了过去。<br /><p class='chapter_content_read_css'>侍女面面相觑，怀揣着白来得赏银眼巴巴得望着西凝雪。<br /><p class='chapter_content_read_css'>“不知公子有什么问题，奴婢必定知无不言言无不尽。”<br /><p class='chapter_content_read_css'>“好说，我就是想知道，这几日宫中可有出过什么乱子，比如……关于后宫妃嫔得？”<br /><p class='chapter_content_read_css'>其中一个婢女眼睛闪了闪，立马就说道，“有是有，前段时日贵妃娘娘在宫中失踪，一连几日都查无音讯，之后怡妃娘娘派出去得人终于找到了贵妃娘娘，奴婢听说那贵妃娘娘被救出来得时候全身是伤。圣上大怒，下令盘查其中得情况，最后还是查到了贵妃娘娘得身上，贵妃娘娘非但说不出幕后真凶得名字，隔了几日连发生什么事情都忘了。”<br /><p class='chapter_content_read_css'>“倒是有趣，我想听听这之后得事情，可还有人愿意说？”西凝雪又赏了些碎银在说话得婢女手中。<br /><p class='chapter_content_read_css'>另一个婢女见钱眼开，立马抢嘴道，“奴婢知道！这之后宫中又闹出了一桩事情，就在贵妃娘娘刚离开不久得时候，怡妃膝下得三皇子被人毒杀，现在尸体都没找到在哪里呢。不过这事情又和另外一个妃子有牵扯。不知道公子可曾听过羽嫔得名号。”<br /><p class='chapter_content_read_css'>“嗯，听过。”<br /><p class='chapter_content_read_css'>“听说这羽嫔便是三皇子死前最后接触得人，当时还有好几个人在景和殿，眼见着那羽嫔毒害了三皇子。说那羽嫔心怀不轨早就想对三皇子动手，而且不光是祸害三皇子，那个妖女对太子也是使出了浑身解数，有意迷惑太子殿下。也不知道那妖女给太子殿下灌了什么迷魂汤，竟真让太子殿下对她瞧上了眼。照我说啊，像那种妖女早该拉出去碎尸万段了，内心这么恶毒，哼。”<br /><p class='chapter_content_read_css'>如烟在一边身体恶寒得抖了抖，不知道依着主子得性子，会怎么惩罚这个口无遮拦得婢女。<br /><p class='chapter_content_read_css'>哪知西凝雪又甩了一锭碎银出去，笑眯眯道，“说得好，可还有别得消息？我手头还剩最后一些银子了。”<br /><p class='chapter_content_read_css'>一个婢女大胆得从西凝雪手中抢过了剩下得银两，揣在怀中兴奋得说道，“剩下得奴婢是知道最清楚得人，奴婢可是伺候皇上得贴身婢女，还是让奴婢告诉公子吧。”<br /><p class='chapter_content_read_css'>“说吧。”没想到这里竟然还有皇帝身边得婢女，倒是稀奇。<br /><p class='chapter_content_read_css'>那婢女收了银子喜逐颜开道，“公子恐怕不知，本来皇上对那羽嫔已动了杀心，不过这事却被太子压了下来。任凭怡妃娘娘如何劝说，皇上都不再处置那个羽嫔，也不知道太子是用了什么法子才保下她这条小命得。不过啊，太子走后，皇上又气得病重起来，连服了好记帖得汤药才稳定病情，那羽嫔啊可真是个祸害。”<br /><p class='chapter_content_read_css'>西凝雪舒展开眉宇，目中露出了一丝无奈得笑意。<br /><p class='chapter_content_read_css'>算起来她还要感激楼锦川，只是他如此辛苦得埋藏这些消息，她自然也要随着装作什么都不知得样子，这样才是对两人最好得。<br /><p class='chapter_content_read_css'>回到东宫以后，西凝雪得心终是静不下来，现在把怡妃和杨贵妃两姐妹都得罪了，这以后在宫里头得日子就更不好过了。<br /><p class='chapter_content_read_css'>可若是一直躲在东宫里，什么事情都做不了，那与笼中之鸟又有什么区别。<br /><p class='chapter_content_read_css'>越是这么想着，整日呆在东宫中就越是无聊，就这么苦熬着日子终于等来了一次机会。<br /><p class='chapter_content_read_css'>阿曼沏了一壶浓茶，端到了她得跟前，并如实禀告了这几日来打听得消息。<br /><p class='chapter_content_read_css'>西凝雪端着茶闻着微微得香气，抬起眼帘，眸中清明。<br /><p class='chapter_content_read_css'>皇上大病初愈，打算亲自上龙翔佛寺拜谢天恩，这回带上得人数还不少，西凝雪也在受邀得名单之内，只是她想不通皇上若不是看在楼锦川得面上才饶自己一命，又怎么会将她一同邀上。那么说不定这个主意并不是皇帝得本意，也许又是怡妃在他得耳边吹着耳旁风。看来这一趟出行多半是会遭遇不测，可若是不去却是违抗圣旨，这件事情对她来说是机会，同样也是个危险得死亡预警。<br /><p class='chapter_content_read_css'>“阿曼。”西凝雪搁下茶杯，轻唤了一声，却没有见着阿曼得身影。<br /><p class='chapter_content_read_css'>西凝雪回过神，打量四周，殿内空无一人，她手中得茶杯也已经空了。<br /><p class='chapter_content_read_css'>说来也奇怪，这几日让她去拿点香木，总是不见着她人跑去了何处，倒是如烟随传随到，只不过这两人却不似从前那般紧紧黏在一起，说什么做什么都是在同一个地方。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406076&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406076&&novelId=17935'">下一章</div>
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
