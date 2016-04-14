<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>阅读界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/azycjs.css">
	<script language="javascript" src="js/jquery.js"></script>
	
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">var path='<%=path%>';</script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jbox-demo-depends/highlight/styles/magula.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/index/css/index.css"/>
	<style type="text/css">
		img{border: none;}	
		.huanfu{ position:absolute; display:none; overflow:auto; padding:10px; margin-left:650px; margin-top:85px; z-index:10;}
		.huanfu div{ margin-left:9px; width:25px; height:25px; float:left; border-radius:25px; cursor:pointer;}
		#mulvdiv{ display:none; position:absolute; margin-top:30px; z-index:1; border-radius:4px; background-color:#f7f5ed; border:#e1ded1 1px solid;}
		#mulvdiv div{ font-weight:normal; line-height:25px;width:300px; cursor:pointer; padding:10px;}
		#mulvdiv div:hover{ color:#2599bc; background-color:#eae7da;}
		.replyContent{clear: both;padding-left: 80px;}
	</style>

	<jsp:include page="htmlEdit.jsp" flush="false" />
	
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
		$.jBox("iframe:"+path+"/report_reason.jsp", {
			title: "<div style='font-size:14px;'>举报提交</div>",
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
	
	function shuqian(){
		$.jBox.tip("成功加入书签！");
	}
	
	function shang(){
		$.jBox("iframe:"+path+"/shang.jsp", {
			title: "<div style='font-size:14px;'>我要打赏</div>",
			width: 1072,
			height: 550,
			top:90,
			buttons: { '关闭': true },
			closed:function(){
				$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
			}
		});	
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
	
	function replyContent(index){
		$("#replyContent"+index)[0].style.display="block";
	}
	
	function closeReplyContent(index){
		$("#replyContent"+index)[0].style.display="none";
	}
	</script>
  </head>
  
  <body id="body_index" style="padding:0px; margin:0px;background: center 0px no-repeat #f0f0f0;">
     <div class="read_top">
     	<div class="huanfu" id="huanfu">
     		<div id="f7f5ed@292927" style="background-color: #f7f5ed"></div>
     		<div id="dbefd9@292927" style="background-color: #dbefd9"></div>
     		<div id="e9fdff@292927" style="background-color: #e9fdff"></div>
     		<div id="f7f7f7@292927" style="background-color: #f7f7f7"></div>
     		<div id="dfd7d7@292927" style="background-color: #dfd7d7"></div>
     		<div id="fdd9d9@292927" style="background-color: #fdd9d9"></div>
     		<div id="666666@faf7f7" style="background-color: #666666"></div>
     	</div>
     
   		<span style="padding-left: 142px;color: #409db7;line-height: 105px;font-family: '宋体';font-size: 24px;">《太古帝尊》</span>
    	<span style="line-height: 105px;font-family: '宋体';font-size: 13px;">作者:遥望来天</span>
    	<span style="padding-left: 20px;line-height: 105px;font-family: '宋体';font-size: 13px;">|</span>
    	<!-- <span style="padding-left: 20px;line-height: 105px;font-family: '宋体';font-size: 13px;"><img src="images/9_p_1.png" alt="" /><a href="#">打赏</a></span> -->
    	<span style="padding-left: 20px;line-height: 105px;font-family: '宋体';font-size: 13px;"><img src="images/9_p_2.png" alt="" /><a href="#">评论</a>[136]</span>
    	<span style="padding-left: 142px;line-height: 105px;font-family: '宋体';font-size: 13px;"><a href="javascript:changeFontSize(1)"><img src="images/9_p_3.png" alt="" title="字体放大"/></a></span>
    	<span style="padding-left: 3px;line-height: 105px;font-family: '宋体';font-size: 13px;"><a href="javascript:changeFontSize(-1)"><img src="images/9_p_4.png" alt="" title="字体缩小"/></a></span>
    	<span style="padding-left: 15px;line-height: 105px;font-family: '宋体';font-size: 13px;"><img src="images/9_p_5.png" alt="" /><a href="javascript:shuqian()">书签</a></span>
    	<span style="padding-left: 10px;line-height: 105px;font-family: '宋体';font-size: 13px;"><img src="images/9_p_6.png" alt="" /><a href="javascript:huanfu()">换肤</a></span>
    </div>
    <div class="read_content">
    	<div class="read_content_left">
    		<div class="read_left_menu" id="read_left_menu">
    			<div id="mulvdiv">
    				<div>第1章、帝族宁家</div>
    				<div>第2章、帝族宁家</div>
    				<div>第3章、帝族宁家</div>
    				<div>第4章、帝族宁家</div>
    				<div>第5章、帝族宁家</div>
    				<div>第6章、帝族宁家</div>
    				<div>第7章、帝族宁家</div>
    				<div>第8章、帝族宁家</div>
    				<div>第9章、帝族宁家</div>
    				<div>第10章、帝族宁家</div>
    				<div>第11章、帝族宁家</div>
    				<div>第12章、帝族宁家</div>
    				<div>第13章、帝族宁家</div>
    				<div>第14章、帝族宁家</div>
    				<div>第15章、帝族宁家</div>
    				<div>第16章、帝族宁家</div>
    				<div>第17章、帝族宁家</div>
    				<div>第18章、帝族宁家</div>
    				<div>第19章、帝族宁家</div>
    			</div>
    			<p><a href="javascript:showMulv()">目录</a></p>
    			<p style="padding-top: 15px;"><a href="#">下一章</a></p>
    			<img src="images/hanjiaxing.png" style="margin-left: 2px;"/>
    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp()">举报</a></p>
    		</div>
    	</div>
    	<div class="read_content_center">
    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
    			第一章&nbsp;&nbsp;&nbsp;帝族宁家
    		</div>
  			
  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
	  			<p style="padding:35px 0px 0px 3px;line-height: 25px;">
	    			新京报讯 今日有报道称，缅北中国伐木工一案在缅甸终审宣判，153名中国工人被判处终身监禁。对此，中国驻缅甸使馆新闻和公共外交处负责人对新京报记者表示，正加紧核实有关情况。目前，使馆暂未收到缅甸政府官方关于此事的通报。
	    		</p>
	    		<p style="padding-top: 40px;line-height: 25px;">
	    			该负责人表示，驻缅甸使馆已经注意到今天有媒体报道称“缅甸法庭一次性判处153名中国伐木工终身监禁”，正加紧核实有关情况。目前，使馆暂未收到缅甸政府官方通报，鉴于此事重大，使馆今天中午已经派领保官员专程飞往密支那与当地法庭当面核实有关情况。
	    		</p>
	    		<p style="padding-top: 40px;line-height: 25px;">
					“目前，据我们侧面了解，缅甸法庭所判并不是‘终身监禁’，而是有有限的刑期，150人得刑20年，2名未成年人被各判10年，1名藏毒者得刑35年。但有关情况，还需进一步核实。”该负责人介绍说。
				</p>
				<p style="padding-top: 40px;line-height: 25px;">
					对于将采取怎样的措施应对此事，该负责人透露，“这些中国伐木工人被中国和缅甸的不法分子蒙骗，冒然进入缅甸从事违法的伐木作业，现在身陷囹圄，处境堪怜。我们认为即便判20年都属于量刑过重”。目前，我馆已经向缅方提出严正交涉。
				</p>
				<p style="padding-top: 40px;line-height: 25px;">
				“有危险的地方就有机会，谁都想去挣点钱”，刘威（化名）如此概括自己到缅甸伐木的原因。地方武装授权，让缅北伐木在缅甸政府的反对声中亦能成行。双方的管控拉锯，让外来伐木人在获得财富之时，亦面临诸多未知风险。
				</p>
				<p style="padding-top: 40px;line-height: 25px;">
					中国市场对红木家具的高需求，促成红木木材市场繁荣。但明清之后国内已几无红木可供采伐，市场需求要通过进口满足。大多产于东南亚、非洲的酸枝木、花梨木，成了国内红木市场的主流。其中，采自缅北的红木，占有大量份额。
					国际环保组织环境调查署（EIA）的研究显示，过去两年中国从缅甸进口的红木以极快速度增长，“直接推动非法和不可持续的采伐，对缅甸日渐缩小的森林的生存构成威胁”。
				</p>
				<p style="padding-top: 40px;line-height: 25px;">
					地方势力授权
				</p>
				<p style="padding-top: 40px;line-height: 25px;">
					1月29日下午，云南瑞丽弄岛镇的一个院子里，刘威存了9个月的2700多吨缅甸酸枝木、花梨木仍未卖出去，“买红木家具的少了，市场就小了”。月初缅甸政府军抓捕中国伐木工人时，他没去缅甸，躲过
	    		</p>
    		
    		</div>
    		<div style="padding-left: 365px; margin-top: 20px;">
    			<div class="self_btn" onclick="showMulv()" style="float: left;">目录</div>
    			<div class="self_btn" style=" float: left;margin-left: 42px;">下一章</div>
    		</div>
    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
    			<input type="button" value="赏" class="saveBtnCss" onclick="shang()"/>
    		</div>
    	</div>
    	<!-- <div class="read_content_right" id="awe">
    		  <div class="read_ds" id="read_ds">
		    	<p style="padding-left: 18px;line-height: 20px;font-family: '宋体';font-size: 13px;">打赏:</p>
		    	<p style="padding-left: 18px;line-height: 20px;font-size: 12px;"><a href=""><img src="images/9_p_1.png" alt="" style="padding:5px 5px 0px 0px"/></a>12</p>
		    	<p style="padding-left: 18px;line-height: 20px;font-size: 12px;"><a href=""><img src="images/9_p_7.png" alt="" style="padding:5px 5px 0px 0px"/></a>35</p>
		    	<p style="padding-left: 18px;line-height: 20px;font-size: 12px;"><a href=""><img src="images/9_p_8.png" alt="" style="padding:5px 5px 0px 0px"/></a>108</p>
		    	<p style="padding-left: 18px;line-height: 20px;font-size: 12px;"><a href=""><img src="images/9_p_9.png" alt="" style="padding:5px 5px 0px 0px"/></a>341</p>
		    </div>
    	</div>
    	 -->
    </div>
    <div class="read_content_2"></div>
    <div class="read_pl">
    	<div class="read_pl_left">
    		<p style="padding: 15px 0px 0px 30px;">
    			<img src="images/7_p_25.png" style="padding-right: 5px;"/>
    			<span style="font-size: 19px;">评论</span>
    			（共45条）
    		</p>
    		<p style="padding: 0px 0px 0px 20px;font-size: 15px;">您必须<span style="color: #409db7;">登录</span>才能评论</p>
    	</div>
    	<div class="read_pl_right" style="padding-top: 25px;">
    		<textarea class="htmlEditCss" style="height:230px;"></textarea>
    	</div>
    </div>
    <div class="read_pl_qs">
    	<div style="padding:50px 0px 0px 25px;">点赞前十用户榜</div>
    	<div class="read_pl_qs_info">
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_29.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color: #707070">Gintoki</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_30.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070 ">伊丽莎白</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_31.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">Just&nbsp;We</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_32.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">9999sui</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_33.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">leyouxiyin</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_34.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">siso思烁</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_35.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">sweet乐</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_36.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">琪幻画印</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_37.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">设计师代号零</span>
    		</div>
    		<div>
	    		<a href="reader_info.jsp"><img src="images/7_p_38.png" alt="" /></a><br />
	    		<span style="padding-left: 33px;color:#707070">aiyuanfancs</span>
    		</div>
    	</div>
    </div>
    <div class="read_pl_con"></div>
    <div class="read_pl_content">
    	<div class="read_pl_content_1">
    		<div class="read_pl_content_1_1">
	    		<div style="padding-top: 20px;">
	    			<a href="reader_info.jsp"><img src="images/7_p_39.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">Gintoki</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(1)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;">看到第一张就忍不住想看下去了，很不错的文文推荐哦！</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent1" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss"/>
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(1)"/>
				</div>
    		</div>
    		
    		<div class="read_pl_content_1_2">
    			<div style="width: 50px;height: 50px;">
	    			<a href="reader_info.jsp"><img src="images/7_p_40.png" alt="" /></a>
	    		</div>
	    		<div style="height: 50px;min-width: 460px;">
    				<span style="color: #1a9cda;padding: 0px 0px 0px 15px;">冇猫腻</span>
    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;">不错，，很干净。有些人喜欢。有些人。。看方向吧、。</p>
	    		</div>
	    		
	    		
	    		<div class="read_pl_content_1_3">
	    			<span style="padding-left: 540px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[21]</span>
	    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
	    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    		</div>
    		</div>
    	</div>
    	<div class="read_pl_content_2">
    		<div class="read_pl_content_2_1">
	    		<div style="padding-top: 20px;width: 75px;height: auto;">
	    			<a href="reader_info.jsp"><img src="images/7_p_44.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px; width: 643px;height: auto;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">伊丽莎白</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(3)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;line-height: 30px;">从他们的暗杀分配中就能知道，弓鸣想要采取“三魂夺命”的暗杀方式来进行屠杀，“三魂夺命”，是鬼面组织里最适合小心杀手团队进行暗杀的方式，他们会同时从房间的各个角落闯入，在最快的时间判定危险和暗杀对象的所在，同时出手，确保万无一失。</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent3" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss"/>
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(3)"/>
				</div>
    		</div>
    		
    		<div class="read_pl_content_2_3">
    			<span style="padding-left: 636px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[8]</span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    	</div>
    	</div>	
    	<div class="read_pl_content_2">
    		<div class="read_pl_content_2_1">
	    		<div style="padding-top: 20px;width: 75px;height: auto;">
	    			<a href="reader_info.jsp"><img src="images/7_p_45.png" /></a>
	    		</div>
	    		<div style="padding-top: 20px; width: 643px;height: auto;">
	    			<p style="padding: 0px 0px 0px 15px;">
	    				<span style="color: #1a9cda;">伊丽莎白</span>
	    				<span style="color: #bbbbbb;padding: 0px 0px 0px 10px;">2015年7月22日17:06:12</span><span style="padding-left: 20px;"><a href="javascript:replyContent(4)">回复</a></span>
	    			</p>
	    			<p style="font-size: 15px;padding: 0px 0px 0px 15px;line-height: 30px;">看到第一张就忍不住想看下去了，很不错的文文推荐哦！</p>
	    		</div>
    		</div>
    		
    		<!-- 回复你呢东东 -->
    		<div id="replyContent4" class="replyContent">
    			<div class="divItemsCss">
					<p>回复内容：</p>
					<p><textarea class="htmlEditCss" style="height:230px;"></textarea></p>
				</div>
				<div class="divItemsCss">
					<input type="button" value="回复" class="saveBtnCss"/>
					<input type="button" value="关闭" class="resetBtnCss" onclick="closeReplyContent(4)"/>
				</div>
    		</div>
    		
    		<div class="read_pl_content_2_3">
    			<span style="padding-left: 636px;font-size: 12px;color: #b3b3b3;"><a href=""><img src="images/7_p_41.png" style="padding-right: 5px;" title="赞一个"/></a>[42]</span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_42.png" title="转发"/></a></span>
    			<span style="padding-left: 10px;"><a href=""><img src="images/7_p_43.png" title="删除"/></a></span>
	    	</div>
    	</div>	
    </div>
    <div class="read_pl_more">
    	<div style="padding:50px 0px 0px 25px;font-size: 12px;"><a href="" style="color: #409db7;">查看更多评论...</a></div>
    	<div style="padding:45px 0px 0px 770px; ">
    		<span style="font-size: 13px;"><a href=""><img src="images/7_p_46.png" title="返回顶部" style="padding-right: 5px;"/></a>返回顶部</span>
    	</div>
    </div>
    <div class="read_other_tj">
    	<div style="width: 1000px;height: 55px;line-height: 55px;font-size: 13px;margin: 0 auto;color: #e8e8e8;">
    	<span>其他作品推荐</span>
    	<span style="padding-left: 840px;">查看更多...</span>
    	</div>
    	<div style="width: 1048px;min-height:400px;margin: 0 auto; clear: both;margin-top: -20px;">
			<jsp:include page="read_list.jsp" flush="false"></jsp:include>
    	</div>
    </div>
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
