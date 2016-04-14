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
    <title>第二十六章【胜龙寺之行】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406316&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406316&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406316+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十六章【胜龙寺之行】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406316')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406316 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406316,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第28章&nbsp;&nbsp;&nbsp;第二十六章【胜龙寺之行】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 邵依依微微抬首就看到自己贴身的两个丫头屈膝行礼的样子，看着她们双腿隐隐有打颤的迹象，于是她直接开口，“你们两个先退下吧！”两个丫头互相对视了一眼，然后听话的站在了邵依依的身后。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏没想到邵依依如此的沉的住气，难不成以前那鹌鹑似的样子都是装出来的？竟然现在还给我装看不见，我偏不让你如愿。于是张氏前行两步走到邵依依的视线范围内，而后开口“依依，母亲听下人说你不舒服，”张氏故意语气温柔，为的就是激怒邵依依，这样到了邵渊戎面前自己也能占个理字，权当为自己还在禁足的女儿出口气，“你现在感觉怎样了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “给夫人请安！”邵依依像是才看到张氏一般，缓缓起身对着她浅浅一礼，而后直视着张氏那充满算计的双眼，“姑且死不了呢！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “你！”张氏脸上维持的笑容一下子僵住了，她没想到邵依依竟会如此直接，一瞬间将来之前想要说的话一下子全都堵在了腹中。她甚至有些气急败坏的伸出纤纤玉指指向邵依依的面容。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “夫人，息怒！”到底姜还是老的辣，唐妈妈早就收了一开始的得意，这会看到自家夫人有些失态，急忙上前轻轻的拽了拽对方银红的长袖，低声劝说。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏顺着唐妈妈的动作将胳膊垂了下来，深呼一口气，将自己的怒火慢慢的压下。本来是想激怒对方，却一而再的被对方激怒，自己这是怎么了？平复了自己的情绪之后，张氏脸上挂着淡笑继续看向邵依依的方向，好似刚刚那个恼羞成怒的人不是她自己一般，“既然如此，依依多多休息便是！”说完，带着自己的人匆匆离开，颇有些落荒而逃的意思。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “真没劲！”邵依依轻轻叹了一声，自从邵轻扬上任之后，别说出府，就连这个院子她也没有出过，一天到晚困在这个。突然之间，计上心来，嘴角露出一抹得逞的笑。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 日渐西斜，邵渊戎散职回府，打发了二门上张氏派去等候他的人，照例来到邵依依的院子报到，但今日的女儿并未像往日一样在院中迎他，邵渊戎加快步伐朝里走去。昨日还活蹦乱跳的女儿今日懒洋洋的躺在软塌上，看到她进来就挣扎着想要起身，邵渊戎急忙上前按住她的肩头，语带焦急，“躺着就好！”而后转身看向房内伺候的两个丫头，语气不善，“小姐这是这么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “老爷恕罪，”灯影画影二人急忙跪在地上，连连磕头，看得邵依依都有些心疼，虽然是她们提前商量好的，两个丫头也同意了的，但看着她们已经红了的额头，邵依依就有些于心不忍了，好在邵渊戎也不是一个喜欢体罚下人的主人，自然开口阻止，“小姐到底怎么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 灯影比画影大了有半岁，但明显比画影条例清晰很多，她就从昨天邵渊戎离开“墨芽阁”之后的事开始说起。说着说着就看到邵渊戎的脸色越来越黑，灯影也吓得不敢吭气了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 得了消息的张氏自然也赶来了，一进邵依依的闺房她就傻了眼，但很快就明白过来这是对方给她下了套。她急忙上前想要解释，但一看到邵依依比上午的苍白多了些蜡黄的脸色，想要说的话就卡在了嗓子说不出来了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏满含委屈的看了邵渊戎一眼，却发现对方根本没有看她，随即低下头敛去了眼底那一抹深不见底的狠毒。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 就在张氏还想着怎样应付邵渊戎的时候，却没想到邵渊戎直接将她打发了出去，回到自己院中的张氏，提笔写了一封信让唐妈妈直接送了出去，当然是送到她的嫁妆铺子里，里面自然有人会按照信中的安排将一切都布置妥当。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “父亲，我没事！”邵依依还是从床上坐了起来，灯影仔细的帮她在后背垫了个软枕，让她能舒服一些。邵依依并未再让两个丫头说昨日之事，有些事只要在对方心中埋下一颗种子，总有一天会长成参天大树，从而达到自己的目的。于是她话锋一转，开口将自己的想法告诉邵渊戎，“女儿明日想去‘胜龙寺’烧柱香，母亲的忌日眼看着就要到了，女儿还想多住两日好为母亲祈祷！”说完，邵依依垂下了头但邵渊戎还是看到了她微红的眼圈。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “好，父亲会安排好的！”因为想起了亡妻，邵渊戎自然将其他事情都抛在了脑后，而后叮嘱她照顾好自己就转身离开了。看着他有些逃也似的步伐，邵依依大概也知道了，安氏在他心中的位置。只是，另邵依依纳闷的是邵渊戎对待张氏的态度，如果说爱她吧，也可以月余时间不理她，若说不爱吧，人家办个白莲花他就掉下去了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 算了，想不通便不想了，邵依依下床坐到桌边吃着涟漪刚刚送过来的八宝米茶，别说，这丫头的厨艺不错，现在她的一日三餐基本都是这丫头在料理，尝了很多前世都未曾吃过的美味。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 夜幕慢慢降临，邵依依看着四个忙的满脸通红的丫头，笑着拍了拍手，“好了大家坐下休息会吧！”除了浣纱之外的三个丫头都从善如流的坐下了，只有浣纱还有些局促的站在一旁。三个丫头里面就只有涟漪与浣纱比较熟悉，于是她就拽了拽浣纱翠色的衣袖，“浣纱姐姐坐吧！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依并没有去理会她们私下的小动作，只是严肃的开口，“灯影，我不在的这几日你与云雁夏秋给我把‘墨芽阁’守住了，除了你们几个这房间谁也不许进来，如若发现，直接关了暖阁，等我回来处置！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小姐您不带奴婢吗？”不知为何灯影有些小心酸，语气都恹恹的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “你比画影稳重多了，院子交给你我放心。”邵依依如何不知灯影的心思，她只怕画影笨手笨脚的照顾不好自己，于是继续说道，“你放心，画影浣纱涟漪画屏我都会带走，你放心好了！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 翌日，邵渊戎没等到散职便回来了，看着邵依依的气色好多了，这才道，“你在寺院照顾好自己，待你母亲忌日父亲便会来陪你！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵渊戎说到此处的时候，邵依依扭头朝张氏的方向看了一眼，只见张氏面含浅笑，丝毫没有不悦，倒是她身后关了一月刚刚解除禁令的邵卿卿一脸不愤的样子，但是碍于邵渊戎在场不敢造次。看来，这一个月还是有些作用的。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依只是轻轻扫了邵卿卿一眼，邵卿卿就像炸了毛的猫儿一样，全身都进入了战备状态，但没想到邵依依只给了她一个轻蔑的笑就转身上了马车，邵卿卿整个人都不好了，眼泪已经在眼眶中打转了，要不是怕再被禁足，她才不会被欺负的如此窝囊呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 送走了邵依依，邵渊戎并未在回府，而是带了管家顺伯再次回了府衙，他是抽出时间来送邵依依的，还特地点了八名精壮的护卫随行以保护她的安全。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵卿卿从未被邵渊戎如此无视过，回到“怡玥阁”之后再也忍不住的哭了出来，一旁新提上来的大丫头素锦有些小心翼翼的往后缩了缩，生怕自己被邵卿卿看到用来做出气筒。她其实真的不想给三小姐当大丫头，毕竟雪莹的事情才过去没多久，跟了这么一个不靠谱的主子，小命随时不保啊。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 或许是邵卿卿哭的太过伤心，竟然连推门的声音都未曾听到，只是伤心的她直接被人搂到了怀中，感受到母亲怀抱的温暖，邵卿卿再也忍不住的大声哭了起来。张氏轻轻抚摸邵卿卿乌黑的长发，语气温柔，“娘亲的乖女儿，这是怎么了？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “父亲今日都没有注意到女儿……”邵卿卿嘟嘟囔囔的说着，委屈的泪水一直在眼眶中打转。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 张氏稍稍退开一步，看着自己的女儿，粉色的百褶裙，漂亮的灵蛇髻，头上簪着一支赤金为干，翡翠为坠的步摇，耳朵上带着一对的菱形红宝石耳坠，就连手腕上也带着一只翡翠的玉镯，一看都是精心打扮过的模样。张氏摸了摸邵卿卿的脸，“我女儿真漂亮！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “可是父亲看到没看人家一眼，”邵卿卿嘟着嘴，然后像是想起了什么，语气恶毒，“那个贱人她还嘲笑我，她哪里有人家漂亮，她凭什么嘲笑人家？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “卿卿，”张氏有些严厉的出声，“跟你说过多少次，你一个未出阁的姑娘家不要将那些话挂在嘴上，你怎么一点记性都不长？”张氏有些恨铁不成钢，但自己就这一个女儿，自然要多加教导。她在自己面前这般不注意，自己还能提点提点，如果嫁了人，在婆家要是这般没大没小，肯定要被人家指责没有教养的！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “娘亲~~~”邵卿卿也有些害怕严厉的张氏，拉长声音开始撒娇，企图蒙混过关，让张氏不在抓着这一点不放。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406316&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406316&&novelId=17990'">下一章</div>
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
