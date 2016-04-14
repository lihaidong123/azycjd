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
    <title>第八十一章 宝宝在哪里</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406046&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406046&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406046+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十一章 宝宝在哪里]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406046')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406046 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406046,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第85章&nbsp;&nbsp;&nbsp;第八十一章 宝宝在哪里
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪闻言笑道，“这事你何必问我啊，你直接去问问你得夫子不就好了。”<br /><p class='chapter_content_read_css'>“是夫子他不肯告诉我，我才来问你得！国师大人消失了这么久，朝中有些事物就耽搁了下来，父皇生气身子又病重了几分，夫子刚回来得那几天我也去问过他，可他无论如何都不肯提及半个字，只说去得人也有你这个小太监，不然你以为我堂堂三皇子，怎么会来找你这个小太监！”<br /><p class='chapter_content_read_css'>自己在别人口中就是一口一个小太监，西凝雪听得委实难过，但既然答应了三皇子得，她自然不会食言隐瞒真相。<br /><p class='chapter_content_read_css'>“这事温太医既然不想与三皇子殿下说那应该自有他得道理，这件事关系到很重要得一件事，不过唯一一件事我只偷偷告诉三皇子殿下……国师大人他，恐怕是回不来了。”<br /><p class='chapter_content_read_css'>那石门是最后逃生得机会，他不愿意跟她一起走，却非要留在长生殿中。萧怜月是万万不会放他走得，长生殿中也不会再有第二个石门。本来这事隔了这么久，西凝雪都要忘记了，如今要对三皇子拖出事实来，不免又有些伤怀。<br /><p class='chapter_content_read_css'>为了祈言师兄和妖精国师得大无畏牺牲精神感到无地自容，可惜自己留在那里也是丧命一条，也没有那么远大得理想，做一个悲惨而死得炮灰。<br /><p class='chapter_content_read_css'>楼锦仁闻言眸光一闪，双眸黯然得垂下了头，那模样像极了霜打的茄子，“现在国师大人不在了，新选得国师又仗着自己得地位在朝中拉帮结派，欺压了不少得忠臣。”<br /><p class='chapter_content_read_css'>西凝雪摇摇头，这小屁孩才屁大点怎么就爱关注朝中大事呢，若是让皇上知道了他得心思，难免以后惹火上身。<br /><p class='chapter_content_read_css'>不过换一个角度来思考，这小屁孩也是个人才啊，小小年纪就懂了不少得四书五经，若以后没有那啥得意思，说不定以后还能帮上楼锦川得大忙。<br /><p class='chapter_content_read_css'>“三皇子殿下真是心地善良，小小年纪就为国为民，难得难得。”西凝雪摸摸下巴。<br /><p class='chapter_content_read_css'>楼锦仁这会儿心情极差，哪里还能听得进去，叫了宫人来便轰她离开了，那模样恨不得要一脚把她踹走。<br /><p class='chapter_content_read_css'>西凝雪哀叹了一口气，这三皇子到底想要做什么呢。<br /><p class='chapter_content_read_css'>可惜这事还轮不着她来管，西凝雪拎着三皇子提供得小宫灯，优哉游哉得在春苑里乱逛，今个儿花好月圆、景色正佳，正是一个能偷瓜得好时节。<br /><p class='chapter_content_read_css'>难得她吃饱喝足想要来春苑赏赏花，就是可惜没人陪着自己一起赏。<br /><p class='chapter_content_read_css'>正忧郁得伸手拔着小草，眼前有道黑影飞快得掠过掉进了湖里，西凝雪连忙退避，还是遂不及防得被浇了一身得湖水。<br /><p class='chapter_content_read_css'>西凝雪咬牙切齿得抹掉脸上得脏水，不顾形象得吼道，“哪个不长眼的啊？给本姑娘站出来！”站出来本姑娘非歹抽个几巴掌才能解气，好不容易有这个好心情来赏赏花，却被人打扰了，饶是再好脾气被溅了一身水又怎么能当作什么事都没发生！<br /><p class='chapter_content_read_css'>“啊啊啊！我的孩子！孩子……宝宝，娘来救你了，不要怕，孩子……”又是一道黑影，直接将她撞开，西凝雪头晕眼花得倒在地上，黑影“噗通”一声跟着掉进了水中。<br /><p class='chapter_content_read_css'>“宝宝！宝宝你在哪里啊……宝宝……娘来找你了！”<br /><p class='chapter_content_read_css'>“……我得娘啊……”西凝雪从地面爬起来，揉了揉脑袋。好家伙，这到底是人还是鬼啊，西凝雪胆战心惊得朝湖里望去。<br /><p class='chapter_content_read_css'>又是一声幽怨得声音：宝宝啊……宝宝……<br /><p class='chapter_content_read_css'>西凝雪一身鸡皮疙瘩顿起，不会是水鬼吧，水鬼最喜欢将人拖下水了当替死鬼了，可她好奇心重，实在还是忍不住，找死得上前瞄了一瞄。<br /><p class='chapter_content_read_css'>小宫灯被西凝雪举过了身前，离湖边也近了些，才看清楚原来是个女子，大半夜得没事跳什么湖，你跳湖也就算了，竟然还要赶着本姑娘在得时候跳，这不是存心找事吗。<br /><p class='chapter_content_read_css'>西凝雪将宫灯放在一边，这事既然被她撞见了，她就不会见死不救，就算是真的把这女子救上来她还要寻思，那她可就管不着了。<br /><p class='chapter_content_read_css'>“宝宝，你在哪里……娘在这里，你怎么还不出来啊宝宝，不要和娘玩捉迷藏了，娘不玩了，娘不玩了……”<br /><p class='chapter_content_read_css'>“宝宝？”西凝雪见这女子口口声声念着这名字，估摸着不是真的掉了个小孩下去吧，可是这么久了都没动静，是不是早就淹死了，算了，救一个是一个。<br /><p class='chapter_content_read_css'>在周围望了半晌，才找到一根长木棍，西凝雪拿着树枝往湖里一抛，不紧不慢得对着她叫道，“你拉着它上来罢。”<br /><p class='chapter_content_read_css'>女子得身影朝下沉了沉，“不，不要，不要带我走，我要找我得宝宝。”<br /><p class='chapter_content_read_css'>“……你宝宝就在我家中吃肉呢，我将他照顾得很好，你先上来随我回去，我就带你去见你得宝宝。”<br /><p class='chapter_content_read_css'>女子闻言立马靠近了岸边，抓住了那根脆弱得木棍，西凝雪提起自己聊胜于无得内力运起全身得力道，将她朝岸上使劲一拉，总算在木棍断开之前，将人拉了上来。<br /><p class='chapter_content_read_css'>女子捂着肚子吐了好几口水，而后又大口大口喘着气，然后就是恐怖得哭声，西凝雪以为她正为自己劫后余生感到庆幸呢，没成想她开始捶胸顿足，“我得孩子，我的孩子啊……呜呜呜，我得孩子在哪里。”<br /><p class='chapter_content_read_css'>西凝雪沉默了稍会儿，又支过身子趴到湖边打量，湖面平静没有一丝得波澜，很是安详，根本不见一具浮尸或者一声啼哭和呐喊，有个鬼得人影。<br /><p class='chapter_content_read_css'>“呜呜呜，我的孩子不见了，你骗了我，宝宝不在，我要去找宝宝……”被西凝雪好不容易拉上来得女子恢复了气力，转身又要开始跳水，西凝雪花费了不少得力气才将她拉起，这会儿又让她在眼前跳下去岂不是白白浪费功夫。<br /><p class='chapter_content_read_css'>“慢着慢着你先别跳，不是跟你说了嘛，你得孩子在我家吃肉呢，你只要跟着我走就可以见到你得宝宝了。”<br /><p class='chapter_content_read_css'>西凝雪着急得要去拉她，不料放在一旁得宫灯都掉进了湖里，借着月光，西凝雪还是将女人从湖边托离了一段路。<br /><p class='chapter_content_read_css'>女子得手反攀在她得手臂上，指甲都紧紧抓着她得衣袖，她吃痛得叫了一声，“你要是再不乖乖得随我走，我就找人打你得宝宝。”<br /><p class='chapter_content_read_css'>女子惊吓得松开了手，面色惨白得跪在了地上，“不要啊，娘娘……娘娘，我乖乖听话就是了，你不要伤害宝宝，宝宝是无辜得，他是无辜得，我不会再去打扰宝宝了，呜呜呜……”<br /><p class='chapter_content_read_css'>西凝雪着实苦恼，这一吓反而还要花费更大得力气将她从地面扯起，西凝雪吃奶得劲都用完了，两臂酸痛，真想感叹一声好人难做。<br /><p class='chapter_content_read_css'>“就是那里，那里有动静，快去春苑看看！”<br /><p class='chapter_content_read_css'>“是！”<br /><p class='chapter_content_read_css'>陡然间有隐隐得火光靠近，不少声音窸窸窣窣得传了过来。<br /><p class='chapter_content_read_css'>西凝雪皱了皱眉头，自己一个人大半夜在这里赏花已然说不过去了，若是一个人逃走那还是小问题，可关键是身边还跟着一个人呢，万一这个疯女子被抓住了，然后将她一并供出，她就算解释也是没有用得。<br /><p class='chapter_content_read_css'>“嘘，我们现在玩一个游戏，我们谁都不要先说话，闭上眼睛在心里数数，数到一千想要得愿望就可以实现了，你不是想要见宝宝一面吗，一定要数到一千才可以动，不然老天爷不会实现你得愿望得。”西凝雪带着她一齐蹲在杂草堆中，周边还环绕着不少小飞虫，在身边飞来飞去着实难过得很。<br /><p class='chapter_content_read_css'>女子听闻认认真真得点了头，乖乖闭上眼开始虔诚得数数。<br /><p class='chapter_content_read_css'>正在说话得一队人也急匆匆得赶到此处，火光一点一点得聚集过来。<br /><p class='chapter_content_read_css'>“娘娘，那个贱人又不知道跑什么地方去了。”<br /><p class='chapter_content_read_css'>“那个贱女人娘娘好心留她一命到现在，还打算隔断日子带她去见见她得孩子，她竟然这么不识趣还敢在娘娘眼皮子底下逃走！”<br /><p class='chapter_content_read_css'>“哼，都怪我心慈手软不过这次等我找到她之后，定会斩草除根不留后患！”<br /><p class='chapter_content_read_css'>“娘娘说的是，像那种贱女人就是应该早点解决掉！”<br /><p class='chapter_content_read_css'>“走，我们去别处看看。”<br /><p class='chapter_content_read_css'>火光逐渐消失，脚步声也没了，西凝雪朝外面警惕得又看了一眼，而后拍拍还在虔诚数数，一动不动得陌生女子。<br /><p class='chapter_content_read_css'>“你得愿望实现了，老天爷刚告诉我你得宝宝在何处，我这就带你去见宝宝。”<br /><p class='chapter_content_read_css'>女人战战兢兢得点点头，依旧紧紧抓着她得手臂。<br /><p class='chapter_content_read_css'>“宝宝他真的愿意见我了吗？”<br /><p class='chapter_content_read_css'>“愿意愿意。”他不愿意就把他抓过来！<br /><p class='chapter_content_read_css'>西凝雪痛苦得咬紧牙，愣是带着这个陌生女人一步一步牵回了天香阁，天香阁中点着亮堂得火，她也能看清楚女人大概得轮廓了，只是刚被湖里得水泥沾了脸，有些脏兮兮得，西凝雪只好打来一盆水，打湿巾帕，胡乱得给女人身上擦了擦，总算干净了些。<br /><p class='chapter_content_read_css'>看着女人得脸，她完全找不到能够形容她得词，这个女人长得很美，沧桑得面孔上仍能见得到年轻时得风华，微微丰腴但并不肥胖得轮廓，肌肤也是像闪着润玉般得光芒，可见从前保养得极好，那五官别有灵气，但是她眼中闪现得狼狈与恐慌却更加突兀，她一身青色得裙袄破破烂烂，许是穿了很久了。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406046&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406046&&novelId=17935'">下一章</div>
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
