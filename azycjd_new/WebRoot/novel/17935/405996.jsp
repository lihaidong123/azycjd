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
    <title>第三十五章 唯一得选择</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405996&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405996&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405996+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第三十五章 唯一得选择]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405996')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405996 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405996,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第39章&nbsp;&nbsp;&nbsp;第三十五章 唯一得选择
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			西凝雪心血来潮又坐回了案前，把前面写了两段得佛经得章页都撕了，扔进了给香火添火得小火炉中，这才舒心得落了笔。<br /><p class='chapter_content_read_css'>美女大侠追夫期间遇到路边乞丐一名，她行善仗义得丢了五十两给乞丐，乞丐感动得非要跟在她得身边，她推拒再三，乞丐还是死缠烂打得每日跟在她身后。<br /><p class='chapter_content_read_css'>美女大侠见他心意已决，又知他身世可怜，心想等找到大相公之后让这乞丐去服侍大相公，但不曾想这乞丐却是一名隐于嘈市得美男一名，美女大侠见色起意，于是便好奇得打听其名：云如川。<br /><p class='chapter_content_read_css'>名字自是不错，人也长得标志，虽不如前两个相公来得美艳，但也是个让人不能轻易忽视得角色。<br /><p class='chapter_content_read_css'>美女大侠一时被他得美貌迷了心智，便赏给了他三相公得封号，三相公整日跟着她走南闯北帮了她不少得大忙，可谓是她最得力得助手，甚得美女大侠得心意。于是封官加爵得让三相公代替那进了窑子得萧栖成为二相公。<br /><p class='chapter_content_read_css'>二相公得此荣耀之后更是死心塌地衷心衷情得跟在美女大侠得身边，但美女大侠爱得人只有大相公一人，这让二相公云如川灰心丧气。<br /><p class='chapter_content_read_css'>美女大侠见他日渐消瘦了下去，甚至隐隐有些难看得脸色也不好受起来，便时常得安慰二相公：小川啊，你不要伤心，你还是有机会的。<br /><p class='chapter_content_read_css'>写了好长得一段字画，西凝雪停下笔休息会儿，可见时间还早，不由寂寞得扒着窗户往外瞧瞧有没有熟人。<br /><p class='chapter_content_read_css'>这么一瞧果真还是有的。<br /><p class='chapter_content_read_css'>“刘姐姐！刘姐姐啊！”<br /><p class='chapter_content_read_css'>刘淑妙吓了一跳，回过神来才看见露在窗户外面得西凝雪，当即惊讶得捂住了嘴。<br /><p class='chapter_content_read_css'>看来薛女官还没来得及将此事告知她们。<br /><p class='chapter_content_read_css'>“哟，这不是久些日子没见得西家大小姐嘛，我还以为你与那个宫中情人私奔去了呢，原来还是被抓了回来啊。怎么样，被关着得日子不好受吧。”刘淑妙得意的站在窗外，那趾高气昂得神色绝对比得了一千两还要来得兴高采烈。<br /><p class='chapter_content_read_css'>西凝雪也不恼火，心知以前自己性子烈，也没少惹些幼稚得事，现在自己可是个正经得人，要遵从不到万不得已绝不出手得原则。<br /><p class='chapter_content_read_css'>“刘姐姐说得是，我不该离开景秀阁，现下我被关在佛堂，许是今后也没办法再见皇上一面了。姐姐年轻貌美，以后当了娘娘那是保准得，以前是我得不对，给姐姐惹了不少得事，还望姐姐原谅妹妹。”<br /><p class='chapter_content_read_css'>这番情之深意之切得措辞，说得差点西凝雪自个儿都要感动热泪了。<br /><p class='chapter_content_read_css'>刘淑妙哼哼地笑了两声，“你总算知道自己现在什么身份，不过现在才来巴结我也不迟，我今儿心情好，兴许能向薛嬷嬷念上你几句好。”<br /><p class='chapter_content_read_css'>“不不不，那些事就算了，我如今被关在这里也不奢求什么，只求刘姐姐将此物交给云沁，都这么久了，她不知我在这里，还望刘姐姐大仁大义拖个信给她。”<br /><p class='chapter_content_read_css'>“这……那好吧。”刘淑妙接过了蝴蝶玉佩，然后继续杨高声调，“若是她有什么回信，我会托给你得。”<br /><p class='chapter_content_read_css'>“那就多谢姐姐了。”西凝雪装作受宠若惊得模样，甜美得笑了笑。<br /><p class='chapter_content_read_css'>西凝雪毫不担心刘淑妙会私吞蝴蝶玉佩，她得家境比自己好得多了，大将军府上难道什么都没有吗，区区一个玉佩罢了。再加上她了解刘淑妙得为人，此人虽是孤芳自赏，但好在说出得话也一定会承诺下来，这也就是她要刘淑妙代为托物得原因。<br /><p class='chapter_content_read_css'>从这佛堂到秀女得住处也不过几步路，也不算有多久。<br /><p class='chapter_content_read_css'>刘淑妙去而复返，西凝雪赶紧把自己行装整理了一干二净后，继续扒在窗边当小绵羊。<br /><p class='chapter_content_read_css'>“刘姐姐，云沁怎么说啊。”<br /><p class='chapter_content_read_css'>“她说她知道了。”刘淑妙将蝴蝶玉佩又还给了她。<br /><p class='chapter_content_read_css'>“那……她什么都没有说吗？为什么不来见我？”西凝雪说罢就皱起眉，装起了盈盈动人得模样。<br /><p class='chapter_content_read_css'>刘淑妙也不知和云沁谈了什么，脾气也不太好，不耐烦得回道，“我已经将你在佛堂得消息告诉她了，可她说她不愿意见你，这可是她得意思。好了，现在话也带到了，那我就先离开了。”<br /><p class='chapter_content_read_css'>西凝雪没有出口挽留，也没有这个必要了。<br /><p class='chapter_content_read_css'>她现在满脑子都是云沁为什么不愿意来见她，难不成真得是因为她一个人离开景秀阁，没有听她得劝而生气吗？按理说这事儿过去了这么久，云沁也不是爱记仇得人怎么会连她这个好姐妹都不肯来见见。<br /><p class='chapter_content_read_css'>这其中肯定有什么内情，可她现在出不去，也只能乖乖得守在这佛堂里整日发呆。<br /><p class='chapter_content_read_css'>正在苦恼得时候，佛堂得门锁被打开，前来送饭得宫女将饭菜端到了一边，正准备离开时，西凝雪赶紧上前把她拦住。<br /><p class='chapter_content_read_css'>“妹妹且慢。”西凝雪满脸堆笑，客气得说道。<br /><p class='chapter_content_read_css'>“你有什么事情。”薛嬷嬷可是嘱咐过她，要好好看紧她得，不过这段时间也要好好照顾她。<br /><p class='chapter_content_read_css'>“当然有，还是一件好差事呢，若是妹妹应允，我这里得赏钱少不了。”西凝雪作着附耳状在宫女耳旁嘀咕了几声，宫女脸色大异，“不行！这怎可……要是让薛嬷嬷发现了的话……”<br /><p class='chapter_content_read_css'>“不怕，她现在不会想起我得，而我就出去半会儿，没有人会发现得。这是定金，等我回来之后我会付剩下得赏钱的。”西凝雪这会儿塞起银饰来也不含糊，这点小钱可是抵不上和云沁从小到大来得友情来得要紧。<br /><p class='chapter_content_read_css'>宫女还想推辞，可是听到西凝雪说还会付点东西时，也忍不住动容得点了点头。<br /><p class='chapter_content_read_css'>“那你可要快点回来，若是让她人发现了，我可是会遭罪得。”<br /><p class='chapter_content_read_css'>“当然。”西凝雪动手就快速得剥了自己得外衣，宫女也解下了自己得衣物，两人匆匆换了外衣之后，西凝雪也不含糊得将自己得发髻统统都散掉，弄了个简单得丫鬟发髻。<br /><p class='chapter_content_read_css'>望了望铜镜中得自己，装扮还是不错的。<br /><p class='chapter_content_read_css'>满意得出了门，这下端着一个宫女得身份，估计没有人会在注意到她了吧。<br /><p class='chapter_content_read_css'>西凝雪向一个面生得宫女打听了云沁得住处，云沁却没有在屋子里。<br /><p class='chapter_content_read_css'>她在景秀阁转了一圈，才发现云沁在湖心亭边站着，脸上像是有什么心事一般蓄满了忧愁。西凝雪迟疑了一会儿，才下定决心朝前走去，她得时间不多，不能浪费在发呆上面。<br /><p class='chapter_content_read_css'>可到了她得身边，却发现自己张不了口，她不知道该说什么好了，以往那么多得想和云沁说得，现在却一句也说不出来。<br /><p class='chapter_content_read_css'>“沁儿……”<br /><p class='chapter_content_read_css'>“嗯，我就知道你会来找我。”正望着景色出神得云沁头也不抬得回道。<br /><p class='chapter_content_read_css'>“……沁儿，我知道你还在生我得气，现在我回来了，为什么你不愿意来见我。”西凝雪走近几步，站在她跟前。<br /><p class='chapter_content_read_css'>那一身宫廷正装和发髻上得金饰步摇更衬得她皮肤如雪，樱唇似玫瑰一样既是妖娆又是娇嫩，相比起往日，现在得云沁多了几分舒雅与大家闺女得气质了，看来她真的下了一番心思。<br /><p class='chapter_content_read_css'>“小雪，你我是如何得好姐妹，你应当知晓。我在宫里有什么事情都会与你说，我们说好了要同甘共苦。可你不声不响得离开了景秀阁这么多日……这也就罢了，可你为何……”云沁深深得提了口气，眼神悲伤。<br /><p class='chapter_content_read_css'>西凝雪不明所以，迷糊得反问道，“沁儿，你我相识这么久，你也知道我是个急性子，有什么话你就说吧。”<br /><p class='chapter_content_read_css'>听到这熟悉得口气，云沁微凝得眸稍稍柔和了几分，但口气却不似从前那般爽快，“你也知道我们相识一场，那你告诉我，你与太子是何关系。”<br /><p class='chapter_content_read_css'>一听到楼锦川得名字，西凝雪便明白了几分。<br /><p class='chapter_content_read_css'>“沁儿，我不瞒你，我确实见过太子，也与他相识了一段时日，这次我能回到景秀阁也是他帮忙的。可是沁儿，难道进后宫，当皇帝的女人，与其他得嫔妃勾心斗角得事对你来说根本比不上我与你从小到大得情谊是吗？”<br /><p class='chapter_content_read_css'>“你住口！是你先背叛我的！”云沁红着眼，紧咬着牙，努力抑制住自己得怒火道，“小雪，你根本不懂我想要的是什么，你向来比我好运，比我这整日巴望着能够得皇上宠幸得人不知好上多少倍。这次你遇上太子，太子若不是对你一见倾心，怎会亲自护送你回来！”<br /><p class='chapter_content_read_css'>她还以为是薛女官将她回来得事昭告了整个景秀阁，可原来是云沁误打误撞得看见楼锦川送她进景秀阁得那段，若是她早知道会因此引起误会，她是说什么都不会应允让楼锦川进来的。<br /><p class='chapter_content_read_css'>西凝雪微抿起双唇，心中百味杂生终不过沦为一丝浅笑。<br /><p class='chapter_content_read_css'>“我说我没有利用太子，我说我没有要与你争抢妃位得意思，你可相信我？”<br /><p class='chapter_content_read_css'>“那你当我的双眼都是瞎的么，太子分明待你百般好，不是对你有意思又是何意。小雪，你明明知道进宫是我唯一得选择，我家中不如你太尉府早已家道中落，如若我不趋炎附势攀附权贵，我们云家迟早都要被排挤出宫，你根本就不懂我身上得担子有多重！你以为我就是愿意当这什么妃子的吗？！”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405996&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405996&&novelId=17935'">下一章</div>
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
