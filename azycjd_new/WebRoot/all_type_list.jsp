<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/index/css/index.css"/>
<script language="javascript">
	var click_id="";
	$(function(){
		$(".title_three").click(function(){
			if($(this).html()=="不限"){
				yijibuxian();
				$(this)[0].className="title_three_click";
				$("#typs_div")[0].style.display="none";
				searchNovel();
				return;
			}
			
			$("#yijifenlei0")[0].className="title_three";
			
			if($(this)[0].id==click_id){
				if($("#typs_div")[0].style.display==""||$("#typs_div")[0].style.display=="none"){
					$("#typs_div")[0].style.display="block";
				}else{
					$("#typs_div")[0].style.display="none";
				}
			}else{
				click_id=$(this)[0].id;
				$("#typs_div")[0].style.display="block";
			}	

			$(".title_three_click").each(function(){
				$(this)[0].className="title_three";
			});
			
			$("#divyijifenlei .conditioncss").each(function(){
				$(this)[0].style.display="none";
			});
			$(this)[0].className="title_three_click";
			$("#div"+$(this)[0].id)[0].style.display="block";
		});
		
		loadNovelData(false);//加载数据
	});
	
	function yijibuxian(){
		$(".title_three_click").each(function(){
			$(this)[0].className="title_three";
		});
		$("#typs_div").find(".title_two_click").each(function(){
			$(this)[0].className="title_two";
		});
	}
	
	var searchPageNum=1;//默认查询第1页
	var searchSize=10;
	var totalDataPageNum=0;
	var isLoadData=true;
	function searchNovel(){
		if(isLoadData){
			searchPageNum=1;
			searchSize=10;
			oldPageNum=2;
			realLoadNum=1;
			loadNovelData(false);
		}
	}
	
	function getSearchParam(){
		var param={};
		//设置一级分类
		$(".title_three_click").each(function(){
			if($(this).html()=="不限"){
				param.bigType="";
				param.smallType="";
				return false;
			}
			param.bigType=$(this).html();//设置一级分类
			if($("#div"+$(this)[0].id).children(".title_two_click").length==0){
				param.smallType="";//设置一级分类小类
			}else{
				var tmp="";
				$("#div"+$(this)[0].id).children(".title_two_click").each(function(){
					tmp+=$(this).html()+",";
				});
				tmp=tmp.substring(0,tmp.length-1);
				tmp=tmp=="不限"?"":tmp;
				param.smallType=tmp;//设置一级分类小类
			}
		});
		//设置作品字数、写作进度、排序方式、时间范围
		var paramArr=new Array("zishu","xiezuo","paixu","shijian");
		for(var i=0;i<paramArr.length;i++){
			var tmp="";
			$("#"+paramArr[i]).children(".title_two_click").each(function(){
				tmp=$(this).html();
			});
			tmp=tmp=="不限"?"":tmp;
			param[paramArr[i]]=tmp;
		}
		param.size=searchSize;
		param.pageNum=searchPageNum;
		param.timenow=new Date().getTime();
		return param;
	}
	
	//Ajax的加载数据 appendBoolean--true：追加数据 false：覆盖数据
	function loadNovelData(appendBoolean){
		isLoadData=false;
		var params=getSearchParam();
		//$("#loadMoreData").slideUp();//隐藏加载更多
		//$("#loadingData").slideDown();//显示加载中
		$.post(path+"/anzhinovel/shuku.do",params,function(res){
			if(appendBoolean){
				$(res).appendTo($("#novel_main_div"));
				//$("#novel_main_div").html($("#novel_main_div").html()+res);
			}else{
				$("#novel_main_div").html(res);
				searchPageNum=1;
				//$("#loadMoreData").html("点击加载更多数据");
			}
			totalDataPageNum=parseInt($("#"+params.timenow).val());//设定页码总数
			$(window).scrollTop(850);
			$.post(path+"/shuku_next.jsp",{
				formId:'fenye',
				totalNum:totalDataPageNum,
				num:searchPageNum,
				realLoadNum:realLoadNum
			},function(shuke_res){
				//$("#loadMoreData").slideDown();//显示加载更多
				//$("#loadingData").slideUp();//隐藏加载中
				$("#shuku_fenye").html(shuke_res);
				isLoadData=true;
			});
		});
	}
	
	//点击加载更多，异步加载数据
	function loadMoreDataFn(){
		searchPageNum++;
		searchSize=10;
		if(searchPageNum>totalDataPageNum){
			$("#loadMoreData").html("没有更多数据了->>");
			return;
		}else{
			loadNovelData(false);
		}
	}
	
	var oldPageNum=2;
	var realLoadNum=1;
	/* function fenyeClick(click_num){
		if(isLoadData){
			searchSize=(click_num-oldPageNum)*10;
			if(searchSize<=0){
				//alert("该页数据已经加载了");
				return;
			}
			searchPageNum=oldPageNum;//记录之前的
			realLoadNum=click_num;//就是点击的页码
			oldPageNum=click_num;
			loadNovelData(false);
		}
	} */
	
	function fenyeClick(click_num){
		if(isLoadData){
			searchSize=10;
			searchPageNum=click_num;//记录之前的
			realLoadNum=click_num;//就是点击的页码
			loadNovelData(false);
		}
	}
	
	function shuku_go(go_input_id){
		fenyeClick(parseInt($("#"+go_input_id).val()));
	}
</script>
<div class="main_2_div">
	<div id="dfg"></div>
		<div class="search_div">
			<table width="100%" border="0">
			  <tr>
			  	<td>
			  		<div class="conditioncss">
						<div class="title_one">一级分类</div>
						<div class="title_three" id="yijifenlei0">不限</div>
						<div class="title_three" id="yijifenlei1">古代言情</div>
						<div class="title_three" id="yijifenlei2">现代言情</div>
						<div class="title_three" id="yijifenlei3">玄幻奇幻</div>
						<div class="title_three" id="yijifenlei4">武侠仙侠</div>
						<div class="title_three" id="yijifenlei5">都市异能</div>
						<div class="title_three" id="yijifenlei6">历史军事</div>
						<div class="title_three" id="yijifenlei7">游戏竞技</div>
						<div class="title_three" id="yijifenlei8">科幻灵异</div>
					</div>
			  	</td>
			  </tr>
			  <tr>
			  	<td id="divyijifenlei">
					<div class="divfenlei" style="display:none;" id="typs_div">
						<div class="conditioncss" id="divyijifenlei1">
							<div class="title_two">不限</div>
							<div class="title_two">穿越架空</div>
							<div class="title_two">仙侠魔幻</div>
							<div class="title_two">女尊天下</div>
							<div class="title_two">宫斗宅斗</div>
							<div class="title_two">种田养成</div>
							<div class="title_two">民国旧影</div>
							<div class="title_two">种田养成</div>
							<div class="title_two">江湖情仇</div>
							<div class="title_two">架空玄幻</div>
							<div class="title_two">异族恋情</div>
							<div class="title_two">远古神话</div>
						</div>
						<div class="conditioncss" id="divyijifenlei2">	
							<div class="title_two">不限</div>
							<div class="title_two">豪门总裁</div>
							<div class="title_two">青春都市</div>
							<div class="title_two">军婚高干</div>
							<div class="title_two">娱乐明星</div>
							<div class="title_two">商战职场</div>
							<div class="title_two">异术超能</div>
							<div class="title_two">官场沉浮</div>
							<div class="title_two">婚恋情感</div>
						</div>
						<div class="conditioncss" id="divyijifenlei3">
							<div class="title_two">不限</div>
							<div class="title_two">异界大陆</div>
							<div class="title_two">异界争霸</div>
							<div class="title_two">远古神话</div>
							<div class="title_two">东方玄幻</div>
							<div class="title_two">西方奇幻</div>
							<div class="title_two">领主贵族</div>
							<div class="title_two">魔法校园</div>
							<div class="title_two">异类兽族</div>
						</div>
						<div class="conditioncss" id="divyijifenlei4">
							<div class="title_two">不限</div>
							<div class="title_two">古典武侠</div>
							<div class="title_two">现代武侠</div>
							<div class="title_two">异界武侠</div>
							<div class="title_two">古典仙侠</div>
							<div class="title_two">现代修真</div>
							<div class="title_two">洪荒修神</div>
							<div class="title_two">幻想修真</div>
						</div>
						<div class="conditioncss" id="divyijifenlei5">
							<div class="title_two">不限</div>
							<div class="title_two">都市商战</div>
							<div class="title_two">都市生活</div>
							<div class="title_two">都市重生</div>
							<div class="title_two">官场沉浮</div>
							<div class="title_two">娱乐明星</div>
							<div class="title_two">乡土传记</div>
							<div class="title_two">恩怨情仇</div>
							<div class="title_two">现实百态</div>
							<div class="title_two">青春校园</div>
							<div class="title_two">异术超能</div>
							<div class="title_two">国术武技</div>
							<div class="title_two">合租情缘</div>
						</div>
						<div class="conditioncss" id="divyijifenlei6">
							<div class="title_two">不限</div>
							<div class="title_two">外国历史</div>
							<div class="title_two">历史传记</div>
							<div class="title_two">架空历史</div>
							<div class="title_two">上古先秦</div>
							<div class="title_two">秦汉三国</div>
							<div class="title_two">两晋隋唐</div>
							<div class="title_two">五代十国</div>
							<div class="title_two">两宋元明</div>
							<div class="title_two">清史民国</div>
							<div class="title_two">战争幻想</div>
							<div class="title_two">谍战特工</div>
							<div class="title_two">军旅生涯</div>
							<div class="title_two">抗战烽火</div>
							<div class="title_two">军事战争</div>
						</div>
						<div class="conditioncss" id="divyijifenlei7">
							<div class="title_two">不限</div>
							<div class="title_two">游戏生涯</div>
							<div class="title_two">电子竞技</div>
							<div class="title_two">虚拟网游</div>
							<div class="title_two">游戏异界</div>
							<div class="title_two">体育竞技</div>
							<div class="title_two">奕林春秋</div>
							<div class="title_two">篮球竞技</div>
							<div class="title_two">足球竞技</div>
						</div>
						<div class="conditioncss" id="divyijifenlei8">
							<div class="title_two">不限</div>
							<div class="title_two">星际战争</div>
							<div class="title_two">机械时代</div>
							<div class="title_two">数字生命</div>
							<div class="title_two">时空穿梭</div>
							<div class="title_two">未来世界</div>
							<div class="title_two">古武机甲</div>
							<div class="title_two">超级科技</div>
							<div class="title_two">进化变异</div>
							<div class="title_two">末世危机</div>
							<div class="title_two">推理侦探</div>
							<div class="title_two">恐怖惊悚</div>
							<div class="title_two">悬疑探险</div>
							<div class="title_two">灵异奇谈</div>
						</div>
					</div>
			  		
					
			  	</td>
			  </tr>
			  <tr>
				<td>
					<div class="conditioncss" id="zishu">
						<div class="title_one">作品字数</div>
						<div class="title_two">不限</div>
						<div class="title_two">10万字</div>
						<div class="title_two">10万-30万字</div>
						<div class="title_two">30万-50万字</div>
						<div class="title_two">50万-100万字</div>
						<div class="title_two">100万字以上</div>
					</div>
				</td>
			  </tr>
			  <tr>
				<td>
					<div class="conditioncss" id="xiezuo">
						<div class="title_one">写作进度</div>
						<div class="title_two">不限</div>
						<div class="title_two">连载</div>
						<div class="title_two">全本</div>
					</div>
				</td>
			  </tr>
			  <tr>
				<td>
					<div class="conditioncss" id="paixu">
						<div class="title_one">排序方式</div>
						<div class="title_two">不限</div>
						<div class="title_two">最新更新</div>
						<div class="title_two">点击最高</div>
						<div class="title_two">收藏最多</div>
						<div class="title_two">打赏最多</div>
						<div class="title_two">评论最多</div>
						<div class="title_two">订阅最多</div>
					</div>
				</td>
			  </tr>
			  <tr>
				<td>
					<div class="conditioncss" id="shijian">
						<div class="title_one">时间范围</div>
						<div class="title_two">不限</div>
						<div class="title_two">一周之内</div>
						<div class="title_two">一月之内</div>
						<!-- <div style="float: right; margin-right: 250px;">
							<input type="button" value="查询" class="resetBtnCss" onclick="searchNovel()" />
						</div> -->
					</div>
				</td>
			  </tr>
			</table>
		</div>
		
		
		<div class="paixu_div" style="margin-top:40px;">
			<table width="100%" border="0">
			  <tr style="line-height:35px;">
				<td width="70%" style="padding-left:10px;">
					书库列表
				</td>
				<td width="12%">
					<!-- <input type="checkbox" />只显示已完成 -->
				</td>
				<td width="9%">
					<!-- <input type="checkbox" />VIP作品 -->
				</td>
				<td width="9%">
					<!-- <input type="checkbox" />半价库 -->
				</td>
			  </tr>
			</table>
		</div>
		<div id="novel_main_div">
			
		</div>
		<!--<div id="loadMoreData" class="heng_div_css" onclick="loadMoreDataFn()">
			点击加载更多小说...
		</div>
		-->
		<!-- <div id="loadingData" class="heng_div_css">
			正在努力加载中...
		</div> -->
		<div id="shuku_fenye">
			
		</div>
	</div>
	
<jsp:include page="foot.jsp"></jsp:include>