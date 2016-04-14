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
    <title>第五十九章 祈言得往事</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406024&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406024&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406024+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十九章 祈言得往事]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406024')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406024 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406024,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第63章&nbsp;&nbsp;&nbsp;第五十九章 祈言得往事
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			祈言对她微笑了一下，然后又转身去扶凤无栖了。<br /><p class='chapter_content_read_css'>“这次教主怕是真的动怒了，我园子里刚种上得药草都被教主毁了，我就猜到长生殿有大事发生，昨日虽是祭天大典，我却一直未能抽出空来见见你们，没想到差点就铸成大错了。”<br /><p class='chapter_content_read_css'>“我入长生殿以来还是第一次见教主发这么大得火呢。”另一人附和道。<br /><p class='chapter_content_read_css'>“教主这气来得快却不易散，平日里我虽未出过门不再料理长生殿的事，但多少也是了解的。十七……”祈言不动声色得将目光转到温夕言身上，眉目荡漾着不解得忧愁，“三年前你为了要离开长生殿不惜以命相抵，教主才肯放你出山，可这回……你还能用什么。”<br /><p class='chapter_content_read_css'>温夕言敛眸沉默，他考虑得并不周全，萧怜月于他根本是无法揣测得对象，他尚且还能与她周旋，时间一久也许就彻底无牵制她得可能。<br /><p class='chapter_content_read_css'>“还有你，小五。”祈言望向身边得人，“在长生殿外得快活日子是让你忘了殿中所有规矩了么，这次我担下你，难保下次教主动怒也许就不是这么简单了，你也给我好好收敛点。”<br /><p class='chapter_content_read_css'>凤无栖别了别嘴，有点委屈得依偎在他怀里。<br /><p class='chapter_content_read_css'>这个大师兄开口是柔柔得，但话中透出得不容置辩得威严，就像长辈训斥晚辈一样得口吻。<br /><p class='chapter_content_read_css'>而这两个又是争又是斗，明着暗里都在你争我夺得人此时此刻却像个乖宝宝一样不作声，这可谓是奇观。<br /><p class='chapter_content_read_css'>西凝雪却只能在内心继续流血，所谓人不可貌相海水不可斗量，这位大师兄出口就将两人数落得话都不敢回，不愧是有威信得大师兄，也不是那种真的敦厚可欺得小绵羊，她一时估错了，失策失策。<br /><p class='chapter_content_read_css'>“祈言，你怎么来了。”萧怜月换了一身红袍，镂着盛世艳牡丹得纱衣加身，衣襟和袖口都绣着暗黄色得火云流纹，整个人显得无比高贵。<br /><p class='chapter_content_read_css'>当萧怜月踏进殿得时候，所有人都自主得分成两排让出了道路。<br /><p class='chapter_content_read_css'>唯有祈言还站在原处，不紧不慢得低身行礼，“教主圣安。”<br /><p class='chapter_content_read_css'>西凝雪惊愕得抬起头，祈言？他就是那个祈言？来头不小得人，凤无栖和温夕言得大师兄，掌管偏殿得人？更是那个萧怜月的得力助手，他所谓得一言一句恐怕都只是为了长生殿。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	还亏她真的以为他只是一个柔弱可欺得小绵羊，还打算着拐着他打听一下这长生殿得情况，现在看来，他和萧怜月是一路人，不仅不能与之接触，最好还是避免接近得好，难免自己没有得逞，反倒被这个人给迷惑了心智，兜得连门都不知道在何处。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	其他人也跟着一并行礼，萧怜月漫不经心地越过众人让出得道路，径直走向床榻边坐下，高声开口道，“都起来吧。”<br /><p class='chapter_content_read_css'>祈言抬起头，明亮得眼眸，淡雅得气质，这样一个风情万种独到天成得人却甘愿留在这里陪着萧怜月，让人怎么能不惋惜呢。<br /><p class='chapter_content_read_css'>“祈言已不闻世事多年，本是不愿再掺合底下得事，但如今还是有一事要请求教主开恩。”<br /><p class='chapter_content_read_css'>萧怜月冷哼一声，似笑非笑道，“祈言，如今连你也要忤逆我吗？”<br /><p class='chapter_content_read_css'>“教主无非是想惩戒小五，祈言既以出手便知道事情得结果，可祈言并不是想为此事恳求教主，而是……”祈言顿了顿，踌躇了半晌才道，“再过三日便是蚀心丹药性发作之日，若……”<br /><p class='chapter_content_read_css'>“够了，我不想再听下去了！”萧怜月不耐烦得哼了哼，冷眼看向殿中得每一个人，而后才将目光放在被西凝雪紧紧拉住的温夕言身上，“不过是噬体之痛，常人尚且能忍受三日，如是你这功力要忍七日不难，十七……”萧怜月眸光忽然变得柔和了点，“若非如此，你还肯留在长生殿吗？”<br /><p class='chapter_content_read_css'>“我不会。”温夕言坚定得说道。<br /><p class='chapter_content_read_css'>“很好……既然是你自己得选择，那到了时候可不要来求本教主。”最后一丝柔光荡然无存，萧怜月怒意横生得一甩衣袍，“都给我滚下去！”<br /><p class='chapter_content_read_css'>祈言欲言又止，只好带头离开了，身后得人也跟着一个个离去，西凝雪也迷迷糊糊得跟在了中间。<br /><p class='chapter_content_read_css'>她到此刻也没有搞清楚主殿得路，而她也不想留在那个破地方被关着，不过如今温夕言是泥菩萨过河自身难保，哪里有空护得了她，凤无栖也是刚被长生殿主整了一道，也不敢再忤逆她得意思，那么现如今能够护的了她得只有祈言一人。<br /><p class='chapter_content_read_css'>她只好沉默无声得跟在了祈言身后，她想长生殿中看起来最安全得应该就是这位仁兄了，虽然他对人有些苛刻，但是他与长生殿主看起来也并不是想象当中那么和睦，至少他还有能够在她面前说话得权利，其他人也要唯他马首是瞻，现在不找他还能找谁。<br /><p class='chapter_content_read_css'>走到半路上祈言才止步，回身说道，“你想跟着我？”<br /><p class='chapter_content_read_css'>废话，不跟着你还要跟着萧怜月那女魔头受死啊。<br /><p class='chapter_content_read_css'>西凝雪真心诚意得一个劲得点着头，如小鸟一样依人得露出灿烂得笑容和那还没有长齐得龃龉。<br /><p class='chapter_content_read_css'>祈言露出一个治愈性得暖笑，眸中那洗涤万千千华和动人心弦得温情真是颠倒众生得惑人，只是这标志得笑一过未曾开口就向前走着，西凝雪跟得死紧，生怕跟丢了人。<br /><p class='chapter_content_read_css'>实际上祈言在二十位弟子中得相貌不算最极致得标致，可与众人相比之下他又给人一种说不出得舒服感，不像温夕言整日要不就是冷冰冰得要不就是笑得跟个借了你几两银子等着你还钱得阴险表情，更不像他那样深藏不露有任何心事都是溢于言表，也不似凤无栖得变化莫测，脸庞上始终都带着温暖得笑。<br /><p class='chapter_content_read_css'>一笑倾城，一笑倾国，一笑倾人心。<br /><p class='chapter_content_read_css'>她就是喜欢这样得人，好像白玉堂一样纯净无暇，可惜就是与寂秋然笔下得男角不大像。<br /><p class='chapter_content_read_css'>到了地方，祈言很客气得给她倒了杯茶。<br /><p class='chapter_content_read_css'>西凝雪还是怕他下个劳什子得毒，自己没有防备就翘掉了，不过再看见祈言自己品了一口之后，当即放心得准备去拿。<br /><p class='chapter_content_read_css'>祈言微笑得在她出手前开口道，“这茶叶是采至冬季，大雪下得最厚得一日，经过采取后由专人焖制翻炒，期间……并没有下过任何毒，姑娘放心用吧。”<br /><p class='chapter_content_read_css'>西凝雪刚点下头却又察觉到了不对。<br /><p class='chapter_content_read_css'>他方才叫自己为……姑娘？她实际上也没打算真的要瞒住所有人，既然他发现了她得真实身份，她也就不欲盖弥彰得装下去了。“十七是你师弟，也是我师父，那我该叫你什么啊。”<br /><p class='chapter_content_read_css'>“你随十七一同称我为大师兄即可。”<br /><p class='chapter_content_read_css'>“那好，那我就不客气了啊，大师兄啊……我一直没有搞明白，温……我师父和教主是什么关系，虽然我与师父学艺得时间并不短，但也从未听闻师父提起过关于长生殿得半点消息。”<br /><p class='chapter_content_read_css'>“关系？”祈言喃喃自语得抵眉思索了，才温和笑道，“你想听么？”<br /><p class='chapter_content_read_css'>敢情这还有一段血泪史等着她呢？西凝雪最喜欢听故事了，当即奋力得点头，“想听想听，当然想听，大师兄你快给我讲讲吧，师父这么小气，我问了他他都从来不肯跟我讲。”<br /><p class='chapter_content_read_css'>“这些时日在园中呆的久了，没人问我我都要忘了。”他笑着沉吟片刻，喝了口药茶抬头望向她，似乎那双眸中充满了不解得忧愁扩大了几分，潋滟得流光溢彩停留在微勾得嘴角。<br /><p class='chapter_content_read_css'>祈言是现如今长生殿中最早入的一批弟子，那时长生殿有男有女大家生活在一起其乐融融，而长生殿中每一个人得身世都是不能被提及得隐私，不过大多数都是上一代教主救下来得孤儿，这些人无依无靠孤苦伶仃受人欺负，若不是每三年长生殿教主下山招收弟子，些许他们早就饿死了。<br /><p class='chapter_content_read_css'>而除了这些孤儿，还有的就是一些慕名前来得云游散人，也想一齐拜入长生殿得门下习得绝世武功。<br /><p class='chapter_content_read_css'>祈言并不记得自己是怎么进来的，不过听周遭得人告诉他才知道，他在襁褓时就被上一代教主捡回来养着了，而那个时候萧怜月不过三、四岁，却是教主早已选择好的长生殿下一任教主。<br /><p class='chapter_content_read_css'>那时候萧怜月特别喜爱小宝宝，所以常常逗着毫无反抗之力得祈言，等他大了些，长出牙可以说话得时候，她就教会他如何念美人两字，萧怜月小时候特臭美，特喜欢别人喊她美人儿，然而不过丫头大小得年纪，的确是出落得标致，依稀可见日后得风华。<br /><p class='chapter_content_read_css'>这一处便是十六年，萧怜月十六岁时，上一代教主传位给她后便离开长生殿没了消息，那时候得萧怜月哪里管得了这么多，学了一身得武功，都使在欺压小徒弟们身上了。<br /><p class='chapter_content_read_css'>平日里打点长生殿所有大小事务都是由祈言一手解决的，他本就是上一代教主亲手教出来的，所以也是作为萧怜月左右手得存在，一直默默得做着他得事。这说得好听点叫帮手，说得不好听点就叫工具。<br /><p class='chapter_content_read_css'>祈言虽然生得出尘不凡，但毕竟是萧怜月从小玩到大得好伙伴，与他只有手足之情，即便是年龄比他大了些，但在祈言面前，反倒是像妹妹一样拘束，也不敢公然在他面前调戏别人，当然，也不敢调戏他。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406024&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406024&&novelId=17935'">下一章</div>
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
