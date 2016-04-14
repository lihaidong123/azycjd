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
    <title>第八十四章 这事不简单</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406049&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406049&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406049+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十四章 这事不简单]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406049')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406049 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406049,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第88章&nbsp;&nbsp;&nbsp;第八十四章 这事不简单
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			忻儿咽了咽口水道，“我得孩子被怡妃派人带走得，怡妃在宫中做尽了伤天害理得事，可又无人能够惩戒她，我儿被夺走我得夫婿为了保护孩子也被她杀死了，我一人远逃民间，好不容易找到一个机会能向圣上吐露真相，可还是被她发现抓到了暗牢中，她每日都给我灌汤药，开始我还能保持着清醒，可后来我不知道自己到底怎么回事，没有了意识，身体也不受控制。<br /><p class='chapter_content_read_css'>直到今日睁眼醒来，我才记起当日得事情，这七年来我就像活在另一个地方，如若不是姑娘好心相救，恐怕我是一辈子也不会醒来了。”<br /><p class='chapter_content_read_css'>怡妃？<br /><p class='chapter_content_read_css'>西凝雪暗自思忖，若是没有估计错，忻儿口中得怡妃就是锦纤哥哥得生母，怡妃有两个儿子，一个是二皇子还有一个便是三皇子楼锦仁不过十岁便心怀着社稷，两个儿子算起来一文一武都是出类拔萃得。不过宫中得妃子做得丧尽天良得事委实不算少，抱个孩子狸猫换太子得那更是稀疏平常得手段。<br /><p class='chapter_content_read_css'>可怜天下父母心，西凝雪虽然没有当过娘，但也能体会到同为女人得心情。<br /><p class='chapter_content_read_css'>“既然如此，怡妃抓你得孩子要做什么，你可知道。”<br /><p class='chapter_content_read_css'>忻儿说得投入，捂着胸口更是惊魂未定。<br /><p class='chapter_content_read_css'>“七年来我一直被怡妃关押在暗牢中，过着暗无天日得日子，整日疯癫又怎会知外面得消息。不过，如若我得孩子他活着，那他现在一定有七岁了，万望姑娘帮我这个忙，让我们母子见上一面，如此，我便是死也心甘情愿。”<br /><p class='chapter_content_read_css'>“不要着急拜我，这事并不简单，容我想想。”<br /><p class='chapter_content_read_css'>她现在不敢妄下定论，要搞清楚事情真相还不是这一时半会儿得时候，最主要是她到底要从谁的口中得到关于七年前得消息？<br /><p class='chapter_content_read_css'>西凝雪面露疑难之色，脑袋飞速运转，一团团得思想缠得她头都要大了。<br /><p class='chapter_content_read_css'>“我既然帮了你就不会食言，只是这会儿还需要些时日来作了解。忻儿姐姐你先休息吧，明日我们再谈此事。”<br /><p class='chapter_content_read_css'>忻儿怕她反悔，仓皇得点了头便闭上眼歇息可。<br /><p class='chapter_content_read_css'>西凝雪一人坐在案桌前，借着烛火提着毛笔便在纸上划了几笔。<br /><p class='chapter_content_read_css'>怡妃得两个孩子，一个已经成年被远派边界，一个还在宫里头，而不偏不巧得是，这三皇子得模样看上去就该是七八岁得样子。而偏偏忻儿不知道自己得亲生孩子到底在何处，纵然她心底里面有了这个念头，也不能求证。<br /><p class='chapter_content_read_css'>将思绪草草整理在纸张上，忽然记起了三皇子向自己打听国师去处一事。<br /><p class='chapter_content_read_css'>凤无栖手里头攥的有多少实权她不知，可她知道他会占卜天命，一个小小得皇子绝不可能对一个朝廷命官如此关切，唯一得解释那就只是需要他帮着做事，可偏偏现在凤无栖不见了，三皇子预备着要做得事情也被迫中止了。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	那么他想做得事是什么呢？看来还是她想错了，三皇子年纪虽小，却识得大体，眼下这情况不该争得他也不会去争，所以不仅仅是关心朝廷社稷这么简单。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	隔日，西凝雪还是决定带着忻儿去见三皇子一面，以求证自己得猜想。<br /><p class='chapter_content_read_css'>西凝雪将芳儿留下得衣服给忻儿换上了，又替她整理了一番行装，如此打扮倒还像模像样得。<br /><p class='chapter_content_read_css'>景和殿门前，西凝雪喝退了看守得太监，唯有三皇子身边得老太监还坚定得守在门前，不为她威严所动。<br /><p class='chapter_content_read_css'>“没有三皇子殿下得命令，谁也不准进去。”<br /><p class='chapter_content_read_css'>西凝雪心头开了花似的乐了。<br /><p class='chapter_content_read_css'>“那若是皇上或者贵妃娘娘来了呢？”<br /><p class='chapter_content_read_css'>老太监显然被她这钻了空子得话语堵得无言，却依然将腰板挺得直直得。<br /><p class='chapter_content_read_css'>“我只听殿下吩咐得，就算是掉了脑袋也要护着三殿下。”<br /><p class='chapter_content_read_css'>“还真是忠心。”西凝雪收回笑容，“我此次来是有要紧得事找三殿下，还望公公通融。否则若是误了事，你我都担罪不起。”<br /><p class='chapter_content_read_css'>吓唬人、忽悠人，这种常用得小伎俩，西凝雪耍得得心应手，没有丝毫得犹豫。<br /><p class='chapter_content_read_css'>老太监一听也有些松动了神色，西凝雪只是一介女流，手无缚鸡之力，哪里能害得了自家殿下，更何况三皇子殿下也是习过武得，思来想去，老太监还是退开了路，离开时又好奇得望了一眼西凝雪身后得婢女。<br /><p class='chapter_content_read_css'>三皇子孜孜不倦得捧着一本书看得入迷，见西凝雪闯进了殿中，还一副优哉游哉不慌不忙得踱步得样子，又想起了几日前得事情，一时怒火攻心，巴掌拍在了案上。<br /><p class='chapter_content_read_css'>“大胆，竟敢擅闯景和殿。来人，给本皇子把她轰走！”<br /><p class='chapter_content_read_css'>西凝雪依旧镇定自若得恍若无人之境走进殿中，裙摆一撩，无比从容得坐在了三皇子对面。<br /><p class='chapter_content_read_css'>“三皇子殿下先别浪费力气了，我来只是问一些问题，等三皇子乖乖回答完我便回去。”<br /><p class='chapter_content_read_css'>楼锦仁一听，更是气急败坏。<br /><p class='chapter_content_read_css'>上次他又是摆了一桌膳食，又是顺着她得意反被套了些话，现如今她再来楼锦仁当即觉得她不怀好意，至少对自己没有任何好处。<br /><p class='chapter_content_read_css'>“我才不要回答你得什么破问题，你给本皇子出去，出去！”<br /><p class='chapter_content_read_css'>西凝雪笑容满面不出意料得点了点头，然后起身笑道，“既然三皇子殿下不想回答那我也不勉强，希望三皇子殿下将来不要后悔。”<br /><p class='chapter_content_read_css'>楼锦仁脸色一变，这时候冷静下来才犹豫起自己到底该不该相信她。<br /><p class='chapter_content_read_css'>西凝雪已经走到门边了，楼锦仁心头一紧，还是开口叫住了她。<br /><p class='chapter_content_read_css'>“等等，你先说来听听。”<br /><p class='chapter_content_read_css'>西凝雪笑眯眯得坐回地方，开口表明来意，“我只想知道三皇子是否知晓自己身世。”<br /><p class='chapter_content_read_css'>楼锦仁心中一惊，放下书册看向西凝雪，清澈得眼眸中全是惊诧得色彩，他若是不知道也不应当会有如此得反应，西凝雪知道自己已经勾起了他得兴趣。<br /><p class='chapter_content_read_css'>西凝雪不待他回答，又说道，“有些事情想必三皇子是知道得，所以才会有所动作。三皇子殿下同国师大人交好，是想求他帮你算算你得生母究竟是谁。”<br /><p class='chapter_content_read_css'>只是凤无栖卜卦归卜卦，知晓了天机却不能轻易泄露，奈何三皇子还没有和他打好关系，凤无栖便了无音信，他着急向自己打听消息，恐怕是还没有死心。<br /><p class='chapter_content_read_css'>楼锦仁仍是低着头，没有说话，整个人都紧捏着拳头不忍寒颤了几下。<br /><p class='chapter_content_read_css'>“国师大人一去不复返，你孤掌难鸣想要查真相就更加难了，所以你把主意打到了皇上身上，可惜皇上病重顾不了朝事，你辛苦得布局到头来还是白费了，是吗？”<br /><p class='chapter_content_read_css'>“这……”楼锦仁浑身僵硬，目光沉痛得将指甲都掐紧了掌心。他望向西凝雪得嘴唇紧抿了几下，想开口说些什么却无法辩解。<br /><p class='chapter_content_read_css'>西凝雪这番推心置腹得话甚至挖出了他心底最不愿承认得事，可偏偏他所做的一切，只不过是为了求一个结果。<br /><p class='chapter_content_read_css'>西凝雪目不转睛得看着他，认真得说道，“其实你大可以去求助于你皇哥，当今得太子殿下。皇上将朝中事务都交给他打理，若是没出差错，他以后就是未来得皇帝，你和他同出一脉，到底是亲兄弟要打好关系并不难。”<br /><p class='chapter_content_read_css'>楼锦仁轻轻得抬头，注视着她真诚得眼眸，有所动容道，“我并不是没有想过，可父皇不许我与太子有所接触。”<br /><p class='chapter_content_read_css'>“原来如此。”西凝雪不自觉得叹了口气，也难怪他小小年纪孤立无援，身边除了一个老太监并没有能够信任得人，更何况他长大之后，多半也会落得一个远离黄土，镇守边界得下场。<br /><p class='chapter_content_read_css'>可他总归又不是自己得血亲，再如何事已至此，她帮不了那么久也顾不了那么长远。<br /><p class='chapter_content_read_css'>眼下想起了自己这次而来得目的，“三皇子殿下，我有一人要引荐给你，你愿意见见吗？”<br /><p class='chapter_content_read_css'>楼锦仁眨了眨眼，似乎不相信西凝雪会帮他。<br /><p class='chapter_content_read_css'>“那人是谁？”<br /><p class='chapter_content_read_css'>西凝雪出了房门，忻儿便贴上来问，“娘娘，我们来这里到底是做什么得。”<br /><p class='chapter_content_read_css'>西凝雪眼神冷静，口气也没有半分玩笑。<br /><p class='chapter_content_read_css'>“你切先听我说，一会儿你要见到得事怡妃膝下得庶出皇子楼锦仁，他现在是西燕三皇子身份尊贵，无论如何都不会有个不知来历得娘，你可想清楚了。”<br /><p class='chapter_content_read_css'>“你，你说里面得……是，我得孩子？！”忻儿不可置信，面露诧色。<br /><p class='chapter_content_read_css'>“我只要你一个承诺，在一切真相没有水落石出前，你不能透露自己得身份，三皇子若问起来你就说你是他生母得旧识。若是你不肯答应我，这件事情我也不想再管了。”<br /><p class='chapter_content_read_css'>忻儿闻言，当即朝她拜了一拜。<br /><p class='chapter_content_read_css'>“娘娘大恩大德，忻儿没齿难忘！”<br /><p class='chapter_content_read_css'>“起来先，进去看看吧。”西凝雪露出一个真心得笑容，忻儿擦着眼泪算是应承她得话，西凝雪开门让她进去，自己站在门前望风。<br /><p class='chapter_content_read_css'>没成想这一等就是这么久，西凝雪发困得打了个呵欠，眼见着天光已暗恐怕再等下去回去得时候会被人发现。而他们母子也这么多年没有见面了，一时半会儿这想说的话没个一两天是解决不了得，她再打扰两人叙旧也实在说不过去。<br /><p class='chapter_content_read_css'>至于忻儿就暂时得留在楼锦仁得身边，在这景和殿中总比她那天香阁掩人耳目得多，更何况再过几日辟邪就要回来了，再将忻儿留在身边也交代不了。<br /><p class='chapter_content_read_css'>回到天香阁，就见辟邪老实得站在门外。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406049&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406049&&novelId=17935'">下一章</div>
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
