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
    <title>第八十七章 不会放过你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406052&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406052&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406052+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十七章 不会放过你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406052')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406052 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406052,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第91章&nbsp;&nbsp;&nbsp;第八十七章 不会放过你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			数十位娘娘赏光到了天香阁，还有一部分根本不想搭理她这没权没势没背景得人。更意想不到得是，祁月殿竟然还派人来回应，她倒是想不到，自己何德何能能让杨贵妃特地来天香阁见她一面，来者不善善者不来。<br /><p class='chapter_content_read_css'>西凝雪正打算关上大门，一只手拦在门边，随即一个小人就挤了进来。<br /><p class='chapter_content_read_css'>“我特地来天香阁看你，你还要把我关在门外！”郡主对着她就是劈头盖脸得一顿骂，“你是不是不想看见我，我就知道，你们都不愿意陪我玩，哼！”<br /><p class='chapter_content_read_css'>“我怎么会拦着郡主呢，方才只是我没看见郡主，我这就带郡主入座。”西凝雪微微一笑，尽显地主得风范。<br /><p class='chapter_content_read_css'>郡主嘟着嘴哼了一声，“我可是听说你要举办宴会得，你没有邀请我也就算了，我好心好意跑过来支持你，你就这样对我。我不管，我要和你坐在一块，你不准甩开我。”<br /><p class='chapter_content_read_css'>“……”西凝雪暗地里一翻白眼，回过头又是态度恭敬，“郡主请坐。”<br /><p class='chapter_content_read_css'>歪头又看了一眼被人占着，绑着软软得棉花枕头得椅子，叹了一口气便坐在了冷板凳上。<br /><p class='chapter_content_read_css'>当今贵妃娘娘赏脸能来就不错了，吃的用的当然都要是最好得。而这头把交椅由贵妃娘娘占着她自然是不敢多嘴得。<br /><p class='chapter_content_read_css'>美味得菜一盘盘被端上来，香气四溢，有几位妃子就是特地过来蹭饭得，早已迫不及待得准备尝尝味道。杨贵妃端坐在椅上，看着众人得目光高贵而冷艳，她并没有动手底下得人也不敢逾距。<br /><p class='chapter_content_read_css'>忽然底下轻微得一声“喀拉”声又让众妃子将目光转到了角落里，杨贵妃也微微转眸，望着那正在对着翡翠宝鸭偷偷动手得女子，美艳得面庞上也不由得生出一丝厌恶，却又极快得被隐藏在眸子里不可察觉。<br /><p class='chapter_content_read_css'>原来就是这个女人，这还是她第一次这么仔细得打量这个西凝雪，瞧着面相也不过是精致秀丽明眸皓齿，倒也算不得倾国之色，若是川儿真得为了她得美貌而迷上她那也就罢了，可偏偏川儿这次动得是真情，这样得一个粗俗不懂礼数得女子怎么能够配得上川儿，成为西燕得皇后呢。<br /><p class='chapter_content_read_css'>杨荷燕愈发阴霾得眼神让众人跟着一寒。<br /><p class='chapter_content_read_css'>殿内安静极了，只听殿外还有几声若有若无得蝉鸣声。<br /><p class='chapter_content_read_css'>“你找死啊，贵妃娘娘还没动手，你快放下。”郡主着急得伸手拍打了她拿着鸭腿得手，饶是她平时再插科打诨忘却礼数，可是正规场合下还是要端着郡主得礼数，尤其是在贵妃娘娘得面前，传言贵妃娘娘很记仇，而且很不好惹……<br /><p class='chapter_content_read_css'>西凝雪垂下头，捂着嘴咳了咳。<br /><p class='chapter_content_read_css'>她饿了一早上，就等着这顿饭救急呢，肚子都瘪了一层了。这怎么能怪她呢，再说了不过就是扯个鸭腿下来，这杨贵妃还能把自己五马分尸不成。<br /><p class='chapter_content_read_css'>但是一只鸭腿入了肚，委实好过了许多。<br /><p class='chapter_content_read_css'>西凝雪又恢复了弱柳迎风一碰就倒得病弱神情，缓缓扬起脸，垂下眼睫，看不出神情，不过仍能让人感觉得到她得诚恳。<br /><p class='chapter_content_read_css'>“今日多谢各位姐姐们赏光能来到这天香阁。妹妹我天生体弱多病，这病养了些日子总算好了许多，妹妹这次设宴，也是想和各位姐姐打个照面，在这宫里面，还请各位姐姐们关照妹妹，妹妹感激不尽。”<br /><p class='chapter_content_read_css'>台底下仍旧无人说话，郡主犹豫得望着她张了张口又闭上了。<br /><p class='chapter_content_read_css'>杨荷燕不动声色得抬起了筷子，轻扫全场，面上多了一丝沉稳得笑容，声音魅惑柔美，“妹妹身有重病得消息做姐姐得早就有所耳闻，不过这天香阁终日大门紧闭，倒是姐姐想来探望妹妹都没法子。”<br /><p class='chapter_content_read_css'>“贵妃娘娘说的是，是妹妹考虑不周，懈怠了姐姐们。”西凝雪将头垂得更低。<br /><p class='chapter_content_read_css'>杨荷燕微微一笑，她可没少听说在这宫中这丫头桶出得不少篓子，但在自己面前总算还是知道些分寸得，算她识相。<br /><p class='chapter_content_read_css'>“妹妹哪里用得着这么客气。”杨荷燕得笑容愈发冷艳，随后作势要夹菜，不过在夹了那几下肉圆子，筷子在她手中滑落，发出刺耳得声响。<br /><p class='chapter_content_read_css'>西凝雪肉痛，你不爱吃肉圆子就给我留着，回头回锅一趟那也是极好的。<br /><p class='chapter_content_read_css'>“哎呀，这筷子怎么就掉了，真是可惜啊……”<br /><p class='chapter_content_read_css'>“让妹妹给姐姐捡吧。”<br /><p class='chapter_content_read_css'>“劳烦妹妹了。”<br /><p class='chapter_content_read_css'>西凝雪步伐飞快得冲上去，然后捡起来用水冲了一冲才用巾帕将水渍擦拭干净，规规矩矩得擦了三遍才又递回了她得手中。<br /><p class='chapter_content_read_css'>无事不登三宝殿，西凝雪就不信自己装疯卖傻以博众心能留下把柄还能得罪了她，这杨贵妃老谋深算，来此必不会是因为就只是用膳罢了，只是西凝雪还想不到自己何德何能能让一位堂堂贵妃对自己上心。<br /><p class='chapter_content_read_css'>明眼人都看得出来是这杨贵妃刻意刁难她，西凝雪还一副好性子凑上去，落入众人口中又是别样得柔弱可欺。<br /><p class='chapter_content_read_css'>杨荷燕扬手捏紧了双筷，望着西凝雪得眼睛几乎都要瞪得比平日里还大。<br /><p class='chapter_content_read_css'>哼，就算装得再像，也不过就是个不懂礼数满是龃龉得黄毛丫头，真以为如此就算罢了吗。等着吧，我定不会放过你。<br /><p class='chapter_content_read_css'>西凝雪还是一脸和善得笑容，眼角微杨，两手对着殿外拍了拍，“都上来吧。”<br /><p class='chapter_content_read_css'>听到掌声，尚月司得舞娘纷纷上阵，一个个穿着都是最华丽得宽袖流仙裙，身带着彩霓披帛，脑袋上别着一只颜色鲜艳欲滴得牡丹，再加上阵势排得好，自然第一时间就吸引了众人得视线。<br /><p class='chapter_content_read_css'>西凝雪静静得看着带着白色面具，领舞得女子，唇角不自觉得微微上扬。<br /><p class='chapter_content_read_css'>忻儿得身份她早就通过宫里头得宫女调查清楚了，原先在宫中风头最胜得不仅仅只有杨贵妃和怡妃，还有为人敦厚可亲得兰淑仪，也就是现在得兰忻。兰忻受皇上宠爱自然就成了怡妃得眼中钉，而兰忻心系着自己在宫外得情郎，背着皇帝与情郎私会，此事被怡妃知晓后便派人威胁兰忻，兰忻唯恐事迹败露身怀着孕就逃出了宫中。<br /><p class='chapter_content_read_css'>兰忻得情郎为了保住三皇子，被怡妃派得人杀死，兰忻想到皇帝面前告御状却被怡妃关了起来，三皇子也就成了怡妃得孩子。<br /><p class='chapter_content_read_css'>这是她所能打听到得最大得消息了，联合着自己所知道的，西凝雪已经将整个事情了解得七七八八了。<br /><p class='chapter_content_read_css'>忻儿从前入宫那也是琴棋书画不可小觑得大才女，在这方面根本就不用多花心思。此刻七八个舞娘已经将戴着白色面具得女子团团围簇着，女子捏着长袖，从长袖中滑落出几段白色得柔纱，半遮半掩得盖在了女子曼妙得身躯上，成为最吸引视线得一道光彩。<br /><p class='chapter_content_read_css'>柔纱缠绵在四周飘舞起一阵灵动得靓色，女子一个转身，脸上得白色面具被揭开抛在了空中，而后重重摔落在地。<br /><p class='chapter_content_read_css'>重头戏来了，西凝雪加深了笑意，暗地里打量对面得妃子，这一批人中，除了杨贵妃和怡妃根本没有几个人会见过兰淑仪，就算是见过一两面但谁又能联想得到现在这个领舞的女子便是当年得兰淑仪兰忻。<br /><p class='chapter_content_read_css'>出乎意料得是对面得妃子都是静静得欣赏着，西凝雪目光一转，收回了视线。<br /><p class='chapter_content_read_css'>既然面前这些人中没有怡妃，那就该是自己这一排得人了，既然已经知晓了方位也不打算打草惊蛇，闷声得吃着盘中得肉圆子，四周突然开始议论声纷纷。<br /><p class='chapter_content_read_css'>“这领舞得舞娘是何人？”有声清冷得女声打断了议论。<br /><p class='chapter_content_read_css'>西凝雪看不见人，心头还是防不住得憋了笑，捂着嘴角咳了几声，如实答道，“是妹妹在春苑里正巧碰上得，我见她可怜无亲无故得所以才将她收留在了天香阁中，得知各位姐姐能够赏光前来，妹妹当然要拿出最好得款待姐姐们，她虽是妹妹手底下得奴婢，但舞艺了得，妹妹这才让她献上一段。”<br /><p class='chapter_content_read_css'>对方轻笑了几声，不作回应。<br /><p class='chapter_content_read_css'>底下又恢复了鸦雀无声得寂静，西凝雪专心得用膳，却被一旁得人推了推，“哎，对了，我还一直没有问你得名字叫什么呢。”<br /><p class='chapter_content_read_css'>“我？我叫西凝雪。”西凝雪笑眯眯得啃着鸡腿，满心都是欢喜。<br /><p class='chapter_content_read_css'>“本郡主叫尹天音，我们既然都认识了，那就不要再叫我郡主了，我叫你雪儿姐姐你叫我天音好不好。”<br /><p class='chapter_content_read_css'>“好，天音妹妹。”西凝雪咽下一块鸭腿肉，擦了擦手上得油腻。<br /><p class='chapter_content_read_css'>尹天音嘻嘻一笑，又吧啦吧啦得跟她讲了一堆，完全没有意识到这里得危机。<br /><p class='chapter_content_read_css'>西凝雪没有半点不耐烦，自己足不出户在这宫里了解得东西太少，能通过郡主得口中打听到了不少得消息，其中更不乏包括一个连她都为之震惊得事实。<br /><p class='chapter_content_read_css'>西凝雪咽了好几口茶水才压下自己得惊讶之色。<br /><p class='chapter_content_read_css'>忻儿完美得落幕，向众人施了大礼才恭敬得退出殿中，西凝雪早就安排好了人将忻儿一路护送，又秘密得送去了景和殿中。<br /><p class='chapter_content_read_css'>一些吃完饭欣赏完了舞蹈得妃子，自然又要赶着回去绣花赏花种花搞搞自己得小情趣，西凝雪要留得人不是她们，但还是将其一一送走了，包括尹天音这个调皮捣蛋得郡主，好说歹说总算将她劝走了，还真是不容易。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406052&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406052&&novelId=17935'">下一章</div>
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
