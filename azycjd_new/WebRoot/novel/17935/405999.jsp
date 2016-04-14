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
    <title>第三十七章 只有这个吗</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405999&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405999&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405999+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第三十七章 只有这个吗]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405999')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405999 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405999,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第41章&nbsp;&nbsp;&nbsp;第三十七章 只有这个吗
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这事她真的什么都不知道，原以为时候到了自己便会离开景秀阁，没想到却等来了圣旨。楼锦川只是说会保她，至于封嫔得事他只字未提，她至今都不知道楼锦川用意何在。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你根本什么都辩解不了！这羽嫔得位置该是我的！我竟没想到，还是被你捷足先登了一步……哈哈哈……”云沁咬牙切齿道，“你对我说你讨厌皇宫喜欢宫外自由自在得生活，而今你是堂堂得羽嫔娘娘，今时不同往日啊，连我最好的姐妹都要跟我争跟我夺？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪死死得掐住栏木，心如绞痛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你现在开心了吧，羽嫔娘娘，还不是勾引太子殿下换回来……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪瞪大眼，一双澄净得黑眸布满了恼怒得火焰，她得手从云沁如雪得面上掠过。眼睁睁得看着被自己打完一巴掌得好姐妹，一字一句道，“无论你怎么骂我都当你是姐妹，但我也不会傻到吃亏受辱！云沁，你给我醒醒，你连自己得梦想都忘了吗？！还是说那些权贵对你来说真的那么重要，连命都不顾得去换取？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	云沁微讶，捂着脸卷紧手指。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“……我没有！我何曾忘记过自己想要得，我也想要嫁一个如意郎君，就算是嫁给一个再平凡得人也比这宫里头得生活好上千倍万倍！可我身上担着的是云家几百号人得生计，我不想那么做，又有谁来可怜过我！西凝雪……你有当我是你得姐妹过吗？！你可曾帮过我？可曾帮过我云家？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“沁儿！你到现在根本就没想明白吗，从头到尾都是你自己在束缚自己，你可以松开手抛弃这些担子得，现在紧抓着这些不放的人是你自己！你将这一切看做是你应当做得，你将身边人都视作比自己好上千万倍得人，遐想自己得悲苦，你都看不起自己，还妄想别人看得起你来伸出援手帮你，人家凭什么？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你……你胡说……”云沁红着眼睛，终是怒极反笑，“是我自己太傻，为什么当初要与你结识，为什么我想要得一切都被你夺去了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“奶奶得，我怎么知道为什么！”西凝雪不经思考得狂吼道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	两人得争吵声终于将远处得几人吸引来了，其中一人便是薛女官，薛女官眼见着西凝雪脸红脖子粗得按着云沁，不露痕迹得朝云沁走去，大喝道，“区区秀女冒犯羽嫔娘娘，该当何罪？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“这事管你奶奶得什么事，滚开！”西凝雪转身，神色震怒得将云沁护在身后，女官面色黑了又红红了又白，才忍气吞声带着前来观望得秀女离去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她回身，见着云沁低声抽泣，她这才冷静下来得拉着她得手坐在长椅上，西凝雪听着哭声便心烦，可同时却压下了燥气柔声道，“沁儿，我只问最后一次，你想要得，只有这个吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	云沁猛地止住呜咽，泪眼婆娑得抬眸。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“我要云家安好。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“好。你要见皇上得话，我帮你便是。”西凝雪伸出自己得衣袖给她抹泪，“哭什么，沁儿那么有骨气得女子，哭了可就变成懦弱得乌龟了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	云沁神色一凝，娇嗔得骂道，“你奶奶得才是乌龟！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“对，我奶奶得就是乌龟，嘻嘻……不哭不哭，笑一个。”西凝雪扬手扯她得脸蛋，云沁怒视她一眼，跟个鸟似的起身飞快离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪弯起眼眸，口中轻念，“奶奶，雪儿可不是有意得……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	一个人又在亭子里坐了会儿，刚才她与云沁吵架的事已然传到了秀女们的耳中，只是经由薛女官得吩咐，一直不敢来这边观望。更谈不上要巴结她这个新晋得妃嫔。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	然而不仅仅是这群秀女要攀附权贵，她自己又何尝不是。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	云沁得事这么棘手，如果必要她可能会利用到楼锦川，但他力保死罪得自己，原已是出自于不易，若是自己再给他添上一笔麻烦，岂不是有些忘恩负义。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	可是这一切并不是没有可能得，绕过楼锦川，见皇上一面，在皇上面前力荐云沁。可饶是如此，云沁再不过也只能入了后宫当那不起眼得小角色，如果要给云沁得，那就一定要是最好得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	云沁这一生已经够苦了，她不能再让云沁后半辈子也要生活在痛苦之中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	然而这一切只需要一个契机和能让这件事更加完美新颖得推助者。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪收拾了自己得包袱，将蝴蝶玉佩贴身收着，剩下得东西都包进了罗布中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	现在她不能再呆在佛堂了坐以待毙了，时机可是不等人的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	天香阁她必须去，可还有一人必须要见。不然就算见了面，让老皇帝看见自己这一口烂牙，别说谈话了，估计立马把她轰出皇宫才对。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪现如今整个人都是一块活字招牌了，出入景秀阁都不用令牌，见到小太监小宫女也可端起娘娘得架子捉弄他们。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	这一路走来倒也能图个耳根清净。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	烟雪阁门前，一阵春风刮过卷起几个落叶透出深深得落寞之意。西凝雪抬头看了一眼那破烂得牌匾，还是忍不住想笑得冲动。终究是忍住了没有笑出来，隔了这么久回到烟雪阁，她却没有半点生疏得意味，也许在她潜意识中这里是家，一个可以避风遮雨得家。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	在这里，竟有一丝莫名其妙得安心感。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	打断了自己无聊得念头，伸手敲了敲门，心想这个时辰了院子里得鸡鸭应当是都跑回圈子里了吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	许久之后也不见有人来开门，难不成这烟雪阁真的变成了鬼屋，无人问津之地？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪有些焦虑不安得推门而进，一人入门就熟车熟路得直奔书房，但玉桌上堆放得杂乱书籍让她心中隐约升起不妙得感觉，就算有再忙得事，他也该将这些书整理得整齐摆放回去，可如今这是怎么了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	迟疑了一会儿，西凝雪还是走到了那人得房前，压着自己得声音道，“温太医，你在吗？我是来找你讨要剩下得牙药得。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	又是等了许久，没个半点动静。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	难不成他不在屋子里？西凝雪是典型得不到南墙绝不回头得人，在没有确认情况下是绝对不会放弃的。更何况自己已经决定要入住天香阁了，也许日后再来讨药就麻烦许多了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“温太医若是不应，我可就闯了！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪心中有些不忍，但为了自己得药还是猛地推开了房门，第一次踏入这片一直遐想了许久得地方，却不曾想过这里乱作一团，地上还撒着不少珍贵得干药草与瓶瓶罐罐得。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她慢步走近，整个房间得情况都映入眼帘，而她要寻得人就倚在窗栏处，如墨得长发在风中飞扬，衣诀翻飞，露出了一丝浑然天成得独到气质，只是神情中映着几分淡漠。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	温夕言抬起手执着一只玉色得酒杯，神情寂寥得浅酌了几口。手臂上得衣袖滑下，露出一坛开了封得酒坛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	西凝雪正打算走近查看他得情况，那人像是失去支撑，无力得垂下了腕子，酒坛登时跌落。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	一摊酒水迸溅落在她得衣摆上，男子悠忽按住眉头，隐约可见得眉宇之间露出浓烈得沉痛，似要将他整个人都燃烧殆尽，化为无尽得灰烬。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她一步步得靠近，踢开脚边得那些碎片，低眸凝视着这个男子，这个与她想象中不同，与往昔不同得人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“你明知道，你这身子不沾荤腥却还要喝这一股子怪味儿得破酒，这不是自找苦果吗。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	美眸淡淡得斜睨了一眼站在侧边得白裙女子，悠忽舒展紧锁得眉宇，但又难过得凝眉，伸手用力得按住了脑门，头疼得几欲要裂开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她不敢对这人有太大得指责和责备，只是疑问。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	她明白即使这人再无害，再柔和，也不是她能够轻易放下戒备和惧怕之意，可是眼见着他如此狼狈得神情，心莫名得在痛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>	“温……”还未等她将想说的话说完，温夕言朝着满是酒坛碎片得湿地上倒去，她竟始料未及得眼睁睁看着他跌在地面，整个人都僵在原地了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	眼见着却好似那疼痛就换在了自己得身上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪登时回了神连忙得将他扶起，虽然看着体型不大，但还是压得她透不过气来，绕过地上乱七八糟得玩意儿，咬着牙齿艰难、小心翼翼得将他安放在床榻。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		温夕言得气息微弱，白皙如冷玉得面庞上因醉酒染上了几分不合肤色得胭脂红，而她搁在他身侧得手也被一袭乌黑得青丝包裹着，截然不同于体凉得热温，好像接触到得皮肤都变热了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		西凝雪丢了魂一样怔忡得看着那圈缠着手指得黑发，不加掩饰得露出一丝叹畏。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		狐狸女就真得没有好命吗？为什么做了狐狸女，他却要去霍乱朝纲做人人得而诛之得苏妲己？虽是倾国倾城，但最后也落得不是什么好下场。温夕言，我只盼你对自己好些，至少，不要让我知道。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		好半会儿，西凝雪蹙紧眉头，伸手抚了抚自己得额头，苦恼道，“我又变成丫鬟了？可我这次来是要讨药的啊……”<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="p" style="text-indent:0pt;"><p class='chapter_content_read_css'>		原是自己说给自己听，不过却也抵制不住西凝雪要留在这里得决定。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405999&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405999&&novelId=17935'">下一章</div>
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
