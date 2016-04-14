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
    <title>（一）巧入十三尘世中 自道原是故人来</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351914&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351914&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351914+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（一）巧入十三尘世中 自道原是故人来]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351914')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351914 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351914,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第2章&nbsp;&nbsp;&nbsp;（一）巧入十三尘世中 自道原是故人来
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  南宁整个人身体僵硬着，躺在雕花香檀的大床上，密密麻麻的汗珠一颗一颗滚落下来，沾湿了香蚕丝的枕巾，一只手掀起被角，另一只手搭在她脉搏上，良久，南宁的手微微动了动，再后来，没了动静。<p class='chapter_content_read_css'>  南宁紧紧拧着眉头，似是承受着巨大的苦痛。<p class='chapter_content_read_css'>  然而，只有她自己心里最清楚，那是一种什么痛。<p class='chapter_content_read_css'>  只觉得像是叫人把骨头拆开来又安上似的，痛到了麻木，又像是一盆滚油泼下来，浑身都是火辣辣的，像是漂在水中，找不到一个可以停下来的支撑点。<p class='chapter_content_read_css'>  南宁挣扎着想睁开眼，却是徒劳，恍惚中听到了有人谈话的声音，模模糊糊，连是男是女都分不清楚。糊糊涂涂又霎时清醒过来，恰好逢到每一丝痛楚都藏了起来，只能感觉到大脑的思考。<p class='chapter_content_read_css'>  说不清楚是对宫雪有什么感觉，只是，真的很怀疑他，一切都太巧合了，突然出现又离奇消失的墓地女子，晕倒在墓前的宫雪，撒谎称不记得自己的家，故意让自己收留他。<p class='chapter_content_read_css'>  所有的事情零落在一起，像是一根无形的线将一切串连在一起，真相近在眼前，可又忽而模糊不堪。<p class='chapter_content_read_css'>  南宁只觉得耳边响起一阵阵呼喊，她悠悠转醒。怔了许久才回归元神，看清了那个一直呼喊自己的人。<p class='chapter_content_read_css'>  那人只不过是个十三四岁的小丫头，梳着百合鬓簪了对儿流苏，穿着桃粉色的襦裙，长得清秀可爱，睁大着水灵灵的眼睛站在床头直勾勾的盯着她，看见她醒来，嘴里就嘟嘟囔囔道：“公子说的没错，只要一直喊着，姑娘就会醒了，这是真的。”<p class='chapter_content_read_css'>  南宁怔了半天，缓缓坐起身看看周围，自己身在雕花香檀的床上，右手按在床帮上，床上垂着纱幔，床边案桌上的香炉里烟丝渺渺，有一道屏风将床隐于房门视线之后，纸窗、雕花木门，一切都是古色古香原装的古式家具装修，没有摄像机，没有任何的现代化设备，甚至连个近代的电灯泡都没有。所以，这是，穿越？<p class='chapter_content_read_css'>  穿越？！太可笑了吧！<p class='chapter_content_read_css'>  她十六年的岁月中一共买了三百九十二张各种彩票，别说大奖了，甚至连个安慰奖都没中过，她会得到穿越这种走大运的中奖机会？骗谁？这肯定是有人故意为之，宫雪吗？一定有什么东西被忽略了，一定是这样的！<p class='chapter_content_read_css'>  南宁挣扎着就要下床，一动全身就都痛了起来，“砰”的又摔回了床上，南宁拧着眉低声咒骂。<p class='chapter_content_read_css'> “姑娘千万别乱动啊，公子说伤到了筋骨要好好休息。”那小丫头慌忙的拦住她。<p class='chapter_content_read_css'> “好，我不乱动，”南宁闭上眼，咬咬牙道，“你先出去。”<p class='chapter_content_read_css'> “可是，公子说……”<p class='chapter_content_read_css'> “我管你什么公子！你，出去！出去！”<p class='chapter_content_read_css'> “诺。”小丫头被吓得低着头赶忙跑出去，倒还没忘了把门带上。<p class='chapter_content_read_css'>  南宁粗喘着气慢慢顺着床头躺下，双手紧紧攥住被褥，头脑渐渐平静下来，脑海中忽而闪过一个人，这件事的缘由，似乎有些眉目了。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  第二天，阳光刚刚透过薄薄的窗纸射在南宁的满是睡意的脸颊上，她就被无情地弄醒了。<p class='chapter_content_read_css'>  女孩子端着汤药，站在南宁床前，面色冷淡。<p class='chapter_content_read_css'>  南宁睡眼朦胧的盯着她，被她眼睛里的淡意慢慢催醒过来，南宁这才看清她的长相，顿了顿。<p class='chapter_content_read_css'>  再来照顾南宁的是另外一个女孩子，与昨日的女孩子两人倒是一个模子刻出来的，只是一个冷淡，一个活泼。<p class='chapter_content_read_css'> “姑娘，请喝药。”她的语气也十分淡。<p class='chapter_content_read_css'> “你叫什么名字？昨天那个女孩是你姐妹吗？”南宁接过碗，看着那黑乎乎的药，有些反胃。<p class='chapter_content_read_css'> “回姑娘，婢子名小锦，小桃是婢子的妹妹，昨日冒犯姑娘真是该死。”她说着便要跪下。南宁吓得没把碗摔掉，伸出手扶她，“别别，昨天是我心情不好，对着你妹妹发火，真是对不起。”<p class='chapter_content_read_css'> “姑娘言重了。”小锦站起，立在床边，见南宁迟迟不动碗里的药，道，“姑娘，药凉了就不好了。”<p class='chapter_content_read_css'> “呃，可不可以不喝？”南宁一脸苦瓜样。天知道，她最讨厌喝药了，西药就算了，还是这黑乎乎的中药，真是让人接受不了啊。<p class='chapter_content_read_css'> “公子说这药必须要喝，而且还要再喝上至少半个月。”小锦一板一眼地回答道。<p class='chapter_content_read_css'>  半个月！南宁翻了翻白眼，乖乖喝了两口，突然想到什么，差一点把药吐了出来，顿了顿，又苦着脸咽下去，“对了，你有没有见到，呃，我的耳坠还有一本书，封面画着蓝色妖姬花，那对我很重要。”<p class='chapter_content_read_css'> “耳坠和书……”小锦低头想了想，“好像是有，不过在公子那里。”<p class='chapter_content_read_css'> “那你们公子呢？”南宁语气有些焦急。<p class='chapter_content_read_css'> “公子外出，恐怕要半个月后才能回来。”<p class='chapter_content_read_css'> “买糕的!”南宁白眼又一翻，差点没昏过去，那些可都是她的身家性命啊！左手捏着鼻子，右手把汤药猛一灌，苦涩的药汁顺着食管顺畅的灌进胃中，南宁眼角泛起苦苦的泪花。<p class='chapter_content_read_css'>还好小锦伶俐，提前准备好了蜜饯，她捞起一块填到嘴里，才好受了一些。<p class='chapter_content_read_css'>  半个月说快也快，说慢也慢，南宁时常拉着小桃说话，至于为什么不是小锦，是因为从小锦嘴里什么也套不出来！<p class='chapter_content_read_css'>  旁敲侧击中南宁才知道了自己所处的地方叫做南苧国，处于东陆的南部，北面是云殇国，西北是漠北国，周围也有一些零散的小国，但是三国鼎立的局面可以维持数百年，这倒是让南宁很惊讶。<p class='chapter_content_read_css'>  云殇人大都修习巫术，信奉月女神；南苧只有皇室和君玄观的诸多弟子修习巫术，信奉日女神；漠北修习巫术的人寥寥无几，但也因为夜女神的庇佑而可以与其他二国对抗。正是因为这神明护佑三国鼎立的局面才没被打破。<p class='chapter_content_read_css'>  但是，最近几年云殇和南苧的关系似乎不太好，也不知现在这样的局面会不会被打破。<p class='chapter_content_read_css'>  最让南宁在意的是南苧国的太子就叫宫雪，从年龄上来推算，太子宫雪也就只有十九，而那人怎么看起来也有二十多岁，莫非是长得太早熟？<p class='chapter_content_read_css'> “唉，算了，不想了。”又是一个晴日头，南宁身上的伤也全好了，连一点疤都没留，虽然她也很奇怪自己这一身大大小小的伤痕是怎么来的，但总不好意思开口询问，只好归于沉默，认为是穿越时落地不好，摔此一身伤。<p class='chapter_content_read_css'>南宁像前几日一样将手帕往脸上一搭，昏昏欲睡。<p class='chapter_content_read_css'> “小锦，那姑娘现在怎么样了？”南宫宁雪一袭紫衫，少许头发用一根雪蚕丝布帛束在脑后，有几分儒雅，朝着南宁所在的小院走去，小锦和衣蓝在后面跟着。<p class='chapter_content_read_css'> “服了公子的方子，姑娘现在好多了，只是身子还有些懒。”小锦恭恭敬敬的回答。<p class='chapter_content_read_css'> “哦。”<p class='chapter_content_read_css'> “咦？”刚进院子，就看到南宁躺在那树下的美人椅上睡着了，帕子搭在脸上，随着呼吸一起一伏，头发随意的散着。一时有些玩儿性，南宫宁雪轻步走近，隔着帕子碰了碰她的脸，南宁一动，手软软的打在他没来得及收回的手，嘴里低喃。<p class='chapter_content_read_css'>南宫宁雪没有听清楚，微微倾身贴近。<p class='chapter_content_read_css'> “别玩儿了，七七，唔，宫雪？”南宁轻扯帕子露出眼来，朦朦胧胧看见南宫宁雪贴近的脸，还以为见到了宫雪，她还在店里，又闭上眼，喃喃道，“宫雪你什么时候也跟七七学坏了，打扰我睡觉，真是……啊！不对！”<p class='chapter_content_read_css'>南宁突然反应过来，猛地起身，头直接撞在了还没躲开的南宫宁雪的肩膀上，反作用力地往后面仰去，南宫宁雪猛地伸手捞住了她。<p class='chapter_content_read_css'> “对不起，对不起！”南宁站起身，弯腰道歉，微微低眉不落人注意的仔细看看南宫宁雪，心里默默道：确实和宫雪长得一模一样，只不过，宫雪好像从来不会露出这种，呃，温文尔雅的笑容，总是露着呆萌的表情，做事也是稀里糊涂，“请问公子贵姓？”<p class='chapter_content_read_css'>  “在下免贵姓南宫，名宁雪。”他十分知礼地后退一步，与南宁保持距离。<p class='chapter_content_read_css'>  “南宫宁雪？”南宁脑子一卡，不是宫雪？如果去“南宁”二字的话，不就是“宫雪”了，再说，化名这种事很常见吧，应该吧……南宁心里也不确定，毕竟那只是小说中经常这样写，若是按照古时传统，改姓氏也只有某些特殊情况之下才不得已做出的事，耶？不对，都说了是化名啊，干嘛想那么远？恩恩，南宫宁雪还有待考察。<p class='chapter_content_read_css'>  “公子，打扰了，午膳已经备好，不知公子是在偏厅用膳，还是在正厅？”小锦恭敬问道。<p class='chapter_content_read_css'>  “不知秦姑娘何意？”南宫宁雪率先问南宁。<p class='chapter_content_read_css'>  “就在正厅好了，”南宁笑笑，问小锦，“不知道今日有没有琉璃珠玑？”<p class='chapter_content_read_css'>  “自然是有的。”<p class='chapter_content_read_css'>  “琉璃珠玑？”南宫宁雪也是好奇地一挑眉，他倒是还从未听说过有这样一道菜。<p class='chapter_content_read_css'>  “公子看到后就知道了。”南宁稍稍有些得意地说道。<p class='chapter_content_read_css'>  果然，让南宫宁雪吃惊的不止这一道菜。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351914&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351914&&novelId=15670'">下一章</div>
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
