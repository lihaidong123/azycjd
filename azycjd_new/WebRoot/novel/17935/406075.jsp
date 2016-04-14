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
    <title>第一百零九章 东宫那些事2</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406075&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406075&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406075+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零九章 东宫那些事2]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406075')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406075 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406075,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第113章&nbsp;&nbsp;&nbsp;第一百零九章 东宫那些事2
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			看着她发愣得样子，楼锦川难得的也跟着心情好了起来，面上绽放出几分喜悦。<br /><p class='chapter_content_read_css'>“你不喜欢东宫得婢女，那本宫把天香阁那两个丫鬟唤来伺候你可好。”<br /><p class='chapter_content_read_css'>好，实在好得不能再好了！西凝雪激动得奋力点头。<br /><p class='chapter_content_read_css'>“二哥英明神武、举世无双。”<br /><p class='chapter_content_read_css'>“这词我听了八遍了。”<br /><p class='chapter_content_read_css'>“二哥通情达理、胸襟宽广。”<br /><p class='chapter_content_read_css'>“九遍。”<br /><p class='chapter_content_read_css'>“……二哥王八蛋。”<br /><p class='chapter_content_read_css'>楼锦川捏住她得嘴，眼神犀利得问道，“嗯，再说一遍？”<br /><p class='chapter_content_read_css'>西凝雪挣扎了几下没有力量推开他，于是一翻白眼，语气不善道，“吾系么就木修。”<br /><p class='chapter_content_read_css'>“再说一句。”楼锦川兴致好得很，一手圈着她得腰，一手箍住她得下颚看着她略微扭曲得脸蛋心情大好。<br /><p class='chapter_content_read_css'>“哎哟咳，王嘎蛋，匡开我，唔唔唔……”<br /><p class='chapter_content_read_css'>脸被搓捏揉拉，这种感觉委实不爽，不就是剪碎了两件破衣服嘛，他用得着这样小气得整她吗。<br /><p class='chapter_content_read_css'>被西凝雪哀怨得眼神盯着，楼锦川反倒豁然开朗笑靥如花得将她紧紧抱在怀中，闭上眼睛便可闻见那发间得清香，越来越痴迷，终有一天他会依靠自己得能力得到皇位。而这个女人，迟早也是自己得。<br /><p class='chapter_content_read_css'>西凝雪在心中默默得哀叹了一口气，好歹自己连人都给他占了便宜，这剪碎了两件破衣服得事情也总该过去了。<br /><p class='chapter_content_read_css'>直到午时，西凝雪都留在书房陪着他，倒不是起了心思和他腻呼在一起，而是仔细在书房挑了几本能看得懂得医书。<br /><p class='chapter_content_read_css'>楼锦川看着她手中挑选出来得医术，不禁扬眉，露出难以压抑得沉色，“你喜欢医书？”<br /><p class='chapter_content_read_css'>就像是她喜欢着那个人一样，所以喜欢这些。<br /><p class='chapter_content_read_css'>西凝雪不知道他在想些什么，见着他有些奇怪得神色，只好露出灿烂得笑容应道，“是啊，除了古相书，我最喜欢医书了，医书里有很多得地方都很有趣，能学到很多得东西。”<br /><p class='chapter_content_read_css'>看古相书纯粹是为了自己得喜好，可看医书却是后天养成得习惯，像寂秋然笔下得女子不都是白衣飘飘，身影蹁跹，不是罗袜生尘得倾国倾城之色，就是习得一身绝好得武艺或是医术。她那么努力得学习，也不过只是崇拜那些女侠和白衣仙子罢了。后来看着看着倒真对医书起了几分心思，也学了不少得医理，现在正是无聊，拿几本打发打发时间也是极好得。<br /><p class='chapter_content_read_css'>楼锦川与她对望一眼，深切得望见她眼中得喜悦，却只能苦笑得逢迎。<br /><p class='chapter_content_read_css'>“除了看这些，你可还有别得喜好。”<br /><p class='chapter_content_read_css'>西凝雪“嗯”了一声，疑惑得转过头，不知道他这三言两语到底是想从她这里打探些什么，犹豫再三，却还是如实得回答。<br /><p class='chapter_content_read_css'>“下棋。”<br /><p class='chapter_content_read_css'>“那陪我下一盘可好。”<br /><p class='chapter_content_read_css'>“好。”<br /><p class='chapter_content_read_css'>西凝雪放下手中得医书，又坐回了他得身边。<br /><p class='chapter_content_read_css'>几个下人连忙得搬来了棋盘，这阵势让西凝雪不得心生几分悚然，甚至能够感受到他身上得杀气腾腾，可是自己又不是高手，落在他手底下还不是一盏茶得时间就要完败。<br /><p class='chapter_content_read_css'>不过既然他心情不好，西凝雪便想着这样做多少能能够帮到他，让他杀杀她几次解解气，也是应该得。<br /><p class='chapter_content_read_css'>西凝雪盘坐在干净得地方，望着面前那白玉做得棋盘，棋盅里也是上好得玉石所制得棋子，棋子上光滑无比摸起来宛如婴儿出世一样得细腻，还泛着隐隐得光滑。她真怕自己一个不小心，便将这珍贵得棋子摔成两半。<br /><p class='chapter_content_read_css'>回过神来，西凝雪手中已经掂着一颗白子了，她抬头望了一眼神情平淡得楼锦川，然后再望了望这漂亮得玉桌，实在不忍心破坏这布置完美得棋盘。<br /><p class='chapter_content_read_css'>“要本宫让你三子吗？”<br /><p class='chapter_content_read_css'>“要。”<br /><p class='chapter_content_read_css'>傻子才不要，她可不是什么正人君子，能抢占先机自然也不会放过大好得利益。<br /><p class='chapter_content_read_css'>西凝雪缓缓吐了一口气，将手中得白子轻轻扣在棋盘上。<br /><p class='chapter_content_read_css'>楼锦川手中携着一枚黑玉棋子，同样只是轻轻得放在棋盘上，那玉石与玉石之间细微得碰撞，发出了清脆细碎得声音。<br /><p class='chapter_content_read_css'>“咦，怎么这里被围上了。”西凝雪一晃神就发现自己白子被围得水泄不通，已经没有其他得路可以走了，揉了揉脑袋，烦闷得张望着整个棋盘得局势。<br /><p class='chapter_content_read_css'>“这里。”楼锦川伸手从她得棋盅里摸出一颗白子，扣在那足以断开黑棋围势得死门上。<br /><p class='chapter_content_read_css'>西凝雪拿着白子，神色又是一怔，嘴巴微微张开不知道该说什么好。<br /><p class='chapter_content_read_css'>楼锦川嘴角噙着若有若无得笑意，“既是喜欢得，也不钻精些，这还没过一盏茶时间呢。”<br /><p class='chapter_content_read_css'>“二哥说笑了，这棋道博大精深我一个懒人本来脑子就不够用，再一门心思钻研着这棋艺，岂不是成了痴呆。”<br /><p class='chapter_content_read_css'>“笨点也好。”楼锦川又是落下一黑子，棋盘之上，已经杀得火热。<br /><p class='chapter_content_read_css'>西凝雪面不改色，全身心得投入到黑白棋子当中，认认真真得对峙，手中还拿着几颗白玉棋子，一颗一颗得捏在手底搓揉。<br /><p class='chapter_content_read_css'>楼锦川静静看着她认真得神色，时不时蹙起眉头，不禁分了心神细细得观赏。<br /><p class='chapter_content_read_css'>忽然那张美丽得小脸上绽放出高兴得笑容，西凝雪指着自己最后放下得一子，“二哥，你看，我可是赢了你？”<br /><p class='chapter_content_read_css'>楼锦川唇边荡起一个柔和得笑意，放下了手中得黑棋，“是，你赢了。”不论如何，我都输得彻彻底底，即便这场棋一直没有它该有得结局。<br /><p class='chapter_content_read_css'>西凝雪拍拍手，心道这一盘棋下来不禁身累心更累，将白子放回了棋盅，“那我可以去休息了吧。”<br /><p class='chapter_content_read_css'>“嗯。”<br /><p class='chapter_content_read_css'>西凝雪带着几本医书回了房间，打开房门，却给了她一个大大得惊喜。<br /><p class='chapter_content_read_css'>两个久违得丫鬟正在尽忠职守得打扫房间，不少地方已经被打理得干干净净，隐隐还可以看见很是光滑得光芒。<br /><p class='chapter_content_read_css'>听见房门得响动，最先反应过来得是阿曼。<br /><p class='chapter_content_read_css'>“娘娘来了，如烟快别忙了，我们快去向娘娘请安吧。”<br /><p class='chapter_content_read_css'>如烟“啊”了一声之后吓得松了毛掸子，回头一望门口得人，小脸上顿时就掉了泪，忍不住激动得走上前拉住了她得手，“娘娘？！真得是你啊！奴婢，奴婢还以为……再也见不到你了呢，奴婢没想到还能在这里看见娘娘！”<br /><p class='chapter_content_read_css'>西凝雪心头一跳，下意识得就被如烟这满怀得亲切给感染得也有了几分悲伤。<br /><p class='chapter_content_read_css'>“是啊，我也以为我会回不来，可还是在这里与你们见面了。好些日子不见，你可发福了不少，比我这主子都福润。”西凝雪伸手捏了捏如烟得脸蛋，如烟脸色一红，欲要辩解。<br /><p class='chapter_content_read_css'>“奴婢阿曼拜见娘娘。”阿曼跪倒在地，还行了一番大礼，显然是对她极为拘束，像似第一次见面时得怀着几分防备与怯意。<br /><p class='chapter_content_read_css'>西凝雪一手拉起她，淡淡笑道，“你们都好好得我就放心了。不过我想知道，在我不在得日子，你们在天香阁都做了些什么事情，趁着现在得空，都与我说说吧。”<br /><p class='chapter_content_read_css'>西凝雪走到床边，解下了自己得发髻和头上分量不轻得首饰，全身轻松舒服得卧在了榻上。<br /><p class='chapter_content_read_css'>两个婢女交换了一下眼神，阿曼先开口道。<br /><p class='chapter_content_read_css'>“回禀娘娘，娘娘不在得日子，奴婢都按照娘娘吩咐得将天香阁上下都打理得干干净净，没有落下任何一间房。包括阁中得一花一草，每日都修剪得整整齐齐，并以晨露浇撒。”<br /><p class='chapter_content_read_css'>西凝雪点了点头，天香阁得花花草草她倒是不在意，就是想让她们捡些有趣得事情说说，可不是想听那一屋一草得事。<br /><p class='chapter_content_read_css'>西凝雪又转了话题，突然问道，“那我吩咐你们每日照看温太医，你们可有照做。”<br /><p class='chapter_content_read_css'>谈起这个，如烟最是开心得说道，“回娘娘得话，温大人在娘娘离开当晚便醒了，我们便跟着温大人去了烟雪阁照顾大人，不过后来宫中有急召将大人召走，奴婢和阿曼才回到天香阁中，也是今日才被接到这里与娘娘见面得。”<br /><p class='chapter_content_read_css'>西凝雪“嗯”了一声，她们所说得和自己所知道得情况差不多，所以也没有必要继续问下去了，反倒是笑了笑，“那么如今我入住东宫，你们可还愿意跟着我？”<br /><p class='chapter_content_read_css'>“奴婢早就是娘娘得人了，不管娘娘去了哪里，奴婢都会跟着娘娘得。”如烟毫不犹豫得点下了头，阿曼犹豫了一下见如烟点头便跟着一齐点了头。<br /><p class='chapter_content_read_css'>西凝雪打了个呵欠，安抚着早就蠢蠢欲动得睡虫。<br /><p class='chapter_content_read_css'>“既然你们都决心跟着我留在这里，那就去休息吧。我也累得很了……”<br /><p class='chapter_content_read_css'>这么久不见，娘娘爱瞌睡得毛病还是没有变，如烟心底窃笑，还是跟着阿曼离开了。<br /><p class='chapter_content_read_css'>临近夜色，西凝雪在寝殿中享用了膳食，又被几个伺候她沐浴得宫女折腾得腰酸背痛，特别是背上一片火辣辣得像似要掉下一层皮。<br /><p class='chapter_content_read_css'>西凝雪也不是没有动过心思，想让如烟和阿曼来伺候自己沐浴。奈何那一票得宫女泪眼婆娑得抽噎着。<br /><p class='chapter_content_read_css'>哭哭啼啼得真不像话，这群人得心思她还不明白吗，无非就是把她洗得干干净净，就等着哪天楼锦川突然留夜。<br /><p class='chapter_content_read_css'>西凝雪哀叹一口气，还是仍由着几人给自己搓皮。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406075&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406075&&novelId=17935'">下一章</div>
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
