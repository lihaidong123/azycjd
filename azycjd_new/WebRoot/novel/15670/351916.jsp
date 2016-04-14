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
    <title>（三）信中现拼音字母 玉湖知穿越真相</title>
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
	<script language="javascript">var novelId='15670';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351916&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351916&&novelId=15670";
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
					window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351916+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三）信中现拼音字母 玉湖知穿越真相]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351916')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'">公子，请上钩</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:官秋月</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351916 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351916,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第4章&nbsp;&nbsp;&nbsp;（三）信中现拼音字母 玉湖知穿越真相
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  花厅里，南宫宁雪坐在上位，南宁坐在客位，小桃和刚刚换好衣服的衣蓝站在二人面前，气氛有些沉闷。<p class='chapter_content_read_css'>  良久，南宫宁雪才开口：“衣蓝，你说一下到底是怎么回事？”<p class='chapter_content_read_css'>  “禀公子，属下按照公子的吩咐去书房取秦姑娘的东西，刚进苑里就看到一个人从公子书房里出来，刚想训问他怎么会进书房，他就扬手向我撒了药粉，虽然躲了过去跟他过了几招，却突然头晕眼花不省人事，再后来就是秦姑娘泼醒了属下。”<p class='chapter_content_read_css'>  “这样啊，那你有没有看清他的脸？”继续问。<p class='chapter_content_read_css'>  衣蓝低头想了想，摇摇头，“属下也记不清了。”<p class='chapter_content_read_css'>  “后遗症啊，后遗症。”南宁托着下巴，喃喃自语，猛然想起来，激动地站起来，“那，那，我的东西呢？”<p class='chapter_content_read_css'>  “怕是，秦姑娘的东西是被偷了。”南宫宁雪很是抱歉的站起来朝她拱手，“既然秦姑娘的东西是在在下的府中丢的，在下一定会给秦姑娘一个交代的。”<p class='chapter_content_read_css'>  瞬时，南宁感觉骨头都是凉的，竟然丢了，那可是她的全部身家性命。<p class='chapter_content_read_css'>  “啊，对了，”衣蓝突然掏出了一封信，“属下在刚才换衣时发现了这封信，或许，秦姑娘的东西还有转机。”<p class='chapter_content_read_css'>  南宁上前一步夺过了信封，粗暴的撕开，细细看来，脸色一变。<p class='chapter_content_read_css'>  “应当是那贼人趁衣蓝昏迷时放在衣蓝衣物中的。”南宫宁雪若有所思道：“但是，他到底有什么目的？”又见南宁面色古怪，也凑近看信，面露不解，信上的字符似是在哪儿见过，凝神一顿才想起来，是西苍国的文字，又有些不像。<p class='chapter_content_read_css'>  Ruoshiyuqushu menghunyuhubian<p class='chapter_content_read_css'>  “若是欲取书，梦魂玉湖边。”南宁轻声念出，心里倒是不解，招魂香，汉语拼音这些东西都是不该在这里出现的，还有偷东西的那个人，莫非，是自己的熟人？还有那个落款，南宁又深深地看了一眼。只有一个简体的“绘”字。好像在哪里见过。<p class='chapter_content_read_css'>  “唔，哪里呢？”南宁不自觉地问了出来。<p class='chapter_content_read_css'>  “秦姑娘刚才说‘玉湖边’，会不会是春言兰阁东边的玉湖？”南宫宁雪提醒道。<p class='chapter_content_read_css'>  “啊！想起来了！”南宁想了良久才想起来原来在秦泽生的书桌上看到过这样落款的信，不过，那和师父又有什么关系呢？神情又迷惑起来，完全忽略了南宫宁雪的话。南宫宁雪见她如此，也没打扰只是遣了小桃下去，自己则和衣蓝回到华苑。刚才南宁在华苑里熏了另一种香，现在进去已经无碍了。<p class='chapter_content_read_css'>  “衣蓝，你当真回想不起来那人的模样吗？”南宫宁雪环视了书房四周，除了南宁的那两样东西，别的什么也没丢。<p class='chapter_content_read_css'>  “公子，属下虽然想不起来那人的模样，却还记得那人的招式，好像，”衣蓝顿了顿，“好像是国师的‘流云剑’。”<p class='chapter_content_read_css'>  “国师？”南宫宁雪敛眉，“怎么可能，国师早就失踪了，也没听说他有徒弟。”<p class='chapter_content_read_css'>  “属下也不敢确定。”<p class='chapter_content_read_css'>  “罢了，让陌雪阁的人再继续调查她，一个人，怎么可能一点过往都没有，她若是云殇派来的奸细就糟了。还有玉湖，派几个人盯着些。”<p class='chapter_content_read_css'>  “诺。”衣蓝心里虽然觉得南宁还不错，应当不会是奸细，但一想自家公子的处境，又不得不更加谨慎些。<p class='chapter_content_read_css'>  南宫宁雪眼眸一暗，写了封密信，招来了信鸽，绑在鸽腿上又放出去。<p class='chapter_content_read_css'>  南宁在花厅里站了良久，直到腿麻的快要站不住才回过神来，想了这么久也没想通什么，但意识到一个积极严重的问题，啊，她的早饭、午饭都没有吃啊！不知道这个时辰到厨房里还有没有吃的。<p class='chapter_content_read_css'>  虽说可能有诈，南宁还是决定到玉湖去一趟，本来南宫宁雪说是让衣蓝跟在她身边，也好有安全保证，但被南宁拒绝了。<p class='chapter_content_read_css'>  南宁走在街上，总觉得有双眼睛一直盯着自己，但每次寻着那道目光找去只会看到一群平头小老百姓。<p class='chapter_content_read_css'>  深吸了一口气，抬脚继续往前走，忽然呆了一下，从袖筒里掏出一张纸条看了看，往四周瞅瞅，又看几眼，将纸条折了几折重新放回袖筒里，猛然转身迅速相反的方向走去，嘴里还在喃喃自语。<p class='chapter_content_read_css'>  就在那一瞬，两道身影迅速往人群中一挤，其中一人拍拍胸口，冲同伴道：“吓死咱了，还以为她看见咱了，不过，她为啥突然朝这边走？”<p class='chapter_content_read_css'>  衣蓝看了他一眼没搭话，心想，怪不得秦姑娘清早让我画张路线图……<p class='chapter_content_read_css'>  不多时，拐来拐去，周围逐渐寂静下来，冷风袭来，南宁紧了紧衣领，倒有几分初春乍寒的意味。<p class='chapter_content_read_css'>  模模糊糊看见玉湖湖心有个身影，再走几步靠近，只望见一个背影，湛蓝色的锦袍，双手负在背后，似在等人。平静的看了那人一会儿，快步走向亭子，藏在袖中的手又紧了几分。<p class='chapter_content_read_css'>  “你……”<p class='chapter_content_read_css'>  “果然高估你了，又是迷路了吧。”那人打断她的话头，缓缓转过身来，一双琥珀色的眼瞳映进南宁眼中，南宁疑惑的贴近他，为了确认什么，伸出手就要扯掉他头上遮住头发的斗笠，被他一把抓住手腕，那冰凉的温度让南宁的意识回拢了一下。<p class='chapter_content_read_css'>  “有人跟踪你。”他突然扯过她，嘴唇贴在她耳廓，一挥宽袖一道结界便布在亭子四周，二人就凭空消失在衣蓝等人眼中。<p class='chapter_content_read_css'>  “这下就没事了吧。”南宁抬腿踢了他一下，毫不客气地扯下斗笠，满头银发倾洒而下，垂到腰间。<p class='chapter_content_read_css'>  “你是，书绘音？”南宁看到他的银发，心里稍微有底些，但还是问了一句。<p class='chapter_content_read_css'>  “真是没大没小，怎么也该喊我一声‘师兄’。”书绘音用布帛将头发拢了拢，平静地看向她，就连斥责的话也没有一丝起伏，就如同他的体温一般，冷冷冰冰的。<p class='chapter_content_read_css'>  “如果不是你的银发，还有那冷死人不偿命的体温，我还真认不出来你，不过，你怎么会在这儿？”南宁审视般的看着他。<p class='chapter_content_read_css'>  “不用怀疑，跟你想的一样。”书绘音优雅的坐到石凳上，将南宁手中捏着的斗笠截过来，放在石桌上，伸手拿过茶壶，倒了两杯热腾腾的红茶，摆出“请”的手势。<p class='chapter_content_read_css'>  南宁看他倒出两杯热茶，心里便知他早已将火字运用的驾轻就熟，也不推脱，坐下，抿了一口茶，才道：“他老人家干什么算计到我身上来？还有，到底怎么样才能回去？”<p class='chapter_content_read_css'>  “不只是你，连我也一块算进去了，十有八九是想磨练磨练你，至于回去，”他掏出古书，翻了几页，转过书去，用食指微长的指甲抵着几行字，“这七圣珠乃是上古时某上神遗失在尘世的神器灵物，可以扭转时空界速，从而达到空间跳转的目的，也就是现代所说的‘穿越’。”<p class='chapter_content_read_css'>  “你的意思是要集齐这七圣珠，才能回去？看什么玩笑，如果那七圣珠恰好有几颗落在现代，或是什么别的空间里，那怎么办，总不能永远回不去吧？难道就没别的办法？”<p class='chapter_content_read_css'>  书绘音又将一只做工精致的耳坠掏出，站起身戴到南宁左耳上，通透的湖心石中流转着光晕，血红色的玉丝抽条而出绕成细致的半环围在湖心石四周。<p class='chapter_content_read_css'>  南宁摸上耳垂，指尖传来丝丝暖意。<p class='chapter_content_read_css'>  “无论怎样，你只能先开始收集七圣珠了，放心，以你的本事在这里也丢不了小命吧，嗯？”<p class='chapter_content_read_css'>  书绘音的袖摆在南宁眼前一晃，南宁闭了闭眼，再睁眼时便没了书绘音的身影，只在桌上留了一封信，还有冒着热气的茶水。<p class='chapter_content_read_css'>  南宁将信收回袖中，漫不经心的望望周围，快步离开。<p class='chapter_content_read_css'>  衣蓝站在很远的树后，微不可见地沉了沉眼神。<p class='chapter_content_read_css'>  <p class='chapter_content_read_css'>  古华苑书房中，南宫宁雪沉心捏笔蘸墨，提笔在纸上写下几列行书，轻轻提笔收尾，将毛笔放进笔洗中，静静的看着那几列小字，弯弯的唇角渐渐放松下来化为面无表情。<p class='chapter_content_read_css'>  “紫荆花”，南宫宁雪扫过这几个字，眼眸沉了沉，他人只知君玄观的南宫神医酷爱紫荆花，却不知喜爱此花的另有其人，便是他的母亲。<p class='chapter_content_read_css'>  不过半刻钟，衣蓝便回来了，将他看见的一切如实禀告给南宫宁雪，南宫宁雪没有言语，看向窗外，远远就看见一只白鸽，尾梢是娇艳的紫，很是灵巧的落在南宫宁雪抬起的胳膊上。<p class='chapter_content_read_css'>  南宫宁雪打开信鸽腿上的纸条，瞥了一眼，递给衣蓝。<p class='chapter_content_read_css'>  衣蓝也是面色一白，单膝跪在地上，低头道：“是属下失职，还请公子责罚。”<p class='chapter_content_read_css'>  “并非是你的过错，这次大哥竟然能够找到陌雪阁，定是有人相助，即使他知道我的身份，又能动我几分？”南宫宁雪喂给了鸽子几粒小米，将鸽子放回窗台上，又从书桌内阁中掏出一封鎏金烫边的名帖，淡淡道，“这是司家送来的请柬，看来也是为了钓大鱼了。”<p class='chapter_content_read_css'>  衣蓝站起身，看看名帖上的墨字，便知晓了他的心思，接过名帖点头称诺。<p class='chapter_content_read_css'>  既然司家为了钓大鱼而请他去，那么，他就稍稍利用一下好了。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351916&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351916&&novelId=15670'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')"/>
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
