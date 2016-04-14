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
    <title>（二十一）梦之局缠缠绵绵 择不情愿的威胁</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351934&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351934&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351934+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十一）梦之局缠缠绵绵 择不情愿的威胁]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351934')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351934 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351934,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第22章&nbsp;&nbsp;&nbsp;（二十一）梦之局缠缠绵绵 择不情愿的威胁
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			天才刚刚翻了白肚皮，书绘音就把她从房里揪了出来，看着她迷糊的样子，好心解释道：“带你去看最重要的一场戏吧。”<p class='chapter_content_read_css'>“哈？”南宁还未反抗就被拖到了顾白的书房外。<p class='chapter_content_read_css'>“王爷，大夫已经到了。”管家在门前恭敬道。<p class='chapter_content_read_css'>“大夫进来，化叔守在门外，任何人都不许靠近。”顾白放下手中的毛笔，眼色清淡。<p class='chapter_content_read_css'>“诺。”大夫进来，管家从外带上门，守在门口。<p class='chapter_content_read_css'>“不知王爷身体……”大夫还未说完便被顾白打断，顾白面色阴沉地看着他，“本王只问你，王妃是否真的怀孕，若有虚言你应当知道有什么后果。”<p class='chapter_content_read_css'>那大夫便是当日为木若涵诊脉的人，他额头滑下一滴冷汗，恭敬回答：“回王爷，王妃确实怀有身孕，算算应当有三个多月了。”那时他来诊脉的时候是一个月前，有两个月身孕。<p class='chapter_content_read_css'>“竟然是真的。”顾白面色忽然变得阴沉不定，闪出几分犹豫与担忧，努力恢复平静说道：“本王要你开一个方子。”<p class='chapter_content_read_css'>“诺，老夫已经为王妃开出安胎的方子了……”<p class='chapter_content_read_css'>“不，本王让你开的是堕胎的方子，但绝对不能伤到母体，”顾白阴沉的目光射向他，“你听明白了吗？”<p class='chapter_content_read_css'>“听、听明白了。”大夫也被他阴沉的语气吓得一哆嗦，心中虽是疑惑万分，但也绝不敢违抗。<p class='chapter_content_read_css'>南宁手肘一撞书绘音，“你加速了记忆读取。”<p class='chapter_content_read_css'>书绘音轻轻嗯了一声。<p class='chapter_content_read_css'>那大夫动作到不慢，晌午时分唤他，未时时分就送来了煎好的堕胎药，顾白原是想让管家借送安胎药的名头给她送去，她一定不疑他尽数喝下去，但是，现在他是在独宠水灵啊，送药去不知又会惹出什么麻烦来。盯着那碗药半晌，他让管家唤水灵来，还派小侍从仓库里拿来不少补药首饰之类的。<p class='chapter_content_read_css'>水灵倒是挺悠闲，有幻云跟在身后悠悠哒哒的款步走进书房。<p class='chapter_content_read_css'>“哟，王爷，不知您唤妾身来有何事吩咐啊？”她瞧着桌上放着一碗汤药，故作诧异道，“王爷莫不是被前些日子妾身欺辱王妃的事气坏了吧？心疼被关禁闭的王妃了吗？”<p class='chapter_content_read_css'>“倒是还敢嘴贫，本王是让你送这汤药给王妃，堕胎药，本王想，你应该知道怎么做吧？”顾白两指并拢缓缓敲击着桌子。听他如此说，水灵倒是好奇的看看他的表情，平静优雅，并没有任何不妥，但是没有不妥才是最大的不妥啊，真是搞不懂这顾王，年近而立却膝下无子，唯有一个王妃过门数载好不容易有了身孕，却要打了这孩子。若是说之前太子殿下告诉她顾王想休了王妃是因为无子，但到现在好像不是如此了。<p class='chapter_content_read_css'>“自然，一是要打掉这孩子，二是要借此让王妃彻底对王爷死了心，乖乖回娘家。那妾身便去了。”水灵妩媚一笑，让幻云端着汤药，又从自己院中唤来数名侍女，带着顾白拿来的东西趾高气扬的朝昙现院走去。<p class='chapter_content_read_css'>“姐姐！”毫不客气的推开木若涵的房门，只见到木若涵一人坐在床上绣着婴儿的衣物，见她进来立刻变了脸色，水灵十分抱歉的说道，“姐姐才几日不见又消瘦了些呢，怎么样，姐姐到底想没想清楚呢？到底要不要，”水灵忽而又阴森森的看着她，“到底要不要，和离呢？”<p class='chapter_content_read_css'>“你在说什么胡话！”木若涵猛地站起来，还未忘记用手护住腹部，“你以为王爷宠你，你便可以说出如此不敬之言吗！”<p class='chapter_content_read_css'>“不敬之言吗？哈哈哈——”她戛然止住笑声步步逼近木若涵，直至逼着木若涵重新坐回床上，压低身子，轻声道，“姐姐未免是猜错妹妹的心思了，妹妹也只是乖乖听从王爷的吩咐呢。”<p class='chapter_content_read_css'>“王……爷……”木若涵虽然也早猜出顾白的心思，但从水灵口中说出心还是止不住的酸痛，强忍着怒斥她，“你莫要胡言乱语！本王妃已怀了王爷骨肉，怎能做出和离这种事！”<p class='chapter_content_read_css'>“骨肉吗？”水灵好笑的看着她，目光缓缓移向她的小腹，眼中充满戏谑，轻轻一摆手，幻云就将药汤递到面前，水灵接过药碗，另一只手钳制住木若涵的下巴，木若涵瞳孔一缩想到她要干什么，奋起抵抗，不料双手被幻云压制住无法动弹就连双腿也同样。<p class='chapter_content_read_css'>“啊——已经有三个多月了吧，还有不到七个月王爷就可以做父亲了呢，但是呢——”水灵掰开她的嘴将药灌下去，“但是他∕她的父亲不是很喜欢他∕她呢……”<p class='chapter_content_read_css'>木若涵被她所言惊至麻木，眼角泪水缠绵而出，没有挣扎很顺畅的就被灌了药，软软的倒在床上，下腹开始阵阵剧痛，漫漫血色晕染在裙上。水灵将药碗摔在地上，一抚额上碎发，眼中充满怜悯又或是其他情绪，用帕子擦擦她嘴角的药渍，哀叹一声再道：“放心，这药对你母体无害，至于那和离书，姐姐还是乖乖签了吧。”<p class='chapter_content_read_css'>见她不回答，让侍女将东西放下，翩翩而去。<p class='chapter_content_read_css'>木若涵缓缓抱腿蜷缩在一起，嘴里喃喃：“你果然还是怨我的，还是不肯原谅我……”<p class='chapter_content_read_css'>南宁手肘一撞书绘音，“哎，这就是你让我看的好戏吗？和说书人说的有什么区别？”<p class='chapter_content_read_css'>书绘音微微离她远点儿，怎么老是用手肘撞他，老老实实说不可以吗？他一咳，“自然有区别，那大夫并没受过什么王妃的恩，那堕胎药也是真的，至于孩子为什么没有被打掉，你忘了师父之前教给你的一种草药吗？”<p class='chapter_content_read_css'>南宁捏住下巴仔细思考，草药，可以保住被堕胎的胎儿，有吗？不过若是那个，难道就是那个！她猛地扯住他的衣袖，“不会是同命草吧！”<p class='chapter_content_read_css'>书绘音眼角一跳，想要拂开南宁的手，奈何南宁发挥了自己紧手的绝招，愣是没让他拂开，只好咬牙扯开她的手，拍拍衣袖轻佻她一眼，道：“木若涵早知会有这么一天，便托木梓寻来了同命草，早早就服下了，有了同命草，子死母亡，木若涵打得也不过这个主意。但以顾白的意思只是不想要那孩子，至于木若涵他还是十分在意的。”<p class='chapter_content_read_css'>南宁顺着说下去：“这样的话，顾白就不得不为了救木若涵而救胎儿，以顾白的地位要想找到一个能够保住胎儿的大夫应当不是难事，之后木若涵便回了娘家，就是这样吧。至于什么和离书，她一定没有签。”<p class='chapter_content_read_css'>“你知道顾白请的人是谁吗？”<p class='chapter_content_read_css'>“谁？”南宁很认真的接问下去，书绘音可从来不说什么废话。<p class='chapter_content_read_css'>“君玄观观主君安，南宫宁雪的师父。”<p class='chapter_content_read_css'>南宁听完，沉默下来。<p class='chapter_content_read_css'>“好了，也该到时间了。”书绘音淡淡瞅了她一眼，说着就施咒离开忆境。<p class='chapter_content_read_css'>南宁等到身体平稳才缓缓睁开眼睛，刚好听到卯时四点的打更声。低头瞧见躺在床上很是安静的木若涵，“王妃，刚才的那些你都……王妃？”<p class='chapter_content_read_css'>南宁心感不妙，将手指慢慢探向木若涵的鼻间，一种熟悉的恐慌漫上心头，心脏扑通扑通差些要跳出胸腔，还差一点点儿，一只突然探出的手拂开了南宁的手，一滴冷汗从发鬓滑出，猛地屏住呼吸，僵硬的抬头看向手的主人。<p class='chapter_content_read_css'>眼神还是一如既往的冰冷，总能用极其平静的语气说出噩耗。<p class='chapter_content_read_css'>“不用探了，她已经故去了，就在我们进入忆境的时候。”<p class='chapter_content_read_css'> “啪！”一个脆生生的巴掌落在书绘音白皙的脸颊上，瞬间五个鲜红手指印映在脸上，南宁眼中的怒火瞬间被浇灭的一点儿也不剩，她哆嗦地收回手，赶忙低下头紧紧咬着下唇，想象着书绘音布满寒冰的双瞳，心里在不断打鼓，恨不得拔腿就跑。<p class='chapter_content_read_css'>刚才她干了什么？竟然打了书绘音，完了完了，得罪了书绘音怕是连个全尸都留不下，自己怎么就这么冲动呢？<p class='chapter_content_read_css'>天色刚刚有些发亮，屋中的蜡烛焰忽明忽暗，映的书绘音琥珀色的眼瞳竟是带些淡淡的柔和，他微微低眼看着南宁的头顶，晦暗不明的说了句：“你的手应该麻了吧。”<p class='chapter_content_read_css'>南宁瞬时冷汗就下来了，她也捉摸不清话中的寓意，如果说麻了，那不就证明她刚才使狠劲打的，反之肯定就是她在说谎了，她刚才是使的超大劲的，冲动是魔鬼啊……<p class='chapter_content_read_css'>书绘音一瞧她的反应就知道她一定想多了，也不想多说，心道若是知晓了他接下来要说的话，恐怕被打死的就是他了，刚张开嘴，便有侍女破门而入，那侍女不晓得屋中有人，看到他二人也是一惊，慌忙跪下，道：“婢子冒犯，还请王妃梳洗，巧儿回来了。”<p class='chapter_content_read_css'>巧儿？南宁与书绘音互看一眼，只是一个贴身侍女罢了，怎会如此慌慌张张？两人又看向床上的木若涵，都没有言语。侍女也不敢插嘴，只是乖乖跪在地上深深低着头。<p class='chapter_content_read_css'>良久，还是书绘音回答：“你们王妃已经故去了，快些去请你们老爷。”<p class='chapter_content_read_css'>那侍女也被他的话吓得脸色惨白，僵硬着不敢动，南宁轻咳了一声，瞥了她一眼，道：“还不快去。”侍女跌跌撞撞的跑出门去。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351934&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351934&&novelId=15670'">下一章</div>
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
