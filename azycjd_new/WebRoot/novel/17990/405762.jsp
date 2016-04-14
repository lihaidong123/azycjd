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
    <title>番外一 【往事如烟（上）】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405762&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405762&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405762+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外一 【往事如烟（上）】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405762')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405762 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405762,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第19章&nbsp;&nbsp;&nbsp;番外一 【往事如烟（上）】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 萧锐良站在轩辕府的二门处看着里面正在池塘边赏花的轩辕泠琪，只见她穿着粉色的裙衫，长及曳地，细腰以锦色云带相束，更显腰肢的纤细。凌云髻上一支红珊瑚制成的发簪，耳垂上戴了副红翡翠滴珠耳环衬得她面若芙蓉，浅笑间一副河中仙子的模样。萧锐良看的痴了，浑然不知自己此举是个登徒浪子的模样。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 只看见她手中持着一柄团扇，莹白皓腕上带着一只上好的翡翠手镯，只见她将手中的团扇高高举起，遮住那俏丽的容颜，萧锐良看着团扇上绣着精致的粉色荷花在阳光的照射下好似要破画而出，原来是日头太盛，她才会以团扇遮挡啊，萧锐良拍了拍自己的心口，刚开始还以为是对方发现了自己呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕昊，是轩辕泠琪的兄长，也是轩辕老家主的嫡长子。轩辕昊一直不知道贵为天潢贵胄的靖王殿下为何会与自己相交，虽然自家是皇商，也十分富有，本朝的商人地位虽不似前朝那般被人瞧不起，但也绝对谈不上能够入了皇家的眼。轩辕昊看着身穿月白长衫的靖王站在二门处朝内张望，暗道一声“不好”。他知道他的妹妹喜欢在这个时辰站在池塘边赏花，而后院池塘又离二门不远，这若是不小心被他进了二门看了妹妹的模样，那该如何啊。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “靖王殿下！”轩辕昊站在萧锐良身后轻声唤道。而萧锐良却被这不大的声音吓了一跳，急忙转身，就看到轩辕昊一撩玄色衣袍准备行礼，急忙伸手拖住他的身子，“无需多礼！”自己这边偷看被人家的兄长看了个正着，萧锐良整个人都处在一种尴尬的境地。最让他脸红心跳的便是听到声音朝这边走来的轩辕泠琪。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“哥哥，”轩辕泠琪不知萧锐良的身份，先是朝着萧锐良身后的轩辕珀行礼一礼，然后才朝着萧锐良福了福身，“小女多谢公子救命之恩！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轩辕泠琪一句话却是让轩辕昊睁大了双眼，关于之前小妹去“国安寺”与安家小姐一同还愿但却遇险一事，他是早就知晓的。跟着的两家下人全都被杀，最终被看似一主一仆的两人所救，妹妹回来也说不清救她之人的身份，但轩辕家从未停止寻找。现在看来，遍寻不到是有道理的，帝王座下最疼爱的靖王啊，怎么可能是他们这商人家庭能够够得到的存在。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“不得无礼，”轩辕昊急忙出言告知妹妹，就怕妹妹行止无状冲撞了靖王殿下，“这位是靖王殿下，还不行礼！”此言一出，轩辕泠琪自然是惊讶非常的，甚至于那一瞬间都忘了掩饰，睁得大大的双眼一下子撞进了萧锐良的心里，只听见他温润如玉的声音传了过来，“不知者无罪，无碍的。轩辕兄何必如此拘泥于礼法！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“不敢，草民不敢！”听到萧锐良的话，兄妹二人一下子懵了，轩辕昊急忙跪地，与堂堂靖王殿下称兄道弟，他是嫌命太长了吗？看了一眼还在呆滞中的妹妹，轩辕珀也顾不得其他，急忙小声说道，“还不行礼！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “好了，”萧锐良急忙制止了想要行礼的轩辕泠琪，也亲自俯下/身子将轩辕珀扶了起来，“哪有那么多的讲究，你看你都吓到轩辕小姐了呢！”说起来，直到现在萧锐良还不知轩辕泠琪的闺名，也是谁家女子闺名是会随意告知别人的呢，救了她们那日，也只是知道了她们分别是安家与轩辕家的小姐。安家还好说，毕竟是官宦之家，安家小姐也随父兄参加过宫宴，所以萧锐良还是知道的，但是轩辕家就不一样了，他们从未参加过宫宴，其他的宴会皇家却是不会去参加的，再加上轩辕泠琪一直养在深闺之中，她的名字就是府中前院伺候的下人都没几个知道的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;要说贵为官家小姐的安媛柔为什么会和商人之家的轩辕泠琪成为闺中好友，此事说来话长，这里就简单解释一下。安媛柔的祖母与轩辕泠琪的祖母其实是堂姐妹，但是两人关系却是异常亲密，甚至于亲姐妹间也没有那般要好的。凌家虽然未曾在京都任职，但也是江南道的抚台，也是官宦之家。凌家祖上出过几位将军，虽然后人中都转从了文职，但规矩却是一直未改，凌家的子女的婚事基本上父母都做不得主，都是孩子喜欢便好。当然，有夫之妇，有妇之夫都是不行的。安家是武将世家，凌家自然是将堂姐欢天喜地的嫁了，轩辕家当时只是江南一方的富商，但却从未出现过为富不仁的事情。凌家堂妹当时出门去了一家店子用餐，但是丫头却与她走散，她虽然会一些拳脚功夫，但她没钱付饭钱，自然理亏，就算是家中做官，但凌家家风甚严，自然不会允许她做出此等事的。就在她窘迫之际，还是轩辕磊，也就是轩辕昊的祖父出现，帮她付了钱，自此见过之后就被凌家堂妹惦记上了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许也是因为轩辕磊有意，所以两家的婚事也算顺利非常。轩辕家后来成为皇商，自然也有凌家与安家的功劳。堂姐妹出嫁后，一开始两地相隔，后来轩辕家迁至盛京之后，两姐妹才继续来往，家里的小辈也多了些往来，尤其是到了孙辈，两家的嫡出女儿各只有一位，两个小女儿的关系也不同他人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 自古女子都不便见外男的，即便是商人，家中也是有规矩的，轩辕泠琪以扇遮颜朝着二人福了福身便转身带着婢女回了自己的“落雨阁”，兀自发呆。而还处在二门处的萧锐良眼中闪过一丝不舍，但一想到帝王为他订下的亲就开始矛盾。既然他有心那个位置，就缺不了昭国公府以及他们姻亲的助力，毕竟太子占了正统，他想要夺位就必须人心所向。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良跟着轩辕昊回到了外院待客的“瀚宇厅”，发现自己的侍卫邵渊戎还在一个人吃着酒，就无奈的摇了摇头。邵渊戎出生武林，自然是不懂那些规矩的，即便是在靖王府也一样，好在萧锐良了解他也从不在意，但也经常告诫他外出万不可如此。还好，并没有出现那些豪爽的举动，只是一个人斟酒品尝。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 看到萧锐良与轩辕昊一前一后进来，邵渊戎急忙从座上起身，穿着玄色的广绣长衫好似有些不甚习惯，平日里他都是穿箭袖直身或是劲装一类的衣服。邵渊戎对着那二人俯身行礼，“殿下，轩辕兄！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;&nbsp;“渊戎不必多礼！”萧锐良挥了挥手，语带笑意，“坐下继续吧！”说完之后他率先坐了下来，邵渊戎自然也跟着坐了下来，只有轩辕昊犹豫了一二才忐忑不安的坐了下来。萧锐良笑了笑没有言语，只是端起了桌上斟满酒的白玉酒杯，浅浅的品了一口。眼中出现迷离的神色，不知是这酒太过醉人，还是刚刚看到的人让萧锐良醉了，总之，邵渊戎觉得这会的靖王殿下表情特别的不同寻常。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 萧锐良没坐多久就起身告辞了，今日前来本就是为见心上人一面的。萧锐良其实一直都不相信一见钟情的事情，可是自己却对只有一面之缘的轩辕家的小姐上了心，而邵渊戎也对她的好姐妹安家小姐心生好感，如今一天在自己耳边吵着想要娶她为妻。萧锐良靠在马车的车壁上轻轻唤了一句：“渊戎！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“殿下！”邵渊戎骑马在侧，练武之人耳力本身就较为灵敏，尤其是像邵渊戎这类高手，听觉尤为敏锐，即便萧锐良的声音不大，邵渊戎还是听得一清二楚，于是他打马上前略一拱手，低声道。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“待年后本王想办法将你调去西北驻军吧！”听到萧锐良所说的话，邵渊戎略一沉思也知道了对方的想法。他虽出身武林，但对于朝中的事情经过这一年多的学习也大体知道了些。对于靖王殿下的想法也自是清楚，他是力挺靖王上位的，太子是个大事糊涂小事计较的，根本没有帝王该有的胸襟，如若让太子得了帝位，以他那种荒淫无度的人，这金陵国也就该灭国了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“属下遵命！”邵渊戎肃容应声道。他虽然觉得有些遗憾，他还没能将安家小姐娶到家呢，但是为了靖王，为了这天下百姓，他只能将自己的私人感情放置一边。邵渊戎如今虽然做了一年的侍卫，但他毕竟做了十五载的江湖人，骨子里的那份豪气爽快还是不改的，他也相信缘分，如果他们二人有缘的话，定然会结成夫妻的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; &nbsp;“你心中所想的，本王定会为你周全一二，放心吧！”邵渊戎听到萧锐良略带笑意的声音，知道他定是准了自己前些日子的请求。自从见了安媛柔之后，邵渊戎就喜欢上她了，回到靖王府后就报了靖王知晓。靖王自然应了，只是说待到时机成熟了自然会为他去安家提亲。<br /><p class='chapter_content_read_css'><br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405762&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405762&&novelId=17990'">下一章</div>
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
