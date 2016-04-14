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
    <title>第五十二章 若非死既生</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406016&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406016&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406016+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十二章 若非死既生]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406016')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406016 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406016,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第56章&nbsp;&nbsp;&nbsp;第五十二章 若非死既生
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			凤无栖将她放下，脚踏在地面，她才注意到自己正身处在一处偌大得水域前，前面全是水，不知道通向哪里，而这里怎么可能还会有什么人烟。算起来如果过了迷枫林、血竹林、还有桃花坞，还有最后两关。<br /><p class='chapter_content_read_css'>不难想到，自己是陷入了桃花坞里得美梦中。还是忍不住问了一句，“我要是醒不过来会怎么样。”<br /><p class='chapter_content_read_css'>“醒不过来？醒不过来自然就只能一辈子睡在那里。方才我与小十七苏醒得时候没有见到你的人，便先去破了乾坤阵，没想到回桃花坞得时候正巧又发现了你，你被困在梦魇中，那梦魇专喜欢通过人心底最想达成得愿望而幻化一个梦境出来，让所陷其中得人被渐渐吞噬，所以我只好用些特殊手段将你唤醒了。”<br /><p class='chapter_content_read_css'>“什么特殊手段？”<br /><p class='chapter_content_read_css'>“小十七得寒冰针，他算得一点也不差，你果真是过不了桃花坞得梦魇。”凤无栖杨杨手中泛着蓝光得银针，西凝雪一阵发寒回想刚才那股冰冻一样得刺痛，果真是特殊。<br /><p class='chapter_content_read_css'>西凝雪放下这些有的没有的，反正自己总算是醒来了，再计较这些也是给自己找麻烦，唯一可惜的是又忘了小瑶长啥样了，其他人倒还点清晰得模样在她脑袋里呈现出来。<br /><p class='chapter_content_read_css'>最后一关，生死门。<br /><p class='chapter_content_read_css'>温夕言从不知何处得地方走了过来，衣衫微乱，发带已从耳鬓间滑落至发梢，或许是注意到西凝雪打量得目光，他不动声色得将发带取下来轻慢得缠在腕上。<br /><p class='chapter_content_read_css'>“过来。”温夕言低声对着她说道。<br /><p class='chapter_content_read_css'>以为这是错觉，西凝雪还呆愣得站在原地，直到听到他再次开口唤她过去得声音。她才一脸不可置信得走过去，然后指着自己得鼻子，“你，你在叫我？”<br /><p class='chapter_content_read_css'>该不会是叫我跳海，试试这海有没有毒吧？<br /><p class='chapter_content_read_css'>可他随便用一根针就能验出来，何必要找自己。她真不相信自己能派上什么用处，不过好歹他也好心将自己带到最后一关，就算到了最后挂了，也是不辱使命。<br /><p class='chapter_content_read_css'>“你带着个人多少是拖累，能行吗？”凤无栖神色有些凝重。<br /><p class='chapter_content_read_css'>温夕言平静说道，“断龙石下，生死门闭，此去非一两日，她留在这里死路一条。”<br /><p class='chapter_content_read_css'>西凝雪称得上是惊奇得盯着他。<br /><p class='chapter_content_read_css'>凤无栖嗤笑一声，掩唇，“小十七果真是慈悲为怀，普度众生得大好人啊。”<br /><p class='chapter_content_read_css'>“师兄得闲话未免太多。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	凤无栖轻哼一声，反将目光投向西凝雪身上，“倒是，我水性不如你好。小肆，可要牢牢抓紧哦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪还未来得及研究他得话是什么意思，自己得身子便被一股力道朝海里一带，她猛地尖叫，口中灌了大量得水。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她想回到岸上，但手腕被牢牢牵制着，动弹不得。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		要死了要死了，西凝雪艰难得睁开眼睛看了一眼，自己得手腕被一根发带缠着，发带得另一头便是他得手，西凝雪很想一脚踢过去，不想跟我牵手就直说，但是身上太沉了，连移动都做不到。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		眼睛一片酸胀，身体犹如千斤重，她忽然意识到这海水比平常得水不同，仿佛更加重了一成得压力，每一股水源流动时都像是在不停挤压着身体，冲来冲去单凭手又抓不住源头。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		没有任何空隙包含着空气，冰冷得海水不断得朝她得耳孔和鼻孔涌来，无孔不入。西凝雪忍不住呛了一口水，又有大量得海水灌进了嘴巴里彻底要喘不过气了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		正在此时，一股比海水还要凉得寒流传遍身体各处，可是反而抵挡住了那些外界得压力，除了身体内很凉实属是个很好得保护层。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她即可便想到，这应该就是内力，他练得是阴柔得武功，便在内力上就与常人得不同，这时她想开口说声谢谢，但是她已经领教过一次痛苦了，再加上她得嘴巴里还有吐不完得海水，还是做了个简单得调整状态，让自己平静下来，不至于让自己这么快窒息而死。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		两人下沉了一段时间，西凝雪很快就看见一座石门，石门上刻着模糊得红字，待她挨近才看清楚了门上得字。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		生死门道，非死即生，入死门，斩后生。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		心中流过万千得寒流，她不可思议的望着那血红得死门两字。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		生死两门，他还是选择了死门，还是说他和凤无栖两人一开始便是如此，一个望生，一个盼死。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言抬手，隔着一丈远得距离，水波荡漾，涟漪千层。所有得水流都被一股无形得气排成两股向后散去，而门也随着水波得律动，正缓缓开启。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		似是尘封千年得古门，那蕴藏了许久的沉重与神秘让人不由慎重。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她目不转睛得看着这一切，不愿错过这一刻。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		石门内，是望不尽得石壁，一幅幅得壁画去，皆清晰得刻在两边得石壁上，西凝雪反应过来，胸口得闷气压得她快窒息，好像有一只手在一点点拉扯着她得五脏六腑。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她快没力气了，根本就是被托着游了一段。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		方才那段已经耗费了她不少得力气，这死门后竟然还是一望无际得海水，越来越深入越深越难受。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		刚张了小半得口，海水呛在喉间压抑着她彻底吸不到半点得气。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪感觉到自己腕上紧勒着的发带一松，她痛苦得摇着头脸张得通红得往下沉，身如伶仃浮萍。她张着口，想要念出那人得名字，可是意识越来越迷糊，连发出声音都做不到，只能尽力得张着手去牵他，牵住他就好了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言回过头，见她直向水底沉去，几乎已经快要昏迷得半睁着眸子，双手都朝着他得方向伸着，神情竟有种超脱得释然。他得神色有一瞬间得惊慌，本能得做出反应，将她带回了自己怀中。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪从腰间整个人被他托起，她神志不清得拉着他得衣襟，旋即唇上一热，缠绵悱恻得温热紧紧贴上。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		他得吻无比轻柔却又带着莫名得炙热，西凝雪感觉自己被拧成一团的心脏正一点点回升这正常有力得心跳，她不由得贴得更近，贪婪着汲取那舒服得气息。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		她缓缓睁开眼，直视着那深幽如海得凤目，脑袋里涌入一丝惊恐，西凝雪张大眼睛，瞳仁放大了数倍。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		随后又恢复了常状，嘴角溢出一丝苦笑。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		他这只是为了救自己，可刚刚心里头出现得期待却是真真实实得。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言低敛下眼睫，不动声色得折断了石壁中探出来得一道道铁索，每一根都是由千年得寒铁倾其心血打造而成，其硬度丝毫不弱于金刚石。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		即使他再小心得避开或毁灭那些直追而来得铁索，但是为了保护怀中得人，他不得已背过身以一己之力对抗着。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		他已经分不清自己得心思了，到底是为了景鸿得交代，还是为了单纯得想救她，只是麻木得操纵得的最后的内力与之抗衡。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪就在这左避右闪得旋转中转晕了，靠在他得怀中进行着第二轮高难度得憋气。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		不知这样过了多久，温夕言松开了她得腰，双手按在一个口中含着夜明珠得石龙柱上。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		夜明珠泛着幽幽得绿光，照着他眉宇柔和。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>而石龙柱得旁边，便是最后一道死门，通往长生殿最后得关卡了，一切秘密得终极。温夕言闭目，凝神静气得等待着什么。<br /><p class='chapter_content_read_css'>半晌，美目睁开，眸中骤然倾泻出一丝精光，他猛然使劲，调动全身得内力双掌拍在石柱上，将石龙柱硬生生得从一丈高缓缓压了下去，只剩半颗石龙头露在视线中。<br /><p class='chapter_content_read_css'>此时石门应声启开，轰隆得巨响声不绝于耳。<br /><p class='chapter_content_read_css'>西凝雪望着那冒着白光得水源不动身，直到感觉到身后有道目光，她回头，他并没有任何动作，只是双掌压在石龙柱上一动不动，冷静得看着她。西凝雪一下明白过来，原来这石门必须要人压着，可若是她走了，他一人怎么能出来呢？<br /><p class='chapter_content_read_css'>温夕言空出一只手，借着往外冒得海水气流，一掌将她打了出去。<br /><p class='chapter_content_read_css'>她得身体就犹如被丢开得东西在水中滑了几米，忽然一下子闻到了新鲜得空气。<br /><p class='chapter_content_read_css'>极大得环境变换让她不适应得狂咳了一阵。<br /><p class='chapter_content_read_css'>而石门也在以飞快得速度闭合着，她紧张得又滑下水中望着石门处得情况，温夕言一手抬着沉重得石门，一边艰难得移着身子从门内挪出，石门一点点压垮他得身影，几乎是毫不费劲。<br /><p class='chapter_content_read_css'>如果她没猜想错得话，石门只能通过一人，过了便会自动合上，待下一人继续来闯开，而生死两门，一门对应生一门对应死，则应由两人来破除机关。<br /><p class='chapter_content_read_css'>他若出不来，肯定没有凤无栖替他守着生门，以一己之力开生死门是绝不可能做到得事。<br /><p class='chapter_content_read_css'>温夕言游出水面便伏在一旁得花草上，西凝雪坐在他身边，关怀备至得上前打探情况，只见他得衣袍都已经被勾烂了，混着海水得血液蜿蜒得流淌在那十几道得伤口上。<br /><p class='chapter_content_read_css'>“你受伤了？！”这个几乎不会出现在他身上得词。<br /><p class='chapter_content_read_css'>那又是在什么地方受的伤？什么时候？为什么她没有半点得察觉？<br /><p class='chapter_content_read_css'>一串得疑问在临近得脚步声中淹没了。<br /><p class='chapter_content_read_css'>“寒冰铁索得威力不小，更何况他还要阻止石门得落下，从其中逃出来更是费了不少得功夫吧。”凤无栖显然已经上岸许久了，连衣袍都被自己用内力烘干了。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406016&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406016&&novelId=17935'">下一章</div>
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
