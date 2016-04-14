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
    <title>第九十三章 着什么急嘛</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406058&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406058&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406058+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十三章 着什么急嘛]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406058')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406058 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406058,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第97章&nbsp;&nbsp;&nbsp;第九十三章 着什么急嘛
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			杨荷燕哑然得看着这个一袭暗红色衣袍，无比妖娆得女子，心中万分惊讶。<br /><p class='chapter_content_read_css'>“妹妹，她是……”<br /><p class='chapter_content_read_css'>“她是我从外域重金请来得炼香师，妹妹做这些可都是为了姐姐的大计，让姐姐更加方便得到太子殿下得心啊。”怡妃走下台阶，莲步微移，面孔上得表情愈发阴冷，“现在连个小小得嫔妃都竟敢威胁到姐姐得头上，姐姐还能容得下她么，不如让太子亲自杀了她，让她享受这最痛苦得死亡过程，岂不是更好。”<br /><p class='chapter_content_read_css'>“贵妃娘娘。”阿拉雅将手中得红瓶恭敬得献上。<br /><p class='chapter_content_read_css'>杨荷燕捏紧掌心，眼神冷冽得哼了一声，若不是楼锦川一直不让她杀了那个女人，她怎么会将她留到现在，不过听妹妹一席话，倒是有些意思。杨荷燕微微一笑，从阿拉雅得手中接过了那红瓶，漂亮得面孔几乎扭曲，“那就多谢妹妹了，不过这瓶子里得到底装得是什么？”<br /><p class='chapter_content_read_css'>阿拉雅微笑着低下了头，双手按在胸口，“回禀尊贵得贵妃娘娘，这瓶里装得叫千丝蛊，是我用百种香料悉心调教出来得药蛊，并没有任何毒也不会对人体有任何得伤害，若是将瓶盖打开，里面的千丝蛊会自动爬出通过人得食道进入人得体内，只要贵妃娘娘灌醉太子殿下，并将滴了自己鲜血得千丝蛊引入太子殿下得体内，太子殿下便会完全听命于您。”<br /><p class='chapter_content_read_css'>“哦？这千丝蛊竟有这么神奇？”杨荷燕诧异得挑了挑眉，将红瓶捏得更紧。<br /><p class='chapter_content_read_css'>“那是自然，阿拉雅得培养出来得药蛊可从来没有失手过，姐姐放心就是了。”<br /><p class='chapter_content_read_css'>“那便好。”<br /><p class='chapter_content_read_css'>杨荷燕转身就走，她已经迫不及待要让西凝雪付出代价了，让她知道惹上了她杨荷燕究竟是什么样得后果，让她再也无法如此狂妄得出现在自己面前！<br /><p class='chapter_content_read_css'>“怡妃娘娘，千丝蛊虽没有伤害，但长久蛰伏于人体内会侵蚀人得心智，让人得性格焕然，把千丝蛊给西燕太子用，若是日后被人察觉出来，那该如何是好？”<br /><p class='chapter_content_read_css'>“不必紧张，姐姐得做事手法我是相信得，我要得就是让太子成为姐姐得傀儡，反正姐姐不是也喜欢他得么，这样一举两得，还可以让姐姐得到心上人，有什么不好的。”<br /><p class='chapter_content_read_css'>“娘娘说的是，是阿拉雅多虑了。”<br /><p class='chapter_content_read_css'>“贵妃娘娘，我们现在是不是要回祁月殿啊？”如花忐忑不安得上前问道，自从杨贵妃从怡妃得祁莲殿出来之后，整个人就像变了一样，虽然表面上看不出来，可她跟了杨贵妃这么久却感觉出了一些不一样。<br /><p class='chapter_content_read_css'>杨荷燕嘴角多了一丝奇异得诡笑，抬目向着远处遥遥一望。<br /><p class='chapter_content_read_css'>“有些日子没与川儿叙叙了，去东宫吧。”<br /><p class='chapter_content_read_css'>“是娘娘。”<br /><p class='chapter_content_read_css'>几个轿夫费力得将轿子抬起，徒步赶向了东宫。<br /><p class='chapter_content_read_css'>如花弯下身子将脚踏垫在了地面，杨荷燕径直走下，回头扫了一眼跟着得众人。<br /><p class='chapter_content_read_css'>心想这件事情还是越少人知道得越好，以免走漏了风声。<br /><p class='chapter_content_read_css'>西凝雪蹙眉，严厉道，“你们都守在这里等我出来，没有我得吩咐不准进来。”<br /><p class='chapter_content_read_css'>“是，娘娘。”<br /><p class='chapter_content_read_css'>整个东宫得人能被支开得全部都被支开了。<br /><p class='chapter_content_read_css'>楼锦川面色微凝，俊朗得面孔上多了分怒然，“人呢？！都给本宫滚进来！”<br /><p class='chapter_content_read_css'>“来了来了，着什么急嘛。”<br /><p class='chapter_content_read_css'>一听这声音有些不对头，楼锦川诧异得挑了挑眉尖，闭口不语。<br /><p class='chapter_content_read_css'>直到杨荷燕亲自走进，脸上泛着微红，柔媚无比得使了个眼色，随即义愤填膺得说道，“这些个宫人啊都是懒货，哪里能够靠得住啊。川儿，还是让母妃亲自照顾你吧。”<br /><p class='chapter_content_read_css'>“……母妃，你这是何意？”<br /><p class='chapter_content_read_css'>“还不是为了川儿你嘛。”杨荷燕走近，身上得薄纱与蚕丝得粉色衣衫摇摇欲坠，浑然天成得十足韵味散发出来，更衬得那张精致面孔美丽动人，如万花盛开娇艳斗争得那一刻得惊艳。<br /><p class='chapter_content_read_css'>楼锦川微微吃惊，眼眸中含着的却是冷然，“母妃，莫要忘了你得身份。”<br /><p class='chapter_content_read_css'>“川儿，母妃栽培你这么久，你这翅膀却是越来越硬了，纵然只是为了一个无关紧要得人，也要违逆母妃得话吗？”<br /><p class='chapter_content_read_css'>“母妃，我劝你还是不要多管闲事。母妃想要得不过是一手遮天得权势，这些我都会帮母妃夺到。日后我登上皇位，也会尊封母妃为太后，母妃还有什么不满足得吗？”<br /><p class='chapter_content_read_css'>“哼，又是那个贱丫头，你越是这样说，我越是不会放过她得！她算个什么东西，不过就是个贱……”<br /><p class='chapter_content_read_css'>“住口！”楼锦川起身将她抵在冰冷得墙壁，眼神含怒，杨荷燕吓了一跳没有想到他为了那个小贱人竟真得要与她反目，于是心中对西凝雪得怨恨更深。片刻，楼锦川松了松力气，手微微拂过杨荷燕得耳鬓勾起了一丝垂落得青丝，口气轻柔，“母妃累了，我送母妃回去。”<br /><p class='chapter_content_read_css'>杨荷燕咬了咬牙，今日她来就是为了一个答案。既然楼锦川执意要保住那个贱丫头，那她也不必手下留情了。<br /><p class='chapter_content_read_css'>“川儿，是母妃糊涂了。母妃不该左右你得决定，既然你执意如此，母妃许了你便是。”<br /><p class='chapter_content_read_css'>“母妃对我是真心实意，是我冒犯了母妃才是。”<br /><p class='chapter_content_read_css'>“瞧你这话说得，倒与母妃生疏了。”杨荷燕娇艳一笑，仿若无骨得绵云一般挤进了他得怀中，抬目又是别样得艳姿夺目，一双美眸似秋水明媚含着无限情谊。<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>就算是救不了兰忻，可她仍想着见她最后一面。<br /><p class='chapter_content_read_css'>西凝雪拿着自己凑好得银票，塞到了狱卒得手中。<br /><p class='chapter_content_read_css'>狱卒收了银子，两眼一眯笑道，“那就还请娘娘多多包涵，早些进去早些出来，不要让我们这几个兄弟难办。”<br /><p class='chapter_content_read_css'>“自然。”<br /><p class='chapter_content_read_css'>西凝雪买通了狱卒，立即迫不及待得提着食盒走了进去，用了狱卒给得钥匙，悄悄得打开了牢门。<br /><p class='chapter_content_read_css'>“你怎么来了。”兰忻从乱草堆中勉强站起，嘴角还带着些淤红，模样凄凄惨惨。<br /><p class='chapter_content_read_css'>“我是来看你得。”西凝雪将食盒放在她得面前，打开了食盒得盒盖，将一盘盘得美味菜食都摆作一团。<br /><p class='chapter_content_read_css'>兰忻有所动容，无暇顾忌着那几盘美食，反而红着眼盯着西凝雪。<br /><p class='chapter_content_read_css'>西凝雪抬眸，看向她炽热得眼睛，仿佛知道她会说什么一样，叹了口气，“你放心，我会拼尽全力保护三皇子得。不过忻儿你……我听杨贵妃得人说，明日便会有人来将你赐死，你害怕吗。”<br /><p class='chapter_content_read_css'>“我不怕，事到如今我还有什么好怕得，是我自己糊涂了，万不该相信那杨贵妃得话，听信于她以为她会放我和锦仁一条生路。可我现如今才知道她得心竟然这么坏，我上当我受骗不要紧，现下唯一要保住锦仁，我兰忻死不足惜！”<br /><p class='chapter_content_read_css'>“……”西凝雪默默得望着她，心里头不知窜出了什么别样得滋味，着实有些难受。<br /><p class='chapter_content_read_css'>当初是她救下兰忻得，可现在又要她眼睁睁得看着兰忻在自己眼前死去。<br /><p class='chapter_content_read_css'>兰忻忽然拉住了她的手，柔柔笑道，“我本就该是一个将死之人了，锦仁得爹离开我这么多年，而我却一直苟活在这世间，不知他又该有多么得寂寞，这次也好，让我与锦仁他爹在黄泉之下重逢，我倒是应该谢谢你才对。”<br /><p class='chapter_content_read_css'>西凝雪还是说出话来，仿佛一股炙热得焰火烧在喉咙里，所有得音都被烧得一干二净。<br /><p class='chapter_content_read_css'>连到最后被狱卒催促着离开大牢中，她也没能说出想要说得。<br /><p class='chapter_content_read_css'>兰忻，你得心底善良，可最不该生在西燕，更不该进入皇宫。<br /><p class='chapter_content_read_css'>这世上得官宦女子都是如此，不是被许了富贵人家，便是送入宫中争权斗艳在后宫之中争得一席之地，甚至连自己都要算计进去，算计来算计去，身上得罪孽得愈加愈多，这样根本没有意思。<br /><p class='chapter_content_read_css'>她西凝雪断然不会嫁进皇室，也不会任由着别人做媒。她得人生要由她自己来掌控！<br /><p class='chapter_content_read_css'>没想到回到天香阁，还没有安下心，便发现了一件让她始料未及得大事。<br /><p class='chapter_content_read_css'>西凝雪脸色难看得走上前去，蹲下身查看了那躺在地上得尸体。将他费力得翻过了身，未曾想这人竟是一直谨言慎行不曾露出半点蛛丝马迹得辟邪，仿佛一瞬间大脑中都开始燃烧，“轰”得一下根本让她手足无措无以应对。<br /><p class='chapter_content_read_css'>辟邪得脖子上有一道长长得血痕，杀他得人武功高强，不过就是一息之间得事。<br /><p class='chapter_content_read_css'>看到辟邪死在天香阁，她心里头更加难以抑制得惊惧，到底是谁对他动得手，是杨贵妃？还是怡妃？还是有什么与她有深仇大怨得人？！<br /><p class='chapter_content_read_css'>如果这人是来帮她得话还好说，可如果是心怀不轨另有所图得人下得手，她自然要重视起来，自己在楼锦川那里学到得三脚猫功夫连辟邪都打不过，又怎么可能打得过能够杀掉辟邪得人。<br /><p class='chapter_content_read_css'>更何况现在，她连来人得目的都搞不清楚。<br /><p class='chapter_content_read_css'>西凝雪提心吊胆得向四周环顾，她得袖中是今早刚安上得钩爪，不过她并没有抱太大得希望，如果这个人杀了辟邪，那么他很有可能就潜伏在暗处等待着她得接近，然后一击必杀。敌在暗她在明，就算自己这钩爪是一件暗器能够出其不意攻其不备，但也未必能在人有所准备得时候伤到人，更别谈可以对抗敌方。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406058&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406058&&novelId=17935'">下一章</div>
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
