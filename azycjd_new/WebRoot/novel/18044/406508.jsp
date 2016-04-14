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
    <title>第一章  男神搭话</title>
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
	<script language="javascript">var novelId='18044';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406508&&novelId=18044";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406508&&novelId=18044";
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
					window.location.href='<%=request.getContextPath()%>/novel/18044/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406508+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一章  男神搭话]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406508')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18044.jsp'">你是我的</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:卷枝</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18044/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406508 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','18044','你是我的','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406508,18044,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第1章&nbsp;&nbsp;&nbsp;第一章  男神搭话
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　　午后，来一首安静的安可曲，来一杯适当的奶茶，来几块精致可口的糕点。闭上双眼，你会体会到空气中带着一丝丝地香甜，一丝丝地享受。<p class='chapter_content_read_css'>　　阳台上，一个穿着白色衬衫，坐着轮椅的少年静静的拿着放在轮椅旁的彩色画笔熟练的勾画着人物的线路。少年乌黑柔顺的短发在微微的凉风中似轻轻的嬉戏着。<p class='chapter_content_read_css'>　　［嘀嘀嘀——］声音是由摆放在电脑桌上的笔记本电脑发出来的。<p class='chapter_content_read_css'>　　肖古白轻轻地放下画笔，推转过轮椅，向着电脑桌的方向推去。<p class='chapter_content_read_css'>　　白皙略带点修长的手握过鼠标，点进一直跳动的QQ。<p class='chapter_content_read_css'>　　古白：【怎么了？海报已经画好了，发给你。】<p class='chapter_content_read_css'>　　古白也就是肖古白的cn，好记又好写。古白点击储存海报的软件，点击了需要用到的图片，点击发送。<p class='chapter_content_read_css'>　　对方已接收。<p class='chapter_content_read_css'>　　天下凛凛：【哎呀~请小白大大收下在下的双膝~(≧▽≦)/~】<p class='chapter_content_read_css'>　　古白：【………】<p class='chapter_content_read_css'>　　天下凛凛：【小白大大~可不可以来我们〔天下〕的广播剧群~ヽ(?ω?｀)ノ】<p class='chapter_content_read_css'>　　天下凛凛：【(*/ω＼*)偶们群可是很多人爱着大大的，都希望大大能加入〔天下〕大家族。反正大大你也是我们家族的大大~加入好不好，好不好…QAQ】<p class='chapter_content_read_css'>　　天下凛凛：【大大？？小白大大？在不在？？在不在？？人呢？？】<p class='chapter_content_read_css'>　　我可以不回答么…<p class='chapter_content_read_css'>　　古白：【…在】<p class='chapter_content_read_css'>　　天下凛凛：【大大(??????)??你就加入我们家族吧~我拉你进，不可以拒绝或者无视哦~～(￣▽￣～)(～￣▽￣)～要不然，嘿嘿嘿~~】<p class='chapter_content_read_css'>　　【嘀——】天下凛凛拉你进〔天下广播剧群〕，您是否加入？<p class='chapter_content_read_css'>　　古白：【…好…】点击加入。<p class='chapter_content_read_css'>　　古白无奈，当初就不应该看着这策划披着〔天下凛凛〕的马甲来苦苦哀求自己帮忙画海报宣传。自己也不会认识这坑货三年了。<p class='chapter_content_read_css'>　　〔天下〕这群里，大部分都是人气多多的大神所在的地方。自己也算是大神么？呵，自己只不过是一个喜欢画画的残废而已。<p class='chapter_content_read_css'>　　记得十年前，如果不是因为自己闹着跟着父母一起去旅游，也就不会在去的路上出了车祸；如果不是因为自己，父母也就不会为了我不被压伤把我保护得太好的话，他们也不会因为我而死。爱的人都会离开自己，自己还有什么…<p class='chapter_content_read_css'>　　肖古寒推开关闭着的房门，手上端着散发出香气十足的汤。双眼看着古白那双眼紧紧的盯着双腿。眼睛里充满着自愧，懊恼，绝望的神情，肖古寒心疼急了。<p class='chapter_content_read_css'>　　不用想也知道，小白又在为十年前的那次车祸事件而感到自责了。<p class='chapter_content_read_css'>　　可是，这有什么错？小白是无辜的，谁也没想到十年前的一次旅游就让古白失去了父母不是么？再说了，古白那时候也就才九岁啊，就目睹了亲生父母的去世，自己却又无能为力解救的自己的父母那种心情，那个画面。<p class='chapter_content_read_css'>　　“小白，哥哥做了鸡肉汤，你帮哥哥尝尝好不好喝~”肖古寒叹了口气，微笑着看着还在发呆的古白，“想什么呢？想这么入神。”<p class='chapter_content_read_css'>　　“……没，鸡汤很好喝，谢谢哥哥。”古白回过神，喝了口鸡汤，仰起笑脸赞道。<p class='chapter_content_read_css'>　　“小白，别乱想，你还有我这个亲人，哥哥永远都在，你不是一个人。”肖古寒摸了摸古白的头，宠溺的看着世上留下来唯一一个亲人。<p class='chapter_content_read_css'>　　“好。”是啊，我还有哥哥。“哥哥今天公司不忙吗？”这十年来，哥哥一边打理着父母留下来的公司，已经很幸苦了，又因为自己的双腿没力气又得一边照顾着自己。<p class='chapter_content_read_css'>　　“啊，今天就给自己放一天假好了，反正也不忙。。哥哥照顾弟弟是应该的。”肖古寒想到那个缠人的牛皮糖，就一阵无语。<p class='chapter_content_read_css'>　　“是么…”古白一脸迷茫的看着。心里却暗暗地轻笑着，这个哥哥，只有对着那个人才会有这么一副表情。<p class='chapter_content_read_css'>　　“咳咳…我去看看晚饭好了没，你继续玩电脑，但是不可以玩太过火。”肖古寒一脸尴尬的走出房间，还顺带把门关上。<p class='chapter_content_read_css'>　　古白这下脸上终于浮现出淡淡的笑容。唯一能治得了自家哥哥的也就只有罗拉斯了。哥哥被罗拉斯吃得死死的，但同时罗拉斯也被哥哥吃得死死的。双方都爱惨了对方，他们俩在一起也有三年多了。<p class='chapter_content_read_css'>　　【嘀嘀嘀——】QQ群消息发出声响。<p class='chapter_content_read_css'>　　CN―天下凛凛：【欢迎大大~~(≧▽≦)/~】<p class='chapter_content_read_css'>　　CN—天下无毒儿：【是我开启的模式不对么！！为何看到了古白大大！！(??˙o˙)?】<p class='chapter_content_read_css'>　　CN—天下熙熙：【不是你一个人看错！！！古白大大。偶是你的NC粉！】<p class='chapter_content_read_css'>　　CN—天下泉溪：【真的是古白大大哇！！欢迎！！】<p class='chapter_content_read_css'>　　CN—天下兮兮：【欢迎！！】<p class='chapter_content_read_css'>　　CN—天下利剑：【我握了把草…凛凛你是怎么把古白大大勾搭来的！！我居然都不知道！！你还有没有把我当兄弟了！！】<p class='chapter_content_read_css'>　　CN—古白：【谢谢。原来…凛凛是汉纸…】<p class='chapter_content_read_css'>　　CN—天下凛凛：【(╯‵□′)╯︵┻━┻死开！！谁跟你兄弟了！！本小姐是女的！！要也是姐妹！！古白大大，你要相信偶是女孩纸。。】<p class='chapter_content_read_css'>　　CN—天下利剑：【古白大大，我是你的NC粉！！o(*////▽////*)q】<p class='chapter_content_read_css'>　　CN—古白：【呃…谢谢】<p class='chapter_content_read_css'>　　CN—天下倾城：【古白，你好。】<p class='chapter_content_read_css'>　　屏幕前的古白看到这句，愣了。天下倾城是谁啊！？有哪个广播剧不知道这天下倾城大神！居然跟我打招呼？我没看错吧？？？<p class='chapter_content_read_css'>　　天下倾城，广播剧里的高级大大，紫红大神。性格则是对谁都是冷冷淡淡的。不过问事。从来没有跟哪个CV有过暧昧什么的，也没有CP神马的，攻气十足。古白是因为天下倾城的声音才从那段阴暗的日子里走出来的。也是因为天下倾城才进入了二次元圈子。<p class='chapter_content_read_css'>　　古白表示很鸡冻，很纠结，从未想过有一天男神居然跟我打招呼！！啊啊啊啊…我要怎么回答！？我该说什么好！！<p class='chapter_content_read_css'>　　　CN—古白：【倾城大大…泥泥……嚎嚎…QAQ】<p class='chapter_content_read_css'>　　CN—倾城：【嗯。摸摸。】<p class='chapter_content_read_css'>　　广播剧群短暂的安静的众人看到这，都沸腾了！！这绝对有j-q有木有！！从没见过倾城大大主动跟人打招呼，就算是古白也是个大大！！但圈子里的大大有很多啊！！说木有j-q，谁信啊！！<p class='chapter_content_read_css'>　　CN—天下凛凛：【啊啊啊！！偶是小白傻妈跟倾城傻妈cp脑残粉！！！】<p class='chapter_content_read_css'>　　CN—天下兮兮：【cp脑残粉+1！！！我好鸡冻啊啊…】<p class='chapter_content_read_css'>　　CN—天下泉溪：【古白傻妈跟倾城傻妈以前认识！？啊啊啊…】<p class='chapter_content_read_css'>　　CN—天下利剑：【倾城你这家伙，什么时候拐了小白傻妈！！小白傻妈不可以啊！！倾城是个腹黑攻！！跟着他会很惨的！！】<p class='chapter_content_read_css'>　　CN—古白：【呃…以前不认识QAQ…】<p class='chapter_content_read_css'>　　CN—天下倾城：【摸摸头。小白现在不就认识了吗？】<p class='chapter_content_read_css'>　　CN—天下倾城：【利剑^_^】<p class='chapter_content_read_css'>　　CN—古白：【嗯…QAQ】<p class='chapter_content_read_css'>　　CN—天下利剑：【倾城傻妈我错了！！求放过…┭┮﹏┭┮】<p class='chapter_content_read_css'>　　古白看着热闹闹的群，嘴角不由得微微一笑，有个这样的群，也是挺好的嘛。<p class='chapter_content_read_css'>　　“古白，咱们中午到外面吃饭吧。罗拉斯请客。”肖古寒推开门，看着坐在电脑桌边的古白孩纸温柔的道。<p class='chapter_content_read_css'>　　“唔，，好吧。”看着自家哥哥一说到罗拉斯，那眼睛，啧啧啧。<p class='chapter_content_read_css'>　　“那你先收拾一下吧，我去客厅等你。”看着四周放着的都是画好的海报，肖古寒道。<p class='chapter_content_read_css'>　　“嗯好的。”向着走出房间的古寒应到。<p class='chapter_content_read_css'>　　CN—古白：【我要跟我哥出去吃饭，下了。】<p class='chapter_content_read_css'>　　CN—天下凛凛：【小白傻妈灰灰~(??????)??】<p class='chapter_content_read_css'>　　CN—天下倾城：【嗯】<p class='chapter_content_read_css'>　　CN—天下利剑：【古白大大灰灰~】<p class='chapter_content_read_css'>　　CN—天下泉溪：【灰灰+1】<p class='chapter_content_read_css'>　　CN—天下兮兮：【灰灰+2】<p class='chapter_content_read_css'>　　CN—天下熙熙：【+3】<p class='chapter_content_read_css'>　　CN—天下无毒儿：【古白傻妈灰灰~】<p class='chapter_content_read_css'>　　顾城看着头像已灰色的古白，嘴角勾起，小白，终于找到你了，这次，可不会再让你逃跑了。<p class='chapter_content_read_css'>　　—————————————————————————————————回忆分界线——————<p class='chapter_content_read_css'>　　————————————————————————————————————————————<p class='chapter_content_read_css'>　　西下的光照耀着水湖面，水面上泛着金色光环，偶尔几条调皮小鱼跃出水面嬉闹着。几只水鸭也跟着调皮的玩耍着。<p class='chapter_content_read_css'>　　一位穿着白色衬衫加上配上浅色的长裤，白皙光滑且精致的面上有着一双黑色美瞳。白皙的双手一手拿着画架，一手拿着笔，很是认真的画着画，不受这湖边上嬉戏的孩童。<p class='chapter_content_read_css'>　　看着慢慢西下的太阳，看着微风轻轻拂过少年的头发，面带着微笑的少年不知道此时此刻是多么让人联想偏偏。就比如顾城。<p class='chapter_content_read_css'>　　顾城就这么静静的看着少年已经很好一会儿了。顾城看着少年他的时而皱眉，时而释放。时而微笑着看水面上玩耍的水鸭。看着这样的少年，顾城的心犹如暖阳一般流过，连自己都不知道此时他自己面上是多么温柔。<p class='chapter_content_read_css'>　　天很快的黑了。来接少年的人来了。是位年轻的青年，看起来差不多有二十岁左右，青年手上还推着轮椅。当然，顾城可没有注意那么仔细，他只看到青年温柔的跟少年谈话着，看着亲昵的两人，顾城皱眉，随即又因少年的一句称呼而松开了皱着的眉头。哥？原来接他的是他的哥哥。<p class='chapter_content_read_css'>　　而接下来，顾城整个人懵了。双眼愣愣地看着少年被青年抱着放在轮椅上，推着离去，消失在视线中。<p class='chapter_content_read_css'>　　顾城回过神，满脑子想着少年是怎么了，为什么双腿无法走路？为什么会这样？顾城眼睛里满是心疼，恨不得替他承受。心里满想着，少年双腿无法行走时那场景，他是有多么的绝望。<p class='chapter_content_read_css'>　　顾城不知道自己是怎么回到家中的，此时的他心里只有那画画中的少年和少年无法行走的那场面，不断地重播着。<p class='chapter_content_read_css'>　　遇见少年已经一个星期过去了，顾城慢走在湖边。他没想到少年的模样刻在脑子里，怎么都抹不掉。。<p class='chapter_content_read_css'>　　突然，顾城眼睛一亮，是那个少年！他又来画画了。<p class='chapter_content_read_css'>　　画的是坐在少年不远处的一对甜蜜的老人家。少年跟那对老人家有说有笑，很是开心。
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406508&&novelId=18044'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/18044/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406508&&novelId=18044'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','18044','你是我的','yes')"/>
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
