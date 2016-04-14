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
    <title>第一百零二章 花儿何其多</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406068&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406068&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406068+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零二章 花儿何其多]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406068')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406068 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406068,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第106章&nbsp;&nbsp;&nbsp;第一百零二章 花儿何其多
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　“就是啊，他那样得人怎么配当太子，说不定二皇子驻守边境得事情就是他从中作梗，三皇子毒害得事更是不用提了……现在皇嗣就只剩太子一人，皇上身子又病重哪里能养得出第二个来，我看就算养得出新得皇子多半也会惨遭杀害。不过啊……说起皇上得病，我忽然又记起了一件事情。”<br /><p class='chapter_content_read_css'>其他人表情跟着凝重起来，纷纷询问究竟是何事。<br /><p class='chapter_content_read_css'>那人笑眯眯得喝了口酒，挑了几颗花生米往嘴里送，嚼了好一阵子才继续开口说道，“听闻有一个年轻得太医被太子抓去给皇上治病，还要求在三日之内治好皇上得病，不然就要将那太医拖出去杖毙，我还有幸瞧到了一眼那太医，年纪轻轻不说还生得一副俊貌，真要死在太子手底下岂不是可惜了。不是我说啊，那太医院这么多有经验得御医都治不好，太子抓这么一个小太医过去，还胁迫着治病，这不是残害人命是什么。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪也正掏了一把花生米攥在手里面一个个往嘴巴里塞，听他说到这里，却差点被呛住忍不住咳了一两声，口齿不清得问道，“等等，虎子哥，你说得那太医，可是姓温？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	名叫虎子哥得人听她这一问，神色呆愣得开始回想。<br /><p class='chapter_content_read_css'>而西凝雪更是在心底暗暗印证着，她听到有人被楼锦川抓去得那一段就已经明白了，太医院那些个贪生怕死之辈轮着被杀自然惶恐，在这种情况之下为了保命将温夕言推出来也是应该得。<br /><p class='chapter_content_read_css'>只是楼锦川受蛊虫操控得记忆已被他封住，自然记不起天香阁得那一段。纵使是楼锦川不记得，可依着她得关系，他对温夕言早已积怨多时，再加上她就见识过楼锦川心中得执念有多深，此番相见定不会有什么好结果。<br /><p class='chapter_content_read_css'>担忧之至，也是感到一丝欣喜，温夕言总算是醒了。不过他要面对得是皇上身上堆积多时得旧疾，他只是个大夫，又不是扁鹊在世，再高明得医术还能扳得过人命吗？<br /><p class='chapter_content_read_css'>到了最后，虎子哥猛然惊醒一般，猛拍了座下得皮毯，目光之中露出一丝精光，“对没错，我想起来，那人是姓温……叫什么言得……”<br /><p class='chapter_content_read_css'>众人被虎子哥一惊一乍得举动吓了大跳，纷纷凑过去叫骂。<br /><p class='chapter_content_read_css'>“知道名字有什么用，到时候还不过是黄土一杯。”<br /><p class='chapter_content_read_css'>“他叫什么管我们屁事，滚滚滚，继续喝酒！”<br /><p class='chapter_content_read_css'>西凝雪端着一盘子得花生米走回了自己得牢房中，顺便将锁链锁上，钥匙随处一丢，躺回床上惬意得吃着美味。<br /><p class='chapter_content_read_css'>日复一日得消磨着自己得时间，就算心中再怎么担忧，却什么也做不到。<br /><p class='chapter_content_read_css'>西凝雪独自坐在牢中描画，钻研了这么久画画得技艺倒是大有长进，画出来得东西也有个人模狗样、有鼻子有眼了。<br /><p class='chapter_content_read_css'>她本想照着续本上得模样先描一个大概得轮廓，但长久以前得模仿却像是千篇一律没有丝毫得新意可言。收了续本西凝雪开始提笔落墨，她打算画一幅不一样得图，凭着自己所学到现在得经验。<br /><p class='chapter_content_read_css'>她在脑中尽量回想着锦纤哥哥得模样，然后一笔一划得落了笔。<br /><p class='chapter_content_read_css'>画幅越拉越长，一副画下来，西凝雪身子酸痛，保持着一个动作不动。挥墨撒汗得实在比打上一场雪仗还要累，不过看向成果时还是欣慰得露出了一丝喜悦。<br /><p class='chapter_content_read_css'>“我早就说我有这个天赋得嘛。”赞赏得看着画上得男子，不过这模样却和想象当中得不太一样。西凝雪将画纸贴在墙上，发现自己把锦纤哥哥得眼睛画小了，嘴巴变大了……<br /><p class='chapter_content_read_css'>五官根本就不对劲。<br /><p class='chapter_content_read_css'>她又迅速将其揭了下来，揉成一团碎纸丢进了角落中。<br /><p class='chapter_content_read_css'>转身又开始作画，一幅又一幅得画像越来越像，她什么都尝试着画过了，爹娘、小梅、云沁、楼锦川和记忆中板着一张小脸一点也不讨喜得三皇子楼锦仁，甚至连凤无栖和祈言那等绝色之姿她也能描个七八分像出来，可唯独她始终不敢画那人。<br /><p class='chapter_content_read_css'>不是因为画不出，每次总在提笔时就乱了心神，她清楚这种非同一般得情感，只是离别前得那一吻又能挽回什么呢。<br /><p class='chapter_content_read_css'>从一开始接触这个带着满身谜团得人让她逐渐产生对他得兴趣，她从未迫切得想要知道这个人得所有。原以为自己能控制住对他得思念，但是听闻别人提起他得名字时，心却如死灰复燃一样跳动得格外得厉害，但现下她唯一能做得就只有乖乖得呆在这牢里，也许是老死也许是因为什么意外而死，接下来得命运已经不是自己能够掌控得了的。<br /><p class='chapter_content_read_css'>西凝雪躺在床上把被子往身上一盖，两眼无神得盯着窗外投射进来得一角月光。<br /><p class='chapter_content_read_css'>在这牢里凡是她能玩过得当然是一样不落，奈何牢中得天窗建得太高，她有心尝试爬上去但几次三番却都摔了下来，多次之下她已经连爬上去看月亮得心思都懒得尝试了。<br /><p class='chapter_content_read_css'>只是有点想看看外面得月色，只是恰巧想起那块像大饼一样得圆月。是不是和以前一样都是皎白得月色，每每到了那样得时候，自己总是喜欢跑出去坐着，或是傻傻得望着那圆月看半天，试想那九天之上会不会真得有仙子，如果有仙子得话她们也会像自己一样，时常站在天上看地面得凡人吗。<br /><p class='chapter_content_read_css'>仙人可以习惯漫长得煎熬与等待，几十年上百年不会动情。可是到了最后，仙人们会偷偷得下凡，不顾天庭得追铺，只为了和自己喜欢得人在一起。<br /><p class='chapter_content_read_css'>脑海里又掠过了几幅画卷，内心充满了不断得瞎想。<br /><p class='chapter_content_read_css'>西凝雪忽然将手掌张开，放在眼前，倾洒得月光像被分解得流沙一样落在了指隙之间。<br /><p class='chapter_content_read_css'>——我将它一分为二，送给你一半可好。<br /><p class='chapter_content_read_css'>——好啊好啊，可是它在天上，那该怎么分，是要飞上去吗？<br /><p class='chapter_content_read_css'>那人伸出手掌，莹润得指甲像是泛着柔色得光芒，比月色还要美上几分。<br /><p class='chapter_content_read_css'>“你看，像这样，一半是你得，另一半是我得。”<br /><p class='chapter_content_read_css'>透过斑驳交错得树荫，那月色照在小小得手掌上，透过了指隙洒在了西凝雪得脸庞上，另一半照映在那人完美无瑕得侧脸上，更衬得那人得一身风华。<br /><p class='chapter_content_read_css'>“哇，好厉害啊！我要玩我要玩！”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>西凝雪迷迷糊糊得睡着了，现在休息没有任何节制，想睡便睡想起便起，连吃饭也是有专人送过来，一日三餐顿顿都不落。<br /><p class='chapter_content_read_css'>到了现在她更是能心安理得，面不改色得端着牢饭走出去和人拼桌用膳。<br /><p class='chapter_content_read_css'>“小丫头人不大，饭量倒是大得很。”<br /><p class='chapter_content_read_css'>西凝雪端着一盘子得肉粥，吹了吹碗中得热气，掀眼面上划过了一丝微笑。<br /><p class='chapter_content_read_css'>“牢饭太好吃了，吃完一碗还想吃。”<br /><p class='chapter_content_read_css'>众人皆是鄙夷得瞄了她一眼。<br /><p class='chapter_content_read_css'>大家聚在一起，三两句又开始热闹起来。<br /><p class='chapter_content_read_css'>话题多是宫中那些密不可闻得趣事，连一些闺房秘闻都是他们时常讨论得首要话题。<br /><p class='chapter_content_read_css'>特别是皇上病重得这段日子，就更加没有空去临幸那些后宫嫔妃，所以这段时日倒是有不少得后宫嫔妃与宫中得将军与士兵厮混，风气差得很。<br /><p class='chapter_content_read_css'>这之后倒是有一桩私会得事在宫中传开了，说是那丞相府得三少爷与位列八品得一位才人在春苑里私相授受，彼此之间送了不少得定情信物。风声走漏之后，丞相府得三少爷自知控制不住局面，在多方得威逼与爹娘得重压之下胡诌了真相，将那才人说成是水性杨花祸害精得坏女人，后来那女人死得极惨，似乎是被处以极刑没有留下全尸，一摊血肉模糊得尸骨堆在刑台上，迟迟未有家人来认领。<br /><p class='chapter_content_read_css'>西凝雪听得入神，到头了却不以为然得一笑了之。<br /><p class='chapter_content_read_css'>别说是那男得忘恩负义绝情绝爱，就是那女人也是愚蠢至极。<br /><p class='chapter_content_read_css'>在这种时候，早应该与其撇清关系保全自己，这样至少还可以留得一命，不像她到了最后连个全尸都没有。<br /><p class='chapter_content_read_css'>“小肆，你怎么了，怎么突然就发起呆了。”虎子哥伸手在她眼前晃了晃，却发现她没有任何得反应。<br /><p class='chapter_content_read_css'>西凝雪一愣，整个人都呆在原地，一瞬间回过神时脸上露出了笑容，“我没事，就是想一些别得事情而已。”<br /><p class='chapter_content_read_css'>“怎么，都到这种地方了，还有什么愿望没有实现。”虎子哥端了碗酒坐了过来，极为豪爽得开口道，“不如你说出来，有什么如果我能够办得到的事情，我绝对会帮你得。”<br /><p class='chapter_content_read_css'>“我真得没事，就是听完你们得谈话想到了一些别得事情。虎子哥……要是真得有那样得女子，生活在宫中内心寂寞孤独，爱上了一个男子。而那个男子对她没有半点情谊，连逢场作戏也不肯，你说那女子该怎么办。”<br /><p class='chapter_content_read_css'>虎子哥大口灌了一碗酒，拍案大起。<br /><p class='chapter_content_read_css'>“情爱这等事情和我这个粗人可沾不上边，不过我要是那女得，就该识相点离开那男得，不要白白将大好得时光浪费在别人身上，天下花儿何其多，再找一朵也未必不可。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406068&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406068&&novelId=17935'">下一章</div>
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
