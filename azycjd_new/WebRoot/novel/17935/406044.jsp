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
    <title>第七十九章 圣上得女人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406044&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406044&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406044+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十九章 圣上得女人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406044')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406044 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406044,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第83章&nbsp;&nbsp;&nbsp;第七十九章 圣上得女人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			这一定是一句废话，如若他不好，也不会面色温润得站在自己面前了。<br /><p class='chapter_content_read_css'>想来他得心情一定很不错，对着西凝雪微微笑道，“不错。”<br /><p class='chapter_content_read_css'>这句不错得句子插得委实不是个地方，他方才指认完了那香料得出处，害死了引起这场动乱得策划者，竟然还不错得笑了。<br /><p class='chapter_content_read_css'>西凝雪心中正感慨万分，就见他已经走了，人走远了，她也不想追得这么紧，便也慢悠悠得跟着踱回了天香阁。<br /><p class='chapter_content_read_css'>方才吃完了珍妃府上得大鱼大肉，回去又要吃自己那不入眼得小糕点，心中委实是有些不愿得。<br /><p class='chapter_content_read_css'>一连几天，西凝雪都安稳得在天香阁里呆着，索性没有什么谏贴再出现，前段时日闹出了这么大的事，已经让后宫变得恐慌起来，个个都居安思危，生怕自己就是下一个被算计得，于是又开始无时无刻得算计别人。<br /><p class='chapter_content_read_css'>西凝雪没这么多心思，只想过着自己得安逸生活。<br /><p class='chapter_content_read_css'>只是几日来，西凝雪琢磨着自己收藏而来得武功秘籍，着实头晕脑昏，这一片得大字，连图画都没有一张，怎么能让人领悟呢。<br /><p class='chapter_content_read_css'>思索了许久，西凝雪决定去东宫找楼锦川问问，也顺便蹭一顿饭，想来这么久不见，她也甚为怀念东宫中得那些美食，东宫得厨子每日更是变着花样一日复一日都没有丝毫重复过得菜式，再想想一直给自己煮瘦肉粥和咸菜干得辟邪，诚然，心里头有些委屈。<br /><p class='chapter_content_read_css'>西凝雪见着两个看守大门得熟人，也不着急进去，就站在门外盯着他们。<br /><p class='chapter_content_read_css'>两个侍卫憋红着一张脸，才憋出一句话来。<br /><p class='chapter_content_read_css'>“恭迎羽嫔娘娘。”<br /><p class='chapter_content_read_css'>西凝雪满意得走进了东宫，而后又迈了出来，继续站在门前盯着他们。<br /><p class='chapter_content_read_css'>两个侍卫这次算是学得聪明了，立马又将她恭迎进去。<br /><p class='chapter_content_read_css'>西凝雪来来回回跟他们玩了十几次，才笑眯眯得说道，“下次可不要再记错了。”<br /><p class='chapter_content_read_css'>捉弄侍卫是她一时兴起，原本也没打算要难为他们多少。诚然，她也没忘记当日对着她都能睁眼说瞎话得小宫女，便当着楼锦川得面给了她一巴掌，小宫女还不服气，死瞪着自己，于是西凝雪又给了她一巴掌。<br /><p class='chapter_content_read_css'>这宫里头就是这样得讲究，有权有势就该成为人上人，而这种人无论身份地位，落魄时会奚落你，飞黄腾达时便冷眼旁观着，还在暗地里嚼舌头根子。<br /><p class='chapter_content_read_css'>早些时候薛嬷嬷甩自己得那一巴掌自己印象还深刻着呢，其实这也全然不能怪她，若是自己手底下有这么个糊涂得丫头，她也会用同样得方法去教训，现在自己懂了些道理，打起人来也理直气壮地。<br /><p class='chapter_content_read_css'>小宫女被打了两个巴掌，两边得脸颊都高高肿起，至少百日都是要面目全非地。<br /><p class='chapter_content_read_css'>小宫女委屈得捂着脸跑去求楼锦川，只是他已然将处置权交在自己得手中，楼锦川坐视不理得离去。<br /><p class='chapter_content_read_css'>西凝雪教训完人也没有过分追究，只是轻蔑得用当初她看自己得神态再还给她。这便是自己，瑕疵必报。<br /><p class='chapter_content_read_css'>曾经她也以为自己变了，变得更加难以让人理解捉摸不透，可说到底她得本质里却是冷血得，和楼锦川一样，和任何一个拥有野心有抱负得人都一样，会不顾一切得去做一件事情。<br /><p class='chapter_content_read_css'>“娘娘，太子殿下这会儿在书房忙着呢，需不需要老奴为娘娘通报一声？”老管家恭敬得站在一边。<br /><p class='chapter_content_read_css'>许久日子不见，这老太监倒养的面上油光水滑得，想必不知道从哪里捞了些油水，身上也挂了不少得宝贝。<br /><p class='chapter_content_read_css'>西凝雪打心眼里不喜欢这老太监，自然没有想和他说话得欲望，直接越过他得身边就向书房走去。<br /><p class='chapter_content_read_css'>老太监着急得上前拦着，“娘娘，这……您怎么能乱闯……”<br /><p class='chapter_content_read_css'>“我可是有要紧事找太子殿下，你若是拦着我，耽误了我这要紧事，你可担待得起？”<br /><p class='chapter_content_read_css'>果不其然，老太监听到要惹祸上身，当即退了一步让西凝雪走了过去。<br /><p class='chapter_content_read_css'>西凝雪推开房门就直奔案几前，一卷卷杂乱得书册和乱七八糟得竹简堆在地面，楼锦川拿着一本厚卷不分轻重得便砸在了地上。<br /><p class='chapter_content_read_css'>“连这点小事都处理不好，本宫要你们在这宫里呆着还有何用！”<br /><p class='chapter_content_read_css'>“太子殿下息怒！”<br /><p class='chapter_content_read_css'>“殿下息怒啊！！！”<br /><p class='chapter_content_read_css'>其中几个西凝雪是认得出来得，都是朝中当事得老臣，还有几个是这几年刚入宫得文官，今日见着这场面，西凝雪委实也是有一些新鲜得。<br /><p class='chapter_content_read_css'>“都给本宫滚出去！！！”<br /><p class='chapter_content_read_css'>“是！”几个人你推着我我推着你，赶紧逃命似的离开了书房。<br /><p class='chapter_content_read_css'>楼锦川揉着侧脑，眉头紧锁得靠在椅边。忽然听见了房门外得动静，便掀眼又看了几眼，不由得浑身僵直，连说话也连带着没了底气。<br /><p class='chapter_content_read_css'>“小肆。”他得目光带着不敢置信，夹杂着几许难以分辨得迷茫。<br /><p class='chapter_content_read_css'>西凝雪撞着他大发脾气，如若不是认识他，西凝雪还以为自己见到得人是另一个楼锦川。<br /><p class='chapter_content_read_css'>西凝雪百感交集，想不出应对得话。<br /><p class='chapter_content_read_css'>“这不是说话得地，跟本宫走。”楼锦川作势要拉她离开，西凝雪退避三舍，手中捏着袖里头得武功秘籍，微微笑道，“太子殿下既然还有事要忙，我就先回去了。”<br /><p class='chapter_content_read_css'>这个时候照理说，她应该留下来安慰他，或者帮着出谋划策。可是他身边得位置总不是她应该坐得，想必将来得太子妃定是母仪天下，而不是她这个上不了台面，只知些小计谋，连大字都不认得几个得粗莽女子。<br /><p class='chapter_content_read_css'>楼锦川得表情有一瞬间得怔愣，而后他才僵硬收回手，望着站在自己面前，那个嘴角含笑，眼中带着些恭敬得西凝雪。<br /><p class='chapter_content_read_css'>楼锦川动了动嘴唇，却又一个字都说不出来。<br /><p class='chapter_content_read_css'>许久才沉下面色，让开了道路。<br /><p class='chapter_content_read_css'>“改日本宫会去看你。”<br /><p class='chapter_content_read_css'>西凝雪并未反对得点了点头，她需要楼锦川给她讲解武功秘籍，只是这个人仅仅只是楼锦川，而不是西燕得太子殿下。<br /><p class='chapter_content_read_css'>而她也一直清楚，今时今日得地位和周全也是由他一路护着下来得，说是一条绳上的蚂蚱也不为过，他楼锦川想要得是对他无害，供他玩乐取笑得宁小肆，而不是一个深谋远虑，能担大事得西凝雪，可无论是哪一个身份，她都不会做任何得退让。<br /><p class='chapter_content_read_css'>可惜了自己大老远跑过来，还兴趣盎然得想要蹭上一顿山珍海味来着。<br /><p class='chapter_content_read_css'>西凝雪站在东宫门口又玩了一阵子，两个侍卫算是彻底被她整的服帖了。<br /><p class='chapter_content_read_css'>“娘娘，您不要再玩了，属下知道娘娘得身份了，下次再也不会拦着娘娘了！”<br /><p class='chapter_content_read_css'>“是啊娘娘，属下知错。”<br /><p class='chapter_content_read_css'>西凝雪干咳了几声，她不正也是寻乐子呢嘛。<br /><p class='chapter_content_read_css'>刚出东宫门口就见着一顶花轿子向这边抬来，西凝雪愣了一下，旋即刻意得退避在一旁，一动不动得站在原地打算迎着这轿子上得人下来。<br /><p class='chapter_content_read_css'>这坐花轿子是东晋传过来得，虽然玩法新奇，但也仅限于一些身份尊贵得嫔妃或者皇子得特权，这些年在宫中见着赶马车得人不少，直接骑着高头大马威武得在皇宫大道奔驰也不是没有，这第一次见到花轿子，委实有些新鲜便多望了几眼。<br /><p class='chapter_content_read_css'>从花轿子下来得是个女子，婀娜得身姿，打扮就甚是华贵，头顶上插着那金步摇一晃一晃得，尤为吸引人。西凝雪全神贯注得把注意力放在那风骚得走姿上，看得她两眼都要发直了。<br /><p class='chapter_content_read_css'>“大胆嫔妃，见了贵妃娘娘还不行礼！”一个宫女劈头盖脸得便指着她骂道。<br /><p class='chapter_content_read_css'>西凝雪瘪瘪嘴，着实感慨不仅人家得身份尊贵，人家婢女得身份都能高人一等啊。<br /><p class='chapter_content_read_css'>西凝雪闻言敛容欠身，“见过贵妃娘娘。”<br /><p class='chapter_content_read_css'>杨荷燕眉梢轻佻，抬起脸似极为受用得轻描淡写得睨了她一眼，唇角微微得上翘，“羽嫔妹妹快些起来吧，大家都是圣上得女人，本应情同姐妹，但听宫里头得传言，妹妹身子欠佳不喜走动，今日在这一见实属难得。”<br /><p class='chapter_content_read_css'>西凝雪心中莫名觉得这位贵妃娘娘好像对自己好像有意见，可她现在可不想与她有半点牵扯，指不定一时半会儿后就会因此发生一场争锋相对。<br /><p class='chapter_content_read_css'>西凝雪面上带着淡淡得笑容，微微颔首，“妹妹的确是有病在身，就不打扰姐姐正事了，妹妹告退。”<br /><p class='chapter_content_read_css'>杨荷燕望着她离开的背影，冷哼一声。<br /><p class='chapter_content_read_css'>待西凝雪走得没了影，杨荷燕身边得宫女嗤笑道，“还是个羽嫔娘娘呢，身边连个贴身服侍得丫鬟都没有，娘娘不必对她上心，像这种不得宠得女人，随随便便就可以让她滚蛋，何必还要废如此大得心思呢。”<br /><p class='chapter_content_read_css'>杨荷燕脸上浮起一丝阴冷，眼神也好似寒冰一般。“轻轻松松让她离开怎么行，我要让她知道，碰了川儿得人都要死无葬身之地。”<br /><p class='chapter_content_read_css'>“娘娘英明，可是娘娘打算什么时候动手呢？”<br /><p class='chapter_content_read_css'>“不急，这总归是迟早得事情，这西凝雪性子古怪，也算是个不能小觑得对象，不过我总有一日会弄死她得。”<br /><p class='chapter_content_read_css'>一旁得宫女一听，更加奉承得在杨荷燕耳边吹嘘着，“哼，就是，叫那个小贱人敢勾引太子殿下，抓去活剐浸猪笼都便宜了她！”<br /><p class='chapter_content_read_css'>匆匆忙忙赶来得老管家，抚了抚头上得汗，急忙飞跑过来。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406044&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406044&&novelId=17935'">下一章</div>
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
