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
    <title>第三十章【牛皮糖】</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406558&&novelId=17990";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406558&&novelId=17990";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406558+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第三十章【牛皮糖】]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406558')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406558 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17990','公子万劫不复之嫡女撩人','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406558,17990,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第32章&nbsp;&nbsp;&nbsp;第三十章【牛皮糖】
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			&nbsp; &nbsp; 风落饮听到邵依依如此讲，一时间怔住了，他用这一招吓坏了好多女子，但是这人怎么就一点都不上当呢？按理说自己演的应该很逼真啊，难道是自己一开始的出场方式不对？<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 风落饮不知道的是，面前镇定的女子根本就不是这个时空的人，她本身就是一个善于从眼睛看到别人内心的人，当然，渣夫除外，也或许是渣夫的演技太棒连她都给骗过了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 风落饮其实是属于那种捧着不屑，撵着却倒追的人，如果今日她们全都是一副害怕的模样，他只会笑笑离去。但偏偏有个与别人反应都不一样的邵依依，风落饮一下子就对她起了兴趣。于是斜倚在一颗树上，自腰间取出一方锦帕缓慢的擦着折扇上的一丝血迹。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 不知道他的扇子是什么材质的，亦或许是他取出的锦帕是用特殊药物浸泡过的，总之，折扇上的已经慢慢干涸的血迹就那样被轻轻擦拭干净了。展开折扇，风落饮仔细的观察画着腊梅的扇面是否有沾到血迹，幸好，扇面干净如往昔，一支寒梅傲立在白雪之中。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依现在完全肯定今日之事并不是偶然，一定是张氏安排好的。但是之前的问题又来了，这么短的时间安排好这一切，张氏到底是何身份？她会如表面上那般简单只是一个五品官的女儿吗？<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 想不通，但邵依依却对张氏的以及张家的身份上了心，待下次见到邵轻扬后一定要让他好好查查，不然他们二人只怕活不到寿终正寝了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 她们出行共架了两辆马车，但现在看来只能舍弃一辆了，浣纱与涟漪驾车，画影与画屏在马车内服侍着邵依依，刚刚的打斗并没有波及到马车内部，所以此刻马车内也算是一应俱全。喝了一口已经冷掉的茶水润了润嗓子，邵依依倚着颠簸的马车闭目养神，刚刚用掉了太多的力气，这会儿她浑身酸痛，怎样都不舒服，于是吩咐她们帮她捏捏肩膀揉揉腿。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “停车！”正享受着，邵依依突然睁开眼睛喊了一声，于是马车便歪歪扭扭的停了下来，没办法驾车的是新手根本无法正确把握方向。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “小姐，您没事吧？”邵依依的一嗓子让画影手抖了一下，于是她就被对方捏疼了，画影急忙揉着邵依依的肩头，小心询问。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “没事，”邵依依眉头微蹙，朝着马车顶棚看了一眼，声音中透着浓浓的不悦，“阁下为何跟着我等？”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “大路朝天各走半边，小爷我喜欢！”马车顶上传来风落饮满不在乎的声音。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵依依生气了，于是她直接掀起帘子跳下了马车，朝旁边走了两步，于是便看到了风落饮躺在马车顶上，将折扇打开用来遮挡头顶的太阳，还悠闲的将左腿搭在右腿之上，嘴里还噙着一朵路边随处可见的嫩黄色小花。这哪里有半分侠士的样子，完全就是大街上游荡的地痞流氓的模样。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 对方不愿离去，邵依依也没有办法，但总不能这样直接回府，那张氏肯定会借题发挥，还不知道会搞出什么幺蛾子呢。既然如此还是按原计划吧，邵依依吩咐浣纱调转车头继续朝着“胜龙寺”的方向行进，只是派了画屏回去向邵渊戎讲述今日所发生的事情。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 马车颠簸前行，但风落饮完全不受影响，他竟然自得其乐的哼起了小曲，听得邵依依一脸的黑线，这人一看就是常年流连声色之地，竟然连那些地方的曲调都哼的如此熟悉。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 待到日落西山浣纱才将马车赶到“胜龙寺”。好在，一大早邵渊戎让人前来安排住宿的事宜，所以邵依依刚到寺庙与方丈见过礼之后就直接回了寺内安排的厢房，坐了一天的马车还经历了一场刺杀，邵依依整个人都累到虚脱，躺在床上一动也不想动。好在那个缠人的风落饮在抵达“胜龙寺”的前一刻就闪身离开了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 同一时间，画屏也终于回到了邵府。回来之前，邵依依还专门叮嘱了画屏，小心张氏。于是，画屏在进了城门做的第一件事并不是直奔邵府，而是先去了莫大娘家，莫大娘是她在以前干活的那家认识的，关系还算不错，但后来那家没落了，莫大娘因为并不是那家的家生奴才，所以便还了自由，而她就被人伢子卖去了邵府。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;莫大娘是个热心人，听闻画屏帮小姐出门采购路遇盗贼，表示一定会帮她到底。画屏给自己化了妆，将自己扮丑一些，然后换掉了邵府统一的丫鬟装，穿了莫大娘闺女的一套绣花短打衣。然后与莫大娘扮母女，结伴来到邵府门外。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “大哥，我们找贵府的总管顺伯，”画屏扶着莫大娘的胳膊，对着邵府门外的小厮垂首低声道，“我们是他的远房亲戚，从老家前来投奔他的！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “你们等着，我进去通报一声！”小厮看了两人一眼，爽快的答应，画屏抓着对方的手千恩万谢，顺手将一个小小荷包塞到了小厮的手中，小厮愣了一下，又推了回来，一脸局促但是却什么也没说的进去了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 听到下人的回报，顺伯虽然有些摸不着头脑，但还是出来了，虽然老家没多少人，但保不齐就是自家亲戚呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 顺伯早年是跟着邵渊戎上过战场的，眼力自然比一般人要强上许多，所以尽管画屏化了妆换了衣服，但他还是一眼就认出来了。这丫头不是陪小姐去了“胜龙寺”吗？怎地现在这样一副模样就回来了。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;画屏看到顺伯出现的时候眼泪就在眼眶中打转，一副喜极而泣的模样，当然这也是真情流露，看到顺伯的时候，画屏才知道自己是真正的安全了，因为她一路走来感觉有好多双眼睛再盯着邵府。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 画屏轻轻的推了推莫大娘，于是莫大娘就喊了一嗓子，“表哥，我可总算找到你了！”画屏也紧跟着上前脆生生的喊了一句“表舅！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 顺伯很快反应过来，应了一声，“你们怎么找来的？”小厮一看这情形赶紧放行。但是画屏很快就发现莫大娘与顺伯的反应很不对劲，虽然着急小姐的事情，但在邵府内画屏还不敢随意表露出着急的模样，谁知道张氏的人都窝在哪个犄角旮旯呢。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 顺伯直接带着画屏去了邵渊戎的书房，一看到邵渊戎画屏就跪在地上将今日所发生的事情讲述了一遍，听得邵渊戎的脸色当场就变了。“吴顺！”邵渊戎喊了一声。在外伺候的顺伯立刻退开书房的们走了进来，“老爷！”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “安排些人手，你随我一起去‘胜龙寺’。”<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 顺伯一脸肃穆的应到。随即去安排他们在暗中的人手在府外集合。当初被帝王“贬”官至此，帝王就暗中拨了一笔钱财用来培养人马，却没想到第一次用到这队人马竟是在这个时候。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 顺伯交代画屏照顾好莫大娘之后就与邵渊戎骑马离开了，虽然对于顺伯的吩咐有些摸不着头脑，但自己既然将莫大娘带来了，自然是要保护好她的。老爷不在的情况下，后院根本就是张氏的地盘，为了安全，画屏带着莫大娘在顺伯的小院子中住了下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp;顺伯，原本是邵渊戎麾下的一员副将，邵渊戎原本是打算让他继续呆在军中，但顺伯还是固执的跟他一起来到了扬州，做了他的管家。所以，顺伯并不是一般的下人，他在邵府有自己独立的院子，只不过比起其他人院子小了一些。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 出了城门，邵渊戎一夹马腹率先飞奔出去，心系女儿安危，他根本不想浪费时间在路上。大概也就是一炷香（半个小时）的时间，邵渊戎率众人便到达了“胜龙寺”山下。大掌一挥，十人小队迅速掩藏了身形，邵渊戎带了顺伯直奔寺内。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 邵渊戎当初施行那一系列政策的时候没少得到“胜龙寺”的方丈了闻大师的帮助，所以寺中的僧人对于邵渊戎还是很熟悉的。看到他这么晚前来，知客僧直接带他去了方丈的禅房。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 轻轻的敲了敲门，邵渊戎静静的站在门外等候。直到传来了闻大师儒雅的声音，邵渊戎才推开门走了进去，而顺伯就静静的站在门外，等着邵渊戎的同时也防止他人靠近偷听里面人的谈话。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “阿弥陀佛，”穿着灰色的僧袍，了闻大师坐在蒲团之上双手合十念了声佛号，道了声“好久不见。”才请他坐下来。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; “谢大师！”邵渊戎双手合十对着了闻大师行了一礼，这才坐了下来。既然来了，也知道了依依没事之后，邵渊戎自然将最近查到的一些事情以及今天邵依依遭到的刺杀一事完全告知了了闻大师。说到这里，不得不介绍一下了闻大师其人。<br /><p class='chapter_content_read_css'><br /><p class='chapter_content_read_css'>&nbsp; &nbsp; 了闻大师，大家所知道的便是得道高僧，但他还有另一个身份，那便是当今圣上的皇叔。他从来无心帝位，很早便离宫四处游历，后来受到了大师的点化便出了家，然后一心研究佛法，继而成为受人尊敬的得道高僧。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406558&&novelId=17990'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17990/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406558&&novelId=17990'">下一章</div>
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
