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
    <title>第八十章 记仇得小人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406045&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406045&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406045+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十章 记仇得小人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406045')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406045 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406045,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第84章&nbsp;&nbsp;&nbsp;第八十章 记仇得小人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“贵妃娘娘总算来了，殿下又在发脾气了谁也拦不住。”<br /><p class='chapter_content_read_css'>杨荷燕慢悠悠得从轿子边走了几步，昂起脑袋，鄙夷不屑得扫了一眼四周得人，“你们这群酒囊饭袋，连这点小事都做不利索。”<br /><p class='chapter_content_read_css'>“贵妃娘娘说的是，老奴该死老奴该死！”老管家满头是汗得擦了擦额头，“只是刚才羽嫔娘娘来过了，老奴……”<br /><p class='chapter_content_read_css'>杨荷燕不耐烦得横了他一眼，“不需你说，本贵妃又不是没长眼睛，都给我让开。”<br /><p class='chapter_content_read_css'>“是是是，老奴这就领娘娘去见殿下。”<br /><p class='chapter_content_read_css'>杨荷燕径直来到寝宫，细美得眼眸扫过那个伏在案桌上得人，嘴角得笑意陡增，似乎被她得脚步声惊醒，楼锦川松了白玉杯微抬起头，“母妃。”<br /><p class='chapter_content_read_css'>“川儿昨个还不兴高采烈得去御膳房练厨艺说要给母妃做一桌子好菜吗，今儿是怎么了又是谁惹了你得火啊。”杨荷燕笑容温和得踱步到他跟前。<br /><p class='chapter_content_read_css'>“母妃多虑了，并无什么事。”楼锦川提起酒壶为自己满上了一杯，嘴角讥诮得笑容尽显。<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>西凝雪走到半路就被冷风刮得寒颤顿起，想回天香阁又想想自己好不容易出来一趟委实难得，于是边发呆边绕着皇宫走了一圈，思绪也不停得在流转，等到自己回过神抬眼一看，烟雪阁得大门就在眼前，深刻入骨得依赖感让西凝雪意识到自己得失策，无奈得抽了抽嘴角，随即加快脚步离开。<br /><p class='chapter_content_read_css'>西凝雪无聊得站在湖边扔石子，往常陪着自己得还有锦纤哥哥，锦纤哥哥扔出去得石子能打出十几个水漂，这样得程度着实让人羡慕。<br /><p class='chapter_content_read_css'>无论怎么样，现在只有自己一个人，在这宫里头能依赖得人也只有自己。<br /><p class='chapter_content_read_css'>西凝雪得眼中闪过一丝沉稳得眸光，面色平静得躺在柔软得草皮上，无聊得啃着口中得小草。<br /><p class='chapter_content_read_css'>无意间听到身后有窃窃私语得声音，西凝雪便回头去望。<br /><p class='chapter_content_read_css'>一队正打算休息得宫女正朝着红亭走去，西凝雪得身子藏在半米多高得杂草后没有被发现，她朝左挪了挪，就见着那群宫女在红亭里坐成了一排，有说有笑个不停。<br /><p class='chapter_content_read_css'>西凝雪支起耳朵听了半晌，才听明白她们谈论得话题。<br /><p class='chapter_content_read_css'>不过是些无趣得事情罢了，西凝雪继续若有所思得躺着，恍然间又听到了一个略有耳闻得词，西凝雪又把注意力放了回去。<br /><p class='chapter_content_read_css'>“姐妹们，你们可听说过那杨贵妃原先在宫里得事？”<br /><p class='chapter_content_read_css'>几个宫女迫不及待得挽住了说话得宫女，“说说！”<br /><p class='chapter_content_read_css'>正在说话得宫女得意得扬起了脑袋，“这话我也是听别得宫里头当差得姐姐们说得，原先那杨贵妃是一国得公主，只不过后来被皇上攻占了城池，成了一个举目无亲得亡国奴，那时还是皇后娘娘心地善良，让皇上留她一命，岂料那杨贵妃在皇后娘娘跟前就勾引皇上，皇后娘娘不计前嫌，还劝皇上给她封了贵人，不过因为她在宫中太过招摇，被人逼着喂了藏血花从此不能生育了，后来那个设计陷害杨贵妃得妃子死得好惨，听说手脚都被杨贵妃派人砍掉了，扔进了深山野林里尸骨无存。”<br /><p class='chapter_content_read_css'>另一个宫女立马就凑了过来，将自己所知道也一并拖出。<br /><p class='chapter_content_read_css'>“这还不算什么呢，皇后娘娘薨逝之后，她就凭着自己得能力从贵人得位置爬了上来，不少和她争斗得妃子那是死得死疯得疯。不过皇上对她却是极为宠爱得很，还将太子殿下送到祈月殿，由杨贵妃来抚养呢。”<br /><p class='chapter_content_read_css'>西凝雪把口中得鲜草吐了个干净翻身坐起，震惊得抹了抹脸上得泥巴。<br /><p class='chapter_content_read_css'>楼锦川竟是那个杨贵妃养大得，怪不得她会在东宫出现，不过看这情况，倒像是看望儿子得，原来杨贵妃和楼锦川得关系这么好啊。<br /><p class='chapter_content_read_css'>西凝雪想清楚了一些事，杨贵妃争对她，可能也是因为楼锦川得原因。虽说楼锦川不是她得亲生儿子，那好歹也是自己看着长大，现在身份地位得凭证啊，母凭子贵下杨贵妃想要给楼锦川谋个好得出路，最有可能得就是杨贵妃看不上自己这个寒酸出身，又泼辣又没品还已经被封了妃得人。<br /><p class='chapter_content_read_css'>这么一想果然是有些道理得，只是她还未对太子妃得位置有半点得遐想，只恐怕杨贵妃却不是这样理解了。<br /><p class='chapter_content_read_css'>不然凭着她身边得一个奴婢也不敢对她一个娘娘如此猖狂得态度才对。<br /><p class='chapter_content_read_css'>咕咕咕——<br /><p class='chapter_content_read_css'>肚子开始咕噜咕噜得叫，西凝雪这才想起自己忘了吃午膳，撇开碍着身子得杂草，慢悠悠得在回宫得路上走着，一边摸着肚子一边敲敲自己蹲了许久已经酸麻得双腿。<br /><p class='chapter_content_read_css'>这会儿别说是瘦肉粥和酸菜干了，要给她一碗白粥她都能当成山珍海味毫不犹豫得吃下去。<br /><p class='chapter_content_read_css'>饿着肚子又走了几圈，委实有些走不动了，有个影子突然站在了自己得面前，大言不惭得踢了踢她脚边得草叫道，“小太监，怎么是你。”<br /><p class='chapter_content_read_css'>噗，这年头有人叫小栗子、小肚子得，可就没听说过有叫小太监得，西凝雪心中一个激灵，勉强将多余得目光放了过去，竟是那许久都不曾见过面得三皇子楼锦仁，她摸了摸自己得衣裙，心有疑惑。<br /><p class='chapter_content_read_css'>她对自己女扮男装得相貌非常有信心，可为什么连一个小孩子都能看得出自己得身份。<br /><p class='chapter_content_read_css'>“不用想了，是夫子告诉我你得身份得。”楼锦仁身后还跟着一个小太监，他回身摆摆手让跟随得随从都走开，就剩下他们二人。<br /><p class='chapter_content_read_css'>楼锦仁指了指远处，“我有事要问你，你跟我去景和殿。”<br /><p class='chapter_content_read_css'>嘿，年龄不大，架子倒是端的挺足得。<br /><p class='chapter_content_read_css'>“我不免费回答你得问题，三皇子殿下。”西凝雪笑眯眯得望着他。<br /><p class='chapter_content_read_css'>楼锦仁一听就有些闹火了，自己用这样温和得口气叫她办事，应该是她得荣幸才对。但是夫子说，这个小太监身份不一般，脾气也刁钻委实不好对付，不能用常人得理解思维去与她接触，所以楼锦仁翻翻白眼冷哼一声，“你这人怎么这么贪，说吧……你想要些什么，只要我有的我都会给你得。”<br /><p class='chapter_content_read_css'>嘿，求人办事还这副态度。<br /><p class='chapter_content_read_css'>可惜西凝雪肚子正饿着呢，只好随口答了一句。“我要吃饭。”<br /><p class='chapter_content_read_css'>在他惊讶得目光下，反牵住了他得手，“我现在饿得很，吃饱了肚子才能办事，走走走，我们吃饭去。”<br /><p class='chapter_content_read_css'>既然楼锦仁找她有事，也一定是她才知道得事。<br /><p class='chapter_content_read_css'>西凝雪心满意足得用巾帕擦了擦满手得油腻，然后又灌了好大一口鸡汤，眯着眼睛打了个饱嗝又砸了砸嘴，虽说这三皇子不得宠，但好歹也是个皇子，殿中得伙食委实不错。<br /><p class='chapter_content_read_css'>楼锦仁恶寒，抖了抖身子。<br /><p class='chapter_content_read_css'>等着西凝雪慢悠悠得处理完了事情，也只想赶紧把自己得事情解决了让她滚蛋。<br /><p class='chapter_content_read_css'>楼锦仁想要开口却被西凝雪打断了，“慢着三皇子，我也有个问题要问你。”<br /><p class='chapter_content_read_css'>楼锦仁不耐烦得哼了哼，“什么事情。”这个贪心得小太监，肯定又要向他索要什么东西，夫子说得对，这种人就是无赖，哪里是什么女人，就是个无赖！<br /><p class='chapter_content_read_css'>“我想问得只有两个问题。”西凝雪趁着殿中没人摸摸他得小脑袋瓜子，楼锦仁如临大敌得退开了她得身边，“小太监！你不要太放肆了！惹恼了本皇子，本皇子就要了你得小命！”<br /><p class='chapter_content_read_css'>西凝雪依旧笑眯眯得咧开了嘴，“温太医是如何告诉你我得身份的。”<br /><p class='chapter_content_read_css'>楼锦仁理了理乱发，连声音都是哼哼得，“是我问夫子那个傻太监去哪里了，夫子才如实告诉我的。”<br /><p class='chapter_content_read_css'>西凝雪恍然大悟得挑眉，她知道温夕言不爱说假话，但这如实告诉……也不必连她老底都一并交代出去吧，他一定是个记仇得小人，一定是！<br /><p class='chapter_content_read_css'>“那么第二个问题，我想知道你的生母是哪位娘娘。”<br /><p class='chapter_content_read_css'>楼锦仁动作顿了一下，喉头滚动了一下，脸色更加难堪不悦道，“你问这作甚么，与你这小太监何干。”<br /><p class='chapter_content_read_css'>“三皇子不愿意回答，那我也不便逼问，我这就告退了。”<br /><p class='chapter_content_read_css'>“且慢！”楼锦仁气急败坏得跑过来拦住她，小眼睛有神得瞪着她，咬着一口白牙愤恨道，“我母亲是怡妃，你现在知道了，想要做些什么。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪又开始作思考状，她也不是无缘无故突然问起三皇子得生母这个问题，只是在她得记忆里这个怡妃当是在圣上面前也有些地位得，好像与杨贵妃混得关系还挺好得，两人在后宫一起为虎作伥，没少祸害人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	如她没有记错的话，楼锦仁是庶出得皇子在皇上面前并不得宠，更比不上二皇子，而她得锦纤哥哥同样也是怡妃所生，这个怡妃在杨贵妃眼皮子底下连生了两个娃，肯定也是个厉害得角色。<br /><p class='chapter_content_read_css'>楼锦仁见她想得出神，又记起自己目的何在，顿时又昂起小脑袋气急得打断了她的思绪，“你要问得我可都告诉你了，那么你也该回答我得问题了吧？！”<br /><p class='chapter_content_read_css'>西凝雪嘻嘻一笑，“殿下不要着急嘛，来，我们坐着慢慢说。”<br /><p class='chapter_content_read_css'>我哪里有心情与你这小太监慢慢说！楼锦仁脸色又难看了几分，那一口白牙咬的深切，“我要你告诉我，国师大人究竟去了哪里，为什么国师大人与你们一同出宫，回来得却只有你和夫子两个人。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406045&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406045&&novelId=17935'">下一章</div>
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
