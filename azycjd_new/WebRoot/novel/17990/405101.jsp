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
    <title>第二章【与夫人对峙】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405101&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405101&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405101+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二章【与夫人对峙】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405101')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405101 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405101,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第2章&nbsp;&nbsp;&nbsp;第二章【与夫人对峙】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“小姐，不可！”两个丫头全都跪在地上，小姐这样的作为今日怕是就用不上午餐了。虽然小姐自落入池塘清醒后就变得跟以前不一样，可是单薄的小姐怎么斗得过根深蒂固的继夫人。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<br /><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	&nbsp;“哼！”邵依依冷哼一声，不理会两个婢女的苦苦哀求直接提了食盒迈开步子走了出去。两个婢女你看看我我看看你，然后“蹭”的一下从地上起身，不能让小姐一个人去面对继夫人的人，即便知道自己力量薄弱，两个婢女还是朝着大厨房的方向跑去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;邵依依推开“墨芽阁”的院门后犹豫了一秒钟，大厨房的位置在这几个晚上出门遛弯的过程中已经摸清楚了。找准方位，邵依依拎着食盒大步向前走去。很快，邵依依便来到了厨房，而厨房的众人都在厨房旁边的一个小餐厅内用餐，邵依依一声不吭的直接走了进去，看着桌子上荤素搭配的各色菜式，比她这个嫡小姐吃得不要好太多了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>直接走到那个穿着明显比其他人体面的坐在上位的中年妇人面前，邵依依知道此人便是大厨房的管事徐妈妈，也是张氏的陪嫁之一，邵依依二话不说直接将食盒扔到了徐妈妈的脸上。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“啊，啊，啊……”徐妈妈直接从座位上跳着喊了起来，因为给邵依依的饭菜基本都是用水烹制的，因此菜汤比较多，所以淅淅沥沥的汤水从她的发髻上流到她那堆满肥肉的脸上，再从脸上滴落到她那褐色的衣衫上。徐妈妈脑门上顶了一片有些发黄的青菜叶与软烂成一团的豆腐一脸不可思议的看着这府中不甚得宠的几乎像是透明人一样的二小姐。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“看，看什么看！”邵依依扫视了一圈后冷冷的说道，瞬间桌边只剩下被泼了菜叶的徐妈妈与邵依依，再就剩下刚刚赶来的灯影画影二人。那二人小心翼翼的看了一脸菜色的徐妈妈一眼，很辛苦的才忍住了笑，继而又担心的看了自家二小姐一眼，这徐妈妈可是继夫人身边的红人，小姐这样会不会收到惩罚啊！<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“老奴做错了什么得小姐这般对待？”到底是做了多年的奴才，即便一开始非常吃惊但没一会儿就平复了情绪，抬眼看着邵依依，眼中闪着敌视的光。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“见了小姐竟然不行礼，徐妈妈你是越发的目无主子了吗？”邵依依再次开口，声音冷得都能够滴出冰来，“灯影，给我掌嘴！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“是，小姐！”灯影虽然害怕的发抖，但是为了小姐的命令，也为了这几年来小姐所受的委屈，她颤颤巍巍的站在了徐妈妈的眼前，闭上双眼努力的伸出了右臂使了大劲抡了上去，然后手臂像是被什么卡住了一般动弹不得，灯影将眼睛睁开一条细缝，原来是那徐妈妈伸手钳住了自己的胳膊，登时脸变得通红一片。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“二小姐，奴婢还是那句话，老奴到底做错了什么事情？”徐妈妈竟然直视邵依依，眼中像是要喷出怒火一般，但这些都直接被邵依依无视了，电光火石之间邵依依突然伸手“啪”的一声，一记重重的耳光打到了徐妈妈的脸上，使得她整个脑袋都向右偏去，但是脸上的红印却只是浅浅的样子。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“嘶，脸皮真厚！”邵依依冷冷的说着，而后轻轻的甩了甩有些疼痛的玉手，动作稍显俏皮，配着她那有些冷漠的面容，整个人透着一股子奇异的美感。只是邵依依此刻的内心却是鄙视了一番这个身体的脆弱程度，甩了他人小小的一巴掌，自己竟然都有种晕呼呼的感觉，这也太脆弱了吧？<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“呦，二姐姐好大的阵势啊！”大厨房出了这么大的事情，收拾人的竟然是一向软弱的二小姐，而被收拾的竟然是夫人的心腹，自然有人将这事禀了府内掌管后院的夫人，而开口说话的便是邵依依的异母妹妹，也是这继夫人的亲生女儿邵卿卿了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>听到说话声，邵依依便转了头，只见穿着宝蓝色裙衫梳着坠马髻的夫人，与穿了件深藕色遍织金云纹的长衫，外面配了一件湖蓝色织大朵百合花的长比甲，梳着妩媚的倾髻的邵卿卿，被众星拱月般的簇拥着进来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“夫人来得正好，刚好帮依依处置一下这欺上瞒下的刁奴！”邵依依并没有理会她那个没有教养的继妹，只是对着张氏微微一礼之后，直接开口说道。而邵依依的两名贴身侍女也早在邵卿卿开口之时已经垂首站好跟着邵依依对着张氏行礼。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp;“邵依依，你……”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“卿卿，闭嘴！”听到邵卿卿愤怒的声音，张氏急忙开口阻止，声音中是从未有过的严厉，只见邵卿卿的眼眶都慢慢的红了起来，好似受了无尽的委屈。张氏厉声阻止了邵卿卿的话语，而后笑的一脸温柔的对着邵依依开口，“这奴才怎么得罪我们二小姐了，说出来母亲替你作主！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>“回夫人，老奴冤枉啊，”却见那徐妈妈突然哭天抢地的跪了下来，一边哭一边还不忘诉苦，“二小姐觉得饭菜不合口味全都摔到了老奴身上，夫人，您看看奴婢身上这些东西。就这样二小姐觉得还不够上来就对老奴一顿拳打脚踢，奴婢这身上可到处都是伤痕啊！可是奴婢根本没有做错什么，完全是按照大夫的医嘱行事啊，大夫说了，二小姐体虚，要吃清淡一些的，可二小姐她……”徐妈妈说着还抹了一把眼泪，可谓之声声泣泪，“老奴是这府里的老人了，如今这般老奴是无颜替夫人管理这大厨房了，还请夫人为老奴做主啊！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>什么叫做颠倒黑白，什么叫做恶人先告状，邵依依算是真真切切的领会到了。只是她一向是个不喜逞口舌之争的人，故而她只是冷眼旁观，倒是那两个忠心的小丫鬟看不下去了，从而双双跪在张氏面前将邵依依护在身后，哭泣出声，“徐妈妈血口喷人，诬陷小姐，求夫人为我们小姐做主啊！”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405101&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405101&&novelId=17990'">下一章</div>
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
