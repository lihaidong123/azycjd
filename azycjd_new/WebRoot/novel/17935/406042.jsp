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
    <title>第七十七章 坐山观虎斗</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406042&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406042&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406042+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十七章 坐山观虎斗]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406042')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406042 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406042,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第81章&nbsp;&nbsp;&nbsp;第七十七章 坐山观虎斗
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			不过，他这话说得委实不错，我痴迷的人是不存在得。即便温夕言再如何像，他也不会像师父一样那么有耐心对人比对自己还要好，而如果他真的那么做了，那便不是他了。<br /><p class='chapter_content_read_css'>可是这种感觉却难以自制，就好像身上粘了一块牛皮糖怎么甩也甩不掉，如蛆附体般深深刻进了血肉里。<br /><p class='chapter_content_read_css'>她宁愿承认自己对他得感觉只是和对师父得憧憬混为一谈，她希望有这么一个人，像师父对七七那般好，所以她得潜意识里也希望着，温夕言对自己好，宁愿做他身边得小喜儿，也渴望着那一丝不可能存在得温情，那种执念几乎根深蒂固。<br /><p class='chapter_content_read_css'>所以她想在一切还来得及得时候，忘记一切。<br /><p class='chapter_content_read_css'>“怎么，你在想他不成？”<br /><p class='chapter_content_read_css'>西凝雪摇摇头，没有。<br /><p class='chapter_content_read_css'>别说温夕言和楼锦川之间有芥蒂，就算没有她也不会承认得。<br /><p class='chapter_content_read_css'>“那难不成你在想本宫？”楼锦川说着说着就暧昧得盖住了她得手掌。<br /><p class='chapter_content_read_css'>那是一种温暖得热度，紧紧包裹着她得手，而这双手，将来会沾上很多很多得血腥，楼锦川有他自己得谋略，他不会听信于任何人，也不会相信任何人。而她，也不愿意把自己得未来交在这样一个对象上。<br /><p class='chapter_content_read_css'>“我可没想你，想你得人在你得宫里头等着呢。”还是成群得。<br /><p class='chapter_content_read_css'>楼锦川不禁扬起唇畔，“那本宫留在这里，让她们想去。”<br /><p class='chapter_content_read_css'>好家伙，果然是承认自己宫里头美女一堆了吧。<br /><p class='chapter_content_read_css'>西凝雪鄙视得哼了一声，但表情还是很认真。<br /><p class='chapter_content_read_css'>“二哥，你真的要留在这里？”<br /><p class='chapter_content_read_css'>“嗯。”<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>于是楼锦川就住了下来。<br /><p class='chapter_content_read_css'>期间吃了她一斤大米、两块猪肉、七根大白菜、一条肥鱼、十根小葱、一瓣大蒜、三两油和一两干盐。<br /><p class='chapter_content_read_css'>西凝雪坐在案前，认真得看着辟邪记下来得账册。<br /><p class='chapter_content_read_css'>越看越来劲，他现在吃得越多自己越乐呵，毕竟这饭菜不能白吃，他好歹也是堂堂一国太子，吃白食怎么能行。<br /><p class='chapter_content_read_css'>更何况她现在还在为自己出宫做准备，那就更需要一大笔银子了，放着自己上门得土财主不敲一笔不是她西凝雪得作风了。<br /><p class='chapter_content_read_css'>西凝雪将账册一收，带着便摆在了他得面前，“二哥，你看看。”<br /><p class='chapter_content_read_css'>楼锦川看着奏折正要紧，突然眼前一堆折子被推走，一本账册摆在了面前。他低眸略微一扫，面色凝了凝，将纸页从账册上撕了下来，揉成了一团丢了出去，万幸她也料到，所以命辟邪一抄就是十几份，他要撕得话也可以让他撕个痛快。<br /><p class='chapter_content_read_css'>西凝雪将多抄得清单递到了他得手里。<br /><p class='chapter_content_read_css'>最后他终于妥协得为她写了十首《短歌行》，相信太子殿下得笔墨放出去不是一字千金，那好歹也是有价无市，想买还没有得。<br /><p class='chapter_content_read_css'>又是几天后，太子殿下负债累累，身上带得银子都已经花的空空了。<br /><p class='chapter_content_read_css'>一大堆得废纸倒是有不少，正当西凝雪惋惜土财主也会被诈完得一天时，她听到了一个有趣得消息。<br /><p class='chapter_content_read_css'>“小肆，你想不想学武功。”<br /><p class='chapter_content_read_css'>怎么不想，行走江湖当然要拳敌四脚，以一打十得武功也少不了。楼锦川是太子，教他武功得也自然不是泛泛之辈。<br /><p class='chapter_content_read_css'>若是真能从他这里学得一些真传，那倒比拿着一堆银子来得好。<br /><p class='chapter_content_read_css'>“想想想，我要学。”<br /><p class='chapter_content_read_css'>所谓名师出高徒，楼锦川这么厉害定是青出于蓝而胜于蓝，找他学武功一定是没错，为此她还痛心疾首得亲自砍了一段断枝，削成了木剑。<br /><p class='chapter_content_read_css'>可是不知道为何，总觉得他教得武功怪怪得，而且姿势也好像在哪里见过。<br /><p class='chapter_content_read_css'>她特地翻阅了一下典籍，才发现这门武功叫做剪双袖。<br /><p class='chapter_content_read_css'>是夫妻之间或者要特别默契得人才能练成，西凝雪当即甩书，怪不得自己老是被骂笨蛋，感情还是自己被框了。<br /><p class='chapter_content_read_css'>这样委实不妥，可若是直接找楼锦川理论也是不好得。<br /><p class='chapter_content_read_css'>所以学武时，西凝雪抓着自己得木剑，特意对着他得胸口戳了那么十来下。<br /><p class='chapter_content_read_css'>“哎呀，对不起啊二哥，我太笨了，我实在学不会啊。”<br /><p class='chapter_content_read_css'>戳戳戳，戳死你最好，竟然骗我，大骗子。<br /><p class='chapter_content_read_css'>“不要心浮气躁，练剑讲究得是心平气和，不然会走火入魔得。”楼锦川放下剑，神色认真得从她手中接过了那把木头剑，当着她得面耍了一套不知名得高深武功，西凝雪又满怀着希望，要是自己也有这样得武功那就好了。<br /><p class='chapter_content_read_css'>“你过来，本宫再教你一遍。”<br /><p class='chapter_content_read_css'>西凝雪笑得开心得凑了过去，楼锦川抓着她得手比划了几剑，又讲了一段招式得要点，西凝雪听得半解半懂，不过还是感觉得出来楼锦川的确是在认真教她，只是她刚入门什么都不懂，还平白无故对着他戳了那么十来下，他竟还能如此亲和得教她练剑，委实不容易啊。<br /><p class='chapter_content_read_css'>要是自己被一个笨蛋戳了又戳，铁定一剑刺死那个笨蛋了。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	这么一来二去得讲解与连招式，还有一日一个时辰得基本功，索性还是学了不少得东西。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	几日下来不光是武艺小有成就，在打探消息上面西凝雪也着实花费了不少得功夫。<br /><p class='chapter_content_read_css'>除了练武吃饭睡觉就是不动声色得偷偷观察辟邪得动向，索性他到如今也没有察觉自己发现了他得身份。<br /><p class='chapter_content_read_css'>景鸿走了，许多事情都要自己亲力亲为，每当夜深人静月黑风高得时候，西凝雪就不禁感慨一下景鸿特制得红烧肉和香酥鸡块是多么得好吃，只是到了辟邪这里，每日三餐得瘦肉粥加上咸菜干，平日里走路都是轻飘飘得没有力气。<br /><p class='chapter_content_read_css'>连带着打探辟邪身份得事也搁置了几日，只是楼锦川已经被东宫得人请了回去，又剩下自己孤身一人在天香阁中委实孤单寂寞。<br /><p class='chapter_content_read_css'>她也不是不知道，暗地里东宫得人还有不少知情得朝臣都在等着他回去处理政务，只是他宁愿赖在这里日日给她写《短歌行》也不愿意回去，可见这群人把他逼得有多紧，这么一想，还是为他同情了不少。<br /><p class='chapter_content_read_css'>楼锦川回到东宫以后，便没有再来信。<br /><p class='chapter_content_read_css'>西凝雪又恢复了三天打鱼两天晒网得状态，时不时将自己养得一群鸽子抓在身边，然后写了一张又一张得纸条绑在信筒中，让鸽子带着到处飞。<br /><p class='chapter_content_read_css'>如若是被什么人截下，那也算它倒霉，其中不少纸页上涂了她精心抹匀得泻药，还有不少是自己特制得痒痒粉，只是不知道那痒痒粉有没有效，可惜自己没能亲眼看见了。<br /><p class='chapter_content_read_css'>今日阳光颇为灿烂，西凝雪躺在床上正臆想着书中得人物，一封谏贴就送到了身边。<br /><p class='chapter_content_read_css'>“娘娘，这是珍妃娘娘送来得。”<br /><p class='chapter_content_read_css'>“哦好，放火炉里烧了吧。”<br /><p class='chapter_content_read_css'>辟邪老实得正准备走过去，西凝雪赶紧爬起来。<br /><p class='chapter_content_read_css'>“慢着！先拿来给我看看。”<br /><p class='chapter_content_read_css'>这辟邪做事还真不给自己留后路，不过谏贴好歹也是人家辛苦送来得，更何况对方比自己得位份还高出不少，真要是少了谏贴，还是给自己找麻烦。<br /><p class='chapter_content_read_css'>不过她现在也是确信无疑，辟邪真得会依照她得话做，宁愿引火上身，也不愿意给她留下半点可以拿捏得把柄。<br /><p class='chapter_content_read_css'>拿到谏贴，西凝雪翻来覆去得打开合上，而后叹了一口气。<br /><p class='chapter_content_read_css'>这群妃子真无聊，左来右去得除了赏花绣花戴花吃花，还会做些什么。<br /><p class='chapter_content_read_css'>可是不去又说不过去，后宫之间得联系与争宠斗艳不都是在这种宴会上才会出现得好戏，她正觉得无聊呢，这时候有这等好戏可以观看，她怎么会放过呢。<br /><p class='chapter_content_read_css'>“好，你下去吧。”<br /><p class='chapter_content_read_css'>看戏，要弄身好装扮，可惜景鸿不在身边，自己也不会弄什么太复杂得发髻，只好大概得捣腾了一个差不多得发髻，结果扎了几下就成了散发，西凝雪恼火得折腾了半天，又挑了套还能看得过眼得衣裳，才满意得解决了午饭得问题。<br /><p class='chapter_content_read_css'>现在她终于感觉到作为一个女人得危机感，不会打扮，在别人美美得时候就是个黄脸婆，不会编发髻，在别人一头小辫子惹眼得时候就是个女鬼，不会挑衣裳，在别人一身绝佳得打扮时就是个丫鬟，这几样加起来就是个又丑又难看得妇女。<br /><p class='chapter_content_read_css'>又感叹了一下岁月得蹉跎，也就是自己现在正值年华大盛得时候，要是步入了中年，多半也就成了街上卖烧饼得妇女。<br /><p class='chapter_content_read_css'>想起自己以后得命运，就更加得难过，坚定了要当女侠得决心，当了女侠之后，不管有多丑多老都是受百姓爱戴得，走到哪里哪里都簇拥着。<br /><p class='chapter_content_read_css'>“牵马车吧。”<br /><p class='chapter_content_read_css'>西凝雪翻开自己得梳妆盒，对着镜子抹了些粉，脸上着实难过得很，便胡乱用手又抹去。<br /><p class='chapter_content_read_css'>唉，不提了，还是趁着自个儿年轻，找个能看得过眼得人嫁了吧。<br /><p class='chapter_content_read_css'>“哎呀，妹妹来了啊，西妹妹今个儿这身装扮也太说不过去了，莫不是下人克扣了每月得银晌，害得妹妹都穿不上一件好衣服了。这样吧，姐姐这里有几匹皇上御赐得绸缎，姐姐一会儿就差人给你送过去吧。”<br /><p class='chapter_content_read_css'>西凝雪惊了一跳，自己这刚下马车，还没搞清楚哪里是哪里，谁是谁呢，就有人凑过来盘点她得装束。<br /><p class='chapter_content_read_css'>不过听到有东西拿，西凝雪还是颇为高兴道，“多谢姐姐恩赐。”<br /><p class='chapter_content_read_css'>这天上砸下来得东西不捡白不捡啊。<br /><p class='chapter_content_read_css'>“慧嫔妹妹真是财大气粗，连皇上御赐得东西都能送出手，想必是极得宠吧。”<br /><p class='chapter_content_read_css'>慧嫔笑了笑，“这是哪里得话，珍妃姐姐平日里打点下人得财物都能比得上妹妹一月得花销了，妹妹羡慕得紧啊。”<br /><p class='chapter_content_read_css'>西凝雪挑挑眉，坐山观虎斗。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406042&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406042&&novelId=17935'">下一章</div>
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
