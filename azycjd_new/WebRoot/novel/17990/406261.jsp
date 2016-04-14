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
    <title>第二十五章【双双清醒】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406261&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406261&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406261+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十五章【双双清醒】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406261')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406261 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406261,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第27章&nbsp;&nbsp;&nbsp;第二十五章【双双清醒】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 夜幕在众人或忐忑或焦急的心情中按时降临了，“墨芽阁”内的邵依依发起了高热，两个婢女不停的用毛巾帮她擦拭用来达到降温的目的。一直到后半夜，邵依依额头的温度才降了下去，而两个婢女一个在地上打起了地铺，一个就趴在邵依依的床沿边上眼睛也不眨的盯着床上的邵依依，生怕她的高热反复发作。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影睡了一觉醒来发现灯影还坐在那里，就起身走到灯影身边轻轻拍了拍她的肩膀，“灯影姐姐，你去休息吧，我来守着小姐！”灯影胆子本来就不大，这夜深人静的被拍了一下，自个先被吓了一跳，直到听到画影的声音才深呼一口气拍了拍自己的心口，而后才转过头来，有些怕怕的小声道，“吓死我了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “对不起灯影姐姐，我不是故意的！”画影急忙道歉，垂首的样子让灯影也不忍过多的责备。灯影转过身伸手附上邵依依的额头，并未有反复的迹象，这才揉了揉有些酸涩的眼睛，“那我躺躺，时刻注意小姐的体温，若是再发高热，一定要喊醒我！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “姐姐放心！”画影做了个保证的样子，灯影这才躺在了刚刚画影躺着的地铺上，没一会儿就睡着了。画影看着邵依依蹙起的眉头，于是伸手想要帮她抚平，却没想到对上了一双明亮的眸子，画影刚刚露出微笑想要唤她一声，却被邵依依闪电般的出手扼住了咽喉，画影的脸登时变得通红，想要说的话全都卡在了嗓子眼一个字也说不出来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影的面容慢慢的清晰的呈现在邵依依的视线内，她急忙松开手，腿软脚软的画影立刻趴在地上大口大口呼吸着空气，嗓子感觉火烧火燎的疼，脑子也因缺乏空气而昏昏沉沉的，邵依依急忙从床上下来，赤脚踩在地上将画影扶了起来，取过桌边的白底青花的茶杯帮她倒了一杯水，小心翼翼的帮她喂下。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依自昏迷中醒来，看到有人离自己那么近，生存的本能让她直接伸手扼住对方的要害，但清醒之后就知道自己做错了，毕竟这里不是自己当初生活过的地方，这里除了那母女二人之外没有人想要自己的命。半晌过后，画影才将气喘匀了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 虽然有些不明白为什么小姐高热退了之后就跟平日一般，根本没有以前的虚弱样子，但画影又是一个从不喜欢为难自己的人，想不通便不想了，只要小姐好了就好！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “几时了？”邵依依看了看房内燃着的油灯，有些不确定的开口询问。不知道她这一睡睡了多久。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “回小姐，现在丑时末，”画影出去看了看沙漏，回来对着邵依依道，“小姐再睡一觉吧，现在时辰还早。再说您高热才退正是需要好好休息的时候！”说完，就跑了出去重新端了一壶茶水进来，帮邵依依斟了杯茶送到她的手边，“小姐喝点水就休息吧！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 一切就绪，邵依依躺在床上看着画影睁着一双闪亮亮的大眼睛，有些头疼，这样的情况下她怎么可能睡得着啊，但是让她与灯影一起去睡她又不肯。直到后来画影打了个哈欠，邵依依突然之间就有些心疼这个孩子，于是自个往里侧挪了挪，拍了拍空出来的位置，“过来睡！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影的头摇得像个拨浪鼓，口中小声的说着，“奴婢不敢！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “你家小姐我还能吃了你不成？”邵依依故意恶声恶气的说着，而后话锋一转，带着些命令的口吻道，“快些过来！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画影垂首慢慢的往床边挪着，嘴角含着开心的笑，她与灯影是自小跟着小姐的，依稀记得小时候夫人还在世的时候，小姐的生活无忧无虑，那时候的小姐有时候也会露出这般强势的一面，但她从来不无缘无故责罚下人，只是想让她们分享好吃的东西的时候才会这般命令她们。但自从夫人去世之后，小姐就像变了一个人，被赶到这个破院子也没有吭声，除了对大少爷还是一如既往的依恋之外，就像变了一个人一样。小姐今日的作为，难道是在预示着从前那个小姐要回来了？画影有些窃喜的想着。但毕竟是小孩子心性，又加上是人最为疲惫的时候，没一会儿就睡着了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依因为自下午就陷入了昏睡之中，再加上前世的一些因素，这会的她越发的清醒了。双瞳在黑暗中越发的明亮，借着窗外的月光看着头顶的蚊帐，淡色的一丝花色也无的蚊帐，看着就不像少女的品位。邵依依犹记当初刚刚穿过来的时候，简陋的院子基本上没几件能够看得过眼的东西，一开始她还以为自己穿到了平民窟，但后来经过两位婢女的说明她这才明白过来。好吧，为了不引起两位婢女的怀疑，她当初不得不借用了“失忆”的梗。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 直到天光透亮之际，邵依依才再次睡了过去。醒过来的灯影看到在床上与小姐并排睡得香甜的画影，无奈的摇了摇头，走过去，轻轻的摇了摇画影。于是画影揉了揉惺忪的睡眼，看到灯影的一瞬间还有点迷糊，然后猛然间想起了昨夜灯影对她讲的话，急忙开口，“我没有偷懒，是小姐让我陪她睡的！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小姐醒过了？”灯影有些着急的问，对于画影这种说话不抓重点的人她真的是没办法愉快的沟通了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “嗯嗯！”画影连忙点头，而后将昨晚发生的事情细说了一遍，但是对于小姐快要将她掐死一事也不知是因为什么原因她隐去了没说。就在此时，外间传来涟漪的声音，灯影急忙走了出去，原来是涟漪担心了一晚上，天刚亮就趁着众人还没起身的功夫前来主屋打探一番。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 听到小姐已经痊愈，涟漪心中的巨石也放回了肚中，昨日请不到老爷，请不到大夫，涟漪自责了一个晚上，还在想今日小姐若是还不好的好，她就算拼了自己这条命也要去找大夫，现在看来，小姐果然是吉人自有天相，佛祖保佑！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 直到正午时分，邵依依才睁开双目，然后她就再也感受不到原主的任何情绪波动了，整个身体的支配权完全属于她自己了。可是她没有任何胜利的喜悦，因为她们都是可悲的人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 同一时间的盛京诚意伯府，轩辕祁也自昏迷中睁开了双眼，只是双目有些失神，有种不知今夕何年的感觉。转过头，他便看到一旁的轩辕昊轩辕澈还有他们的母亲都在他的房内。于是他准备起身，但被轩辕昊按住了肩头，“还有哪里不舒服吗？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕祁摇了摇头，他觉得自己与以前根本没什么不同。但轩辕昊还是让他躺着别动，请了帝王一大早就派来的御医章陵远进来为他把脉。结果自然是皆大欢喜，什么后遗症都没有。章陵远的话甚至比刘御医让人更为信服，毕竟他是神医沈墨霖的徒弟。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 待章陵远回宫复命之后，轩辕昊想要得知轩辕祁晕倒的真相，可是他自己也说不清楚。但轩辕祁没有告诉轩辕昊的是，那时候的自己好似要失去自己挚爱之人一般，情绪根本不受他控制，好似冥冥之中已早有安排。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 用过午餐，邵依依躺在堂屋下风口摆放的摇椅上，静静的听着两个丫头你一言我一语的讲述昨天下午她晕倒之后张氏的所为。两个丫头愤愤不平，如若小姐真的有个三长两短那该如何是好。邵依依笑了笑，劝两个丫头，“你家小姐不是活的好好的么！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 话虽如此，但邵依依并没有打算将这一章悄然接过，虽然自己如今根基不稳，但她没打算如此简单的就放过她。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 现在，她的精神完全与前世一样，这幅模样，只是摆给院中的众人看的，这样傍晚邵渊戎来此用餐的话也比较有说服力。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 对于昨日涟漪的所作所为，张氏自然在一大早就得到了消息。这不听到她醒过来的消息就赶紧过来慰问一番。自从昨日张氏从“墨芽阁”与邵渊戎一同离开之后，这“墨芽阁”内的众人心中都起了微妙的心思，从张氏带着人大摇大摆的进了这院的大门没人赶拦就看得出来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 不光其他人没有拦着，得了邵依依命令的涟漪浣纱等人自然也不会拦着，她们只是对着张氏俯身行礼。唐妈妈嘴角带着胜利的笑意，不知道的人还以为她才是这府中的当家主母。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 一路直奔邵依依的主院，却发现一脸苍白的邵依依就躺在堂屋的下风口，张氏带着人直接走了过去，灯影画影停下了打着折扇的动作急忙屈膝行礼，“给夫人请安！”张氏就那样盯着邵依依紧闭的双目，灯影画影就那般一动不动的行着礼，一时间，堂屋内寂静一片。灯影画影自然直到这是夫人给她们的下马威，所以一声不吭的受着。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许是屋内气氛太过压抑，唐妈妈的嗓子有点发干，忍不住的咳嗽了一声，邵依依这才动了，然后揉了揉双目，慢慢的从躺椅上坐直了身子，因为天气炎热的缘故，她将头发简单的扎了个马尾垂在脑后，长发随着她的动作在空中划过一道优美的弧线。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406261&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406261&&novelId=17990'">下一章</div>
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
