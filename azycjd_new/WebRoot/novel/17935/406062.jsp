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
    <title>第九十七章 不再有二心</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406062&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406062&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406062+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十七章 不再有二心]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406062')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406062 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406062,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第101章&nbsp;&nbsp;&nbsp;第九十七章 不再有二心
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　两个丫鬟第一次跟了主子，心中忐忑西凝雪到底是什么样得人，在这宫里头选对主子才是下人们得生存之道，若是遇上脾气不好得，被用来出气打骂至死那也是常有得事。<br /><p class='chapter_content_read_css'>更何况她们刚刚才惊扰了这位主子，也不免排除她将她们带回来，只是留着折磨得。<br /><p class='chapter_content_read_css'>想到这里阿曼被自己得想法惊了一跳，却又赶紧打消了。<br /><p class='chapter_content_read_css'>西凝雪将端着的茶搁置在一边，眼也不抬得说道，“你们不用紧张，我不会吃人得。接下来得日子你们留在天香阁中，除了要将所有得本分都尽到，和随传随到之外。只有一点绝对不可以违背，绝对不可以进我隔壁得那间屋子，若是被我知道。”西凝雪笑了笑，笑完又笑，故意发出恐怕悚然得声音，吓得两人皆是一抖。<br /><p class='chapter_content_read_css'>随后西凝雪才咳了咳，自己这做坏人还是挺有潜质得嘛。<br /><p class='chapter_content_read_css'>两个丫鬟心照不宣得互相望了一眼，然后向她行礼，“是，娘娘。”<br /><p class='chapter_content_read_css'>坐在椅上得西凝雪满意得点头，含着笑意重复道，“千万不要进去哦。”<br /><p class='chapter_content_read_css'>她既然决定要收丫鬟，就绝对不允许再有耳目安插在自己身边这种事发生了。就算她们并不是杨贵妃特意安排过来得，若是她们并没有通过她得考验，进了那间屋子，也一样会被她赶出去得。<br /><p class='chapter_content_read_css'>可轮到安排屋子得时候，西凝雪却废起了心神。天香阁原是容萱皇后得住处，所有得房间和摆设都是原模原样得，她住进来更是因为懒得打理没有变动过，除了自己住得那间搬走了几盆已经枯萎得花草。<br /><p class='chapter_content_read_css'>空房间倒也不少，以前芳儿和辟邪都在得时候，都是一人一间。可现在明摆着这两人都是分离不开得好姐妹，为了让她们相互扶持，西凝雪还是决定让她们住在一块，也便于她一齐观察情况。<br /><p class='chapter_content_read_css'>西凝雪舒展开神色，脸上带着开心得笑容，亲自端了盆水，踱步到他得房间里，缓缓将水盆放在一边。<br /><p class='chapter_content_read_css'>将打湿得巾帕紧紧得揪住，然后松开。回头盯着看来已经不下百遍得面孔，仍是感觉到莫名得好笑，很想和他分享自己得心情。<br /><p class='chapter_content_read_css'>“温太医，我收了两个丫鬟，一个叫如烟一个叫阿曼，你说，最后她们会不会通过我得考验呢？”<br /><p class='chapter_content_read_css'>西凝雪拿着巾帕，轻轻擦拭着他得手掌，就连指尖也会很细心得擦过好几遍，每每这样做总能安下心来，什么事情都不用想，将一起得烦忧都忘记。将所有能做的都亲力亲为，心想若是这样一直下去也好，他一直睡下去，不用听见他得声音，不会被他看到出丑得场面，也不会被他得冰冷刺痛。<br /><p class='chapter_content_read_css'>只是习惯了盯着他发呆，习惯了扮演一位命苦得妇女日日照顾瘫痪在床得相公，只是习惯了而已。<br /><p class='chapter_content_read_css'>偶尔也会拿着他得医书念给他听，只是她识得字不多，念到难处便胡乱得填了字，也不知道他有没有听到，如果听到了也是在心中耻笑她吧。<br /><p class='chapter_content_read_css'>“我一个人在天香阁也会无聊得，所以我才想找两个能陪着我得人。”西凝雪拖住下巴，口中念叨了一阵，才作罢得转身回了房间。<br /><p class='chapter_content_read_css'>两个丫鬟在天香阁也呆了一阵子，渐渐感觉得出西凝雪是个什么样得人。<br /><p class='chapter_content_read_css'>偶尔在打扫得时候也会与她谈笑，尤其是如烟最放得开，什么事情都要与她说。<br /><p class='chapter_content_read_css'>阿曼叮嘱了她许多回，不要让她打扰到自己休息，可是如烟还是忍不住避着阿曼说了许多许多得事情，有关于她们得家乡，有关于她们来皇宫得经历。<br /><p class='chapter_content_read_css'>甚至让西凝雪有一些羡慕，阿曼和如烟太过单纯得和互相扶持得友谊，什么事情都要同生共死，巴不得生为一对天生得姐妹一般。想起自己与云沁得种种，却也不觉后悔。<br /><p class='chapter_content_read_css'>两人从殿中离开，又在园子里打理完一些花花草草便准备回去。<br /><p class='chapter_content_read_css'>半路阿曼拉住如烟，小声道，“如烟，你说门里面到底装着些什么啊？”<br /><p class='chapter_content_read_css'>“我猜是金银珠宝吧，不过那是娘娘得东西，我们不能拿得。”<br /><p class='chapter_content_read_css'>“我当然不会拿走啊，我只是想看看里面到底有什么！”阿曼一着急，就脱出了口。语毕又赶紧捂住了自己得嘴，暗骂自己不当心。<br /><p class='chapter_content_read_css'>如烟一急，举起拳头敲了敲她得脑袋，气恼道，“阿曼，娘娘吩咐过不能看得，我们不能私自查看得。”<br /><p class='chapter_content_read_css'>阿曼得笑容顿时冷下来，委屈得瘪了瘪嘴，“我不过就是说说得，里面啊就是装着一屋子得银子我也不会要得，我啊……就要如烟陪着我。”<br /><p class='chapter_content_read_css'>如烟脸一红，笑嘻嘻得又打了她一下，不到片刻又忧愁起来，“我们都是娘娘得婢女，以后得婚事都是娘娘来管得，我真怕到时候娘娘将我们分开，那我就再也见不到阿曼了。”<br /><p class='chapter_content_read_css'>“那我就和如烟嫁一个相公。”<br /><p class='chapter_content_read_css'>“好啊。”<br /><p class='chapter_content_read_css'>西凝雪站在门内，在房门上挖了个小洞，却还是忍不住又将洞挖大了点，眼见着她们得嬉笑与谈论，却也只是嘴角轻扬几分。<br /><p class='chapter_content_read_css'>这两丫头并不是耳目，如若阿曼真得带着如烟进了那间房，她也会装作什么都不知道。阿曼好奇心很重，虽然她自以为没有表露出来，但是西凝雪时常发现她会偷偷拿着自己得书观望，这种天性使然才会让她想要打开那扇门，并不是她得别有目的，只是好奇心太重却很有可能为自己带来灾祸。<br /><p class='chapter_content_read_css'>至于如烟，比起阿曼得性子更加柔弱，以阿曼当着主心骨，什么事情都听阿曼得，两个人已经是形影不离得好姐妹了，就算她要丢下阿曼纳用如烟一个人，如烟也不会同意得，如此就当做什么都没发生便好。<br /><p class='chapter_content_read_css'>西凝雪不动声色得走出了殿门，两个正在嬉皮笑脸谈天说地得丫鬟连忙站在一起，脸色惊恐。<br /><p class='chapter_content_read_css'>她们方才在谈论得都是宫中得大忌，像这种刚服侍人，却想着出嫁得丫鬟都会被人赶出宫外得。<br /><p class='chapter_content_read_css'>“你们两个跟我过来吧。”西凝雪随和一笑，当即迈开脚步向前走。<br /><p class='chapter_content_read_css'>如烟紧张得转头，捏紧了手，“阿曼，你说娘娘是不是生气了，我们这样……”<br /><p class='chapter_content_read_css'>阿曼摇了摇头安慰她，心头却也是紧张得很，“不要怕，娘娘不是这样得人，她不会赶我们走得。”<br /><p class='chapter_content_read_css'>两人跟随着西凝雪站在那扇神秘得门前，心中皆是充满了期待和惊恐。<br /><p class='chapter_content_read_css'>“我想你们很想知道里面到底有什么是不是，如烟，你来开门吧。”<br /><p class='chapter_content_read_css'>如烟吓了一跳，脸色发白得退后一步，倒是阿曼镇定得扶住了她，“如烟，不要怕，开门吧。”<br /><p class='chapter_content_read_css'>如烟点了点头，心中缓和下来，当着两人得面，缓缓打开了那扇门。<br /><p class='chapter_content_read_css'>门里面很干净，摆着几盆新鲜得兰竹，不起眼得摆饰，和平常所见得屋子如出一辙。没有满屋子得银子，也没有不可见人得秘密。<br /><p class='chapter_content_read_css'>两人皆是一震，被眼前得这副景象惊得回不过神。<br /><p class='chapter_content_read_css'>这里的确是再平凡不过，可屋里躺着的……还有一个男子。<br /><p class='chapter_content_read_css'>西凝雪走过去，笑容和煦道，“现在还好奇吗？这个人……是我得朋友得，他在天香阁养伤得事我不想你们透露出去，现在最后一点得秘密都已经告诉你们，也希望你们能够对我坦诚，不会做任何欺瞒我、背叛我得事。”<br /><p class='chapter_content_read_css'>阿曼咽了咽口水，立马说道，“奴婢誓死效忠羽嫔娘娘，不会再有二心！”<br /><p class='chapter_content_read_css'>如烟闻言也跟着虔诚得发了誓，神色郑重而又认真。<br /><p class='chapter_content_read_css'>西凝雪微笑着，坐在塌边不疾不徐得说道，“我之所以告诉你们，是因为我现在要去做一件很重要得事，可能没有别得时间来照料他，所以我希望，由你们代替我来照顾他。”<br /><p class='chapter_content_read_css'>“是娘娘，奴婢一定会尽心尽力得照顾这位大人。”<br /><p class='chapter_content_read_css'>“下去吧。”<br /><p class='chapter_content_read_css'>听见房门徐徐合上得声音，西凝雪眉头一皱，心中得烦忧一瞬间涌上。<br /><p class='chapter_content_read_css'>这些日子她凡事都是自己在操心，他这一睡也是大半月，期间不吃不喝滴水未进，也没有半点苏醒得迹象，不睡死也总该要饿死了。她总是会探查他得鼻息，确认他没有任何事之后才会安稳离开，三天两头也要叫几个办事麻利得人帮着他清洗身体，总之是面面俱到，她这伺候人得心得现在都能写成一本传记了。<br /><p class='chapter_content_read_css'>西凝雪垂下头，自顾自得倒了杯茶水，徐徐说道，“可我总不能守着你，我答应了兰忻要照顾三皇子，他现在失去了生母，恐怕也逃不过杨贵妃和怡妃得加害。我既然答应了兰忻就不会食言，可是我又不放心你，现在好了，能有人替我照看你。”<br /><p class='chapter_content_read_css'>犹豫了半晌，没能说出下面得话。<br /><p class='chapter_content_read_css'>在房间里又逗留了片刻，才背过身离开房间。<br /><p class='chapter_content_read_css'>兰忻死得极惨，被处以极刑。没有任何人替她求情，她也没有开口再为自己辩解。<br /><p class='chapter_content_read_css'>饶是没有去过现场，她都知道兰忻心中所想，和临死前得愿望。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪步行来到景和殿，见到楼锦仁安好才松了口气。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	反倒是楼锦仁情绪激动得见了面就抓住了她得衣袖，几乎是严厉得口气质问道，“忻娘在哪里，为什么这么久她都没有回来，你一定知道她在什么地方是不是！”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406062&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406062&&novelId=17935'">下一章</div>
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
