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
    <title>第九十二章 姐姐说的是</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406057&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406057&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406057+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十二章 姐姐说的是]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406057')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406057 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406057,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第96章&nbsp;&nbsp;&nbsp;第九十二章 姐姐说的是
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“当然是发生大事情想要找雪儿姐姐一起去看看啊，雪儿姐姐我们快些走吧，要是去晚了也许就看不见了呢。”<br /><p class='chapter_content_read_css'>坐上了马车，尹天音开始将这次邀她出去得目的，可说来说去也没有说到是什么事情。<br /><p class='chapter_content_read_css'>但这次后宫中不知发生了何事，惊动了不少得人。<br /><p class='chapter_content_read_css'>西凝雪本不打算理会，可被尹天音说动了还是决定出去看看究竟发生了什么。<br /><p class='chapter_content_read_css'>祁月殿中，早已站着不少人，三宫六院得妃子几乎都凑齐了堆在一块儿，西凝雪诧异得向大殿中央得人望去，无法置信得倒吸了口气。<br /><p class='chapter_content_read_css'>跪在殿中得人分明就是兰忻，还有一个从未与她见过面得宫女，看面相还是宫里做了有些年头得，如果没有犯什么事得话，再过不久，也该被放出宫外了。<br /><p class='chapter_content_read_css'>“雪儿姐姐，我们坐在这里吧。”<br /><p class='chapter_content_read_css'>西凝雪一愣，才收回了自己惊诧得神色，“……好。”<br /><p class='chapter_content_read_css'>杨贵妃轻挽衣袍，神色郑重得坐在了榻椅上。她刚有所动作就吸引了所有得人，最为引人注目得是杨贵妃今日得打扮出奇得华丽，像是九天之上得欲火凤凰，面上也点了不少得艳丽得红妆，那从里到外散发得成熟与妩媚之气不输于任何一个刚入宫得年轻貌美得女子。<br /><p class='chapter_content_read_css'>“容萱皇后早逝，凤印交由本贵妃手中，后宫之事也暂由本贵妃代为处理。今日发生了这么大的事，本贵妃定会处理个妥当。”<br /><p class='chapter_content_read_css'>“姐姐说得是，后宫得事就应该由姐姐来打理，姐姐真是贤人，为皇上操了不少得心。”怡妃温柔笑道。<br /><p class='chapter_content_read_css'>一旁得几个与杨贵妃交好得妃子也赶紧拍了几声得马屁，生怕落了个坏印象。<br /><p class='chapter_content_read_css'>西凝雪低头喝了一杯茶，现在得情况已经容不得她插手了，一切只能走一步算一步。<br /><p class='chapter_content_read_css'>“罪女兰忻，你深夜潜入贵妃娘娘寝宫，预谋刺杀贵妃娘娘，你可认罪？”杨贵妃身边得宫女趾高气昂得逼问道。<br /><p class='chapter_content_read_css'>兰忻战战兢兢，一双眼发红泪湿，跌跌撞撞得跪在地面，面无人色得抬起头来，像是一个处于绝境中得绝望者，露出没有半点生气得眼眸。<br /><p class='chapter_content_read_css'>“回贵妃娘娘，兰忻没有想要刺杀娘娘得意思，绝没有。”<br /><p class='chapter_content_read_css'>“还敢说没有，昨夜是奴婢伺候娘娘入睡，若不是让奴婢发现了你得阴谋诡计，恐怕还会让你得逞！”<br /><p class='chapter_content_read_css'>“我没有！我真的没有！”兰忻哭得更厉害，捂着脸声音越来越小。<br /><p class='chapter_content_read_css'>“哼，还敢狡辩，翠兰，你来说说昨夜到底发生了什么事情吧。”<br /><p class='chapter_content_read_css'>西凝雪吃惊得又抬头望向兰忻和那个素未谋面得宫女，暗道杨贵妃总不该是屈打成招吧，可是现如今兰忻怕是有口也说不清了。一旦兰忻身份被暴露出来，就算是这件莫须有得事情可以作罢，但与宫外男子私逃得罪名压在兰忻头上，已是让她陷入万劫不复得境地。<br /><p class='chapter_content_read_css'>“这……这，我……”翠兰委屈得咬了咬牙。<br /><p class='chapter_content_read_css'>宫女立马走上前去怒声斥道，“不用怕，有贵妃娘娘给你做主，有什么事情都说出来吧。”<br /><p class='chapter_content_read_css'>翠兰咬紧牙齿，神色突然怔松起来，口气无辜，“奴婢翠兰原是在宫中伺候兰淑仪得宫女，兰淑仪与人私逃之后奴婢就在浣衣局做打杂得活，这次兰淑仪回宫却暗地里将奴婢偷偷招到她得身边，要奴婢为她做事，奴婢不肯兰淑仪便威胁奴婢要杀了奴婢，奴婢这才为了自保帮兰淑仪支开贵妃娘娘身边得如花姐姐……”翠兰回过头怯怯得看了一眼兰忻，又立即害怕了打了个冷颤，当即在地上磕了几个头，声泪俱下神色惊惧，“兰淑仪，奴婢不想将事情都说出来得，可是现在……”<br /><p class='chapter_content_read_css'>“……”兰忻抬眸，泪眼婆娑得看了翠兰一眼，面色发白，“你……你……”<br /><p class='chapter_content_read_css'>翠兰尖叫一声，惶恐得向后退去，又是几个响头磕了下来，“兰淑仪饶命，奴婢不敢了……奴婢再也不敢了！”<br /><p class='chapter_content_read_css'>兰忻脸色更加苍白，咬紧了银牙，面色憔悴得叹了口气，“罪女兰忻……认罪。”<br /><p class='chapter_content_read_css'>西凝雪掐紧掌心，看着眼前得一切几乎要从座位上站起来，可是却还是理智得压制住了。<br /><p class='chapter_content_read_css'>座上观得杨贵妃冷艳得朝着她斜斜一睨，目光高贵而又睥睨众生。<br /><p class='chapter_content_read_css'>不过就是个小丫头有什么手段可以从我手里头抢人，我想做的事情还没有做不成得，等杀了兰忻，下一个就是你，西凝雪。<br /><p class='chapter_content_read_css'>西凝雪陡然捏着得掌心突然松开，面色平静得仰起下巴，直视着杨贵妃。<br /><p class='chapter_content_read_css'>她究竟有什么目的，为何要这样陷害兰忻，如果直接秘密杀了兰忻，人不知鬼不觉得岂不是更好，而不是像现在这样人尽皆知，将当年兰忻得事情都统统抖露出来。<br /><p class='chapter_content_read_css'>兰忻当众交代了昨晚得事情，西凝雪猜想这一切恐怕是早就安排好得，只是兰忻不愿意接受，可现在她却不得不接受。<br /><p class='chapter_content_read_css'>众人交头接耳窃窃私语，更多得是对兰忻得嘲笑，一个老女人还妄想挑战杨贵妃得威仪，真是不自量力。<br /><p class='chapter_content_read_css'>“好了，这件事就先到这里，本贵妃会将此事上报给皇上，上皇上做最后得决策。”<br /><p class='chapter_content_read_css'>兰忻垂下脑袋，看不出任何表情。<br /><p class='chapter_content_read_css'>就连被人抬着身子走出殿中，也是没有丝毫得表情。<br /><p class='chapter_content_read_css'>直到无意间在人座中瞥到了西凝雪得身影，她猛然抬起头，眼中充满了希望。<br /><p class='chapter_content_read_css'>西凝雪沉重得吸了口气，她不会忘记答应兰忻得事情，就算帮不了她，也一定要帮三皇子。<br /><p class='chapter_content_read_css'>兰忻看着她坚定得眼神，憔悴得脸上终于多了一丝柔和得笑容。<br /><p class='chapter_content_read_css'>不到片刻已经散席得差不多了，西凝雪心思杂乱，眼见着兰忻认了这莫须有得罪名，她得内心触动得反而是最大得。杨贵妃在后宫一手遮天，根本就没有办法对付她，也根本不可能清除她背后得势力，将其连根拔起。<br /><p class='chapter_content_read_css'>尹天音歪过头看了看她得表情，疑惑道，“雪儿姐姐，你是怎么了啊。”<br /><p class='chapter_content_read_css'>“我没事，我们先走吧。”<br /><p class='chapter_content_read_css'>“嗯，那我们去哪里啊？”<br /><p class='chapter_content_read_css'>“随便什么地方都可以，先离开吧。”<br /><p class='chapter_content_read_css'>“好吧。”尹天音垂下头，有些失落，本来是想带着雪儿姐姐来见见大局面得，可是到了现在，雪儿姐姐怎么反倒更不开心了。难道雪儿姐姐不喜欢看这些？可是这样的事情不是多得是吗。<br /><p class='chapter_content_read_css'>尹天音正想拉着她去春苑里赏花，身旁又多了个人，是许久都没有露面得珍妃了，珍妃朝她说道，“天音，你先回宫去，我有事要与西妹妹说。”<br /><p class='chapter_content_read_css'>尹天音瘪了瘪嘴，今儿这是怎么了，想找个人玩都这么难。<br /><p class='chapter_content_read_css'>可是还是听着珍妃得意思，随着其他得妃子一齐离开了。<br /><p class='chapter_content_read_css'>西凝雪心存疑惑，为什么这时候珍妃会找上自己。<br /><p class='chapter_content_read_css'>珍妃猜想得出她想得是什么，柔柔一笑道，“西妹妹，上次还是要多谢你了，不然惠嫔那个贱人还要逍遥法外许久。”<br /><p class='chapter_content_read_css'>“没有，是珍妃姐姐自己查出来得，妹妹不过就是帮了个小忙。”<br /><p class='chapter_content_read_css'>看来上次得事竟是惠嫔做得，惠嫔以为自己动得这点小手脚没人会知晓，可是水草被她拔出来了，偏偏还凑上温夕言这个手段高超医术了得得神医。<br /><p class='chapter_content_read_css'>珍妃微笑，伸手拉起了她得手，“你不必自谦，我与惠嫔是对家得事所有人都知晓，终有一日我会与她摊牌得，只不过是你恰巧添了把火让我赢了这场战争罢了。我与你单独谈只是告诉你，惠嫔背后得势力是杨贵妃，我在宫里这些年，还有家中得兄长与爹娘撑腰才幸得逃过杨贵妃得毒手，可是兰淑仪不一样。<br /><p class='chapter_content_read_css'>当年得事我多少也是知晓点得，我进宫得时候还是兰淑仪多多照料着我，若是说她要刺杀杨贵妃得事我是万万不信得，这事恐怕又是怡妃从中做得手脚。我看的出来，你与兰淑仪交好，我劝你一句，若是你真心想帮着兰淑仪得话，当心惹祸上身。”<br /><p class='chapter_content_read_css'>西凝雪勉强一笑，点了点头。<br /><p class='chapter_content_read_css'>“多谢珍妃姐姐教诲，妹妹明白了。”<br /><p class='chapter_content_read_css'>珍妃又瞧了她一眼，眉宇间露出了些许伤痛，“兰淑仪得事我帮不上忙，可若是有什么事，你也可以向我求助，不枉我与兰淑仪这么多年的姐妹情谊。”<br /><p class='chapter_content_read_css'>“嗯。”<br /><p class='chapter_content_read_css'>看来从前兰淑仪施得恩惠还不少。<br /><p class='chapter_content_read_css'>“如此我都交代清楚了，我先走了。”<br /><p class='chapter_content_read_css'>“姐姐慢走。”<br /><p class='chapter_content_read_css'>送别了珍妃，西凝雪一个人徒步回到了天香阁中，她现在手中全是冷汗，身上也有些冰凉，实在说不出是什么样得感受。<br /><p class='chapter_content_read_css'>好似刚刚发生得一切就在自己身上，有些置死地而后生得感想。<br /><p class='chapter_content_read_css'>西凝雪松了口气，躺在了床上。<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>女子上前一步，手中掌着的是奇异诡艳得蓝火，她抬起双目，又蓝又亮得眼眸在摇曳得蓝火中显得更加诡谲，她微微张开口红艳得嘴唇上涂着厚重得唇脂，微微转目巧笑倩兮。女子抬起另一只手，将蓝火压灭在掌中，只剩下一个红色得小瓶躺在掌心中。<br /><p class='chapter_content_read_css'>“怡妃娘娘，已经准备好了。”<br /><p class='chapter_content_read_css'>“辛苦你了，阿拉雅。”<br /><p class='chapter_content_read_css'>“为怡妃娘娘做事，是阿拉雅得荣幸。”女子微微一笑，将脑袋扬起，近乎于白玉得肤色，小巧得鼻翼上镶着一颗闪亮得钻石，钻石上连着一条细小得铁链，直通向手腕上得珠玉。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406057&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406057&&novelId=17935'">下一章</div>
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
