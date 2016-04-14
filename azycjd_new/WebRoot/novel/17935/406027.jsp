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
    <title>第六十二章 连你都不放过</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406027&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406027&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406027+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十二章 连你都不放过]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406027')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406027 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406027,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第66章&nbsp;&nbsp;&nbsp;第六十二章 连你都不放过
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪抬眼继续哀怨得盯他一眼，用力撇开他得手。<br /><p class='chapter_content_read_css'>“难道你就不想知道她来这里找祈言是为了什么吗。”<br /><p class='chapter_content_read_css'>凤无栖犹豫得看了她一眼，便不再纠结得带着她接近祈言的房间。<br /><p class='chapter_content_read_css'>她就是喜欢这样干脆的人，做大事不拘小节！<br /><p class='chapter_content_read_css'>两人跟做贼似的万分小心得靠近房间，西凝雪伸出一指捣捣窗布，没想到这长生殿的屋子还这么结实，不比皇宫一戳就烂得窗布。<br /><p class='chapter_content_read_css'>“我来。”凤无栖伸出莹润得指尖，在窗布上画了一个手指大小得圈，西凝雪立马将他的手打开，激动得将眼睛靠了上去。<br /><p class='chapter_content_read_css'>视线逐渐清晰，祈言与萧怜月两人都在，萧怜月舒适得卧在床上，祈言侧卧在她身旁，正不紧不慢得解着腰间得络带，他神色淡淡，眸色清明。<br /><p class='chapter_content_read_css'>萧怜月笑了笑，不过冰冷之色俨然占据了她得眸子，甚至还带着憎恨。<br /><p class='chapter_content_read_css'>“祈言，十七最在乎你，你说要是让他知道我连你都不放过会怎么样。”<br /><p class='chapter_content_read_css'>祈言解着衣物得动作一顿，而后微微一笑，释然道，“只有三日，教主想在三日之内逼他就范。可若是为了我就低下头的，那便不是他了。”<br /><p class='chapter_content_read_css'>西凝雪心中猛然一沉，伸出手盖住那个洞，回身望了一眼站在旁边得凤无栖，小声开口道，“非礼勿视啊……凤哥，还是你来吧。”<br /><p class='chapter_content_read_css'>凤无栖奇异得挑了挑眉，见西凝雪退开了身子，便也忍不住好奇得凑上去观望，也不知到最后他到底看到了什么，只是刚才那一幅暧昧得场景孕育在西凝雪的大脑里经久不散，祈言和萧怜月到底在说些什么？他们两为何不是在谈话，而是在……<br /><p class='chapter_content_read_css'>“祈言，我从不知道连你都这么脏。”<br /><p class='chapter_content_read_css'>屋里传来萧怜月高声的冷笑，和那句讽刺到极点得话语。<br /><p class='chapter_content_read_css'>凤无栖动作极快得将她向着拐角一推，自己已然飞上了屋顶。<br /><p class='chapter_content_read_css'>萧怜月面无表情得从屋中走出，丝毫没有注意到观望到了所有得两人。<br /><p class='chapter_content_read_css'>西凝雪暗叹一口气，朝不远处得凤无栖开口问道，“你听到什么没有？”<br /><p class='chapter_content_read_css'>“没有，一句也没有。”凤无栖神色正经得立在一边，一双眸子就这么平静得望着房间门口。<br /><p class='chapter_content_read_css'>“那我们现在怎么办？”<br /><p class='chapter_content_read_css'>“教主连师兄都不愿意相信了，我们还能如何。”<br /><p class='chapter_content_read_css'>也是，萧怜月又不知道犯什么病，连祈言这么衷心得属下都连着冤枉，着实可恶！<br /><p class='chapter_content_read_css'>不过她的目的是什么呢？西凝雪明明白白得感觉到这件事不简单，萧怜月一项心狠手辣，对温夕言更是狠到极点，不过此刻恐怕她的内心也不会好受的，怪只怪她被那个抛弃她的男人伤的太深，绝情忘情断情，恨不得要将所有的痛苦都还给男人，而长生殿里其他弟子就无辜成了出气品。<br /><p class='chapter_content_read_css'>西凝雪这时才想问问凤无栖到底看见了什么，回神时凤无栖老早就离开了，西凝雪暗道这厮脚下生风溜的太快，不愧是轻功好，不过人呢？人哪里去了？<br /><p class='chapter_content_read_css'>“别过来！”一声轻喝吸引了西凝雪得耳畔。<br /><p class='chapter_content_read_css'>她一个激灵，立马就分辨出声音来自祈言房间的，她三两步赶到房间里，视线却被凤无栖挡住了，她歪过头才看见这恐怖得场景，一床凌乱得衣衫，还有抓着被褥裹在身上得祈言。<br /><p class='chapter_content_read_css'>他浑身都在发抖，垂下得发丝挡住面部看不出表情，只是裸露在外得皮肤是诡异得冰蓝色，和萧怜月得眸色是同一种颜色。就像整个人都结上了一层冰，他靠在角落里，轻提着气隐忍痛苦气若游丝道，“寒bing毒不是你能解的，小五，这几日我留在房里压制毒性，十七那边就交给你了。”<br /><p class='chapter_content_read_css'>凤无栖捏紧拳头，眼睛都在发红，声音无比犀利，“你要我留意他？”<br /><p class='chapter_content_read_css'>祈言将被褥又裹了一层，脑袋都埋得看不见了，一会儿才深吸口气，将整只冰蓝色的手臂伸出，指尖颤抖得握着一个瓶子，面容早已变得惨白，却仍怀着温柔，“小五，将它交给十七，十七……知道，这是什么的。”<br /><p class='chapter_content_read_css'>西凝雪哆嗦了一下身体，竟不能自持得开始胸闷。<br /><p class='chapter_content_read_css'>萧怜月到底做了什么？！她为什么要这样？！<br /><p class='chapter_content_read_css'>凤无栖得紫眸已然充满了猩红，他掐的掌心都出血了，却仍是不肯移动分毫。<br /><p class='chapter_content_read_css'>祈言有些着急得捏紧瓶子，“听话，快去。”<br /><p class='chapter_content_read_css'>听话，快去。<br /><p class='chapter_content_read_css'>连西凝雪都痛了心，胸口涌出一阵阵悲伤。<br /><p class='chapter_content_read_css'>凤无栖终究还是夺了那药瓶，转身离去。<br /><p class='chapter_content_read_css'>祈言放松得向一旁倒去，西凝雪慢步接近，眼见着冰蓝色得颜色已经占据到他得下颌处，正在以肉眼可见得速度蔓延着。这冰是真的吗？下一刻西凝雪就想拍死自己，都这个时候了，她到底在想些什么玩意儿。<br /><p class='chapter_content_read_css'>“寒冰du要紧么，我给你搬个火炉过来烤烤？”<br /><p class='chapter_content_read_css'>没有声音回应，西凝雪又大着胆子继续忐忑道。<br /><p class='chapter_content_read_css'>“火炉太小了，那炉鼎怎么样……”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>死了？<br /><p class='chapter_content_read_css'>西凝雪偷偷爬上榻，执起那只露在外面得手，把了把脉象。<br /><p class='chapter_content_read_css'>虽然寒bing毒在体，但脉象仍是与平常一样能够轻易捕捉得到，西凝雪感觉得出来祈言得气息非常弱，不过她现在又帮不上什么忙，抓着一只手空把脉也是着实苦恼，完全把不出什么。<br /><p class='chapter_content_read_css'>要么就是她这点三脚猫得切脉技术不太好，要么就是寒冰du太过于恐怖。<br /><p class='chapter_content_read_css'>祈言抽了抽腕子，全身都在哆嗦，被子没盖住他得身子，露出了大片得冰蓝色肌肤。现下西凝雪顾不得什么非礼勿视，抓起被褥和房里得其他备用棉被朝他身上裹去，就连自己屋里得被褥都没放过得一齐塞了上去。<br /><p class='chapter_content_read_css'>祈言瘦削得身子外裹着好几层被褥，几乎是他人的五倍。<br /><p class='chapter_content_read_css'>西凝雪蹲在一边撇开他贴在皮肤上得凌乱发丝，关切得又打了盆热水浸湿了巾帕朝他脸上一搭。<br /><p class='chapter_content_read_css'>再怎么说也不能眼睁睁得看着他死，她相信这么多年，如果不是祈言一直在得话，长生殿早就乱成一片，被萧怜月整治的乌烟瘴气了，祈言一死，便再也没有什么能让萧怜月顾忌得了。<br /><p class='chapter_content_read_css'>西凝雪在园子里得书斋处呆了一夜，却未曾寻到提及过什么寒bing毒的内容，连一点关于描述得蛛丝马迹都没有。熬了一夜又难免困乏，正巧在快要睡着的时候，凤无栖跑过来接班。<br /><p class='chapter_content_read_css'>他身上衣服还没弄好呢，估计是刚从萧怜月手底下出来，就忙不迭得赶到了园子里见祈言。<br /><p class='chapter_content_read_css'>西凝雪还是头一次见他这么慌张得呆在祈言身边，一双手拨弄着盖得并不掩饰得被褥，将缝隙处都一一掖好，才回头打量一眼眼圈都黑了的西凝雪。<br /><p class='chapter_content_read_css'>“小肆，我不在的时候就劳烦你照顾师兄了。”<br /><p class='chapter_content_read_css'>“嗯嗯嗯，有我在，你放心吧。”西凝雪打了个呵欠，勉强撑起困乏得双眼，指指他旁边，“那啥，大师兄他衣服还没穿好，衣服我给放在床尾了，你给他穿穿，我先走了，困死我了……”<br /><p class='chapter_content_read_css'>既然有接班人，她也懒得再多费心思照顾了，当即回到了屋里头大睡一场，一觉睡到夕阳出，西凝雪懒得起床，但是为了照看祈言还是慢悠悠得爬起来，这时再去望了望情况，祈言身上得冰蓝色已经褪了大半。<br /><p class='chapter_content_read_css'>只是他仍在沉睡，好在呼吸平稳，面色红润了些。<br /><p class='chapter_content_read_css'>看来这长生殿调理身体得内功竟然这么厉害，睡一觉起来就解了大半得毒，要是她也能习得一招半式的，出去当个二流高手保命也不是不可能的啊。<br /><p class='chapter_content_read_css'>正在她给自己未来得大侠梦扑上一层爽歪歪得憧憬之后，旁边得人有了动静。<br /><p class='chapter_content_read_css'>西凝雪不敢怠慢，一直照看着第一时间就扑了过去观看情况。祈言扬声柔弱得咳了几声，从嘴巴里都冒出不少得寒气，西凝雪趴在他身边，小声得叫唤了一句，“祈言师兄？”<br /><p class='chapter_content_read_css'>“不……嗯……怜咳咳……怜……怜……”<br /><p class='chapter_content_read_css'>西凝雪怔忪了片刻，他一直叫脸干嘛，难不成脸上难受，要她给他面部按摩一下？<br /><p class='chapter_content_read_css'>西凝雪伸着爪子出去了，还没有碰到他的脸，祈言一下子掀了眼帘，无数得恐惧如潮水般凝聚在那黑眸之中，只是短短几息后恢复了波澜不惊得平静。<br /><p class='chapter_content_read_css'>祈言得身上有虚汗，他难过的在好几层得被子里直起身子，也不遮掩住自己异色得双手，就这么平静如水得望着她，而后低如蚊足得声音，“这是何处？”<br /><p class='chapter_content_read_css'>“咋，你忘了？”西凝雪忐忑又补上了一句，“这里……是你的园子。”<br /><p class='chapter_content_read_css'>“我的？”祈言向着四处扫了一眼，有些混乱得揉了揉脑袋，靠在一边，“教主呢……她在哪里。”<br /><p class='chapter_content_read_css'>还好还好，原来不是失忆了，只是睡糊了。<br /><p class='chapter_content_read_css'>“她昨日在你房里呆了一阵，然后就离开了，我也没看见她人去哪里了。”<br /><p class='chapter_content_read_css'>“是吗……”毫无血色得嘴唇牵了牵，祈言捂着胸口咳了几声，似乎很费劲的才开口问道，“才睡了一日，还好……”<br /><p class='chapter_content_read_css'>“可你身上得寒冰du还没解开。”<br /><p class='chapter_content_read_css'>“不妨事。”<br /><p class='chapter_content_read_css'>祈言又陷入了沉睡状态，西凝雪不便打扰他自我清除余毒，给他换了热巾帕之后就离开了，园子里万般静寂，细无声。西凝雪一人尝了两份饭菜还意犹未尽得砸吧砸吧嘴。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406027&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406027&&novelId=17935'">下一章</div>
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
