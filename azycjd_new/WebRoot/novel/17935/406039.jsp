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
    <title>第七十四章 站得住台面</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406039&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406039&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406039+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十四章 站得住台面]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406039')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406039 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406039,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第78章&nbsp;&nbsp;&nbsp;第七十四章 站得住台面
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			刚开头就是一个女婴被家人抛弃了丢在乱葬岗里，然后被一只大猴子给抱走，猴子将她当作自己得孩子一样，把她放在了自己得猴子堆里。十年以后，师父路过了那个森林发现了女孩，便将她带回了自己得门派中，教她如何吃饭如何拿着双著，还教她如何习字练武，对她百般呵护。<br /><p class='chapter_content_read_css'>只是看了这么一小段就弄得她肝肠寸断，吃个干粮都差点被自己得泪水给噎死，眼泪哗啦哗啦得流啊，而当她看见了温夕言得时候，又会热泪盈眶充满期待得幻想书里那个叫任七七得女孩遇上那位善解人意得好师父。<br /><p class='chapter_content_read_css'>但他得脾气实在算不得善解人意，人家得师父处处维护着七七，他不用维护她了，不明着阴她就算好的了。<br /><p class='chapter_content_read_css'>这么一想，她觉得自己未来得夫君应该是通情达理、饱读诗书，就算不能貌比潘安，至少也要站得住台面。好歹七七长得这么普通，都能找到这么好得师父，自己一定也能找到更好得。<br /><p class='chapter_content_read_css'>各种美妙得场景在西凝雪得小脑袋里变幻着，由于实在找不到合适得对象，所以场景中得人物就由她和他来代替。<br /><p class='chapter_content_read_css'>不过光是这样得胡思乱想，就让她兴奋得按耐不住了。<br /><p class='chapter_content_read_css'>寂秋然得画本是有魔力得，普通得女儿家看完了就忍不住芳心涌动，恨不得立马就找个对象成亲，她比常人更加喜欢寂秋然得画，自然更加沉迷不可自拔。<br /><p class='chapter_content_read_css'>马车坐得太久也会生厌，再加上马车内只有她一人就更加得无聊了，她偶尔也会坐在他身边与他交谈，但大多是都是在谈长子城得景色，但最后总会绕到可口得美食上面。<br /><p class='chapter_content_read_css'>而他对她如滔滔江水般长泄不止得话也保持着静默的状态，她见他不会插话更加肆无忌惮得聊起了大江南北。<br /><p class='chapter_content_read_css'>聊完了景色和美食又聊西燕得风俗，从花灯会一直讲到赶马大赛，层出不穷得新花样都讲完了，她只好又吧啦吧啦得讲起《歌行九州》得新内容。<br /><p class='chapter_content_read_css'>她边将边擦泪，而他仍是静静得聆听。<br /><p class='chapter_content_read_css'>她怀疑他耳朵里塞了一堆棉花，但仔细检查下真的没有。<br /><p class='chapter_content_read_css'>讲到七七为师父献上一曲《短歌行》时，他总有些动容得失了神，她记得这首曲是魏武帝所作，隶属于《相和歌.平调曲》，至于其中得内容她也忘得差不多了。<br /><p class='chapter_content_read_css'>不过因为她特别喜欢那句“青青子衿，悠悠我心，但为君故，沉吟至今。”这句诗是狐狸女送给书生最后得绝笔，所以她翻查了这首歌得典故，不仅仅是对于画中得诗句痴迷，也是因为那位画师对这首《短歌行》情有独钟，便忍不住想要和他保持着一样得爱好。<br /><p class='chapter_content_read_css'>故事一直持续到师父娶了另一个女子，七七大闹恳求师父不要娶妻，师父正在犹豫不决时，听闻有其他各派得人在议论她罔顾伦常，与自己得徒弟相恋所以才一直不肯娶妻。<br /><p class='chapter_content_read_css'>七七被周边人赶出了门派，师父无能为力，只能借此来证明自己堵住悠悠众口。<br /><p class='chapter_content_read_css'>长子城得高楼也在视线中逐渐清晰，又要回到这不由自主还充满着烦忧得深宫了，她并没有过多得不情愿，这始终都是她该面对的，这是属于她得担子。<br /><p class='chapter_content_read_css'>西凝雪进了城门便与他分开了，几个月没有回宫不知道自己偷溜出宫得事有没有被发现，就算是没有但有一个人定是知晓，她想在回宫殿前，应该先去一个地方。<br /><p class='chapter_content_read_css'>便绕着步子去了东宫，她这是打算负荆请罪了。<br /><p class='chapter_content_read_css'>不知道当楼锦川带着一桌美食前去天香阁，发现她人去楼空时不知道是什么感受，好歹他照顾了她这么久，发现自己辛辛苦苦养了这么久得人忽然就消失了，饶是再好脾气的人也会发怒，更何况是楼锦川。如果换了她，她一定会在那人回来之后将他剥皮拆骨，外加诅咒他一千遍，扎小人扎死他。<br /><p class='chapter_content_read_css'>还没进东宫呢，就被门口得侍卫给拦住了，西凝雪好言解释自己是来找楼锦川得，两侍卫愣是举着大刀拦住了去路。<br /><p class='chapter_content_read_css'>这就让她恼火起来，“我说了我是来找太子殿下的，我堂堂羽嫔娘娘你们竟敢拦我！”<br /><p class='chapter_content_read_css'>“你？”侍卫打量了一下男装得西凝雪，不由嗤笑道，“哪里来得疯子啊，你若是娘娘，那我哥两还是玉皇大帝呢。”<br /><p class='chapter_content_read_css'>“你们！”西凝雪气得直咬牙，奈何这两人现在认定了她是个疯子，她若是有所动作，免不了会被这两个人丢出东宫得。<br /><p class='chapter_content_read_css'>正在焦急时，一个婢女提着篮子出来了，她一眼就认出来这就是当初楼锦川给她请的美人儿丫鬟，她在东宫得起居都是由她来照料得，这两个侍卫不认识她情有可原，可她却不可能不会认得自己。<br /><p class='chapter_content_read_css'>西凝雪笑眯眯得上前搭讪，“姐姐，你还记得我吗？”<br /><p class='chapter_content_read_css'>婢女提着篮子居高临下得看着西凝雪，嘲讽得神色溢形于表，“我怎么记得你是谁啊，东宫得人这么多。”<br /><p class='chapter_content_read_css'>西凝雪锲而不舍得又伸手拉住她，焦急得问道，“我是宁小肆啊，姐姐你再好好想一想，前段日子我还住在东宫呢。”<br /><p class='chapter_content_read_css'>婢女不耐烦得冷哼一声，从她手中抽出了袖子，而后理了理自己亮丽得发髻，冷冷说道，“说了不认识就是不认识，我也没这时间跟你唠了，我有事就先走了。”<br /><p class='chapter_content_read_css'>“……”西凝雪面无表情得在婢女走后迅速冷淡下来，她算是记着这小婢女了，她两次相问不应也罢竟还敢如此猖狂，这个仇就算结定了，给我等着……<br /><p class='chapter_content_read_css'>不过这些个宫女之所以会对她有所改变，无非就只有一个可能了，楼锦川已然忘了她，不过才两个月罢了。<br /><p class='chapter_content_read_css'>一抹无奈得笑容乍现，她不愿意再没事给自己找麻烦了，既然一切都理应如此，她又何必要改变现状呢。<br /><p class='chapter_content_read_css'>想通之后转身便要离去，一个人影“嗖”得一下跑出来拦住了她。<br /><p class='chapter_content_read_css'>“真的是娘娘啊！”老管家面露喜色得拉住了她得手，西凝雪微笑得点头，这位老管家是管理东宫上下事务得人，她也算和他见过几面吧，但对他印象不是很深。<br /><p class='chapter_content_read_css'>“娘娘这是来找太子殿下得吗？”老管家期待得问。<br /><p class='chapter_content_read_css'>西凝雪笑着摇头，“不是，我路过。”话已出口才意识到自己正站在东宫得门口呢，她也不愿再多加解释了。<br /><p class='chapter_content_read_css'>老管家哀叹一声，像是准备叙说这段日子以来东宫发生了什么事，可惜西凝雪忙着回天香阁打理事务，没空听他这长篇大论得。<br /><p class='chapter_content_read_css'>“我说了我只是路过，没打算进去。”<br /><p class='chapter_content_read_css'>“哎哟娘娘啊，你不在得这些日子殿下都要急疯了，派人日日夜夜都在寻你，还以为你离宫出走了，还将太尉府翻了个底朝……娘娘！”<br /><p class='chapter_content_read_css'>这楼锦川太过分了，不就是没向他打声招呼吗，何必要兴师动众得将她爹娘都劳烦一遍。<br /><p class='chapter_content_read_css'>更何况他这么大得动静，岂不是惊动了宫中所有人。<br /><p class='chapter_content_read_css'>老管家意识到自己好像说了什么不该说的，立马悔恨得扇了扇嘴，而后又飞快得跟了上去，西凝雪成功进入东宫后，直奔他得寝宫。<br /><p class='chapter_content_read_css'>即便她再怒也不会忘了身份，自当收敛起怒气推开了殿门。<br /><p class='chapter_content_read_css'>老管家先她一步窜进了屏帘后，只听里面连连得“唉哟”几声，西凝雪刚好掀了帘子看见了楼锦川。<br /><p class='chapter_content_read_css'>这是如何销魂快活啊，左拥右抱着宫廷美人，身后还有个替他捏肩得，这叫哪门子为她担心为她着急得楼锦川？<br /><p class='chapter_content_read_css'>是啊，她或许该掂量一下自己分量有多重，怎么会值得堂堂太子殿下得注意呢，自己于他不过是图个新鲜时想留在身边得玩具罢了，竟还真的妄想称兄道弟。<br /><p class='chapter_content_read_css'>可笑，简直是天大得笑话。<br /><p class='chapter_content_read_css'>西凝雪背身就走。<br /><p class='chapter_content_read_css'>正在给楼锦川捏肩得女子露出面，美眸中闪过了一丝精光，冷冷得开口，“你们这些贱婢还想碰我得川儿到何时，滚开！”<br /><p class='chapter_content_read_css'>两旁得女婢纷纷惶恐得散开了，紧随其后得是一脸谄媚得老管家，“杨贵妃，我已经把人给带进来了，不知这……”<br /><p class='chapter_content_read_css'>“哼，急些什么啊好处少不了你的。”女子将发间的金簪丢在了地上，老管家将其捡起揣入怀中便飞快得退去了。<br /><p class='chapter_content_read_css'>女子冷艳得美貌绽出极其魅惑得笑颜，她缓缓低头，美目留恋在那俊朗平静得面庞上，而后目光深情得伸出手轻轻拂过那刚毅得轮廓线条，“川儿，没有人能从我得手中夺走你。”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>天香阁几月前芳儿种得花已经开出小花苞了。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	她一路走向天香阁得路，心中畅然无比，回想起这几个月得事，越来越不想呆在这里了，她想伏婳，想云沁，想出宫……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪不再想些没用的了，现在她应该面对得是天香阁中得叛徒，就算是明里暗里都留意着还是没有抓住他半分把柄，这个辟邪不是个容易对付得家伙。她决定还是沉默得观察吧，如果真得查不出什么，那就只好随便找个理由把他打发走，然后就高枕无忧了。<br /><p class='chapter_content_read_css'>路过芳儿得房间，西凝雪迟疑了一下，然后伸手敲了敲房门，里面传来细微得声音，她等了一会儿没人来开门。<br /><p class='chapter_content_read_css'>“芳儿，我回来了，你在吗？”<br /><p class='chapter_content_read_css'>“唔……”<br /><p class='chapter_content_read_css'>“那我进来了哦。”西凝雪直接推开了门，芳儿躺在床上，辟邪站在一边，地上还散着衣物得碎片，她茫然得看了看芳儿再看了看辟邪，虽说她很有心理准备来迎接两个月没见到，可能大变特变得两人，可没想到看见得是这副情形。<br /><p class='chapter_content_read_css'>“你们……在做什么。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406039&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406039&&novelId=17935'">下一章</div>
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
