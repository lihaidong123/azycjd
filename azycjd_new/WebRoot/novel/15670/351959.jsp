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
    <title>番外之告白（2）</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351959&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351959&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351959+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[番外之告白（2）]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351959')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351959 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351959,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第47章&nbsp;&nbsp;&nbsp;番外之告白（2）
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“真的，好喜欢你。”<p class='chapter_content_read_css'>行云的脸腾地就红了，红的就如同能滴出血来，浑身的血液燥热不安。<p class='chapter_content_read_css'>  “是在说梦话吧，哈，哈，哈。”行云干笑几声，“说不定是哪家的姑娘呢，衣管事还真是，还真是……”<p class='chapter_content_read_css'>  他忽然就哽住，只因衣蓝又重复了一遍。<p class='chapter_content_read_css'>  “行云，我真的，好喜欢你。”<p class='chapter_content_read_css'>  他腾地转脸看向衣蓝，恰好蹭过他的唇，衣蓝紧闭着眼，温热的鼻息吹在行云脸颊上，行云立马回过头，脚下像是踩了风火轮似的一溜烟回了府中，幸好徐管事给他留了门，不然他可要直接撞在大门上了。<p class='chapter_content_read_css'>  后厢房寂静的很，行云只能蹑手蹑脚背着衣蓝回了衣蓝的房间。<p class='chapter_content_read_css'>  刚给衣蓝收拾好盖好了被子，手还没从被子上离开，就被衣蓝紧紧抓住。<p class='chapter_content_read_css'>  行云腾地脸又红了，认认真真的看看衣蓝，看看他是不是刻意的，但衣蓝躺在床上歪着头紧闭着眼，呼吸平稳，分明就是睡着了。<p class='chapter_content_read_css'>  行云又想到刚才衣蓝的那句话，心里更是平静不下来，他真的没想到，衣管事竟然喜欢男人，而且，而且竟然喜欢他！他差点儿就直接喷鼻血了。他是在做梦吧，做梦吧……<p class='chapter_content_read_css'>  明天醒过来就好了，没错，只是梦！<p class='chapter_content_read_css'>  这样想，行云就渐渐平静下来，搬了条凳子，趴在床头就睡去了，不一会儿就呼吸平稳睡着了。<p class='chapter_content_read_css'>  原本睡着的衣蓝慢慢睁开了眼，就算他没亲眼看着，他也感觉到了他的惊恐。<p class='chapter_content_read_css'>  果然……啊……<p class='chapter_content_read_css'>  还是……放弃吧……<p class='chapter_content_read_css'>  对了，自己是怎么喜欢上他的来着？<p class='chapter_content_read_css'>  对了，是那块芙蓉糕吧。<p class='chapter_content_read_css'>  早知道，就该狠狠心不给他的，现在后悔，是不是，晚了呢？<p class='chapter_content_read_css'>  那年，他跟着公子刚从君玄观回到滦城开始置办“南宫”家的产业，第一件事就是置办府宅，布置可信的仆人。<p class='chapter_content_read_css'>  徐管事是长公主的心腹，被长公主派来照顾公子，也自然成了主府的第一管事，府里大大小小的事务都交给他来办，自然，那些仆人侍卫也都是由他买来的，到最后也只是让公子过目决定。<p class='chapter_content_read_css'>  公子才十三岁就慧眼识人，有很多人都被又送回去了，留下的人也不多，而行云却恰好是那其中之一，还是所有人里面最小的，只有十二岁。<p class='chapter_content_read_css'>  其实行云差一点儿就被退回去了。<p class='chapter_content_read_css'>  那时行云就躲在另一个少年身后，怯懦地看向南宫宁雪和他，他眼睛里有着不同于其他人眼里的害怕与死灰，而是透着灵性和纯净的。<p class='chapter_content_read_css'>  他便求着公子留下了他，当他知道自己被留下来的时候，只是呆呆的问了一句。<p class='chapter_content_read_css'>  “我，在这儿可以有芙蓉糕吃吗？”<p class='chapter_content_read_css'>  公子微微一皱眉，没有言语，更没有人回答他，他就那样被徐管事带了下去。<p class='chapter_content_read_css'>  再见行云时，他正拿了芙蓉糕送去给公子，行云就躲在假山后面一直盯着他，准确的来说，是盯着他手中托盘里的芙蓉糕。<p class='chapter_content_read_css'>  看着行云挂在嘴边的口水，他强忍了很久才没笑出来。他招了招手，行云就兴奋地跑到他跟前，看着这个比自己矮了一头多的小男孩，心里冒出一丝异样，赶紧轻咳了一声，捏了一块芙蓉糕塞到他手里。<p class='chapter_content_read_css'>  “你为什么一进府就问有没有芙蓉糕吃？”<p class='chapter_content_read_css'>  行云的眼眸立刻黯淡下去，慢慢红了眼眶，“我娘她，她最喜欢给妹妹和我做芙蓉糕吃，可是，可是娘亲她抱着妹妹投河了，再也不能，再也不能给我做芙蓉糕了。”<p class='chapter_content_read_css'>  他紧盯着行云的眼泪在眼眶里打转却强忍着没有落下来，他心里猛一酸，又拿了一块塞进他手里，笑着道：“没事，在南宫府里，以后你天天都可以吃芙蓉糕，想吃多少就能吃多少。”<p class='chapter_content_read_css'>  他顺手揉了揉行云的脑袋，他的头发柔柔的，很舒服，就那样揉进他的心里。<p class='chapter_content_read_css'>  “嗯！”行云笑得咧开了嘴，眼里像装了星星似的，一闪一闪的。<p class='chapter_content_read_css'>  后来被公子质问芙蓉糕怎么少了，那是他第一次对公子撒谎，他说是他嘴馋偷吃了，虽然他心里也是胆战心惊，但他更害怕说出真相，行云会被赶出府。<p class='chapter_content_read_css'>  从那个时候起，那个名叫行云的小男孩就住在他心里了，他只能偷偷的藏在自己心里，这可是他最大的秘密了。<p class='chapter_content_read_css'>  他本想一辈子藏在心里的，可是，可是，当他看见泥儿，行云的儿子的时候，他真的忍不住了，心就好像被刨去一样，真的，好痛……<p class='chapter_content_read_css'>  这个秘密，他真的藏不住了。<p class='chapter_content_read_css'>  *********<p class='chapter_content_read_css'>  <p class='chapter_content_read_css'>  “泥儿！”衣蓝正端了茶具往厨房走，突然撒了手，茶具噼里啪啦碎了一地。<p class='chapter_content_read_css'>  *********<p class='chapter_content_read_css'>  <p class='chapter_content_read_css'>  行云正想着昨天晚上怎么就睡着睡着跑到衣蓝床上去了，虽然两人衣衫整齐，但是他心里还是别别扭扭的，幸好早上的时候衣蓝松开了他的手，又比他醒的晚，才让他没那么尴尬的面对衣蓝。<p class='chapter_content_read_css'>  他叹了一口气，手里的芙蓉糕还没塞到嘴里，右眼皮一跳就看见了慌慌张张的贺娘，心里莫名的慌张。<p class='chapter_content_read_css'>  “行云！行云！不好了！泥儿他落水了！”贺娘跑的上气不接下气，但脸色惨白，“衣管事下水去救泥儿了，可是，可是……”<p class='chapter_content_read_css'>  还没等着她“可是”完，行云手中的芙蓉糕就掉在地上摔碎了，他一脚踏在摔碎的芙蓉糕上，拼命跑出门去，只可惜那芙蓉糕，再也拼凑不齐了。<p class='chapter_content_read_css'>  行云也不知道自己到底在担忧什么，到底在害怕什么，是在害怕泥儿吧，还是……<p class='chapter_content_read_css'>  “可是，衣管事也不会水啊！”贺娘的余声狠狠扎在他心里。<p class='chapter_content_read_css'>  他一路跌跌撞撞，等跑到荷花池边的时候，只能看见躺在那里一动不动的衣蓝。<p class='chapter_content_read_css'>  他腾地一下跪在那里，再也站不起来，他不敢去确定，确定他是不是还活着，为什么？为什么？难道只是因为他那一句“行云，我真的，好喜欢你。”吗？<p class='chapter_content_read_css'>  衣蓝可是个男人啊！他难道也是喜欢男人的吗？怎么可能啊，怎么可能啊……<p class='chapter_content_read_css'>  眼看着衣蓝被人抬走，他摇晃着站起来，跑到他跟前。他紧紧盯着他，看他面色惨白没有一丝人气儿，眼睛瞬间模糊，无论他怎么擦也擦不干净，豆大的眼泪一颗颗砸在衣蓝脸上，却一颗颗痛在行云心里。<p class='chapter_content_read_css'>  徐管事不知什么时候站到了行云身后，将他拉到后面，衣蓝就被人抬走。<p class='chapter_content_read_css'>  他手脚僵硬站在原地怎么也动不了，只能眼睁睁的看着衣蓝慢慢消失在视线内。<p class='chapter_content_read_css'>  徐管事的手搭上行云的肩膀。<p class='chapter_content_read_css'>  “放心，衣蓝他只是呛了点儿水昏迷了，过一阵子就能醒了，放宽心。”<p class='chapter_content_read_css'>  “我……”<p class='chapter_content_read_css'>  “我知道，衣蓝他喜欢你，他已经喜欢你整整六年了啊。”徐管事也不知该怎么表达，“我不知道你心里怎么想，但当你未婚妻来的时候，我就该知道了，我早就该跟衣蓝说的，告诉他断了念想吧，可是我还是有私心，我不想让衣蓝伤心，所以就瞒着他，幸好公子被君师父留在了君玄观，衣蓝也暂时回不来，却没想到……”<p class='chapter_content_read_css'>  徐管事没再说下去，行云也知道没想到什么，没想到会变成这样。<p class='chapter_content_read_css'>  “罢了，到晚饭的时候，你来我房间一趟，我把所有的事都告诉你。”语罢，徐管事拍拍他的肩膀，渐渐走远。<p class='chapter_content_read_css'>  行云偷偷把衣蓝的房间开了条门缝，正好可以看见衣蓝恬静的睡颜，还可以瞧见正在点香的侍女的影子，他又偷偷将门扉关上，回到自己房间。<p class='chapter_content_read_css'>  终于熬到了晚饭时分，行云迈着沉重的步子走到徐管事房门前，犹豫了几下，手还没锤下，房门就“吱呀”一声被打开了，徐管事拿着盏灯，平静的看着行云，淡淡道：“进来吧。”<p class='chapter_content_read_css'>  行云一进屋里就看见了满桌的饭菜，正正好好一样不差都是他喜欢的，还有他最爱的芙蓉糕。落了座，徐管事就给他斟了杯果茶。<p class='chapter_content_read_css'>  “谢谢。”行云喝了一口，恰好是他最爱的香蕉果茶，疑惑漫上心头。<p class='chapter_content_read_css'>  徐管事给自己倒了杯热茶，淡淡道：“你知道为什么我今天这桌上摆的全是你爱的菜吗？”<p class='chapter_content_read_css'>  看着行云脸上迷茫的神情，徐管事嗤笑一声。<p class='chapter_content_read_css'>  “真搞不懂衣蓝这么好的孩子怎么会喜欢你这种呆瓜。若不是衣蓝恳求公子，你怎么会留在南宫府里？若不是因为你贪吃，衣蓝怎么会撒谎而和公子产生间隙？若不是因为你愚蠢把南宫府的消息透露给别人，衣蓝怎么会被公子打得半死差一点儿就没了命？若不是因为你非哭着闹着要吃雪莲花，衣蓝怎么会跑到那天寒地冻危险重重的雪山差点被雪狼吃掉？”<p class='chapter_content_read_css'>  行云被他控制不住的凶狠语气给吓住了，呆若木鸡的盯着自己的鞋尖。<p class='chapter_content_read_css'>  “虽然衣蓝并非我亲子，但我是看着他从襁褓里的小娃娃长成这么大的啊。虽然他是从没有过的任何父爱母爱的，但他是个心思很细腻的孩子，也十分会疼人，他总是把自己最好的一面给别人，就算是再大的苦他也是打碎了牙齿往肚子里咽，从来不抱怨一句。<p class='chapter_content_read_css'>  当我看见他塞给你送给公子的芙蓉糕时，我就明白了，他是喜欢上你了，他的爱，是比任何人的都要纯粹的，他偷偷看着你每天干什么，吃什么，喜欢吃的，喜欢玩的，都记在一个册子上，每天晚上睡觉之前都要拿出来看看，他兴奋地在床上打滚，我从见过他那么开心过；当看到你被人家欺负受伤的时候，他就会在你看不见的时候把人家给揍一顿，揍到都爬不起来，还偷偷的用自己为数不多的俸钱给你买伤药。” <p class='chapter_content_read_css'>  行云张了张嘴直接哑住，他根本就没有任何立场来说些什么。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351959&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351959&&novelId=15670'">下一章</div>
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
