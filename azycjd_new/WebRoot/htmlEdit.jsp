<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">var domid='${param.domid}';</script>
<script>
	var chooseUploadBtnId;
	KindEditor.ready(function(K) {
	
		var editor = K.editor({
			allowFileManager : true,
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp'
		});
		
		
		editor1 = K.create('textarea[class="htmlEditCss"]', {
			cssPath : '<%=request.getContextPath() %>/js/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=request.getContextPath() %>/js/kindeditor/jsp/file_manager_json.jsp',
			items : [
						'fullscreen'],
			
			resizeType:0,
			afterBlur : function(ob) {
				var self = this;
				self.sync();
				K.ctrl(document, 13, function() {
					self.sync();
					K('form[title=htmlEditForm')[0].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					K('form[title=htmlEditForm')[0].submit();
				});
			},
			afterChange : function() {
				try{
					var ts= this.text();
					while(ts.indexOf("\t")!=-1||ts.indexOf("\n")!=-1||ts.indexOf("\r\n")!=-1||ts.indexOf(" ")!=-1||ts.indexOf(",")!=-1){
						ts=ts.replace("\t","");
						ts=ts.replace("\n","");
						ts=ts.replace("\r\n","");
						ts=ts.replace(" ","");
						ts=ts.replace(",","");
					}
					ts=ts.replace(/[\d,-]+/g,',');
					K('#chapterCharNum').val(ts.length);
					K('#totalcharnum').html("总共["+ts.length+"]字");
				}catch(e){}
			},
			afterUpload:function(url){
				
			}
		});
		
		
		K('.uploadBtnCss').click(function() {
			chooseUploadBtnId=$(this)[0].id;
			if(chooseUploadBtnId==null||chooseUploadBtnId==""||chooseUploadBtnId=="null"){
				alert("当前上传按钮没有按规则命名id");
				return;
			}
			chooseUploadBtnId=chooseUploadBtnId.substring(0,chooseUploadBtnId.length-3);
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#url3').val(),
					clickFn : function(url, title, width, height, border, align) {
						$("#"+chooseUploadBtnId).val(url);
						if(chooseUploadBtnId=="memberHeadImg"){
							try{
								$("#targetg").remove();
								$("#update_head_img_div").html("");
								$("#x").val("0");
								$("#y").val("0");
								$("#width").val("0");
								$("#height").val("0");
								$("#saveImgBtn").css("visibility","visible");
							}catch(e){
							}
							$("#update_head_img_div").css("display","block");
							$("<img src='"+url+"' id='targetg' alt='' width='600'/>").appendTo($("#update_head_img_div"));
							inniit('targetg');
						}
						editor.hideDialog();
					}
				});
			});
		});
		
		
		try{
			prettyPrint();
		}catch(e){
		}
	});
</script>