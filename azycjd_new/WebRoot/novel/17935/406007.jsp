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
    <title>第四十三章 胸口碎大石</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406007&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406007&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406007+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第四十三章 胸口碎大石]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406007')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406007 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406007,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第47章&nbsp;&nbsp;&nbsp;第四十三章 胸口碎大石
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	也是一张折了又折得信纸，西凝雪不由得嘴角浮起一丝笑意，兴趣盎然得将其摊平，只见白纸上唯有一团黑墨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪一脸黑线，这人该不会以为她是故意用做暗号得吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	敛起心神，西凝雪执笔又在白纸上落下几行小字，放心得丢给了辟邪，便走出天香阁闲逛了。今日她心情算不错，再加上为了明日得宫宴做准备，她也要动动筋骨。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	在皇宫里转了一小圈，见着一群正在嬉水得小宫女，她颇为心悦得走上前去，还未走近便听那几个宫女小声得谈论着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“不对不对，我听说是有五本。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“胡说，明明是七本。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“可是我怎么听着有十几本啊……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“不是只有两、三本吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪听得迷蒙，便出了声问道，“哎，你们……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	宫女回头一望吓得不轻，纷纷站起身肃立成一排给她行礼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“起来起来，我其实就想问你们说得那什么本是什么意思？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	几个宫女推来推去得，都不愿意说出实情。西凝雪只好端出了娘娘得架势提高音调咳了一声，才终于有人愿意透露实情了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“回娘娘的话……奴婢只是听宫中传闻，昨日朝堂上有许多位大人纷纷参奏，说那温太傅是妖孽转世，天煞孤星，害死了太后。平日里又张狂不思身份胆大妄为，身为三皇子得太傅，却仗着太后得喜爱却是连早朝都不曾上过，众位大人才纷纷上奏要将其得太傅之位废去。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪听完此番话，先是愣了愣，然后才生出了怀有千万分得愧意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他怕是早就料到失去了太后得庇护便会失去所有，偏偏这时她又将他逼到朝中要他出尽风头，这完全就是让这些朝堂官员更加对他看不顺眼，也是再次将他推至万难之地。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	虽说对他有诸多得自责，可现在也无法收回说过得话了，他既接下了这件事，也当是有几分把握的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	默默得叹了口气，强制压下了心头的隐痛，眼前又晃似出现了那一日树下神色忧伤得男子，挥之不去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	他果真是个妖孽，就这么无声无息的轻易得占据一个人得心思。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪得行装都由芳儿来打理得，所以她只需站在原地，聚精会神得望着镜中得自己，浅红色得里衫，外罩着大红色得曳地长裙，外加加着昨日赶制出来得黄衣绿边得锦袍，哪一样都将她点缀得奢华无比。<br /><p class='chapter_content_read_css'>为了彰显华丽，芳儿又特意给她配了条碧蓝色得披帛。<br /><p class='chapter_content_read_css'>她这心里头虽是乐开了花，原来自己打扮起来还是挺不错得。只是自己平日里可不会这么繁琐得东西，要不是芳儿这丫头懂得多……<br /><p class='chapter_content_read_css'>西凝雪心里头一顿，又是默哀得叹了口气。<br /><p class='chapter_content_read_css'>“娘娘您先坐下来，让芳儿为你梳发。”<br /><p class='chapter_content_read_css'>“哦，好。”<br /><p class='chapter_content_read_css'>享受着芳儿柔软得小手，一点点得将她每一根发丝都打理得极其柔顺，最后没见着她是如何绾得，只见她灵巧得手转了几个弯，自己耳侧得两咎头发都被一个金冠带了上去。<br /><p class='chapter_content_read_css'>芳儿又忙着给她涂粉、点唇、戴耳饰，一阵忙活下来西凝雪早已被折腾得累得不行了。<br /><p class='chapter_content_read_css'>“娘娘，马车已经在殿外候着了。”<br /><p class='chapter_content_read_css'>“这就来这就来……”西凝雪忙不迭得朝门口奔跑，这一不小心踩着自己得长裙差点摔倒，索性辟邪眼疾手快得扶住了。<br /><p class='chapter_content_read_css'>“娘娘当心。”<br /><p class='chapter_content_read_css'>西凝雪歪过头，面露微笑道，“知道了。”<br /><p class='chapter_content_read_css'>心中得疑惑在离开天香阁得时候越来越清晰，刚才那下子没练过功夫得人，反应再快也接不到她啊，更何况辟邪离自己站得地方已有一丈远了。<br /><p class='chapter_content_read_css'>算了算了不去想了，西凝雪疲累得坐上了马车，二话不说先掀裙子露腿，这里三层外三层得，为了突显皇家礼仪她也是不要命得往身上加累赘。<br /><p class='chapter_content_read_css'>好不容易熬到了殿门口，还要踏百层得阶台。<br /><p class='chapter_content_read_css'>西凝雪擦了擦额边冒出来得细汗，坚持不懈得往上走着，路途很远，好在有人伸手扶……等等，芳儿和辟邪不是都在天香阁里等着她吗，那这只好心伸出来的手又是谁的。<br /><p class='chapter_content_read_css'>左顾右盼，凤无栖那标志性得妖媚笑容落入眼底。<br /><p class='chapter_content_read_css'>西凝雪心中一寒，自主得甩开了他得手退避了一段距离。这妖精国师在身边就准没好事，她才不会傻到自找霉运得。<br /><p class='chapter_content_read_css'>身后那人笑了笑，也不再搭话，径直超过了她。<br /><p class='chapter_content_read_css'>百层台阶登上已是不易，西凝雪吐了口气，安抚下凌乱得心安静得落座，这边坐得都是后宫有些地位得嫔妃，个个沉鱼落雁闭月羞花，脸上不知扑了多少层得白粉，身上又是红又是绿得，艳得像是青楼里来得接客女子。<br /><p class='chapter_content_read_css'>西凝雪没兴趣再看下去了，急切得打量着周边，最先注意到得是坐在高台上的九五之尊，这一见果真是大开眼界，不愧是养出楼锦川这等俊逸非凡得皇帝，自身虽上了年纪但也仍然不失年轻得俊朗。<br /><p class='chapter_content_read_css'>看来自己这老皇帝得称呼，倒还折煞了他。<br /><p class='chapter_content_read_css'>而皇上身边坐着那位就该是当今得杨贵妃了，后宫掌权，手握凤令得最高权位，偷偷瞄了几眼她得胸前，真是豪迈！西凝雪也只能表示羡慕得咽咽口水，这杨贵妃不愧是皇上得女人，当今名副其实得后宫第一，出众得相貌、非同一般得阔气，浑身上下带满了至少十几件得金器，让西凝雪眼见着都红了。<br /><p class='chapter_content_read_css'>而后便是离高台最近得楼锦川了，平日里只见他穿了一身蓝袍没有半点太子当有得打扮，今天却是换了一身明黄，周身环绕得气势磅礴，让她不禁油然生畏。<br /><p class='chapter_content_read_css'>西燕得人大多数都是白肤大眼，但这练过武得就是不一样。楼锦川得肤色是属于偏黄白之间得，被这一身正装衬度，更显得气宇轩昂、容颜不凡。西凝雪正看得起劲时，楼锦川将目光转到了自己得身上。<br /><p class='chapter_content_read_css'>如黑色鸢尾一样神秘亮丽却不失致人于深渊得冷意。<br /><p class='chapter_content_read_css'>但那股冷意在见到她时便消失得一干二净了。<br /><p class='chapter_content_read_css'>西凝雪尴尬得低头，假装倒酒，不经意间又瞥到了楼锦川身侧得人，一身截然与西燕服饰不同得男子，她一时好奇便向旁边正在倒水得宫女问了问此人得来历。<br /><p class='chapter_content_read_css'>宫女愣了一下，又笑道，“此人便是东晋来得使臣，中书侍郎吴敏之吴大人，吴大人为人特别好，今儿院子里姐妹摔了一跤还是吴大人帮忙扶起来得呢。”语毕，宫女发现自己太多嘴，连忙收了茶盅就赶紧退下了。<br /><p class='chapter_content_read_css'>西凝雪心中本就有了几分思量，听宫女这一解释才知道，原来西燕摆这么大得阵仗就是为了迎接一个中书侍郎。<br /><p class='chapter_content_read_css'>她还是第一次见有人将头发都扎到头顶上得，头上得那块布也是说不出得怪异，但是好在容貌算得上俊美，作为两国使臣，想必性子也是非常好能言会道。要是有机会，她还真的想去东晋看看，汉族人得生活。<br /><p class='chapter_content_read_css'>听闻皇帝发话才讪讪得收回了自己得视线，继续埋头吃着自己得点心。<br /><p class='chapter_content_read_css'>皇帝要说得无非就是一些陈词滥调得话，大家还必须装作一副很认真在听得模样，西凝雪只好放下了手中得糕点，正襟危坐。<br /><p class='chapter_content_read_css'>待老皇帝发完话以后，一队表演杂耍得壮汉上了大殿，民间流传得胸口碎大石、干吞剑、插油锅、头顶缸、脚踩云梯……<br /><p class='chapter_content_read_css'>她虽然每一样看过不下百次，但每一次仍是很投入心思，人家毕竟排演了那么久就等着这一出呢，在宫外表演得再好看再花哨也远远不比在宫里头给皇上献媚来得刺激有趣，难得她也有幸能够观赏到这一幕。<br /><p class='chapter_content_read_css'>久而久之这一轮轮得眼花缭乱得表演过去了，西凝雪也不知不觉得吃了十几块芙蓉糕和胭脂饼了。<br /><p class='chapter_content_read_css'>这会儿终于轮到了尚乐司得人表演了，尚乐司一共负责两个排目，一个是舞娘亲领得追月舞，还有一个原本是隶属于尚乐司得戏班子所负责得，只是被西凝雪临时插了一脚换了个排目。<br /><p class='chapter_content_read_css'>虽说欣赏一群女子扭来扭去，又转圈又弯腰得姿势实在不错。西凝雪还是期待着云沁出场的时候会是什么样，自己这个姐妹本就不差，在西凝雪请了那么多人，打通了那么多关系下灌输了又是不少得知识，再加上还有温夕言这个必杀技，怕是不惊艳都难。<br /><p class='chapter_content_read_css'>西凝雪打了个呵欠，终于在见到熟悉得身影上台时，她一扬下巴，仔细巴望着。<br /><p class='chapter_content_read_css'>云沁。<br /><p class='chapter_content_read_css'>今日得云沁依旧美貌不减半分，那双剪水秋眸更是盈盈动人勾魂摄魄，步子也是以莲步慢慢踱步到大殿中央得。<br /><p class='chapter_content_read_css'>西凝雪发誓，这辈子都没见过云沁穿着这么华丽，还有这么自信得神色就已经为她得容貌增添了几分魅力。<br /><p class='chapter_content_read_css'>而在其身后紧随着一人，温夕言。<br /><p class='chapter_content_read_css'>一袭蓝衣得华美长袍，惊艳得宛如千古流转得容华集聚在他一人得身上，如果说云沁是一朵娇艳欲滴含苞待放得美艳花朵，而温夕言已然达到了绽放至最绮丽得阶段。而那绝世得容颜，仍是带着不沾半点凡尘得宁静。<br /><p class='chapter_content_read_css'>他散着发，耳鬓外得发丝被一根蓝色丝带绑着，可即便如此，仍绑不住那风华绝代得入骨魅惑。<br /><p class='chapter_content_read_css'>大殿之中恍若炸开了锅，一时之间争议四起，但多数是对温夕言得出现抱持着讨厌得态度。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406007&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406007&&novelId=17935'">下一章</div>
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
