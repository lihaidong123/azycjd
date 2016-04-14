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
    <title>番外之告白（1）</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351958&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351958&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351958+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外之告白（1）]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351958')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351958 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351958,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第46章&nbsp;&nbsp;&nbsp;番外之告白（1）
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			所有人都发觉到了衣蓝的不对劲，尤其是对待行云的态度。<p class='chapter_content_read_css'>  变化应该是从衣蓝跟随公子回主府见到行云的独子泥儿开始的。<p class='chapter_content_read_css'>  衣蓝和行云先行回府，一路上衣蓝问了行云不少问题，虽是都是关于府中的事务但隐隐约约都透露出一些行云的信息，或许也只有行云这个缺根筋的人察觉不出来。<p class='chapter_content_read_css'>  “我和徐管事一起一起去茶坊去收茶叶，结果遇到了徐管事以前的内人，管事差点就和她吵起来了，我就……”两个人正谈的高兴，突然一个奶娃娃摇摇晃晃的从大开的门扉后走出来。<p class='chapter_content_read_css'>  行云立刻扔掉马缰绳焦急地冲到门前抱起那奶娃娃，嘴里喊着：“泥儿你怎么跑出来了，有没有摔倒？贺娘怎么没看好你，让你一个人跑出来，要是被人拐跑了怎么办？”<p class='chapter_content_read_css'>  奶娃娃眨着大眼睛肆意的挥舞着胖乎乎的小手，用暖暖糯糯的声音喊着“爹爹”。<p class='chapter_content_read_css'>  衣蓝的笑容立刻凝固在脸上，行云他，什么时候成亲做爹了？<p class='chapter_content_read_css'>  “行云，你，今年多大了？”如果他没记错，行云今年才只有十八岁吧？但是，行云只顾着看那奶娃娃完全忽略了衣蓝，就连小跑出来的贺娘也完全忽视他。<p class='chapter_content_read_css'>  真是，让人不爽啊！<p class='chapter_content_read_css'>  衣蓝直接黑着脸牵着马车从大门进去，等着马蹄声踏到行云耳边的时候，行云才惊觉还有衣蓝，“衣管事……”<p class='chapter_content_read_css'>  衣蓝冷冷斜了他一眼，径直进门，就连旁边的贺娘也吓了一跳。<p class='chapter_content_read_css'>  “行云，衣管事怎么了？我进府这么多年还从没见他生过气呢。”贺娘抱过泥儿奇怪地问道。<p class='chapter_content_read_css'>  “我也不知道，刚才还好好的呢。”行云奇怪的挠挠头。<p class='chapter_content_read_css'>  衣蓝的行为也愈发古怪起来，经常买很多糖果零食和小玩艺儿来讨泥儿开心，但大多数时候都是由行云代收，但交到行云手里的时候，衣蓝常常会刨行云一眼，前几次行云还没所察觉，到后来就变得越发胆战心惊。<p class='chapter_content_read_css'>  还有人看到衣蓝半夜出现在行云房门前，但却没人敢正面说出来，只能在私下口耳相传，最后，竟是传到了南宫宁雪耳朵里。<p class='chapter_content_read_css'>  南宫宁雪一开始还不甚在意，但直到衣蓝错误的把砒霜混进茶叶里给他喝的时候，他终于决定是该和衣蓝好好谈谈了。<p class='chapter_content_read_css'>  “衣蓝。”南宫宁雪皱着眉头拦住衣蓝倒茶的动作，因为——茶都快要淌到他的腿上了。<p class='chapter_content_read_css'>  “对不起，公子。”衣蓝这才回过神来，慌张地寻了抹布擦着桌子。<p class='chapter_content_read_css'>  “衣蓝，你跟在我身边那么多年，我也从未把你当过下人来看待，你虽然只比我年长两岁，却出人意料的稳重，我自是将你当做兄长，我的所有事情你也都知道明白，然而最近，你有这么多心事，又为何不说与我听？”<p class='chapter_content_read_css'>  “属下没事。”衣蓝还是不肯开口，南宫宁雪终是狠狠一皱眉，衣蓝才犹犹豫豫道：“公子，你觉得，喜欢男人，会不会，很恶心……”<p class='chapter_content_read_css'>  南宫宁雪才是明白了衣蓝的意思，很认真的看着他，“那你说，杨先生恶不恶心呢？”<p class='chapter_content_read_css'>  “当、当然不了！”衣蓝惊讶的看着南宫宁雪，杨先生可是南宫宁雪的夫子，他为人和蔼又知识渊博，只可惜有那龙阳之好，人到二甲子了也是膝下无子，“属下怎么能和杨先生相提并论，公子莫说笑了。”<p class='chapter_content_read_css'>  “我没有说笑，龙阳之好又如何？你若真觉得行云好，那就将他留在身边又如何？再者，行云的内人早逝，他自己也不愿续弦，泥儿又总不能让贺娘一直照看吧？行云的性子你势必比任何人都清楚，你以为他一个人能够看好一个孩子吗？”南宫宁雪提了药箱出去，“你自己好好想想吧。”<p class='chapter_content_read_css'>  衣蓝抱着茶壶缓缓蹲下身，狠狠咬着手指甲。<p class='chapter_content_read_css'>  就算公子这样说，他还是……他只是……<p class='chapter_content_read_css'>  第二天，他还是忍不住问了贺娘行云的内人是怎么一回事。<p class='chapter_content_read_css'>  “您是说，流水吗？”贺娘刚刚将泥儿哄睡，和衣蓝到门外谈话。<p class='chapter_content_read_css'>  “她是叫流水？”行云……流水吗？还真是……般配啊……衣蓝掩住自己苦涩的笑。<p class='chapter_content_read_css'>  “是啊，是个挺不错的姑娘，和行云还是青梅竹马呐，听说是从小定的婚约，但是您也知道，行云家里出了事，行云就被徐管事买了回来，这两人也就分开了。可是谁知道啊，这姑娘竟在两年前找到了行云来履行婚约，这姑娘还真是不错啊，嘴又甜又知书达理，还特别会照顾人，行云的衣食住行全靠她一手打理。<p class='chapter_content_read_css'>行云也就顺理成章的和流水成亲了，到了第二年流水就给行云生了泥儿，只可惜她福薄，孩子还没满岁就故去了，只可惜了这孩子从小没了娘，我就将泥儿带着，和我家田儿一起照顾着，行云那个五大三粗的汉子怎么能看好孩子呢？您说是吧？”<p class='chapter_content_read_css'>  “确实是，这个给你。”衣蓝从怀里掏出几两银子放到贺娘手里，贺娘着急的不敢接，衣蓝只好硬气道，“这钱是我给泥儿和田儿买东西的，他们都还在长身体，泥儿才刚满岁身子底一定是要养好的。”<p class='chapter_content_read_css'>  “那就谢谢衣管事了。”贺娘也不再推脱将钱小心翼翼的放好。<p class='chapter_content_read_css'>  “对了，行云他当真不再为泥儿再找个娘亲？”<p class='chapter_content_read_css'>  贺娘听闻无奈的摇摇头，叹气道：“谁知道行云到底是怎么想的，我和薄婶给他介绍过不少姑娘，也都不嫌他带个孩子，但他就是死活不同意，唉，衣管事，你见着他也劝劝他吧，趁早再成个家吧，泥儿也不能一直没有娘啊，哪怕是个后娘也罢。”<p class='chapter_content_read_css'>  “好，我见到他，也劝劝他。”衣蓝在心里苦涩一笑，走出了院子，恰好就见行云迎面走来，他张张唇还未说什么，行云就像见鬼似的一溜烟跑远了。<p class='chapter_content_read_css'>  衣蓝又深深叹了口气。<p class='chapter_content_read_css'>  他怎么就这么懦弱呢？不就一句我喜欢你吗？怎么还就说不出口了？<p class='chapter_content_read_css'>  就这样，行云一看见衣蓝就跑的状况一直持续着，衣蓝周围的黑暗气息也愈发严重，无论是谁见了都退避三舍。<p class='chapter_content_read_css'>  “衣蓝，衣蓝，衣蓝！”南宫宁雪终于狠拍了一下桌子让衣蓝回过神来。<p class='chapter_content_read_css'>“公、公子。”<p class='chapter_content_read_css'>他无奈的叹了一口气，“算了，我还是派徐管事去吧，我正好要去风铃岛，府中事务也不多，你就支些银两去散散心吧，你既然不肯对行云说，我也不好替你而言，我希望等我从风铃岛回来的时候你能调整好你的状态。”<p class='chapter_content_read_css'>衣蓝沉默良久，终是道了一声诺，退身离去。<p class='chapter_content_read_css'>南宫宁雪离府第二天，衣蓝就从账房支了些银子离了府，一走就是十几天。<p class='chapter_content_read_css'>他也觉得自己不该这样下去了，这样影响到公子他得罪过可就大了，不，他已经开始影响公子了。他跑到城郊老林里过了几天，又跑到湖边去钓钓鱼，可心里的郁结却是愈发沉重起来。<p class='chapter_content_read_css'>接着他就把自己藏在酒馆里好几天一直闷头喝酒，酒馆的老板也是认识他的，便就任由他喝去，但到了第五天了，老板还是忍不住了，抢过衣蓝手中的酒坛子。<p class='chapter_content_read_css'>“衣管事，你这样喝下去可是会死人的，你好歹也吃些东西再喝啊。”<p class='chapter_content_read_css'>“没关系的，”衣蓝面色酡红，脑袋已经搅成了一团浆糊，但依旧可以口齿清晰的跟别人说话，“老板你不知道吗？一醉解千愁啊，醉了的话，就什么都不想了，可是，可是，可是，怎么就喝不醉呢？怎么就……呜呜呜，呜呜呜呜呜……”<p class='chapter_content_read_css'>老板也一下慌了手脚，他怎么就哭了起来呢？<p class='chapter_content_read_css'>“衣管事，衣管事。”<p class='chapter_content_read_css'>“呜呜呜呜呜行云，嗝呜呜呜呜呜呜，行云，行云……”衣蓝伏在桌子上环着酒坛子边哭边喊行云的名字。<p class='chapter_content_read_css'>  老板也是听懂了，赶忙派了伙计去南宫府去请行云，伙计也是一路跑到南宫府。<p class='chapter_content_read_css'>  行云刚准备脱了衣服洗洗睡了，就被徐管事二话不说闯进门拉了出去，等那伙计把原委都给他说了一遍，他还是没反应过来。所以是怎么了？为什么衣管事喝醉酒要他去接啊？徐管事不可以吗？<p class='chapter_content_read_css'>  他刚转脸看徐管事，就被徐管事一把推了出去，徐管事二话没说就砰的关了门。<p class='chapter_content_read_css'>  行云在冷风里哆嗦了一会儿，那小伙计最先受不了，把他推推搡搡地“请”到了酒馆，刚进门就看见了趴在桌子上不省人事还挂着两道泪痕的衣蓝。<p class='chapter_content_read_css'>  他直接就傻眼了，这真的是衣管事？不、不可能吧，怎么会？<p class='chapter_content_read_css'>  “衣管事？衣管事？”行云走近推了衣蓝两下，衣蓝抬眼迷迷糊糊地看了他一眼，良久才缓缓道。<p class='chapter_content_read_css'>  “行云。”<p class='chapter_content_read_css'>  “衣管事，你还能认出我来？”行云松了一口气，看来，醉的还不算太狠。<p class='chapter_content_read_css'>  他抬起衣蓝的一只胳膊想将他背起来，奈何衣蓝的另一只胳膊死死抓住桌子边，嘴里还嘟囔着：“不要！我不要走！不走，我还要喝呢！”<p class='chapter_content_read_css'>  “衣管事，你不能再喝了，快跟我回去吧。”行云好声好气道。<p class='chapter_content_read_css'>  衣蓝突然狠狠刨了他一眼，行云直接就僵住了，心里泪奔，天知道，他最害怕衣管事拿白眼刨他了，他实在想回府啊！啊！谁来救救他啊！<p class='chapter_content_read_css'>  “衣管事，好，衣管事咱接着喝，接着喝啊，不过这里没酒了，咱们换个地方再喝，好不好？”酒馆老板及时劝道，衣蓝终于安静下来，点了点头，乖乖的松了手很自然的搭到了行云肩上。<p class='chapter_content_read_css'>  行云终于背起了衣蓝，衣蓝似睡非睡的趴在他背上，下巴抵在他肩膀上。<p class='chapter_content_read_css'>  行云匆匆告辞，背着衣蓝走在寂静的大街上，衣蓝忽然不安的动了一下，搂着行云的脖子呜咽着在他脸颊蹭了蹭。行云猛打了激灵，身体忽然就僵住不能动弹。<p class='chapter_content_read_css'>  只听见衣蓝不安的声音传进耳里。<p class='chapter_content_read_css'>  “真的，好喜欢你。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351958&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351958&&novelId=15670'">下一章</div>
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
