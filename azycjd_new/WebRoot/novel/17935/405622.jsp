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
    <title>第十章 本宫也耳背</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405622&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405622&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405622+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第十章 本宫也耳背]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405622')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405622 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405622,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第14章&nbsp;&nbsp;&nbsp;第十章 本宫也耳背
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪内心一阵狂雷闪电闪过，但强制压抑下来，面上仍是沉静如水的冷静。心中还在飞快得想着自己眼睛没瞎吧，居然能在宫里看见楼小二，难不成这人是楼小二的亲兄弟什么得？<br /><p class='chapter_content_read_css'>西凝雪吃惊的咽了咽口水，盯着他的脸不说话。<br /><p class='chapter_content_read_css'>楼锦川坐在床前，黑眸中散着白玉般的光芒，整个人融在暖光中，嘴角淡淡的笑意，他不开口，西凝雪也不开口。<br /><p class='chapter_content_read_css'>然后西凝雪苦巴巴的皱眉，思索着该如何解释一下自己为何这副狼狈样出现在他的面前，当然很快就想出了对策，便尽量装出了可怜的样子。<br /><p class='chapter_content_read_css'>“二哥，我被奸人暗算实属不易才逃至此，二哥你救救我吧，我宁小肆当牛做马也会回报你的！”<br /><p class='chapter_content_read_css'>现在当务之急疗伤和保命才是最为重要，她对楼小二的身份一无所知，就算真的是认错了人，但这人对她没有恶意，她当即则断的掩盖事实，保住自己小命才是正道，如果他不愿意揽下她这个麻烦，她也不介意略施小手段宣扬一下伏婳姐姐和他情投意合什么的，以此来攀上关系搭上桥梁。<br /><p class='chapter_content_read_css'>当然楼小二还是很识趣的给她把大夫请来了，大夫左看一眼右看一眼，然后拿出一瓶药，一副胸有成竹的模样道，“公子恐怕是伤着筋骨了，老夫这里有一瓶特别调制的精油，只要用这精油配合推拿便可止痛，老夫再开一方内服的药，不出一日，绝对能治好公子的伤骨，不过内里并不会痊愈还需要时日来修养。”<br /><p class='chapter_content_read_css'>西凝雪暗自庆幸，原来自己并不是摔残了，还有得救，她驰骋天下的大侠梦也不会覆灭了。<br /><p class='chapter_content_read_css'>转眼间，楼锦川的大手袭来，西凝雪吓得赶紧护胸，大惊小怪的叫道，“你你你，你要做什么啊二哥！”<br /><p class='chapter_content_read_css'>“不脱衣服我怎么给你推拿抹精油？”楼锦川一副玩味的加深了嘴角的笑意，该怎么说呢，一定是不怀好意的笑。<br /><p class='chapter_content_read_css'>西凝雪摸了摸嘴角，心中一片不爽的往床头一缩，“二哥，我觉得吧，这推拿还是要找个美人儿来做，毕竟美人儿对我来说，那绝对是眼见着就能痊愈的功效，二哥你觉得如何。”言下之意就是说，你这个五大三粗的大老爷们就免了吧，她还没有想到自己找死的地步，光是想想他刚才将她压着在地的劲，就寒了一身的冷颤一下。<br /><p class='chapter_content_read_css'>“哦？美人儿？”楼锦川凑近，眼中闪着忽明忽暗的眸光，那副口吻分明就是在嘲笑再加点不可磨灭的威胁气息，“你我都是男子，有什么好害羞的，嗯？”<br /><p class='chapter_content_read_css'>随着他语毕处的那单字的上扬音度，西凝雪原本就苍白的面容就更加苍白了，万一被楼锦川戳穿了身份，他发现自己是个女子，一定会觉得她欺骗了他，从而一气之下把她交到大理寺，从此受尽折磨！<br /><p class='chapter_content_read_css'>深呼吸一口气，咬着牙把衣服一掀，露出光滑细腻的背肌，楼锦川笑容越加轻柔却淡淡忧愁。<br /><p class='chapter_content_read_css'>“肆弟，你何必一副要上断头台的模样，是二哥难为你了吗？”楼锦川从她手中接过药瓶，倒在手中抹匀，然后轻轻覆在了她的腰上。<br /><p class='chapter_content_read_css'>一阵鸡皮疙瘩狂起，虽说他暖声暖语的，不免还是让她浑身恶寒的抖了抖身体。<br /><p class='chapter_content_read_css'>“二哥救我一命，怎么算的是难为我呢。”咬牙，忍！咱西凝雪大侠能文能武也能屈能伸，什么忍不了的？！<br /><p class='chapter_content_read_css'>楼锦川深深地望了她一眼，旋即洒然一笑，“是么，肆弟果真是让我意料不到的有趣。”他突然俯下身，伸出舌头撩拨了一下西凝雪的耳根，笑容十足的邪气。<br /><p class='chapter_content_read_css'>西凝雪惊慌的“啊”了一声，然后提起手肘往后一撞，楼锦川毫无防备的歪向一边，西凝雪趁机套上衣服，然后跨坐在他的身上，居高临下的伸手掐住他的双耳，然后狠狠往外拉扯。<br /><p class='chapter_content_read_css'>“反了你还，活腻歪了敢动本姑……呸，本公子这就给你点颜色看看，让你这个不知天高地厚的家……”<br /><p class='chapter_content_read_css'>“太子殿下，方子开好了。”遂不及防的房门被外来人打开了。<br /><p class='chapter_content_read_css'>西凝雪反应迟钝的看了一眼被自己骑着的人，然后又看看那个站在门口的太监，然后才考虑太监说的话是什么意思，她的身份是出逃的秀女，而且还是个实实在在的女子当然不是太子，那么这个太监叫的太子殿下应该就是……<br /><p class='chapter_content_read_css'>“等等，你刚才叫他什么？！”西凝雪打死也不承认的非要问一遍。<br /><p class='chapter_content_read_css'>“大胆，你胆敢如此对待太子殿下，你该当何罪！”小太监风风火火的赶过来，脸色惊恐的似要把西凝雪拉起来大卸八块再满门抄斩。<br /><p class='chapter_content_read_css'>这下总算能解释清楚，他为什么会穿着华贵的衣袍和佩戴着如此精致细腻的龙纹玉佩。<br /><p class='chapter_content_read_css'>西凝雪知道真相后更是吓的直接从楼锦川身上滚下去，不顾全身疼痛的跪在了他的面前，两手挡在了紧咬的牙前，眼睛紧闭道，“无意冒犯了太子殿下，小的真是该死，有眼不识泰山！”<br /><p class='chapter_content_read_css'>“你可真有胆子。”楼锦川躺在床上侧过身子，手掌有意无意的拂过已经通红得耳廓，神情那叫一个危险，像似在看一只被自己盯上的猎物一样，冒着寒光的眸子直勾勾的盯着她。<br /><p class='chapter_content_read_css'>有胆子是没错，但要知道他的身份，给她无数个胆子她也不愿意去招惹这个人啊，趁着他未开口她才开始慌忙的回想，从一开始见到楼小二，他并没有表露自己的身份，可算是民间暗访扮了一位贵公子来到了长子城，但是长子城明明那么多人，结果就她好死不死的就碰上了他，然后又好死不死的给了他那么多脸色看，再加上刚才把他骑在身下又掐又拉的狂扯他耳朵……<br /><p class='chapter_content_read_css'>西凝雪忍不住哆嗦了一下身体，眸底的恐惧凝聚，但仍然壮着胆子叫道，“横竖都是死，楼小二我败在你手里我无怨无悔，你想怎么样就怎么样吧！”说罢，摆着一副武林中人大义凛然的受死表情。<br /><p class='chapter_content_read_css'>“本宫可不想便宜了你，让你就这么简单的死了。”楼锦川看到她简直要扑倒在地上磕头的神态，强忍住想要笑出的冲动，别有意味的笑道，“死罪可免活罪难逃，本宫就格外开恩，罚你把身子养好，养不好就拉出去斩了。”<br /><p class='chapter_content_read_css'>西凝雪得第一个反应就是：我耳朵又出问题了？<br /><p class='chapter_content_read_css'>西凝雪迟疑半天，才敢抬起头看他一眼，然后又连忙低头询问道，“太子殿下，麻烦您再重复一遍成吗，小的耳背，方才没清楚太子殿下的话。”<br /><p class='chapter_content_read_css'>楼锦川挑了一下眉，有些意外的看了她半晌，神色颇为复杂，“什么？本宫也耳背，你再说一遍。”<br /><p class='chapter_content_read_css'>……这个混账太子，觉得欺负她好玩是吧，西凝雪在心中织了一千万个布娃娃诅咒楼锦川耳朵真的聋掉，但事实上是西凝雪脸上堆满了一种叫笑容的东西，然后眉开眼笑道，“我这就听太子殿下的吩咐去养好身子……”不管他现在是如何想的，只要没有波及到她的性命，她凡事都可以听之任之。<br /><p class='chapter_content_read_css'>西凝雪一边讪讪的笑，一边朝屋外走去，楼锦川剑眉一挑，淡淡的开口道，“站住。”<br /><p class='chapter_content_read_css'>“太子还有何要吩咐的？”西凝雪笑的肌肉都要僵硬了，她很想要拍拍脸缓解一下，但是还是忍住了。像这种时候她自然遵守自己的宗旨：惹不起我就躲，你奈我何。<br /><p class='chapter_content_read_css'>“你就在这休息，有什么事本宫也好亲自照料着。”<br /><p class='chapter_content_read_css'>就在这？西凝雪呲牙咧嘴的皱起眉头，然后凝神屏气的微笑道，“太子殿下，男男授受不亲，我在这里……不方便。”<br /><p class='chapter_content_read_css'>“有这个理吗？”楼锦川径直的从床榻走下，直到她身前，才敛起笑意，西凝雪得心头忽然闪过不妙得感觉，但还是由着楼锦川动作缓慢的撩起她的发冠，然后一点一点拉下，青丝散乱的垂落在他的指间，他却如释负重的露出了一种惊喜的神情。<br /><p class='chapter_content_read_css'>西凝雪顾不得开罪他，只觉暧昧的连忙撤开步子退了几步。<br /><p class='chapter_content_read_css'>楼锦川毫不恼怒的又走近凑到她耳旁，凝望着她的黑眸深不见底，但嘴角带着似笑非笑的意味，他只稍稍打量她有些怒气的面容，又联想到那个喜欢躲避着人，完全不考虑后果肆意而为肆意开口的宁小肆，不由得更加好笑的绽开如花似的笑颜道，“女扮男装的欺瞒之罪，你难道不该向本宫解释一下？”<br /><p class='chapter_content_read_css'>这一下被拆穿是她始料未及得，但是她也并不是存心欺瞒他的啊，先前是他自己要贴上来，她只好用了宁小肆这个身份，而这次皇宫相遇，那就更是迫不得已穿了男装，偏偏这两次都是无心插柳柳成荫的撞见了他，这时他倒拿着这个把柄开说了。<br /><p class='chapter_content_read_css'>西凝雪就知道他压根不打算放过自己，这个阴险狡诈的小人……西凝雪也懒得问他为何发现自己是女扮男装的，继续破罐子破摔的打开了他的手。<br /><p class='chapter_content_read_css'>“我能解释什么，太子殿下既然已经知晓一切，那么你要杀要剐请便，我宁小肆绝不会皱一下眉头得！”<br /><p class='chapter_content_read_css'>大难临头，她仍没有忘记自己深刻记下来的对句，就在一本叫《好汉出山》的小人书中第三十四回的经典对话。<br /><p class='chapter_content_read_css'>当时她可没少为这本书热血一把，现在生死关头，她自然也要豪气万丈的把自己梦寐以求的台词放出口，不然等死之后她要说给谁听去。<br /><p class='chapter_content_read_css'>哪知楼锦川不怒反笑，搂过她的腰就往床上带，西凝雪没来得及挣扎，整个人就埋向了软床中。<br /><p class='chapter_content_read_css'>“小肆，你可要记住，你现在可是戴罪之身，乖乖养好身体，之后的事之后再说……还有，既然小肆如此喜欢美人儿，本宫这就许一回成人之美给你找个美人儿来。”<br /><p class='chapter_content_read_css'>西凝雪老脸一红，不吭声的又把脸深深的埋进被褥中，不多时身后果然换了个美貌的丫鬟，动作无比轻柔婉转的给她褪下衣裳，滑嫩的小手规规矩矩的在她背上慢慢推拿捻磨着。<br /><p class='chapter_content_read_css'>西凝雪舒服的哼哼几声，就快要沉浸在那温柔的手法中，丫鬟突兀收了手就往旁边一站，面色恭敬的说道，“宁姑娘，太子殿下嘱咐奴婢转告您，宁姑娘下次可记得别再熏这么重的香了。”<br /><p class='chapter_content_read_css'>西凝雪这下算是气的要吐血三升郁结而亡了，没想到自己被熏了那么久的千步香，竟然还是没有散去，不过经过前段时间有臭鸡蛋的洗礼之后，算是被压着淡了许多，穿着衣裳也没有散出半点香味来。<br /><p class='chapter_content_read_css'>但方才她没有顾忌到这点，掀了衣就让他上药，再加上他与自己凑的那么近，怎么说都会闻着点味出来，而男子与女子能用的香种都是不同的，所以楼锦川才察觉出她是女儿身的真相，苍天啊！！！<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405622&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405622&&novelId=17935'">下一章</div>
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
