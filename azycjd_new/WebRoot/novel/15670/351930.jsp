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
    <title>（十七）身世浮沉雨打萍 夜凝之巅徒伤情</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351930&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351930&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351930+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十七）身世浮沉雨打萍 夜凝之巅徒伤情]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351930')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351930 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351930,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第18章&nbsp;&nbsp;&nbsp;（十七）身世浮沉雨打萍 夜凝之巅徒伤情
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			木风听闻南宫宁雪打听南宁的事，心中一顿，扯出一个相对自然的笑容：“南宁不过是老夫请来的客人罢了，至于别的，老夫还当真不知。”<p class='chapter_content_read_css'>南宫宁雪见他面露犹豫，便觉得有问题，继续问道：“那……那位银发公子呢？”<p class='chapter_content_read_css'>“绘音？他的来历……”木风沉声一下，他也并非刻意隐藏，而是他确实不知，“几年前小儿木梓去探望他姐姐，路经一樱山遭遇山匪，被绘音所救，这才与他相识，至于别的老夫也从未询问过。”<p class='chapter_content_read_css'>“这样啊，倒是在下唐突了。”他起身，收拾好医箱，“在下也不好再叨扰了。”<p class='chapter_content_read_css'>“还要麻烦南宫公子逗留几日。”木风赶忙起身拦住他，“正如南宫公子所说，小女身体有恙，老夫也不放心其他大夫，还请南宫公子见谅。”<p class='chapter_content_read_css'>“木老爷爱女之心在下自能体会，正巧在下近日也无事，也算不上麻烦。”木风一番话正中南宫宁雪下怀。<p class='chapter_content_read_css'>“管家，为南宫公子收拾一间客房来。”<p class='chapter_content_read_css'>“诺。”<p class='chapter_content_read_css'>“老爷，夫人有请。”忽有小侍匆匆而来。<p class='chapter_content_read_css'>“夫人？唉，又有何事？”转身对南宫宁雪抱歉一笑，“还请南宫公子自便，老夫还有他事，怠慢了。”<p class='chapter_content_read_css'>“哪里话，在下自己随便逛一逛就是了。”南宫宁雪目送他离去，先去花厅寻了衣蓝，又随意在府邸里闲逛，远远就听见花园里吵吵嚷嚷的声音。<p class='chapter_content_read_css'>“书绘音，你竟然敢肘往外拐，是我跟你亲，还是他跟你亲啊！”南宁一脸恼怒，伸手往书绘音身上扒去，扯着他的衣襟想去抓他的手，南宫宁雪眼神虚虚一瞥，原是书绘音手上托着一盘吃食，想想跟南宁同行时贪吃的行径，便明了了。<p class='chapter_content_read_css'>“我并没向着谁，只是木梓说的确实是实话，再吃这些个甜食，你的牙怕是要不得了。”书绘音轻轻将盘子一抛，南宁就眼睁睁看着它从自己头顶飞过，木梓早就配合好似的接住，幸灾乐祸的看了她一眼。<p class='chapter_content_read_css'>南宁幽怨的看向他，又可怜兮兮的看向书绘音，就差没咬小帕子了，“书绘音，我就吃一块，就一块。”<p class='chapter_content_read_css'>“好。”书绘音淡淡回应了一声，南宁听到他答应，立刻跑到木梓面前抢盘子，手还没碰到盘沿，就有一股冷气从背后而来，南宁硬生生地停住，艰难地回头。<p class='chapter_content_read_css'>“要吃也行，不过，”书绘音漫不经心地看向饭厅的方向，“马上就到午膳时间了，听厨娘说有酱卤鹅，你还能不能吃上，还有晚膳……”<p class='chapter_content_read_css'>南宁讪讪地收回手，心中自是明白他话中所指，更何况书绘音一向是言出必行，她还不想为了一块糕点而放弃午膳和晚膳，只能够喏喏几声。<p class='chapter_content_read_css'>“南宁还是最听绘音的话了。”木若涵看着几人玩闹，心情也不禁舒爽了一些，但，对于南宫宁雪的那几句话果然还是有些在意啊，抬眼就瞧见了站在园门边的南宫宁雪和衣蓝，“南宫神医。”<p class='chapter_content_read_css'>“王妃，木少爷，秦姑娘，这位是？”南宫宁雪走上前来一一问候，看向书绘音，“上次在中辰还未请教阁下尊名，在下南宫宁雪。”<p class='chapter_content_read_css'>书绘音盯着他看了半晌，直到盯得所有人都有些毛骨悚然，才冷冷道：“书绘音。”<p class='chapter_content_read_css'>“原是书兄。”<p class='chapter_content_read_css'>“南宫公子莫要在意，书……我师兄他就是如此，不太喜欢与人交谈，让南宫公子见笑了。”南宁见气氛尴尬，赶忙去打圆场。<p class='chapter_content_read_css'>“就是，书哥，你这怪脾气也改改了，弄得怪吓人的。”木梓将糕点盘放到石桌上，打趣着书绘音，书绘音瞥了他一眼，他瞬时打了个寒颤，冷汗就下来了，嘶，果然，不该一时兴起打趣书绘音啊。<p class='chapter_content_read_css'>“秦南宁，过会儿上我房里来一趟。”书绘音扫了南宁一眼，径直离开，路经南宫宁雪身边稍微顿了一下，看了他一眼。<p class='chapter_content_read_css'>南宫宁雪一皱眉，他感到了从书绘音身上传来的敌视感，没错，就是敌视，他也有些疑惑，他好像与他并与仇怨吧，还有当时那句话。<p class='chapter_content_read_css'>“我早就告诉过你，不要动她。”<p class='chapter_content_read_css'>难道是，他忘记了什么吗？不过，他的记性一向很好啊。<p class='chapter_content_read_css'>“南宫公子？南宫公子？”南宁忽然凑上前来，倒是吓了他一跳，“秦姑娘，喊在下何事？”<p class='chapter_content_read_css'>“啊，我还以为你……”南宁双颊一红，还以为你被书绘音勾掉魂了嘞，“算了，没什么啦。”<p class='chapter_content_read_css'>“咳，在下有一事想请教秦姑娘，不知可否？”南宫宁雪望了望木梓和木若涵，“想和姑娘私下谈谈。”<p class='chapter_content_read_css'>“可以，”南宁想了想，“那就去那边的小凉湖吧。王妃，木少爷，我就先行一步了。”<p class='chapter_content_read_css'>“告辞。”<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>“有什么事，就问吧。”南宁也觉得自己没什么好告诉他的啊。<p class='chapter_content_read_css'>“刚才听姑娘喊书兄为师兄，不知二位师承何处？”南宫宁雪思考良久，还是觉得问这个问题最为妥当。<p class='chapter_content_read_css'>南宁一呆，师承……何处？<p class='chapter_content_read_css'>这要怎么回答啊？<p class='chapter_content_read_css'><p class='chapter_content_read_css'>北苑厢房。<p class='chapter_content_read_css'>书绘音紧闭房门，又仔细布下一个法阵，才放心的走到床头前，右手一侧，便有一个暗格从枕后露出，拿出一个奁盒，刚想打开，手中猛然一空，右手一翻却连那人的一个衣角也没捞着，一阵香味扑鼻而来，心中一顿大感不妙，再想挪动身体却再也无法。<p class='chapter_content_read_css'>“哝，你总是这样笨呢，都多少次了，总是不长记性，叫人家怎么好放心你呢？”纤细润玉般的手指突然弹了他额头一下，一张陌生而又熟悉的面容映入他的眼眸。<p class='chapter_content_read_css'>洛瑾香。	<p class='chapter_content_read_css'>她笑着掰过他的身体，寻了个舒服的姿势让他坐到床上，自己则坐到对面的椅子上，把玩着那个奁盒，离他不过半步之距，只要稍稍上前一点儿，便可以贴到他的面上。<p class='chapter_content_read_css'>“哝，你也放心将南宁一个人放在他的身边？不怕他会一冲动杀了秦南宁么？毕竟……”她盯着书绘音满眼的冰霜大感无趣，“嗯，让我猜猜，这里面装了些什么？呀，不会是情妹妹送你的定情信物吧？啧啧。”<p class='chapter_content_read_css'>她将指尖靠近锁扣，想要打开，瞥了一眼面色愈发冰冷的书绘音，“你说，缨赤珠怎么会突然不见呢？”<p class='chapter_content_read_css'>他瞳孔猛然收缩，缨赤珠，正是七圣珠红色的那颗，也是在南宁手中变成石头的那颗。只是，洛瑾香又怎会得知？<p class='chapter_content_read_css'>“会不会是，被你偷走了呢？”她猛然凑过脸来，差一点就撞在他的鼻尖上，眼中玩味尽显，看他脸色变得有些微愠，才微微收敛。<p class='chapter_content_read_css'>抽出另一只手摸向他的脸颊，笑道，“还是这样呢，一生气就出汗呢，幸好你现在，呀，差一点就说漏嘴了，不逗你了，我自是知道缨赤珠是被谁带走了，你也知道的吧？至于他的目的……可是为了……呼……”她忽然对着书绘音的耳朵吹了口气，饶有兴致的看着他两颊漫上红晕。<p class='chapter_content_read_css'>“哝，还有再告诉你一个消息，他在查你，已经查到宫珀身上了，你可要小心，要是被拉进皇室中，你的行动可就没这么方便了。”她将奁盒放到书绘音手中，眼中忽然闪过一丝哀伤，只是藏得极其隐蔽，就连近在咫尺的书绘音也没觉察出来，“你当真要毁了这花？”<p class='chapter_content_read_css'>书绘音微微张唇，还是无法发声，她也是不想让他回答，怕听到想象中的答案，站起身，又俯下身，捧住他的脸俯面而下，只差一点点，便可以吻到他的额头，最终还是低叹一声，撤了手。<p class='chapter_content_read_css'>转身打开窗户，一挥手，书绘音先前布下的法阵便被撕裂出一个洞来，脚下一顿，像是下了决心，扶窗一跃，便消失了身影。她身影刚散，书绘音便脱了力似的倒在床上，发鬓之间绵绵的汗珠融在一起，又黏又腻。手指一松，奁盒便滚落到地上，盒子被摔开，一个小瓷瓶滚出来，奁口露出一朵黑色的花——夜凝花。<p class='chapter_content_read_css'>书绘音的眼瞳良久才从恍然中挣脱出来，露出淡淡的裂痕。<p class='chapter_content_read_css'>是你吗？<p class='chapter_content_read_css'>良久，张了张唇，还是没能将那个名字喊出口。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>小凉湖。<p class='chapter_content_read_css'>听他这么一问，南宁一呆，心中就转了好几个弯，听他问自己师承何处，南苧有几个地方可以学艺的？君玄观？她傻啊，人家的大弟子就在这儿站着呢，况且君玄观是不收女子的吧？可是别的地方……还有啥地方，总不能自己是从云殇而来吧，也就只有那里的人可以随便修习法术吧，不过，承认这个摆明找死，南苧和云殇的关系好像不咋滴，若是被当成奸细可怎么办？说实话？南宁面前闪过书绘音那张冰块脸，会被他给骂死吧……不死也会脱层皮。<p class='chapter_content_read_css'>“咳，我师父他老人家一向低调得很，我师兄妹二人出山时，他一再嘱咐我们二人，万万不可将他的名号报出，否则就要将我二人的腿打断，废掉全部法术，所以恕我不便相告。”南宁故作抱歉之态，看向南宫宁雪。<p class='chapter_content_read_css'>他一沉吟，看出南宁是想故意隐瞒，“那，不知秦姑娘家中可还有长亲兄弟姊妹？”<p class='chapter_content_read_css'>“啊？没有，我自小便是孤儿，”一想这里的孤儿和现代的说法不同，又解释道，“我自小便独身一人，承蒙师父收养，只有师父算是我的长亲，师兄算是我的兄长。”<p class='chapter_content_read_css'>“那，敢问姑娘芳龄几何？”他问出口时自己也是一愣，怎么顺口就出来了，真是失礼，但又不好意思收回。<p class='chapter_content_read_css'>“十六……”南宁呆愣着回答，心中大惊，这这这，这不是媒婆说亲时问的吗？什么情况！<p class='chapter_content_read_css'>他见她脸色突然变得嫣红，竟手足无措起来，“秦姑娘，在下……”话音还未落，南宁便踉踉跄跄的跑走了，还差点儿撞在门洞上。<p class='chapter_content_read_css'>“公子，秦姑娘，好像是误会了。”衣蓝远远就听到自家公子在问些什么，不禁是冷汗直冒，再瞧见南宁的反应，更是满头黑线。<p class='chapter_content_read_css'>“误会？也是，我刚才问的是有些失礼。”<p class='chapter_content_read_css'>“公子，难道你真的不知？那可是媒婆说亲时问的东西。”衣蓝一仔细想，也是，给自家公子说亲的人可以堆满好几座君山了，但每次，好像都是自己或是公子的师兄弟去应酬推掉的哎。<p class='chapter_content_read_css'>“说亲？”他也是满头黑线，这下可怎么办才好？<p class='chapter_content_read_css'>衣蓝心中却是一笑，他家公子是有多久没有犯过傻了，偶尔孩子气一下，也是不错的。<p class='chapter_content_read_css'>“公子莫担心了，说不定……”说不定是阴差阳错的缘分呐。<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351930&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351930&&novelId=15670'">下一章</div>
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
