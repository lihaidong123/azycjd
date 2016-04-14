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
    <title>番外一 【往事如烟（下）】</title>
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
	<script language="javascript">var novelId='17990';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405819&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405819&&novelId=17990";
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
					window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405819+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外一 【往事如烟（下）】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405819')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990.jsp'">公子万劫不复之嫡女撩人</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:苏易尘</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405819 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405819,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第20章&nbsp;&nbsp;&nbsp;番外一 【往事如烟（下）】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 后来，几乎是顺理成章的事情，萧锐良出马安家自然是同意将宝贝闺女嫁给邵渊戎，虽然这个时候的邵渊戎还只是一个从六品的侍卫，但靖王殿下已经同意将邵渊戎送往西北驻军。虽然安家一直守护的是金陵国的东南边境，但毕竟有军中人脉，邵渊戎即便去了西北，也是个不错的选择。只是这样一来的话，安家自然就被贴上了靖王党的标签，但安家也觉得无所谓，毕竟太子不仁，安家又是良臣自然也不是太子一党。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 次年，待邵渊戎与安媛柔大婚。安媛柔是十里红妆的嫁去了江南，待到邵渊戎婚假休毕返回靖王府后，萧锐良就寻了个西北驻军的五品校尉的空缺给他。大朝之日，萧锐良直接上折，再加上一旁有安家助阵，帝王欣然应允。自此，邵渊戎就奔赴西北，后来慢慢的做上了将军的职位，将西北驻军的军权慢慢的拢于手中。西北的邵渊戎，东南的安家，这些都在后来靖王夺嫡之争中起了决定性的作用。放下这些后话暂且不提。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 身在诡异莫测的朝局之中，萧锐良如履薄冰，太子整日整日的疑神疑鬼，也将目标放在了他身上，毕竟邵渊戎是他府中出去的侍卫，邵渊戎在军中履立战功，现在已经荣升至正四品的副将了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 三月已经慢慢接近尾声，萧锐良与昭国公府嫡出大小姐梁影儿的婚事就在这个月的月末。面对着越来越近的婚期，萧锐良越发的烦躁起来，以前不觉得娶个自己不爱的女人有什么难得，就连当初父皇母妃给自己安排侍寝女子的时候他也从未排斥过。作为一个有正常需求又没有倾心的女子的男人，他觉得做那些事情都是很正常的事情，但是现在他却不想那样做了。其实，自从喜欢上轩辕泠琪之后他已经很久没有抱过女人了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 即便再不愿意，婚礼还是如期举行了。新婚之夜，萧锐良冷眼看着自己的王妃，只见她含羞低头，萧锐良最终还是在宫里老嬷嬷的提醒下与梁影儿喝了交杯酒，他却借着醉酒的因子将她一人留在了婚房内，独身一人坐在花园的凉亭内静静的看着皎皎明月。他第一次感受到了这个身份带给自己的身不由己，抬头将眼中的泪水硬生生的咽了回去，只是那轮明月却便成了轩辕泠琪的如花俏颜，萧锐良有些贪婪的朝天上看着，慢慢的轩辕泠琪笑靥如花的面容却掩上了帕子，萧锐良甚至能够听到她传来的哭泣声。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良有些不能接受她哭得那般可怜的模样，他不忍心再看只能低下头，这个八尺高的男子有些不能自抑的捂住了脸，身不由己真的是身不由己啊！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 但是他却不能将梁影儿那样晾在婚房一整晚，不然他肯定借不到昭国公府的势力，那自己如此委屈还有何意义？即便再不愿，待到夜深之后他还是回了婚房，梁影儿并未听他吩咐直接休息，而是一直端坐在雕花的拔步床上，身上还穿的是大红的嫁衣，头上的金钗凤冠还未取下。看着萧锐良慢慢走进，梁影儿起了身，缓缓对着他福了福身行了一礼，“妾身参见王爷，王爷万安！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 自从决定来到婚房后，萧锐良决定还是将心中的那人就一直放在心中吧，自己不去打扰她平静的生活了，自此就算她嫁人自己也不会干涉了。于是萧锐良又变回了往日那个云淡风轻的模样，看着行礼的梁影儿，缓缓开口：“王妃不必多礼！”说完就自顾自的进了内间洗澡，梁影儿看着萧锐良冷硬的背影，兀自咬了咬唇，将一切委屈都咽下了肚，自招了自己陪嫁的丫头帮自己卸了妆。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良换了身雪白的中衣就直接上床休息了，梁影儿看着对方完全没有理会自己的意思，眼角的狠厉一闪而逝，让人换了洗澡水自己也洗了澡。从里间出来，梁影儿看着萧锐良睡着的模样，心下一横便上了床，从后面搂住萧锐良健壮的腰身，将脸贴在他宽阔的背上。却没想到萧锐良完全没有领情，只是静静的伸手将他推开，声音闷闷的，“早些歇息吧，明日还要进宫问安！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 梁影儿做出那般大胆的动作显然已经到了极限了，所以此刻听到萧锐良如此讲委屈一下子就直接变成眼泪流了出来，温热的眼泪浸湿了萧锐良的中衣。萧锐良虽然知道自己如此迁怒一个女子真的不是君子所为，可是他真的说服不了自己，他的眼中总会不时浮现出轩辕泠琪哭泣的模样。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 时间缓缓流逝，直到端午节，萧锐良依然没有与梁影儿圆房。这一天萧锐良因为有事情处理，却碰到了郁郁寡欢的轩辕泠琪。他令自己的侍卫前去查探了一番，原是自己成婚后轩辕泠琪就闷闷不乐的，今日好不容易听了轩辕昊的劝解出来散心的。回到府的萧锐良也成了一副不思饮食的模样。如此几日之后，梁影儿做了消暑的汤水送到了他的书房，他们虽不恩爱却相敬如宾，萧锐良听到禀告就让她进来了。毫无怀疑之意的萧锐良笑着谢过梁影儿就端起梁影儿手中托盘上的斗彩莲花瓷碗，轻轻的饮了一口，甘甜消暑，甚是可口，于是萧锐良便一口饮进了碗中的汤水，在他仰头的那一刻，他没能看到梁影儿眼中得逞的笑意。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 梁影儿接过萧锐良手中的空碗，她其实不想这般做的，但是母亲告诉她，女人还是要有个子女傍身才是，不得已她才出此下策。出了书房，梁影儿抬头看了看刺眼的耀日，嘴角的笑慢慢变成了苦笑，谁愿意走这一步呢，她也是被逼无奈的。坚定了信念，梁影儿跨步回了后院，只是在下人都没有看到的地方又折身返了回来，去了书房外面的花园。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良只觉得喝下解暑汤之后越发的热了，现在还没到供应冰山的时候，萧锐良有些烦躁的将天青色箭袖直身上款款的腰带接了下来，腰带上面的红色玛瑙晃花了萧锐良的眼。花园中的梁影儿看了看日头，估摸着时间差不多了就起身朝着书房走去，不知是她运气太好还是怎的，书房重地外面却无一人把守。于是她踮起脚尖朝内轻轻走去，还未走到内间便听到了萧锐良那不能自抑的喘息声，梁影儿嘴角勾起一抹笑。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 迷迷糊糊中萧锐良只看到一袭粉衣的女子朝自己走来，而后她还脱下了自己的衣物。久旱逢甘霖，自然成就了一番好事，只是待一次之后，萧锐良有些混乱的意识就变得清明起来，有些恼怒的斥责了梁影儿一番，只是梁影儿哭哭啼啼的向他诉说了一番无子的悲哀，又说成婚这么久她都没有动静，别人还会以为……<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良冷着脸让她回了内院，自己让伺候的内侍烧了水送进来，洗了有半个时辰的功夫，萧锐良才从浴桶中走了出来，换了身月白的长衫，用金丝银线绣着回字文的边，腰间系了一条同色的大带，缓缓出了书房。随后，脑中闪过那人哭得梨花带雨的模样，思念瞬间将他淹没，竟然有些不能忍受见不到的痛苦。于是他便吩咐贴身侍卫前去安排，他要前往轩辕府。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良来到轩辕府的门外，却碰上了刚刚回府的轩辕泠琪，只见她穿着粉色的裙衫也不能遮掩她面容上的憔悴，二人相视苦笑。轩辕泠琪朝他福了福身，便让他跟着自己朝父兄的书房走去。走着走着萧锐良觉得自己身上再次热了起来，隐隐有些控制不住，他的脸也变得越发的通红，身形也晃了一下，一旁的轩辕泠琪自然将萧锐良的变化看到了眼中，于是伸手扶了一下，萧锐良瞬间觉得一阵清泉缓缓沁入心脾，但却是更加不想放开了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕泠琪只是将萧锐良带到了兄长的书房外就直接回了后院。但是一想到他刚刚的状态她就有些放心不下，于是遣了丫头下去，说自己要休息一番，但是等到丫鬟都下去之后她却悄悄的折身回了兄长的书房。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 忍受着刚刚被轩辕泠琪挑起来的药效，轩辕昊并未在府内，下人只是奉了茶上来就在外面候着。轩辕泠琪偷偷进来的时候就看到满面通红的萧锐良喝着茶水的模样，实在忍受不住心中的思念，轩辕泠琪缓缓走到萧锐良身旁，口中轻唤，“萧郎！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 后面的事情似乎顺理成章，被下了要的干柴与烈火一触既燃，两人去了轩辕昊书房一侧的厢房。待二人清醒过来之后，萧锐良紧紧搂着轩辕泠琪，声音中都带了些颤抖，“泠儿你放心，我一定会娶你的。但是只能委屈你做侧妃了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “无妨的，只要能与萧郎在一起，什么身份都无所谓！”轩辕泠琪靠在萧锐良的怀中，二人就这般的私定了终身。然后他们急忙穿了衣物出了房间，这么久的时间，府中却无一人发现二人的失踪。因着这种事情二人也不欲声张，轩辕泠琪只是悄悄的回了自己的院子。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 只是事实却是残酷的，贵妃，也就是萧锐良的生母宁倩儿不同意这门婚事，若是给个侍妾的名分那就无所谓了，但是侧妃的名额，还是留着笼络朝中众臣的好，母子二人就这般陷入了冷战。这些事情自然落到了已经怀孕的靖王妃耳中，她自然也是不同意的，回到娘家哭诉，昭国公自然向萧锐良施压。萧锐良也不愿委屈轩辕泠琪于是这件事情就这般搁置了下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 只是谁也没想到就那一次，轩辕泠琪却怀了身孕。自得到这个消息，萧锐良就亲自前往轩辕府将所有事情托盘而出，轩辕家自然不能难为堂堂靖王，但是也让靖王答应了待轩辕泠琪生产之后再行入府的要求。而轩辕泠琪却在轩辕磊的安排下直接去了乡下的院子待产，毕竟府中人口杂多，走漏了风声反而不美。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 一晃就到了腊月里，也进入了靖王妃与轩辕泠琪的产期，两厢都准备了起来。萧锐良在轩辕泠琪生产前夕去看了她一次，本打算在她生产的时候再次前往，但接到消息的时候自己的王妃梁影儿还在产房中，府中还有自己母妃坐镇，还有梁家夫人自己的岳母大人，他一时找不到空隙前去。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 后来萧锐良才知道那一次却成了永别，轩辕泠琪却难产身亡，给他留下了一子。等到萧锐良抽出时间赶到乡下的时候就看到轩辕昊抱着一个男婴递给他，声音中透着心疼，“泠儿说了不恨你！”一句话却让萧锐良红了眼睛，小心翼翼的接过瘦小的婴孩，因为轩辕泠琪忧思过重，导致孩子在胎中发育的就不是很好。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 因为轩辕泠琪未婚先孕，所以当初就商议让孩子先记到轩辕昊的名下，待他们日后慢慢筹划，再将孩子抱回自己养。可事到如今却是不行了，轩辕泠琪似乎也知道，所以最后还留下了句话，那便是孩子就一直给自己兄长养着吧。萧锐良虽然有些不舍，但到底还是同意了。一是因为那是轩辕泠琪的遗愿，二是因为他就算将孩子抱回去，交由谁抚养，能不能平安长大都是个问题，还不如让他平平安安的在舅家长大，只要自己多去看看他就好了。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405819&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405819&&novelId=17990'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')"/>
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
