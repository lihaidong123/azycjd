<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script language="javascript">var path='<%=request.getContextPath() %>';</script>
<script language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>	
<script language="javascript" src="<%=request.getContextPath() %>/js/azycjd.js"></script>
<!--jbox-->
<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	
<script type="text/javascript">
	var pageDirecNum='${pageDirecNum}';
	var pageDirecJson=[
		{pageDirecNum:'5',url:'anzhifenjuan/findAnzhiFenJuanAll.do#linenumber=11#index=8#chooseIndex=1#novelId=${param.novelId}'},
		{pageDirecNum:'1',url:'index/my_infomation_my_info.jsp#linenumber=1#index=0#chooseIndex=2'},
		{pageDirecNum:'2',url:'index/my_infomation_person_set.jsp#linenumber=1#index=0#chooseIndex=3'},
		{pageDirecNum:'3',url:'index/my_infomation_realname.jsp#linenumber=1#index=0#chooseIndex=4'},
		{pageDirecNum:'4',url:'index/writer_info_upd_pass.jsp#linenumber=1#index=0#chooseIndex=5'},
		{pageDirecNum:'6',url:'index/home_page_my_activity.jsp#linenumber=0#index=2#chooseIndex=0'},
		{pageDirecNum:'7',url:'anzhinovel/lineNewproject.do#linenumber=10'},
		{pageDirecNum:'8',url:'index/writer_info_update.jsp#linenumber=8#index=5#chooseIndex=1'},
		{pageDirecNum:'9',url:'anzhifriend/findMyFriendAll.do#linenumber=0#index=2#chooseIndex=2'},
		{pageDirecNum:'10',url:'anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do#linenumber=8#index=5#chooseIndex=3'},
		{pageDirecNum:'11',url:'line_myincome_month.jsp#linenumber=14#index=7#chooseIndex=0'},
		{pageDirecNum:'12',url:'index/line_newchapter.jsp#novelId=${addnovelId }#linenumber=11#index=8#chooseIndex=0'},
		{pageDirecNum:'13',url:'anzhinovelmultifunction/findAnzhiNovelMultifunctionMyShoucang.do#linenumber=3#index=6#chooseIndex=0'},
		{pageDirecNum:'14',url:'anzhinovelmultifunction/findAnzhiNovelMultifunctionMyTuijian.do#linenumber=8#index=5#chooseIndex=3'},
		{pageDirecNum:'15',url:'anzhicomment/anzhiCommentAllManage.do?linenumber=11&&tableId=${param.tableId}'},
		{pageDirecNum:'16',url:'index/home_page_my_activity.jsp#linenumber=0#index=2#chooseIndex=0'},
		{pageDirecNum:'17',url:'anzhiheadimguserecord/findAnzhiHeadImgUseRecordMySelf.do#linenumber=1#index=0#chooseIndex=1'},
		{pageDirecNum:'18',url:'index/information_account_finance.jsp#linenumber=2#index=1#chooseIndex=0'}
	];
	$(function(){
		pageDirec();
	});
	
	function pageDirec(){
		if(pageDirecNum!=''){
			var urls=""
			for(var i=0;i<pageDirecJson.length;i++){
				var t=pageDirecJson[i];
				if(pageDirecNum==t.pageDirecNum){
					urls=t.url;
					break;
				}
			}
			if(urls!=""){
				$.jBox.tip("请等待，数据加载中...", 'loading');
				getJspDataByUrl(urls);
			}
		}
	}
</script>