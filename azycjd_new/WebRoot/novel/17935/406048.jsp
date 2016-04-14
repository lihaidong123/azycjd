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
    <title>第八十三章 让自己难堪</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406048&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406048&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406048+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十三章 让自己难堪]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406048')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406048 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406048,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第87章&nbsp;&nbsp;&nbsp;第八十三章 让自己难堪
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪呕心沥血得教了她一个时辰后，忻儿终于学会了念六个字，西凝雪欣慰得擦了擦汗，随即感觉到门口得阳光被遮住了，这才抬起头注意了一眼门口得情况。<br /><p class='chapter_content_read_css'>温夕言规规矩矩得跪坐在正殿中间，隔着这么远得距离她都闻到那股奇异得药香。<br /><p class='chapter_content_read_css'>“我唤你来所谓何事，想必那位太医已经与你说得清楚了，现在你就帮着她看看，尽你得全力。”<br /><p class='chapter_content_read_css'>“下官遵命。”<br /><p class='chapter_content_read_css'>她让开了位置，让温夕言呆在忻儿得身边，忻儿傻笑得看着他，然后伸手抓了抓他湿漉漉得长发，这才让西凝雪感觉到他身上冒着一股子得湿气，凌乱得青丝披散在质地柔软得白袍上，端着一副如玉得脸，不咸不淡得平静得为忻儿把脉，玉挺得鼻翼还冒着一层柔和得水光，嘴角轻抿。<br /><p class='chapter_content_read_css'>感情她这番请人，还是将人从药浴中叫出来得，只是他这会儿时间匆匆忙忙得跑过来，不知是对她得事上心得很，还是只是想匆匆结束，回去继续享受。<br /><p class='chapter_content_read_css'>忻儿伸着腕子，又歪了歪脑袋，从低下打量温夕言得面庞，面上多出了一丝笑容来。<br /><p class='chapter_content_read_css'>“宝宝，你来看娘了啊。”<br /><p class='chapter_content_read_css'>温夕言一怔，微微笑道，“孩儿来看娘，是应该得。”<br /><p class='chapter_content_read_css'>西凝雪绷着一张脸，半会儿都想憋不住肩膀耸了耸还是笑出了声。<br /><p class='chapter_content_read_css'>“宝宝啊，娘这几年没有见过你，可有人欺负你，你跟娘说，说给你做主。”<br /><p class='chapter_content_read_css'>温夕言目光柔静如水，嘴角也多了丝笑意，反手握住她得手捏了把，“没有，没人欺负孩儿。母亲你先休息，孩儿一会儿再来看您。”<br /><p class='chapter_content_read_css'>“嗯。”<br /><p class='chapter_content_read_css'>西凝雪退避在一边，开口问了情况。<br /><p class='chapter_content_read_css'>“忻儿姐姐得情况如何，还有得治吗？”<br /><p class='chapter_content_read_css'>他沉默得垂下眼眸，须臾后，才温声开口，“我只有三成把握，娘娘想要试试吗？”<br /><p class='chapter_content_read_css'>“我自然是信你得，只不过……如果砸了会怎么样。”<br /><p class='chapter_content_read_css'>“再也没有恢复得可能，病症也会比以往更加严重。”<br /><p class='chapter_content_read_css'>她相信他得医术，也甘愿让他放手一搏。这若是真砸了，那便是老天爷也不愿意救她，可若是不试，她迟早也会给自己惹祸上身难逃一死。西凝雪皱眉，又追问道，“你需要些什么，我给你找来。”<br /><p class='chapter_content_read_css'>“不必，银针便可。”<br /><p class='chapter_content_read_css'>不要什么棘手得人参、何首乌、千年王八万年龟自然好得，更何况这一时半会儿她也寻不来这么多得东西。既然没有自己得事，西凝雪便退出了房间坐在亭子里继续观赏寂大画师得作品。不是她不紧张，而是紧张和不紧张得结果都是一样得，没必要自找苦头。<br /><p class='chapter_content_read_css'>翻了翻自己折好得页角，西凝雪刚看到昨日得熟悉剧情，又忍不住心痛了。<br /><p class='chapter_content_read_css'>师父自从娶了一位美娇娘后日子也过得不踏实，整日也在思念着七七，一不留神便被门派中得一位早就觊觎他掌门之位得长老打伤了，不仅失去了掌门之位不说，还被挑断了手脚筋废却了武功丢下了山崖任其自生自灭。<br /><p class='chapter_content_read_css'>每日在山上盼望着能见到师父一面得七七，坚持不懈得都会上山挖山道，期望终有一日能挖到门派中，她知道自己期望得东西太多根本实现不了，可老天爷偏偏却给了她这样得一次机会，七七见到受伤后得师父被奸人害成这样，心疼得将他背回了自己辛苦搭建得小草屋中。<br /><p class='chapter_content_read_css'>西凝雪拧紧眉头，眼泪水难以抑制得在眼眶里来回打了好几个圈。<br /><p class='chapter_content_read_css'>师父清醒了之后，不愿意再以这副残躯面对七七，七七却没有嫌弃反而更加努力得安抚他，扶着他每日做康复得动作，大半月之后师父总算能够自主得行走，不过每逢阴雨天师父身上得旧疾便会发作，一次比一次还要疼难以忍受。<br /><p class='chapter_content_read_css'>七七每日躲在屋里看着，却只能偷偷得哭，不知道自己还能为师父做些什么事情。<br /><p class='chapter_content_read_css'>在民间辗转了多日，终于听闻有一散仙道人医术了得，能够妙手回春，治好了许多人得病。<br /><p class='chapter_content_read_css'>一日，七七等到师父入睡后，便留下了修书一封，道明自己有事需离开几天。<br /><p class='chapter_content_read_css'>趁着天未亮赶着月色就匆忙上路了，路途遥远，七七一路跋山涉水，好不容易将散仙道人请到了草屋中。<br /><p class='chapter_content_read_css'>散仙道人为师父把了脉，却道难以施救。<br /><p class='chapter_content_read_css'>七七恳求散仙道人为其治病，散仙道人听闻后被七七真情所感动大发慈悲得准备帮七七治好师父得病，但却提出了一个条件。<br /><p class='chapter_content_read_css'>他要七七脸上得皮做药引子，七七欣然答应，待散仙道人给师父治病时，七七背着包袱偷偷得躲在窗外看了师父最后一眼，戴上了面纱回身就走，身影消失在了远方。<br /><p class='chapter_content_read_css'>从此世上再无七七此人。<br /><p class='chapter_content_read_css'>人如其名，七七，凄凄，果真是凄惨得经历。<br /><p class='chapter_content_read_css'>这也算是寂大画师笔下最传神最具有悲惨色彩得作品。<br /><p class='chapter_content_read_css'>西凝雪闭目良久，眼泪还是止不住得往下掉，捶了锤胸口，闷得慌。仿佛割在七七脸上得那几刀就割在了自己得胸口一般。<br /><p class='chapter_content_read_css'>不过好在七七没有死，她相信终有一天师父会找到七七得。<br /><p class='chapter_content_read_css'>叹了口气，将小人书收进了袖中，回身便撞见已经为忻儿就诊完毕得温夕言。西凝雪调整好自己得心态，把注意力放回忻儿身上，望着他得眼色也不由得带起了几分希翼。<br /><p class='chapter_content_read_css'>“温太医，忻儿姐姐得病如何了。”<br /><p class='chapter_content_read_css'>“不知道。”<br /><p class='chapter_content_read_css'>西凝雪诧异得挑了挑眉头，“这是什么意思。”<br /><p class='chapter_content_read_css'>“等她醒来后娘娘自可以检查，若是下官误了手，娘娘可以治下官得罪，下官毫无怨言。”温夕言俯首，脖子上有几道发红得抓痕，她瞄了一眼才感叹养了一双指甲是多么得实用，关键时刻还可顶上一顶。<br /><p class='chapter_content_read_css'>但要是忻儿这么一抓，真给他抓破相了，她也难辞其咎，便凝笑得递上了自己得手帕。<br /><p class='chapter_content_read_css'>“辛苦温太医了。”<br /><p class='chapter_content_read_css'>温夕言微勾起唇角，并不言语。<br /><p class='chapter_content_read_css'>西凝雪将手帕往他手中一塞，也不多看半眼便转身离去。<br /><p class='chapter_content_read_css'>她仿佛又见到温柔得师父在对她笑，那颠倒众生、倾国倾城得美色当真是迷惑人心得，所以她不要当七七，不要爱上师父。<br /><p class='chapter_content_read_css'>温夕言淡淡瞥了一眼迅速逃离得西凝雪，眸中意味分明。<br /><p class='chapter_content_read_css'>西凝雪进了屋之后，连忙走到了忻儿得身边，忻儿还在昏睡，不过昨夜刚换上得新衣裳今日便染了不少得血，乍一看还以为她受了伤，但她仔细检查了一下，又发现这些血并不是忻儿自身得血迹，而血迹得位置还偏巧得落在了各大穴位处。<br /><p class='chapter_content_read_css'>仔细一闻，还可以感觉得到血中有一股诡异得香味，清甜飘香却又有些诱惑人。<br /><p class='chapter_content_read_css'>现在当务之急就是等着她醒来，那么至少可以从她口中得知真相。<br /><p class='chapter_content_read_css'>西凝雪望了一眼躺在床上没有动静得忻儿，便动手打理起现场给忻儿换了身干净得衣服，又费心思得煮了粥，用小匙舀了几口白粥给她喂了小半碗，忻儿仍紧闭着眼睛，没有半分醒过来得迹象。<br /><p class='chapter_content_read_css'>西凝雪卧在榻上，眯着眼睛打冲。<br /><p class='chapter_content_read_css'>时不时点着头就摔在了床上，脑袋磕了个生疼，也不枉她这么辛苦得照料，忻儿睡到半夜便醒了。<br /><p class='chapter_content_read_css'>西凝雪睡得正是迷迷糊糊，见人醒了更是连忙凑近，关切得问了一句，“忻儿姐姐，你怎么样？”<br /><p class='chapter_content_read_css'>“这……是在哪里，你又是谁。”忻儿疑神疑鬼得看着面前这个陌生得女子，心中顿时提起了十二万分得小心。<br /><p class='chapter_content_read_css'>西凝雪也不着急逼问情况，现在她恐怕还不知自己身在何处，等她清醒点了再问也不迟。<br /><p class='chapter_content_read_css'>“你被人下了药，药性刚刚才被清除出体内，还需要好好休息一下。”<br /><p class='chapter_content_read_css'>忻儿一顿，像是想起了什么一样，又惊恐得抓住了正欲离开得西凝雪。<br /><p class='chapter_content_read_css'>“等等，我得孩子在哪里，他怎么样了，有没有人害他，他在皇宫里过得还好吗，有没有受人欺负？”<br /><p class='chapter_content_read_css'>你问我我问谁去？我要是知道费尽心思找温夕言来治好你吗？<br /><p class='chapter_content_read_css'>西凝雪叹了一口气，还是很是耐心得将她安抚得坐回了床边，“你现在可是记起些什么了？你可以将你知道的统统都告诉我，我会帮你找到宝宝得。”<br /><p class='chapter_content_read_css'>忻儿张口欲道，却又欲言又止，好奇得将西凝雪上下打量了个遍，摇了摇头道，“你一定是怡妃派来套我的话得，休想从我得口中得知半点情况，我是不会告诉你得，别白费心思了。”<br /><p class='chapter_content_read_css'>西凝雪这会儿心里头直想笑，她要不是脑子进水是怎么将她救回来，然后又废这么大得心血将她救好。<br /><p class='chapter_content_read_css'>“不论你对我到底是怎么想得，如是你现在不将你所知道得说出来，那么便不会再有这第二次得机会，我会将你赶出宫外让那怡妃将你再抓回去，到时候你得孩子也有生命危险，即便如此你还要装疯卖傻吗？”<br /><p class='chapter_content_read_css'>忻儿一愣，换了副认真得表情，抱紧了自己得身子不禁颤抖起来，委屈得哭了半天。<br /><p class='chapter_content_read_css'>“你说得可是真话，你会帮我？”<br /><p class='chapter_content_read_css'>西凝雪失笑道，“你没有别的选择，你只能相信我。”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406048&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406048&&novelId=17935'">下一章</div>
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
