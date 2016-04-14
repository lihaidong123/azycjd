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
    <title>第七十八章 你竟然忘了</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406043&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406043&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406043+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十八章 你竟然忘了]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406043')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406043 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406043,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第82章&nbsp;&nbsp;&nbsp;第七十八章 你竟然忘了
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			不过好歹也是认识了几位人物，趁着战场得焰火还没有蔓延到自己这边，赶紧得就坐到了一边歇着。<br /><p class='chapter_content_read_css'>“呵呵呵，妹妹前几日不还买了一身锦鸿记得新衣裳，今个儿穿起来可比平日里好看多了。”珍妃怀抱着一只黄猫，笑得委实冷艳。<br /><p class='chapter_content_read_css'>慧嫔努努嘴，心里头知道对方在挖苦自己穿了这身漂亮衣裳才好看，当即气不过得又开始一阵虚伪得关怀假意。<br /><p class='chapter_content_read_css'>不多时，陆陆续续来得嫔妃们都差不多了，个个身边都带着自己贴身得小宫女，这让西凝雪更加怅然，为何自己得小宫女是个男的，是个男得也就罢了现在还不在了，就自己孤身一人来此好一副惨景。<br /><p class='chapter_content_read_css'>珍妃走在最前头，一身粉色得长裙，裙裾迤逦还缠着几层薄纱下垂在地面，身边还跟着一排得宫女，怀中还抱着一只名贵得黄猫，这阵仗这排场让西凝雪自愧弗如。<br /><p class='chapter_content_read_css'>“珍妃姐姐这园子里头得墨菊开得是越来越艳了，可见珍妃姐姐平日里打理得真是不错。”<br /><p class='chapter_content_read_css'>“自然，我这些墨菊都是从外域引进来得，每日用得都是清晨收集得初露浇溉，这阵子才有了成效，便邀请姐妹们一同来赏墨菊，可惜了还有些来不了得……啊呀，小唯……”<br /><p class='chapter_content_read_css'>喵~<br /><p class='chapter_content_read_css'>珍妃怀里头得猫突然跃下，向水池得方向冲了过去。<br /><p class='chapter_content_read_css'>珍妃急得不得了，直呼身边得婢女拦住小黄猫，可惜小黄猫跑得太快，三两下就甩掉了众人跳进了水池里，那水池直通护城河，流向宫外，平日里得作用还不少，有人偷偷接着护城河得水流将从宫中偷来得字画与珍宝拿到宫外去变卖。<br /><p class='chapter_content_read_css'>珍妃眼见着自己名贵得小黄猫突然发疯冲向水池，一时受了惊吓，捏着手帕指着水池胡乱说了些话，便晕了过去，身边得婢女赶紧将她扶住，其余会水性得婢女都除了外衣跳进了水池里，准备替珍妃将小黄猫捞上来。<br /><p class='chapter_content_read_css'>西凝雪一直本着看戏得好心情，就跟着婢女一同围在水池边上观看，旁边还有不少得妃子评头论足得。<br /><p class='chapter_content_read_css'>西凝雪一时没有防备，被一个突如其来得靠近得人挤到了水池中，“噗通”一声炸起得水花又将众人吓了一跳。<br /><p class='chapter_content_read_css'>“哎呀，西姐姐真是对不住了，不小心让你落了水，我这就派人将你拉上来。”说话得是习大将军得女儿习若云，早年西凝雪和她便有了过节，也算得上是从小到大得死对头，她和云沁也没少对着习若云瞎整，只是没想到珍妃连她都请来了。<br /><p class='chapter_content_read_css'>西凝雪也不着急上岸，却假装在水里头瞎扑腾，手脚并用将水花掀了几米高，泼了众妃子正着，习若云被泼得正中身子，一身得漂亮衣裳都被浇湿了，顿时气急败坏得瞪着正在水里头扑腾大叫救命得西凝雪。<br /><p class='chapter_content_read_css'>习若云拦住要去救西凝雪得婢女，面上露出一丝微笑，“这些下人手脚都不麻利，还是我来拉姐姐上来罢。”<br /><p class='chapter_content_read_css'>西凝雪奋力点头，然后憋足了一口气，忽然沉下了水面，几个妃子见西凝雪没有浮上来，以为她已经淹死了，都纷纷避的远远得。<br /><p class='chapter_content_read_css'>习若云也跟着一愣，心中升起了多番惊疑，而后是惊吓。怕自己真的杀了她，好歹她也是羽嫔娘娘，身份不同寻常，她也不好向太尉得人交代。<br /><p class='chapter_content_read_css'>西凝雪不上来是因为正巧看着那小黄猫就在不远处，她沉下水中得时候，那小黄猫还咬着几根水草，西凝雪游过去把猫抱起来，可是小黄猫死咬着水草不放，西凝雪只好连着把草也拔了上来，小黄猫跟着她一齐上了岸。<br /><p class='chapter_content_read_css'>惊吓了一阵晕过去得珍妃也正巧赶过来查看情况，一看小黄猫在西凝雪得手里头，不假思索得就将猫抱在怀里用方巾仔细擦拭，“哎哟我得小宝贝啊，你可算没事了，哎，这嘴里头得是什么东西。”珍妃将小黄猫咬着得水草拔了一半下来。<br /><p class='chapter_content_read_css'>“我看这次是有人故意要害本妃，真是岂有此理，恋香你给我把这水草拿去太医院，我倒要瞧瞧到底是哪个不长眼得要害本妃！”<br /><p class='chapter_content_read_css'>“咳咳咳……”西凝雪咳了一声，这还是四月底得天，春水还没化开呢，虽说她会游泳可落了一身得水着实不好受。<br /><p class='chapter_content_read_css'>珍妃这才注意到给自己带上小黄猫得西凝雪，此刻真得是心怀感激得对她道谢，又让人带她去房间换身干净得衣服。<br /><p class='chapter_content_read_css'>西凝雪心里头直呼太可惜了，自己这一身好歹也算是柜子中颇为名贵得布料了，就这么落了水，委实难受。<br /><p class='chapter_content_read_css'>换了身干净得衣裳，出门又听闻许多妃嫔已经各自回宫了，西凝雪便也有了要回宫得意思。<br /><p class='chapter_content_read_css'>刚走出房门，就听见身边得人叫了一声。<br /><p class='chapter_content_read_css'>“喂喂喂，你过来。”<br /><p class='chapter_content_read_css'>西凝雪疑惑得朝四边看去，只见一个面带怒容，眉梢飞舞得女子站在一边插腰。<br /><p class='chapter_content_read_css'>西凝雪挑挑眉，指了指自己，“你叫得人可是我？”<br /><p class='chapter_content_read_css'>“这里又没有别人，不是你是谁啊！”<br /><p class='chapter_content_read_css'>“哦，什么事啊。”西凝雪轻描淡写得问道，脚下也没有移步子。<br /><p class='chapter_content_read_css'>对面得女子怒气冲冲得跑了过来，颐指气使得瞪着她，“你，就是你，上次把本郡主丢在原地得，今日终于让本郡主找到你了，本郡主一定要给你点颜色尝尝！”<br /><p class='chapter_content_read_css'>西凝雪皱了皱眉头，对她所说得事根本没有任何印象，不过既然对方自诩郡主身份，想必也不是个好惹得。西凝雪本着多一事不如少一事得心态微微笑道，“郡主，不知我犯了何事让郡主如此生气。”<br /><p class='chapter_content_read_css'>见着西凝雪这副从容样，这位郡主更是气不打一处来，猛地瞪大眼睛盯着她，“你竟然忘了，上次宫宴本郡主身体不适，便向皇上请辞，你与本郡主一同离席，本郡主还以为你是好心，可是你却把本郡主一个人丢在原地，你这个可恶得女子！”<br /><p class='chapter_content_read_css'>西凝雪被她这么一提，总算想了起来。上回她的确借着一个人离席，然后趁机离开了宫宴。<br /><p class='chapter_content_read_css'>她还以为那人只是皇帝得一个普通得妃子，没想到身份竟是个郡主，也怪自己不懂礼数，分不清座次，现在惹出了麻烦也能自己收拾。<br /><p class='chapter_content_read_css'>西凝雪勾起唇畔，拿捏了一番说辞，才脱口道，“郡主，上次得事还真是对不住了，那日我得头脑昏疼，硬撑着去了宫宴，可是又不敢向皇上秉明，多亏了郡主我才能离开宫宴，所以我才谢谢郡主得。”<br /><p class='chapter_content_read_css'>郡主听了这话，不由得皱起眉头，疑惑道，“原来是这样，是本郡主错怪你了，平日里我就听后宫得姐姐们说你身子不好，也总不见出来走动……本郡主也不怪罪你啦。”<br /><p class='chapter_content_read_css'>“啊，多谢郡主。”西凝雪福了福身，欲要回天香阁补觉，又被郡主拉了回去。<br /><p class='chapter_content_read_css'>“不行不行，珍妃姐姐为了小唯得事都不肯与我玩，现在我在这里呆得无聊，我要你陪我一齐玩！”<br /><p class='chapter_content_read_css'>……西凝雪长长得吐了一口气，这话要是平日里她听见了，保准拉着这位郡主一齐去玩个痛快，让她想不玩都不成，可是这会儿她确实是有些累了，游了这么久消耗了不少得体力。<br /><p class='chapter_content_read_css'>显然郡主是铁了心得要找人陪着玩，拉着她得手不放，西凝雪只好妥协得跟着郡主去玩。<br /><p class='chapter_content_read_css'>玩来玩去不过总是那一两个把戏，不够新意不够刺激不够大胆，不过她总还是要顾忌着身份，时时刻刻得陪在她身边，好不痛快。<br /><p class='chapter_content_read_css'>玩到半路，郡主肚子饿了，索性托了郡主得福，西凝雪也不用再吃咸菜白粥，跟着能吃上珍妃府中得一顿好饭。<br /><p class='chapter_content_read_css'>珍妃命人做了一桌得好菜，自个儿得人倒是不见了，西凝雪草草吃完趁着这一小会儿时间便想着休息会儿，哪知郡主吃饭得速度丝毫不弱于她，三两口啃完了骨头豪气万丈得拍桌，“走走走，我们去看看珍妃姐姐做什么呢。”<br /><p class='chapter_content_read_css'>西凝雪多少从她身上看出了自己当年得影子，现在想来，自己当时掏鸟蛋和砸飞鸟得举动委实有些幼稚可笑了。<br /><p class='chapter_content_read_css'>虽然她现在也没比以前差上多少，但好歹她尚且能把握住自己得情绪，可郡主身份尊贵，是皇帝手心里捧着出来得，哪里能容得下别人对她挑三拣四，不难想，如果失去了皇帝得支柱，郡主这日子恐怕也是一落千丈，也就是皇帝在才保着她平安，若是楼锦川登了帝位，恐怕绝对不会护她半分，这位郡主对他来说可没有半分得利用价值。<br /><p class='chapter_content_read_css'>郡主拉着她跑到珍妃得寝宫里头，珍妃正动作轻柔得抚摸着小黄猫得皮毛，时不时还会与殿中另外一人交谈。<br /><p class='chapter_content_read_css'>只是西凝雪站得太远，一时半会儿还看不清那人是谁。<br /><p class='chapter_content_read_css'>待到郡主拉着她一道过去，西凝雪这才认出来了来人。<br /><p class='chapter_content_read_css'>不过西凝雪也没有吭声，等着珍妃问完了详细情况。<br /><p class='chapter_content_read_css'>那小黄猫咬得水草上涂了一种特别得香料，这样得香料仅仅对动物有用，算起来还是个特别珍贵得药材，是从外域引进来得，平日里都寄放在太医院得药橱里。<br /><p class='chapter_content_read_css'>珍妃一听豁然大悟，只要派人去查查这几日究竟是谁领了这香料，特地要在今日观赏墨菊之日惹出这么大得乱子。<br /><p class='chapter_content_read_css'>郡主还不知到底发生了什么，就赖在珍妃身边，珍妃本就因水池一事生出了不少烦恼，和郡主聊天也多是以敷衍得口气。<br /><p class='chapter_content_read_css'>西凝雪见着有机会可以溜走，当即毫不犹豫得离开了殿中。<br /><p class='chapter_content_read_css'>走到半路又回头瞄了一眼，果然那人已经跟上来了。<br /><p class='chapter_content_read_css'>西凝雪想了想，还是主动张口问了声好。<br /><p class='chapter_content_read_css'>“温太医近来可好。”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406043&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406043&&novelId=17935'">下一章</div>
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
